#!/usr/bin/env bash
#
# ask-local.sh — Frage an ein lokales Ollama-Modell mit Kondensat- oder Master-Kontext.
#
# Aufruf: ask-local.sh --model <name> --mode <kondensat|master> <frage-datei>
# Optional: --out <datei>
#
# Roh-Modus ist bewusst nicht enthalten: lokale Modelle haben typischerweise
# 8k–32k Kontext; die 30 rohen PDFs (~130k Tokens) passen dort nicht rein.
# Das ist selbst ein Vortragspunkt.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SYSTEM_PROMPT_FILE="$PROJECT_ROOT/prompts/ask-system.md"
KONDENSAT_DIR="$PROJECT_ROOT/demo-material/fitko-kondensat"
MASTER_FILE="$PROJECT_ROOT/demo-material/fitko-master.md"
ANSWERS_DIR="$PROJECT_ROOT/demo-material/antworten"
OLLAMA_URL="${OLLAMA_URL:-http://localhost:11434}"

MODEL=""
MODE=""
QUESTION_FILE=""
OUT=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --model)  MODEL="$2"; shift 2 ;;
    --mode)   MODE="$2";  shift 2 ;;
    --out)    OUT="$2";   shift 2 ;;
    -h|--help) sed -n '2,11p' "$0" | sed 's/^# *//'; exit 0 ;;
    -*) echo "Unbekannte Option: $1" >&2; exit 2 ;;
    *)
      if [[ -z "$QUESTION_FILE" ]]; then QUESTION_FILE="$1"; else
        echo "Nur eine Fragedatei pro Aufruf." >&2; exit 2
      fi
      shift ;;
  esac
done

[[ -n "$MODEL" ]] || { echo "Fehlt: --model <name> (z. B. qwen3:8b)" >&2; exit 2; }
[[ -n "$MODE"  ]] || { echo "Fehlt: --mode kondensat|master" >&2; exit 2; }
[[ -n "$QUESTION_FILE" && -f "$QUESTION_FILE" ]] || { echo "Frage-Datei fehlt: ${QUESTION_FILE:-<nicht angegeben>}" >&2; exit 2; }
[[ -f "$SYSTEM_PROMPT_FILE" ]] || { echo "System-Prompt fehlt: $SYSTEM_PROMPT_FILE" >&2; exit 1; }

case "$MODE" in
  kondensat|master) ;;
  roh) echo "Roh-Modus lokal nicht unterstützt (Kontextfenster reicht nicht — siehe Vortrag)" >&2; exit 2 ;;
  *) echo "Ungültiger Mode: $MODE" >&2; exit 2 ;;
esac

QUESTION_BASE="$(basename "$QUESTION_FILE" .md)"
MODEL_TAG="$(echo "$MODEL" | tr ':/' '__')"
mkdir -p "$ANSWERS_DIR"
[[ -n "$OUT" ]] || OUT="$ANSWERS_DIR/${QUESTION_BASE}__local_${MODEL_TAG}_${MODE}.md"

START_EPOCH=$(date +%s)
elapsed() { local now=$(date +%s); printf "+%ds" $((now - START_EPOCH)); }
step() { printf "[%s] %s\n" "$(elapsed)" "$*"; }

printf "== %s == ask-local start\n" "$(date '+%Y-%m-%d %H:%M:%S')"
printf "    frage : %s\n" "$QUESTION_FILE"
printf "    mode  : %s\n" "$MODE"
printf "    model : %s (lokal via Ollama)\n" "$MODEL"
printf "    out   : %s\n" "$OUT"

TMP_CTX="$(mktemp -t askctx.XXXXXX).md"
trap 'rm -f "$TMP_CTX"' EXIT

case "$MODE" in
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

step "sende an ${MODEL} @ localhost ..."

python3 - "$SYSTEM_PROMPT_FILE" "$QUESTION_FILE" "$TMP_CTX" "$MODEL" "$OUT" "$MODE" "$OLLAMA_URL" <<'PY'
import json, os, sys, urllib.request, urllib.error

sys_file, q_file, ctx_file, model, out_md, mode, url = sys.argv[1:8]

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
  "stream": False,
  "options": {
    "temperature": 0.2,
    "num_ctx": 32768,
  },
}

req = urllib.request.Request(
  url.rstrip("/") + "/v1/chat/completions",
  data=json.dumps(payload).encode("utf-8"),
  headers={"Content-Type": "application/json"},
)

try:
  with urllib.request.urlopen(req, timeout=1800) as resp:
    data = json.loads(resp.read())
    content = data["choices"][0]["message"]["content"]
    usage = data.get("usage", {})
    with open(out_md, "w") as f: f.write(content)
    if usage:
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
