#!/usr/bin/env bash
#
# download-fitko.sh — lädt die 30 öffentlichen Vergabeunterlagen der FITKO
# Rahmenvereinbarung (TED 431936-2026, DTVP CXP4DM2MNHA) vom Deutschen
# Vergabeportal herunter.
#
# Hintergrund: die Unterlagen sind nach §41 VgV registrierungsfrei zugänglich,
# werden aber im Repo nicht mitgeliefert — jeder zieht sich sein eigenes Set.
#
# Aufruf: download-fitko.sh
# Ausgabe: demo-material/fitko/*.pdf (30 Dokumente, ca. 14 MB)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
OUT_DIR="$PROJECT_ROOT/demo-material/fitko"

NOTICE_ID="CXP4DM2MNHA"
DOCS_URL="https://www.dtvp.de/Satellite/public/company/project/${NOTICE_ID}/de/documents"
BASE_URL="https://www.dtvp.de/Satellite/public/company/project/${NOTICE_ID}/de"

mkdir -p "$OUT_DIR"
TMP_HTML="$(mktemp -t dtvphtml.XXXXXX).html"
TMP_COOKIES="$(mktemp -t dtvpjar.XXXXXX)"
trap 'rm -f "$TMP_HTML" "$TMP_COOKIES"' EXIT

echo "== $(date '+%Y-%m-%d %H:%M:%S') == download-fitko start"
echo "    notice: $NOTICE_ID"
echo "    out   : $OUT_DIR"

echo "[1/3] Bekanntmachungsseite laden (Session initialisieren) ..."
curl -sL -c "$TMP_COOKIES" -A "Mozilla/5.0" "$DOCS_URL" -o "$TMP_HTML"
HTML_BYTES=$(wc -c <"$TMP_HTML" | tr -d ' ')
if [ "$HTML_BYTES" -lt 30000 ]; then
  echo "Server-Antwort verdächtig klein ($HTML_BYTES bytes) — evtl. Seiten-Layout geändert." >&2
  exit 1
fi

echo "[2/3] Download-Links extrahieren ..."
# HTML enthält Onclick-Handler wie
#   window.location.href='./documents/<cat>/<file>;jsessionid=...'
# Diese aus dem HTML holen, jsessionid und Cookie verwenden zum Download.
python3 - "$TMP_HTML" "$OUT_DIR" "$BASE_URL" "$TMP_COOKIES" <<'PY'
import html, os, re, subprocess, sys, urllib.parse

html_path, out_dir, base_url, cookie_file = sys.argv[1:5]

with open(html_path, 'rb') as f:
    body = f.read().decode('iso-8859-1')

pattern = r"window\.location\.href=&#039;(\./documents/[^']+?);jsessionid=([^&']+)&#039;"
matches = re.findall(pattern, body)
seen = set()
pairs = []
for rel, jsid in matches:
    if rel in seen:
        continue
    seen.add(rel)
    pairs.append((rel, jsid))

pdfs = [p for p in pairs if p[0].lower().endswith('.pdf')]
print(f"    gefunden: {len(pairs)} Dateien insgesamt, davon {len(pdfs)} PDFs")

# Cookie aus Netscape-cookie-jar lesen
jsession = None
with open(cookie_file) as f:
    for line in f:
        if line.startswith('#') or not line.strip():
            continue
        parts = line.strip().split('\t')
        if len(parts) >= 7 and parts[5] == 'JSESSIONID':
            jsession = parts[6]
            break
if not jsession:
    print("    Warnung: keine JSESSIONID im Cookie-Jar gefunden", file=sys.stderr)

ok = fail = 0
for rel, jsid in pdfs:
    path_part = rel[2:]  # strip "./"
    url = f"{base_url}/{path_part};jsessionid={jsid}"
    raw_name = os.path.basename(rel)
    fname = urllib.parse.unquote(urllib.parse.unquote(raw_name)).replace('+', '_')
    out_path = os.path.join(out_dir, fname)
    if os.path.exists(out_path) and os.path.getsize(out_path) > 5000:
        print(f"    [SKIP] {fname}")
        ok += 1
        continue
    cmd = ['curl', '-sL',
           '-H', f'Cookie: JSESSIONID={jsession}',
           '-A', 'Mozilla/5.0',
           '-e', f'{base_url}/documents',
           '-o', out_path,
           '-w', '%{http_code}|%{size_download}|%{content_type}',
           url]
    r = subprocess.run(cmd, capture_output=True, text=True)
    http, size, ctype = r.stdout.split('|')
    size = int(size)
    if http == '200' and size > 5000 and 'text/html' not in ctype:
        ok += 1
        print(f"    [OK]   {fname} ({size} B)")
    else:
        fail += 1
        print(f"    [FAIL] [{http}, {size}B, {ctype}] {fname}")
        if os.path.exists(out_path):
            os.remove(out_path)

print(f"\n    Ergebnis: OK={ok}  FAIL={fail}")
sys.exit(0 if fail == 0 else 1)
PY

echo "[3/3] Bestand:"
ls "$OUT_DIR"/*.pdf 2>/dev/null | wc -l | xargs -I{} echo "    {} PDFs in $OUT_DIR"
du -sh "$OUT_DIR" 2>/dev/null

echo "== $(date '+%Y-%m-%d %H:%M:%S') == download-fitko fertig"
