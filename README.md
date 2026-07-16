# Architekturarbeit mit lokalen und EU-gehosteten LLMs

Vortrag bei den **InfoDays Software Architektur**, 06.10.2026, 11:00–11:25 Uhr.
Alle Skripte, Prompts, Aufbereitungs-Artefakte und Video-Einspieler zum Vortrag.

> **Titel:** Architekturarbeit mit lokalen und EU-gehosteten LLMs — ein Praxisbericht
> **Sprecher:** Patrick Cornelißen (Atvantage)

## Worum es geht

Der Vortrag zeigt, wie ein Software-Architekt öffentliche Vergabeunterlagen mit Hilfe von KI aufbereitet, um architekturrelevante Aussagen (technologische Vorgaben, Widersprüche zwischen Anlagen, Betriebs-Kontext) daraus zu ziehen — und dabei bewusst zwischen **lokalen**, **EU-gehosteten** und **public** Modellen wählt.

Als Praxisfall dient die öffentliche FITKO-Rahmenvereinbarung „Integrierte Projekt- und Produktberatung" (TED 431936-2026), 30 Vergabedokumente, deren Inhalte nach §41 VgV frei zugänglich sind.

## Repository-Struktur

```
.
├── 00-vortrag-metadaten.md      Eckdaten, Kernbotschaften, Nutzen
├── 01-talking-points.md         Ausformulierte Talking Points, Block 1–6
├── 02-beispiele-und-vignetten.md  Persönliche Vignetten
├── 03-demo-fragen.md            Die 4 Demo-Fragen und Aufnahmestrategie
├── 04-eu-anbieter.md            EU-/DE-Anbieter-Recherche
├── README-vortrag.md            Werkzeugkasten-Übersicht für die Aufnahme
├── README.md                    (diese Datei)
│
├── prompts/
│   ├── kondensat-system.md      System-Prompt fürs Pro-Dokument-Kondensat
│   ├── master-system.md         System-Prompt für die Master-Synthese
│   ├── ask-system.md            System-Prompt für Fragen mit Kontext
│   └── fragen/                  Die 4 Demo-Fragen (F1–F4)
│
├── scripts/
│   ├── download-fitko.sh        Zieht die 30 Original-PDFs vom DTVP
│   ├── condense.sh              PDF → strukturiertes Kondensat (Stackit)
│   ├── master.sh                30 Kondensate → Master-Synthese
│   ├── ask.sh                   Frage mit roh/kondensat/master-Kontext (Stackit)
│   ├── ask-local.sh             Frage lokal via Ollama (nur kondensat/master)
│   └── record-scene.sh          iTerm2-Aufnahme einer Szene
│
├── scenes/                      Aufnahme-Szenen für record-scene.sh
├── videos/                      Aufgenommene Bühnenvideos (mit README)
│
└── demo-material/
    ├── fitko/                   Original-PDFs (NICHT im Repo — siehe unten)
    ├── fitko-text/              Rohtexte (NICHT im Repo — siehe unten)
    ├── fitko-kondensat/         30 KI-erzeugte Kondensate ✓ im Repo
    ├── fitko-master.md          Master-Synthese ✓ im Repo
    └── antworten/               Antworten auf die 4 Demo-Fragen ✓ im Repo
```

## Was fehlt im öffentlichen Repo — und warum

**Nicht enthalten:** die 30 Original-PDFs (`demo-material/fitko/`) und daraus extrahierten Rohtexte (`demo-material/fitko-text/`).

**Grund:** Die Unterlagen sind zwar nach §41 VgV registrierungsfrei zugänglich. Ihre vollständige Wiederveröffentlichung als PDF-Paket ist aber nicht durch den Vortragskontext gedeckt. Kondensate, Master-Synthese und Antworten sind eigenständig aus dem Material erzeugte Werke und werden hier zusammen mit den Aufbereitungs-Werkzeugen geteilt.

**So kommst du an die Originale**, falls du das Beispiel selbst nachbauen willst:

```bash
./scripts/download-fitko.sh
```

Zieht sich in ~1 Minute alle 30 PDFs direkt vom DTVP (Deutsches Vergabeportal).

## Setup, um den Praxisfall selbst nachzubauen

Voraussetzungen:
- macOS oder Linux mit `bash`, `curl`, `python3`
- [Poppler](https://poppler.freedesktop.org/) für `pdftotext` (`brew install poppler`)
- Für Stackit-Aufrufe: `.env` im Projekt-Root mit `OPENAI_API_BASE_URL` und `OPENAI_API_KEY` (Stackit AI Model Serving)
- Für Lokal-Aufrufe: [Ollama](https://ollama.com) mit `qwen3:8b` und `qwen3:14b`

Ablauf:

```bash
# 1. Originale ziehen
./scripts/download-fitko.sh

# 2. Alle PDFs in Kondensate verwandeln (~6 min)
for f in demo-material/fitko/*.pdf; do
  ./scripts/condense.sh "$f"
done

# 3. Master-Synthese aus den 30 Kondensaten (~90 s)
./scripts/master.sh

# 4. Fragen stellen
./scripts/ask.sh --mode master prompts/fragen/f1-technologische-vorgaben.md

# 5. Vergleich lokal (Ollama)
ollama serve &
./scripts/ask-local.sh --model qwen3:14b --mode master prompts/fragen/f1-technologische-vorgaben.md
```

Details in [`README-vortrag.md`](README-vortrag.md).

## Videos

Bühnenaufnahmen der CLI-Interaktionen liegen in [`videos/`](videos/) mit Index in [`videos/README.md`](videos/README.md).

## Lizenz / Nutzung

Vortragsmaterial: © Patrick Cornelißen / Atvantage.
Skripte: nach freiem Ermessen wiederverwendbar (nutz sie, mach sie besser).
KI-erzeugte Kondensate und Antworten: aus öffentlichem Vergabematerial synthetisiert; als Zwischenergebnis dokumentiert, ohne inhaltliche Gewähr.
