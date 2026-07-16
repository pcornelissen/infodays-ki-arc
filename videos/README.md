# Video-Einspieler für den Vortrag

Bühnenaufnahmen der CLI-Szenen. Reine Terminal-Videos, keine Voiceover-Spur —
werden im Live-Vortrag per Screenshare abgespielt, du sprichst live drüber.

Aufgenommen mit `scripts/record-scene.sh` gegen iTerm2, Region-Capture per macOS `screencapture -v`.
Szenen-Skripte in `scenes/`, Frage-Prompts in `prompts/fragen/`, System-Prompts in `prompts/`.

## Übersicht

| # | Video | Zeigt | Artefakt | Dauer |
|---|---|---|---|---|
| 01 | [01-condense-single.mov](01-condense-single.mov) | Ein PDF via `condense.sh` in ein strukturiertes Kondensat verwandeln (Qwen3-VL-235B auf Stackit) | [1_Leistungsbeschreibung_v.1.0.md](../demo-material/fitko-kondensat/1_Leistungsbeschreibung_v.1.0.md) | ~20 s |
| 02 | [02-ask-master.mov](02-ask-master.mov) | Frage F1 gegen den aufbereiteten Master-Kontext (Stackit) | [f1…__master.md](../demo-material/antworten/f1-technologische-vorgaben__master.md) | ~25 s |
| 03 | [03-ask-raw-fail.mov](03-ask-raw-fail.mov) | Der 400-Fail: alle 30 rohen PDFs (192.001 Tokens) sprengen das 200.000-Token-Kontextfenster | — (kein Artefakt, Fail ist die Aussage) | ~5 s |
| 04 | [04-ask-local-8b.mov](04-ask-local-8b.mov) | Gleiche Frage lokal auf `qwen3:8b` (Ollama, M3 32 GB) | [f1…__local_qwen3_8b_master.md](../demo-material/antworten/f1-technologische-vorgaben__local_qwen3_8b_master.md) | ~4 min |
| 05 | [05-ask-local-14b.mov](05-ask-local-14b.mov) | Gleiche Frage lokal auf `qwen3:14b` (Ollama, M3 32 GB) | [f1…__local_qwen3_14b_master.md](../demo-material/antworten/f1-technologische-vorgaben__local_qwen3_14b_master.md) | ~5 min |

## Erzähl-Reihenfolge im Vortrag (Vorschlag)

1. **Szene 03 zuerst** — der 400-Fail. Etabliert den Vortragspunkt „Kontext-Aufbereitung ist die eigentliche Arbeit" mit einem visuellen Knall statt einer Folie.
2. **Szene 01** — was Kontext-Aufbereitung konkret aussieht: 20 s pro Dokument, quellenverankertes Kondensat kommt raus.
3. **Szene 02** — Ergebnis der Kette: sauber, schnell, mit Referenzen. Zeigt was Frontier-Klasse + aufbereiteter Kontext liefert.
4. **Szene 04 + 05** — dieselbe Frage lokal. Zeigt Trade-off Geschwindigkeit (~4–5 min vs. ~20 s) und was ein deutlich kleineres Modell mit derselben Aufbereitung anfängt.

## Wichtige inhaltliche Beobachtungen

- **Nicht-Determinismus in Aktion (mit Belegstelle):** In mehreren Läufen produzierte `qwen3:8b` **mal 0, mal 10–18 halluzinierte `https://example.com/…`-URLs**. Die für Szene 04 aufgenommene Antwort war zufällig sauber (0 URLs). Ein separat gesichertes Halluzinations-Beispiel liegt unter [f1…__local_qwen3_8b_master__halluzination.md](../demo-material/antworten/f1-technologische-vorgaben__local_qwen3_8b_master__halluzination.md) — konkret 10 gefälschte URLs, mit denen das Modell die Kondensat-Referenzen aufgebläht hat. Im Vortrag sinnvoll als Folie hinter das 8B-Video schalten und explizit sagen: „Das Video zeigt einen guten Tag. In anderen Läufen kommt so etwas raus — mal ja, mal nein. Genau das ist der Punkt."
- **Kontextfenster-Grenze bei Rohtexten:** 30 PDFs entsprechen ~192.000 Tokens. Selbst das 200.000-Token-Fenster von Qwen3-VL-235B ist knapp gesprengt. Genau warum Kondensieren nötig ist.
- **VZÄ als „Unklarheit"**: Das Aufbereitungsmodell markiert den Standardbegriff „VZÄ = Vollzeitäquivalente" als unklar (siehe [f3-widersprueche__kondensat.md](../demo-material/antworten/f3-widersprueche__kondensat.md), Punkt 4). Beispiel für „menschlicher Lektorlauf bleibt zwingend". Nicht in einem der aktuellen Videos zu sehen — im Vortrag mündlich einbauen.

## Reproduzierbarkeit

Alle Videos lassen sich neu aufnehmen:

```bash
./scripts/record-scene.sh scenes/01-condense-single.sh
./scripts/record-scene.sh scenes/02-ask-master.sh
./scripts/record-scene.sh scenes/03-ask-raw-fail.sh
./scripts/record-scene.sh scenes/04-ask-local-8b.sh
./scripts/record-scene.sh scenes/05-ask-local-14b.sh
```

Für die Lokal-Modelle muss `ollama serve` laufen und `qwen3:8b` / `qwen3:14b` installiert sein.
Für die Stackit-Aufrufe muss `.env` mit `OPENAI_API_BASE_URL` und `OPENAI_API_KEY` bestückt sein.
