#!/usr/bin/env bash
#
# master.sh — synthesiert alle Einzelkondensate zu einer architekturrelevanten Gesamtsicht.
#
# Aufruf:  master.sh [--in DIR] [--out FILE] [--model MODEL]
# Default-Eingabe: demo-material/fitko-kondensat
# Default-Ausgabe: demo-material/fitko-master.md
# Default-Modell:  Qwen/Qwen3-VL-235B-A22B-Instruct-FP8

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
ENV_FILE="$PROJECT_ROOT/.env"
SYSTEM_PROMPT_FILE="$PROJECT_ROOT/prompts/master-system.md"
DEFAULT_IN_DIR="$PROJECT_ROOT/demo-material/fitko-kondensat"
DEFAULT_OUT="$PROJECT_ROOT/demo-material/fitko-master.md"
DEFAULT_MODEL="Qwen/Qwen3-VL-235B-A22B-Instruct-FP8"

IN_DIR="$DEFAULT_IN_DIR"
OUT="$DEFAULT_OUT"
MODEL="$DEFAULT_MODEL"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --in)     IN_DIR="$2"; shift 2 ;;
    --out)    OUT="$2";    shift 2 ;;
    --model)  MODEL="$2";  shift 2 ;;
    -h|--help) sed -n '2,8p' "$0" | sed 's/^# *//'; exit 0 ;;
    *) echo "Unbekannte Option: $1" >&2; exit 2 ;;
  esac
done

[[ -d "$IN_DIR" ]] || { echo "Eingabe-Verzeichnis fehlt: $IN_DIR" >&2; exit 1; }
[[ -f "$ENV_FILE" ]] || { echo "Fehlt: $ENV_FILE" >&2; exit 1; }
[[ -f "$SYSTEM_PROMPT_FILE" ]] || { echo "System-Prompt fehlt: $SYSTEM_PROMPT_FILE" >&2; exit 1; }

# .env robust einlesen (gleiches Muster wie condense.sh)
while IFS='=' read -r key val; do
  [[ -z "$key" || "$key" =~ ^[[:space:]]*# ]] && continue
  val="${val%\"}"; val="${val#\"}"; val="${val%\'}"; val="${val#\'}"
  export "$key=$val"
done < <(grep -E '^[A-Za-z_][A-Za-z0-9_]*=' "$ENV_FILE")

: "${OPENAI_API_BASE_URL:?fehlt in .env}"
: "${OPENAI_API_KEY:?fehlt in .env}"

START_EPOCH=$(date +%s)
elapsed() { local now=$(date +%s); printf "+%ds" $((now - START_EPOCH)); }
step() { printf "[%s] %s\n" "$(elapsed)" "$*"; }

printf "== %s == master start\n" "$(date '+%Y-%m-%d %H:%M:%S')"
printf "    in    : %s\n" "$IN_DIR"
printf "    model : %s\n" "$MODEL"
printf "    out   : %s\n" "$OUT"

# Alle Kondensat-Dateien (außer _batch.*) einsammeln und mit klaren Trennern zusammenfassen
TMP_JOIN="$(mktemp -t master.XXXXXX).md"
trap 'rm -f "$TMP_JOIN"' EXIT

COUNT=0
for f in "$IN_DIR"/*.md; do
  base=$(basename "$f")
  [[ "$base" == _* ]] && continue
  {
    echo "===== KONDENSAT: $base ====="
    cat "$f"
    echo ""
  } >> "$TMP_JOIN"
  COUNT=$((COUNT+1))
done

WORDS=$(wc -w <"$TMP_JOIN" | tr -d ' ')
step "vereinigt: ${COUNT} Kondensate, ${WORDS} Wörter"

step "sende an ${MODEL##*/} @ Stackit ..."

python3 - "$SYSTEM_PROMPT_FILE" "$TMP_JOIN" "$MODEL" "$OUT" <<'PY'
import json, os, sys, urllib.request, urllib.error

sys_file, join_file, model, out_md = sys.argv[1:5]

with open(sys_file) as f: system_prompt = f.read()
with open(join_file) as f: all_kondensate = f.read()

user_prompt = (
  "Grundlage: die untenstehenden 30 Einzelkondensate der FITKO-Vergabeausschreibung.\n"
  "Jedes Kondensat ist durch eine Trennerzeile ===== KONDENSAT: <name> ===== eingeleitet.\n"
  "Referenziere in deiner Analyse jeweils den Kondensat-Namen und die darin genannten Abschnittsverweise.\n\n"
  "Erzeuge jetzt die architekturrelevante Gesamtsicht nach der vorgegebenen Struktur.\n\n"
  "--- ANFANG KONDENSATE ---\n\n"
  f"{all_kondensate}\n"
  "--- ENDE KONDENSATE ---"
)

payload = {
  "model": model,
  "messages": [
    {"role": "system", "content": system_prompt},
    {"role": "user",   "content": user_prompt},
  ],
  "temperature": 0.2,
  "max_tokens": 12000,
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
