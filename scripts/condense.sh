#!/usr/bin/env bash
#
# condense.sh — kondensiert ein PDF-Dokument in ein strukturiertes Markdown-Kondensat.
#
# Aufruf:  condense.sh <pfad/zum.pdf> [--out <verzeichnis>] [--model <modell>]
# Default-Ausgabe-Verzeichnis: demo-material/fitko-kondensat
# Default-Modell:             Qwen/Qwen3-VL-235B-A22B-Instruct-FP8

set -euo pipefail

# --- Pfade -------------------------------------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
ENV_FILE="$PROJECT_ROOT/.env"
SYSTEM_PROMPT_FILE="$PROJECT_ROOT/prompts/kondensat-system.md"
DEFAULT_OUT_DIR="$PROJECT_ROOT/demo-material/fitko-kondensat"
DEFAULT_MODEL="Qwen/Qwen3-VL-235B-A22B-Instruct-FP8"

# --- Argumente parsen --------------------------------------------------------
PDF=""
OUT_DIR="$DEFAULT_OUT_DIR"
MODEL="$DEFAULT_MODEL"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --out)    OUT_DIR="$2"; shift 2 ;;
    --model)  MODEL="$2";   shift 2 ;;
    -h|--help)
      sed -n '2,7p' "$0" | sed 's/^# *//'
      exit 0 ;;
    -*)
      echo "Unbekannte Option: $1" >&2; exit 2 ;;
    *)
      if [[ -z "$PDF" ]]; then PDF="$1"; else
        echo "Nur ein PDF pro Aufruf." >&2; exit 2
      fi
      shift ;;
  esac
done

if [[ -z "$PDF" ]]; then
  echo "Aufruf: condense.sh <pfad/zum.pdf> [--out DIR] [--model NAME]" >&2
  exit 2
fi

if [[ ! -f "$PDF" ]]; then
  echo "PDF nicht gefunden: $PDF" >&2; exit 1
fi

# --- .env laden --------------------------------------------------------------
if [[ ! -f "$ENV_FILE" ]]; then
  echo "Fehlt: $ENV_FILE" >&2; exit 1
fi
# nomatch/globs deaktivieren, damit Klammern in Kommentaren nicht stören
set +o histexpand 2>/dev/null || true
# eigenes Parsen ist robuster als 'source' bei kruden .env-Dateien
while IFS='=' read -r key val; do
  [[ -z "$key" || "$key" =~ ^[[:space:]]*# ]] && continue
  val="${val%\"}"; val="${val#\"}"; val="${val%\'}"; val="${val#\'}"
  export "$key=$val"
done < <(grep -E '^[A-Za-z_][A-Za-z0-9_]*=' "$ENV_FILE")

: "${OPENAI_API_BASE_URL:?fehlt in .env}"
: "${OPENAI_API_KEY:?fehlt in .env}"

# --- Utilities ---------------------------------------------------------------
BASENAME="$(basename "$PDF" .pdf)"
mkdir -p "$OUT_DIR"
OUT_MD="$OUT_DIR/${BASENAME}.md"
TMP_TXT="$(mktemp -t condense.XXXXXX).txt"
trap 'rm -f "$TMP_TXT"' EXIT

START_EPOCH=$(date +%s)
elapsed() {
  local now=$(date +%s)
  printf "+%ds" $((now - START_EPOCH))
}

step() {
  printf "[%s] %s\n" "$(elapsed)" "$*"
}

# --- Ablauf ------------------------------------------------------------------
printf "== %s == condense start\n" "$(date '+%Y-%m-%d %H:%M:%S')"
printf "    file : %s\n" "$PDF"
printf "    model: %s\n" "$MODEL"
printf "    out  : %s\n" "$OUT_MD"

step "pdftotext ..."
if ! command -v pdftotext >/dev/null 2>&1; then
  echo "pdftotext fehlt (brew install poppler)" >&2; exit 1
fi
pdftotext -layout "$PDF" "$TMP_TXT"

WORDS=$(wc -w <"$TMP_TXT" | tr -d ' ')
step "extrahiert: ${WORDS} Wörter"

if [[ ! -f "$SYSTEM_PROMPT_FILE" ]]; then
  echo "System-Prompt fehlt: $SYSTEM_PROMPT_FILE" >&2; exit 1
fi

step "sende an ${MODEL##*/} @ Stackit ..."

# JSON-Body via Python bauen (sichere Escapes), Antwort direkt in OUT_MD schreiben
python3 - "$SYSTEM_PROMPT_FILE" "$TMP_TXT" "$(basename "$PDF")" "$MODEL" "$OUT_MD" <<'PY'
import json, os, sys, urllib.request, urllib.error

sys_file, txt_file, doc_name, model, out_md = sys.argv[1:6]

with open(sys_file) as f: system_prompt = f.read()
with open(txt_file) as f: doc_text = f.read()

user_prompt = (
  f"Dokument: {doc_name}\n\n"
  f"Inhalt:\n---\n{doc_text}\n---\n\n"
  "Erzeuge das Kondensat nach der vorgegebenen Struktur."
)

payload = {
  "model": model,
  "messages": [
    {"role": "system", "content": system_prompt},
    {"role": "user",   "content": user_prompt},
  ],
  "temperature": 0.2,
  "max_tokens": 3000,
}

base = os.environ["OPENAI_API_BASE_URL"].rstrip("/")
key  = os.environ["OPENAI_API_KEY"]

req = urllib.request.Request(
  base + "/v1/chat/completions",
  data=json.dumps(payload).encode("utf-8"),
  headers={"Authorization": f"Bearer {key}", "Content-Type": "application/json"},
)

try:
  with urllib.request.urlopen(req, timeout=300) as resp:
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

step "fertig → $OUT_MD"
