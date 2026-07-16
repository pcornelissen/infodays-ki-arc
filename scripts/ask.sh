#!/usr/bin/env bash
#
# ask.sh — stellt eine Frage an das Modell mit einem der drei Kontext-Varianten.
#
# Aufruf: ask.sh --mode <roh|kondensat|master> <frage-datei>
# Optional: --model <modell> --out <ausgabe.md>
#
# Modes:
#   roh        - alle Rohtexte aus demo-material/fitko-text/
#   kondensat  - alle Kondensate aus demo-material/fitko-kondensat/
#   master     - nur demo-material/fitko-master.md

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
ENV_FILE="$PROJECT_ROOT/.env"
SYSTEM_PROMPT_FILE="$PROJECT_ROOT/prompts/ask-system.md"
RAW_DIR="$PROJECT_ROOT/demo-material/fitko-text"
KONDENSAT_DIR="$PROJECT_ROOT/demo-material/fitko-kondensat"
MASTER_FILE="$PROJECT_ROOT/demo-material/fitko-master.md"
ANSWERS_DIR="$PROJECT_ROOT/demo-material/antworten"
DEFAULT_MODEL="Qwen/Qwen3-VL-235B-A22B-Instruct-FP8"

MODE=""
QUESTION_FILE=""
MODEL="$DEFAULT_MODEL"
OUT=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --mode)   MODE="$2"; shift 2 ;;
    --model)  MODEL="$2"; shift 2 ;;
    --out)    OUT="$2"; shift 2 ;;
    -h|--help) sed -n '2,12p' "$0" | sed 's/^# *//'; exit 0 ;;
    -*) echo "Unbekannte Option: $1" >&2; exit 2 ;;
    *)
      if [[ -z "$QUESTION_FILE" ]]; then QUESTION_FILE="$1"; else
        echo "Nur eine Fragedatei pro Aufruf." >&2; exit 2
      fi
      shift ;;
  esac
done

[[ -n "$MODE" ]] || { echo "Fehlt: --mode roh|kondensat|master" >&2; exit 2; }
[[ -n "$QUESTION_FILE" && -f "$QUESTION_FILE" ]] || { echo "Frage-Datei fehlt: ${QUESTION_FILE:-<nicht angegeben>}" >&2; exit 2; }
[[ -f "$ENV_FILE" ]] || { echo "Fehlt: $ENV_FILE" >&2; exit 1; }
[[ -f "$SYSTEM_PROMPT_FILE" ]] || { echo "System-Prompt fehlt: $SYSTEM_PROMPT_FILE" >&2; exit 1; }

case "$MODE" in
  roh|kondensat|master) ;;
  *) echo "Ungültiger Mode: $MODE" >&2; exit 2 ;;
esac

# .env robust einlesen
while IFS='=' read -r key val; do
  [[ -z "$key" || "$key" =~ ^[[:space:]]*# ]] && continue
  val="${val%\"}"; val="${val#\"}"; val="${val%\'}"; val="${val#\'}"
  export "$key=$val"
done < <(grep -E '^[A-Za-z_][A-Za-z0-9_]*=' "$ENV_FILE")

: "${OPENAI_API_BASE_URL:?fehlt in .env}"
: "${OPENAI_API_KEY:?fehlt in .env}"

QUESTION_BASE="$(basename "$QUESTION_FILE" .md)"
mkdir -p "$ANSWERS_DIR"
[[ -n "$OUT" ]] || OUT="$ANSWERS_DIR/${QUESTION_BASE}__${MODE}.md"

START_EPOCH=$(date +%s)
elapsed() { local now=$(date +%s); printf "+%ds" $((now - START_EPOCH)); }
step() { printf "[%s] %s\n" "$(elapsed)" "$*"; }

printf "== %s == ask start\n" "$(date '+%Y-%m-%d %H:%M:%S')"
printf "    frage : %s\n" "$QUESTION_FILE"
printf "    mode  : %s\n" "$MODE"
printf "    model : %s\n" "$MODEL"
printf "    out   : %s\n" "$OUT"

# Kontext einsammeln je nach mode
TMP_CTX="$(mktemp -t askctx.XXXXXX).md"
trap 'rm -f "$TMP_CTX"' EXIT

case "$MODE" in
  roh)
    COUNT=0
    for f in "$RAW_DIR"/*.txt; do
      base=$(basename "$f" .txt)
      { echo "===== DOKUMENT: $base.pdf ====="; cat "$f"; echo ""; } >> "$TMP_CTX"
      COUNT=$((COUNT+1))
    done
    ;;
  kondensat)
    COUNT=0
    for f in "$KONDENSAT_DIR"/*.md; do
      base=$(basename "$f")
      [[ "$base" == _* ]] && continue
      { echo "===== KONDENSAT: $base ====="; cat "$f"; echo ""; } >> "$TMP_CTX"
      COUNT=$((COUNT+1))
    done
    ;;
  master)
    { echo "===== MASTER-KONTEXT ====="; cat "$MASTER_FILE"; } >> "$TMP_CTX"
    COUNT=1
    ;;
esac

WORDS=$(wc -w <"$TMP_CTX" | tr -d ' ')
step "kontext: ${COUNT} Datei(en), ${WORDS} Wörter"

step "sende an ${MODEL##*/} @ Stackit ..."

python3 - "$SYSTEM_PROMPT_FILE" "$QUESTION_FILE" "$TMP_CTX" "$MODEL" "$OUT" "$MODE" <<'PY'
import json, os, sys, urllib.request, urllib.error

sys_file, q_file, ctx_file, model, out_md, mode = sys.argv[1:7]

with open(sys_file) as f: system_prompt = f.read()
with open(q_file) as f:   question = f.read()
with open(ctx_file) as f: context = f.read()

user_prompt = (
  f"Frage:\n{question}\n\n"
  f"Kontext (Modus: {mode}):\n"
  f"{context}\n"
  "--- ENDE KONTEXT ---\n\n"
  "Beantworte die Frage jetzt anhand des Kontexts."
)

payload = {
  "model": model,
  "messages": [
    {"role": "system", "content": system_prompt},
    {"role": "user",   "content": user_prompt},
  ],
  "temperature": 0.2,
  "max_tokens": 8000,
}

base = os.environ["OPENAI_API_BASE_URL"].rstrip("/")
key  = os.environ["OPENAI_API_KEY"]

req = urllib.request.Request(
  base + "/v1/chat/completions",
  data=json.dumps(payload).encode("utf-8"),
  headers={"Authorization": f"Bearer {key}", "Content-Type": "application/json"},
)

try:
  with urllib.request.urlopen(req, timeout=600) as resp:
    data = json.loads(resp.read())
    content = data["choices"][0]["message"]["content"]
    usage = data.get("usage", {})
    with open(out_md, "w") as f: f.write(content)
    print(f"    tokens: in={usage.get('prompt_tokens')} out={usage.get('completion_tokens')}", file=sys.stderr)
except urllib.error.HTTPError as e:
  print(f"HTTP {e.code}: {e.reason}", file=sys.stderr)
  print(e.read().decode("utf-8", errors="replace")[:800], file=sys.stderr)
  sys.exit(1)
except Exception as e:
  print(f"{type(e).__name__}: {e}", file=sys.stderr)
  sys.exit(1)
PY

step "fertig → $OUT"
