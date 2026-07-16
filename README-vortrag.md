# Vortrags-Setup — Aufnahmemodus

## Voraussetzungen

- `pdftotext` (Poppler): `brew install poppler`
- `python3` (macOS-Bordmittel)
- `.env` mit `OPENAI_API_BASE_URL` und `OPENAI_API_KEY` (Stackit) im Projekt-Root

## Die drei Skripte im Werkzeugkasten

Alle drei drucken absolute Startzeit + relative Zeitmarken + Tokenverbrauch.

### 1. `scripts/condense.sh` — Pro-Dokument-Kondensat

```bash
./scripts/condense.sh demo-material/fitko/1_Leistungsbeschreibung.pdf
# → demo-material/fitko-kondensat/1_Leistungsbeschreibung.md

# Alle PDFs auf einmal:
for f in demo-material/fitko/*.pdf; do ./scripts/condense.sh "$f"; done
```

### 2. `scripts/master.sh` — Gesamtsicht aus allen Kondensaten

```bash
./scripts/master.sh
# → demo-material/fitko-master.md
```

### 3. `scripts/ask.sh` — Frage stellen (Stackit-Frontier)

```bash
./scripts/ask.sh --mode master     prompts/fragen/f1-technologische-vorgaben.md
./scripts/ask.sh --mode kondensat  prompts/fragen/f3-widersprueche.md
./scripts/ask.sh --mode roh        prompts/fragen/f1-technologische-vorgaben.md   # scheitert am Kontextlimit — Feature!
# → demo-material/antworten/<frage>__<mode>.md
```

Verfügbare Fragen: `prompts/fragen/f{1,2,3,4}-*.md`.

### 4. `scripts/ask-local.sh` — Frage stellen (lokal via Ollama)

```bash
# Ollama muss laufen: ollama serve
./scripts/ask-local.sh --model qwen3:8b  --mode master    prompts/fragen/f1-technologische-vorgaben.md
./scripts/ask-local.sh --model qwen3:14b --mode kondensat prompts/fragen/f3-widersprueche.md
# → demo-material/antworten/<frage>__local_<modell>_<mode>.md
```

Kein `--mode roh`: die 30 Rohtexte (~130k Tokens) passen nicht in typische lokale Kontextfenster.
Das ist im Vortrag ein zusätzlicher Punkt für „warum EU-gehostet nötig sein kann".

## Wichtiger Punkt für die Aufnahme: der `roh`-Fail

Der `--mode roh` schickt alle 30 PDF-Rohtexte gegen das Modell und **wird abgewiesen** mit
„192.001 input tokens vs. maximum 200.000". Das ist ein didaktischer Volltreffer: „Alles reinwerfen"
scheitert schon am Kontextfenster — der Vortragspunkt zur Kontext-Aufbereitung
manifestiert sich vor der Kamera als 400-Antwort. Bitte diesen Aufruf im Video **stehen lassen**.

## Zeit-Sichtbarkeit im Video

Ist im Skript selbst eingebaut. Kein Prompt-Umbau nötig. Wenn du die Uhrzeit
auch **zwischen** Kommandos sehen willst, für die Aufnahme einmalig:

```bash
PROMPT='%D{%H:%M:%S} %~ %# '
```

## Optionen von condense.sh

- `--out DIR` — abweichendes Ausgabe-Verzeichnis
- `--model NAME` — anderes Stackit-Modell
- `-h` — Kurzhilfe

## Nicht enthalten (bewusst)

- Kein `activate.sh` — condense.sh sourced `.env` selbst
- Kein `llm`-CLI — direkter HTTPS-Call, weniger Abhängigkeiten
- Kein Batching mit Fortschrittsbalken — der einfache `for`-Loop reicht
