# Folien-Drehbuch

Für die Umsetzung in PowerPoint. Zielgruppe: Software-Architekt:innen im Live-Vortrag,
**20 Min Vortrag + 5 Min Q&A**, per Videokonferenz. Videos werden per Screenshare eingespielt.

**Design-Prinzipien:**
- 16:9, hoher Kontrast (Vortrag wird per Zoom o.ä. übertragen, Kompression schluckt Kleinteiliges)
- Große Typografie, wenig Text pro Folie
- Konsistentes Farbschema: eine Akzentfarbe für „souverän/EU", eine für „nicht-souverän/US"
- Keine Bulletpoint-Wüsten. Wenn eine Aussage die Folie trägt, ist sie eine einzelne Zeile
- **Video-Folien** enthalten Video + kurzen Prompt-/Frage-Auszug zum Nebendran-Erklären. Sprecher spricht live drüber
- Alle Sprecher-Notizen gehen in das Notizenfeld der jeweiligen Folie

**Gesamt: 21 Folien für 20 Min = ~57 s pro Folie im Schnitt.**

---

## Folie 1 — Titelfolie

**Layout:** Titel-Zentriert
**Inhalt:**
- Titel (groß): Architekturarbeit mit lokalen und EU-gehosteten LLMs
- Untertitel: Ein Praxisbericht
- Zeile darunter: Patrick Cornelißen · Atvantage
- Fußzeile: InfoDays Software Architektur · 06.10.2026

**Speaker Notes (~30 s):**
- Kurz begrüßen, Namen nennen, Thema anteasern
- Zeitrahmen anmoderieren (20 Min + 5 Min Q&A)

---

## Folie 2 — Der Aufhänger

**Layout:** Vollflächen-Zitat / große Frage
**Inhalt (eine Zeile, mittig, groß):**
> Kann ein LLM bei Architekturentscheidungen mitdenken, ohne dass deine Entwürfe durch US-Cloud-Backends wandern?

**Speaker Notes (~45 s):**
- Die Frage laut vorlesen, kurze Pause
- Antwort andeuten: „Ja, aber nicht überall gleich gut."
- Klare Ansage: kein „KI macht jetzt auch Architektur"-Vortrag, kein Tool-Lobgesang
- Souveränität nicht als Marketing-Etikett, sondern als Entscheidung pro Use Case

---

## Folie 3 — Wer da vorne redet

**Layout:** Titel + zwei kurze Zeilen
**Inhalt:**
- 25+ Jahre Software-Architekt · Bei Atvantage: Schwerpunkt digitale Souveränität
- Was du hörst, ist **ehrlicher Zwischenstand** aus laufender Praxis

**Speaker Notes (~25 s):**
- Kurz zur Person, nutze die Setups selbst
- Ehrlichkeit vor Vollständigkeit — auch die Grenzen sitzen im Vortrag

---

## Folie 4 — Baseline: die faire Messlatte

**Layout:** Vollflächen-Zitat
**Inhalt:**
> Wir verlangen von KI 100 % Perfektion. Sind aber selbst keine Maschinen — und liegen ehrlich gemessen auch darunter.

**Speaker Notes (~60 s):**
- Frame für den ganzen Vortrag: KI vs. Mensch unter Zeitdruck, nicht KI vs. Perfektion
- Vignette aus eigener Praxis: zwei Ausschreibungen in den letzten 12 Monaten, KI zum Zusammenfassen genutzt — nicht falscher als ich selbst, aber deutlich schneller
- Diese Rahmung entwaffnet später die typischen „KI könnte doch falsch liegen"-Reflexe

---

## Folie 5 — Das Entscheidungsraster

**Layout:** 3-Spalten-Tabelle, große Zellen
**Inhalt:**

| Lokal | EU-gehostet | Public |
|---|---|---|
| Inhalt darf **nicht raus** | Braucht **Qualität**, Inhalt lässt es zu | Nichts Schützenswertes oder ADV/AVV reicht |
| M3, Ollama, Open-Weight | z. B. Stackit, IONOS, Mistral (Paris) | die üblichen Verdächtigen |
| Qualitätsdeckel | Frontier-Klasse möglich | Frontier-Klasse Standard |

Untertitel: **Kein Router. Kein Hochglanz-Stack. Eine bewusste Wahl pro Fall.**

**Speaker Notes (~75 s):**
- Kernframework — Achsen: Schutzbedarf, Qualitätsbedarf, Kontextlänge
- Take-away-Merksatz: „Wähle das **stärkste** Modell, das der Schutzbedarf zulässt"

---

## Folie 6 — Ökosystem der EU-/DE-Anbieter

**Layout:** Titel + drei Anbieter-Namen groß, jeweils zwei Zeilen Kürzest-Erklärung
**Inhalt:**

**Stackit** (DE) — voll deutscher Managed-Stack, BSI-C5, kein eigenes Frontier-Modell
**IONOS AI Model Hub** (DE) — zweiter deutscher Player, Open-Weight-Modelle
**Mistral la Plateforme** (FR) — einziger Frontier-Provider mit EU-Residency

Untertitel: **In DE gibt es aktuell keinen 1:1-Frontier-Ersatz.**

**Speaker Notes (~50 s):**
- Nur die drei Namen als Beispiele, nicht die vollständige Liste
- Kurzer Warnhinweis: „Manche ‚deutsche KI-Plattformen' leiten im Kleingedruckten auf Azure OpenAI Frankfurt um — immer nach Inferenz-Backend und Vertragspartner fragen"

---

## Folie 7 — Übergang: die eigentliche Arbeit

**Layout:** Titel-Zentriert, kein weiterer Inhalt
**Inhalt (mittig, groß):**
> Die Modellwahl ist nicht der Engpass. Der Engpass ist der Kontext.

**Speaker Notes (~40 s):**
- Diesen Satz betont vorlesen
- Legitimations-Verweis: „Das ist keine Nischenbeobachtung — die CaSE-Podcast-Episode ‚Agent Harness, State of Play, Risk and AI Company Culture' bringt genau denselben Punkt als **Context Engineering: The Real Lever** auf den Punkt."
- Kurz FITKO-Vergabe einordnen: 30 Vergabedokumente, Rahmenvertrag Projekt-/Produktberatung, 254 Mio €, 8 Fachdisziplinen inklusive Enterprise-Architektur und Software-Engineering

---

## Folie 8 — Das Setup: Aufbereitung als Pipeline

**Layout:** Titel + Diagramm mit zwei Spuren
**Inhalt:**

**Für PDFs — mein Setup (drei Bash-Skripte gegen die Stackit-API):**
```
30 PDFs ──► condense.sh ──► 30 Kondensate ──► master.sh ──► Master ──► ask.sh + Frage ──► Antwort
              (Qwen3-VL-235B)                    (gleiches Modell)          (gleiches Modell)
```

**Für Code — fertig als Skill:**
```
Codebase ──► Understand-Anything ──► Knowledge Graph ──► Antwort
```

Untertitel: **Gleiches Prinzip, verschiedene Domänen. Das Werkzeug ist zweitrangig, die Aufbereitung ist der Punkt.**

**Speaker Notes (~60 s):**
- „Drei Bash-Skripte gegen die Stackit-API. Keine Frameworks, keine Router, kein Hochglanz-Stack — bewusst minimal, damit man das Prinzip sieht statt das Tooling."
- „Für Code muss man das nicht mal selbst bauen: Understand-Anything ist ein Skill, der genau das für Codebasen macht — Files, Klassen, Beziehungen, Layer, Business-Domänen. Dazu komme ich am Ende nochmal ausführlicher zurück."
- Zum nächsten Teil überleiten: „Was passiert, wenn man diesen Schritt weglässt? Also alle 30 PDFs direkt an das Frontier-Modell schickt?"

---

## Folie 9 — Video: „Alles reinwerfen" scheitert (Szene 03)

**Layout:** Video-Vollflächen-Einbettung
**Inhalt:**
- Eingebettetes Video: [videos/03-ask-raw-fail-trim.mp4](videos/03-ask-raw-fail-trim.mp4)
- Kleiner Titel oben rechts: *30 rohe PDFs an das Modell*

**Speaker Notes (~40 s):**
- Video anspielen (~12 s), beim HTTP 400 stehen bleiben
- Kern laut vorlesen: „192.001 Tokens, Maximum 200.000, Bad Request"
- „Selbst das Frontier-Modell kann meine Halde nicht anfassen. Das ist keine Ausnahme, das ist der Normalfall bei realistischen Dokumentmengen."

---

## Folie 10 — Deshalb: strukturieren und kondensieren

**Layout:** Titel + 3 Kernaussagen als große Punkte
**Inhalt:**
- **Faktenextraktion** aus PDF-Halde → ist ein LLM einem Menschen sowieso überlegen
- **Architektonisches Arbeiten** (Trade-offs, Widersprüche, ADR-Argumente) → braucht **strukturierten, kondensierten Kontext**
- Kontext-Aufbereitung ist der **eigentliche Wertschöpfungsschritt**, nicht die Modellwahl

**Speaker Notes (~55 s):**
- Klar unterscheiden: „Was steht drin?" vs. „Was folgt daraus für die Architektur?"
- Für das erste braucht's keine Kunst. Für das zweite: aufbereiten, damit das Modell Bezüge sehen kann

---

## Folie 11 — Video: Kondensat eines Dokuments (Szene 01, mit Prompt)

**Layout:** Split — links Video, rechts Prompt-Auszug (Monospace, klein aber lesbar)
**Inhalt:**

*Links:* Eingebettetes Video [videos/01-condense-single-trim.mp4](videos/01-condense-single-trim.mp4)
Kleiner Titel: *`condense.sh` auf einem PDF — Qwen3-VL-235B*

*Rechts (Auszug aus [prompts/kondensat-system.md](prompts/kondensat-system.md)):*

```markdown
Du bist Analyst für öffentliche Vergabeunterlagen mit
Fokus auf Software-Architektur.

Regeln:
- Nur was im Dokument steht. Keine Spekulation.
- Jede Aussage mit Quellenverweis (Abschnitt/Seite).
- Widersprüche explizit markieren, nicht glätten.

Ausgabeformat (Markdown, feste Struktur):
- Rolle im Verfahren
- Kernaussagen (architekturrelevant)
- Technologische/methodische Vorgaben
- Nicht-funktionale Anforderungen
- Verweise auf andere Anlagen
- Unklarheiten und Widersprüche
- Für die Architekturarbeit besonders relevant
```

**Speaker Notes (~60 s):**
- Vor dem Video: „Aufbereitungs-Modell Qwen3-VL-235B bei Stackit, souverän, in Deutschland."
- Prompt kurz einordnen: „System-Prompt, ehrlich gehalten — keine Kunst, feste Struktur, Quellenverweise verpflichtend."
- Video läuft (~30 s), Zeitanker: „~17 Sekunden pro Dokument. Insgesamt 5 Minuten für alle 30."

---

## Folie 12 — So sieht ein Kondensat aus

**Layout:** Titel + Markdown-Ausschnitt (großer Font)
**Inhalt:**

```markdown
# 1_Leistungsbeschreibung_v.1.0.pdf

## Kernaussagen (architekturrelevant)
- Enterprise- und Lösungsarchitektur als eigenständige
  Beratungsfelder mit klaren Rollen [§6.1]
- TOGAF, ArchiMate, C4-Modell, DDD, iSAQB, arc42
  verpflichtend [§6.1.1, §6.2.1.5]

## Unklarheiten im Dokument
- Definitorisch: „Führung von Teams" bleibt undefiniert [§10.2.6]
- Widerspruch: Nicht-Eingliederung (§2.3) vs. Präsenzpflicht (§9.1)
```

**Speaker Notes (~45 s):**
- Feste Struktur, alle Aussagen mit Quellenverweis
- „Das Modell findet Widersprüche schon innerhalb eines Dokuments — die Basis für den nächsten Schritt."

---

## Folie 13 — Video: Frage an den aufbereiteten Kontext (Szene 02, mit Prompt)

**Layout:** Split — links Video, rechts Frage-Auszug
**Inhalt:**

*Links:* Eingebettetes Video [videos/02-ask-master-trim.mp4](videos/02-ask-master-trim.mp4)
Kleiner Titel: *`ask.sh` mit Master-Kontext*

*Rechts (Auszug aus [prompts/fragen/f1-technologische-vorgaben.md](prompts/fragen/f1-technologische-vorgaben.md)):*

```markdown
Gibt es Vorgaben zu Technologien, Frameworks, Standards,
Programmiersprachen oder Cloud-/Hosting-Anbietern, die die
zu erbringende Architektur beeinflussen?

Trenne klar:
- Explizite Vorgaben (wird ausdrücklich gefordert)
- Implizite Vorgaben (ergibt sich zwingend aus Kontext,
  Standards, Verweisen, Bewertungskriterien)

Falls in einer Kategorie keine Vorgaben zu finden sind,
sag das explizit.
```

**Speaker Notes (~60 s):**
- „Frage ist bewusst so formuliert, dass das Modell zwischen explizit und implizit unterscheiden muss."
- Video läuft (~37 s), Zeitanker: „25 Sekunden für die Antwort, gegen einen kondensierten Master-Kontext — statt der 130.000+ Tokens aus den rohen PDFs."

---

## Folie 14 — Und das kommt raus (Ergebnis-Auszug)

**Layout:** Titel + Markdown-Ausschnitt aus der tatsächlichen Antwort (große Type)
**Inhalt (Auszug aus [demo-material/antworten/f1-technologische-vorgaben__master.md](demo-material/antworten/f1-technologische-vorgaben__master.md)):**

```markdown
## Explizite Vorgaben

**Keine expliziten Vorgaben** zu Programmiersprachen,
Cloud-Anbietern oder Plattformen.

## Implizite Vorgaben — aus Standards und Frameworks

**Architekturmethoden**: TOGAF, ArchiMate, C4-Modell,
Domain-Driven Design, iSAQB, arc42, UML, BPMN [§6.2.1, §10.2.2]
→ Architektur muss dokumentiert und nachvollziehbar sein

**Sicherheit & Compliance**: BSI IT-Grundschutz, ISO 27001,
C5, NIS2, Zero-Trust, Security-by-Design [§6.2.1.5, §10.2.2]
→ Security-Konzepte müssen mitgeliefert werden
```

**Speaker Notes (~60 s):**
- Sichtbar machen: „Das Modell hat nicht nur eine Liste ausgespuckt — es hat sie architektonisch strukturiert. Explizit vs. implizit. Und jede Aussage hat einen Quellenverweis."
- Kritischer Punkt: „Keine erfundenen Frameworks, keine ‚das sollte man auch nehmen'-Ergänzungen aus dem Trainingskorpus. Nur was aus der Ausschreibung ableitbar ist."

---

## Folie 15 — Was rauskommt aus 30 Kondensaten

**Layout:** Titel + 4 Aufzählungspunkte mit fetten Highlights
**Inhalt:**

**Aus 30 Kondensaten synthetisiert (`fitko-master.md`):**
- **10 fundamentale Architekturfragen**, die die Ausschreibung selbst **nicht beantwortet** (Programmiersprachen, Cloud-Provider, Datenmodelle, Schnittstellen …)
- **4 harte Widersprüche zwischen Anlagen** — Referenzzählung, Definitionslücken
- **Genutzte Standards und Frameworks** vollständig gebündelt: TOGAF, ArchiMate, C4, DDD, iSAQB, arc42, BSI-Grundschutz, ISO 27001, C5, XÖV, XZuFi, OSCI
- **Falsch-Positiv gefunden:** VZÄ als „unklar" markiert — obwohl Standardbegriff. **Warum menschlicher Lektorlauf bleibt.**

**Speaker Notes (~70 s):**
- Der 10-Fragen-Punkt ist der Wow: die KI zeigt, was in der Ausschreibung **fehlt**
- Bei VZÄ: Modell ist domänenfremd, kennt den Begriff nicht als Standard → markiert als Grauzone
- „KI liefert, aber sie liefert nicht perfekt. Menschlicher Review bleibt zwingend."

---

## Folie 16 — Understand-Anything im Detail

**Layout:** Titel + zwei-Spalten
**Inhalt (links):**
- Codebase rein → **Knowledge Graph**: Dateien, Klassen, Funktionen, Imports, Layer, Business-Domänen
- Sub-Skills für Alltagsfragen: **understand, understand-diff, understand-onboard, understand-domain**

**Inhalt (rechts, Graph-Skizze):** Ein paar Knoten (Files / Klassen), gerichtete Kanten, gruppiert in Layer-Boxen. Symbolisch.

Untertitel: **Mit einem Coding-Harness gegen eigengehostete LLMs → komplett auf souveräner Infrastruktur.**

**Speaker Notes (~55 s):**
- Kurze Konkretisierung: „Für Code muss ich das Prinzip nicht selbst nachbauen — Understand-Anything liefert das fertig."
- Souveränitäts-Bogen: „Und mit einem Coding-Harness, der eigengehostete LLMs versteht, lässt sich das komplett auf der eigenen Infrastruktur betreiben — Alltagsarbeit am Code auf souveränem Setup."

---

## Folie 17 — Fallstricke — und wie man sie umgeht

**Layout:** Tabelle (dreispaltig): Fallstrick / Was passiert / Gegenmittel
**Inhalt:**

| Fallstrick | Was passiert | Gegenmittel |
|---|---|---|
| Kontextlänge zu kurz | 40-Seiten-Doc passt lokal nicht | Frontier mit 200k+; lokal: hochstufen |
| Zu höfliches Modell | Stimmt zu, statt zu widersprechen | Prompt auf Ehrlichkeit trimmen, Rollenwechsel |
| Halluzinierte Referenzen | Erfindet Patterns, URLs, Bibliotheken | Pflichtreferenzen, Lektorlauf mit Prüf-Prompt |
| Overconfidence bei Domänen | Wirkt sicher, wo Wissen fehlt | Belege einfordern, „was ist unbelegt?"-Prompt |
| Fehlendes Fachvokabular | Standardbegriffe als „unklar" (VZÄ!) | Menschlicher Lektor — Domänenwissen beim Menschen |

Untertitel: **Fast alles lösbar mit Prompt-Disziplin. Harte Grenze: Modellgröße bei lokalen Setups.**

**Speaker Notes (~55 s):**
- Kurz durch die Tabelle, Highlight auf die letzten beiden Zeilen
- „Das sind Fallstricke, keine Sackgassen"

---

## Folie 18 — Video: Lokale Modelle — 8B vs. 14B (Szenen 04 + 05)

**Layout:** Zwei Videos nebeneinander oder Split-Screen
**Inhalt:**
- Links: [videos/04-ask-local-8b-trim.mp4](videos/04-ask-local-8b-trim.mp4) — *qwen3:8b lokal auf M3*
- Rechts: [videos/05-ask-local-14b-trim.mp4](videos/05-ask-local-14b-trim.mp4) — *qwen3:14b lokal auf M3*
- Untertitel: **Gleiche Frage, gleicher Kontext, unterschiedliche Modellgrößen. Wartezeit im Video 8x beschleunigt.**

**Speaker Notes (~60 s):**
- Vergleich zur Stackit-Antwort (25 s): „Faktor 8–10 langsamer, deutlich kleineres Modell — aber komplett offline"
- Take-away: „Für Inhalte, die nicht raus dürfen, ist das der Preis. Und der Preis ist zahlbar."

---

## Folie 19 — Halluzinationen live gefangen

**Layout:** Titel + Code-Screenshot mit rot markierten Halluzinationen
**Inhalt (Ausschnitt aus [demo-material/antworten/f1-…__halluzination.md](demo-material/antworten/f1-technologische-vorgaben__local_qwen3_8b_master__halluzination.md)):**

```markdown
**Quelle**: [1_Leistungsbeschreibung_v.1.0.md §6.2.1](https://example.com/…)
**Quelle**: [1_Leistungsbeschreibung_v.1.0.md §10.2.2](https://example.com/…)
**Quelle**: [1_Leistungsbeschreibung_v.1.0.md §3.1](https://example.com/…)
**Quelle**: [8.1_Mitarbeiterprofile_Projektmanagement.md](https://example.com/…)
…
```

Rot markiert: `https://example.com/…` — 10 Mal.

Untertitel: **`qwen3:8b`, ein Lauf von dreien. Nicht-deterministisch.**

**Speaker Notes (~55 s):**
- „Das Video davor lief sauber. In diesem Lauf hat dasselbe Modell 10 URLs erfunden."
- „Mal ja, mal nein. Das Problem ist nicht dass die URLs kommen, sondern dass du es beim nächsten Lauf nicht siehst."

---

## Folie 20 — Was du mitnimmst

**Layout:** Titel + 4 klare Punkte, große Typografie
**Inhalt:**

- Souveränität ist eine **Entscheidung pro Use Case**, kein Etikett
- Wähle das **stärkste Modell**, das der Schutzbedarf zulässt — nicht das gerade angesagteste
- Die **Arbeit liegt in der Kontext-Aufbereitung**, nicht in der Modellwahl
- **LLM als Sparringspartner**, nicht als Entscheider — die Verantwortung bleibt beim Architekten

**Speaker Notes (~45 s):**
- Vier Sätze, jeder einzeln kurz durchgehen
- Puffer für Übergang zu Kontakt / Q&A

---

## Folie 21 — Kontakt & weiterführend

**Layout:** Titel + zwei Blöcke (Kontakt / Repo)
**Inhalt:**

**Kontakt**
- Patrick Cornelißen · Atvantage
- LinkedIn / E-Mail (konkret einfügen)

**Alles zum Nachbauen**
- GitHub-Repo (Link einfügen, sobald public)
- Enthält Skripte, Prompts, Kondensate, Antworten, Videos
- Original-PDFs zieht man selbst mit `./scripts/download-fitko.sh`

**Weiterführend**
- CaSE Podcast, Episode 62 — *„Agent Harness, State of Play, Risk and AI Company Culture"* (case-podcast.org)
- arc42 Skill — dieselbe Kondensations-Idee für Architekturdokumentation
- Understand-Anything — für Code

**Am Ende:** *Fragen?*

**Speaker Notes (~30 s + Q&A):**
- Q&A-Slot (5 Min): vorbereitete Fragen aus [01-talking-points.md](01-talking-points.md) parat

---

## Timing-Kontrolle

| # | Folie | Sprech-Zeit | Video | Kumul. |
|---|---|---|---|---|
| 1 | Titel | 30 s | — | 0:30 |
| 2 | Aufhänger | 45 s | — | 1:15 |
| 3 | Wer da vorne redet | 25 s | — | 1:40 |
| 4 | Baseline | 60 s | — | 2:40 |
| 5 | Entscheidungsraster | 75 s | — | 3:55 |
| 6 | Ökosystem-Anbieter | 50 s | — | 4:45 |
| 7 | Übergang: Kontext ist die Arbeit | 40 s | — | 5:25 |
| 8 | **Setup: Aufbereitung als Pipeline** | 60 s | — | 6:25 |
| 9 | Video: raw-fail | 40 s | ~12 s | 7:05 |
| 10 | Deshalb strukturieren | 55 s | — | 8:00 |
| 11 | Video condense + Prompt (Split) | 60 s | ~30 s | 9:00 |
| 12 | Kondensat-Struktur | 45 s | — | 9:45 |
| 13 | Video ask-master + Frage (Split) | 60 s | ~37 s | 10:45 |
| 14 | **Und das kommt raus** | 60 s | — | 11:45 |
| 15 | Harte Funde (30 Kondensate) | 70 s | — | 12:55 |
| 16 | Understand-Anything im Detail | 55 s | — | 13:50 |
| 17 | Fallstricke-Tabelle | 55 s | — | 14:45 |
| 18 | Video: 8b vs. 14b | 60 s | ~52 s Zeitraffer | 15:45 |
| 19 | Halluzinationen live gefangen | 55 s | — | 16:40 |
| 20 | Take-aways | 45 s | — | 17:25 |
| 21 | Kontakt | 30 s | — | 17:55 |

**Ergebnis: ~17:55 Sprech-Vorschlag + Puffer für Übergänge, Nachdenken, atmen → passt sicher in 20 Min.**
(Die Video-Zeiten sind in den Sprech-Zeiten integriert, da meist parallel kommentiert wird.)

Wenn's eng wird, kürzt du in dieser Reihenfolge:
1. Folie 17 (Fallstricke-Tabelle) — kurzer mündlicher Verweis reicht
2. Folie 10 (Deshalb strukturieren) — Aussage aus Folie 8 herüberziehen
3. Folie 12 (Kondensat-Struktur) — mündlich neben Folie 11 abhandeln

---

## Anhang: Mapping Folien → Material

| Folie | Nutzt |
|---|---|
| 4 | [02-beispiele-und-vignetten.md](02-beispiele-und-vignetten.md) — Vignette 1 |
| 5 | [01-talking-points.md](01-talking-points.md) Block 2 |
| 6 | [04-eu-anbieter.md](04-eu-anbieter.md) |
| 8 | [scripts/condense.sh](scripts/condense.sh), [master.sh](scripts/master.sh), [ask.sh](scripts/ask.sh), Understand-Anything (Skill) |
| 9 | [videos/03-ask-raw-fail-trim.mp4](videos/03-ask-raw-fail-trim.mp4) |
| 11 | [videos/01-condense-single-trim.mp4](videos/01-condense-single-trim.mp4), [prompts/kondensat-system.md](prompts/kondensat-system.md) |
| 12 | [demo-material/fitko-kondensat/1_Leistungsbeschreibung_v.1.0.md](demo-material/fitko-kondensat/1_Leistungsbeschreibung_v.1.0.md) |
| 13 | [videos/02-ask-master-trim.mp4](videos/02-ask-master-trim.mp4), [prompts/fragen/f1-technologische-vorgaben.md](prompts/fragen/f1-technologische-vorgaben.md) |
| 14 | [demo-material/antworten/f1-technologische-vorgaben__master.md](demo-material/antworten/f1-technologische-vorgaben__master.md) |
| 15 | [demo-material/fitko-master.md](demo-material/fitko-master.md), [demo-material/antworten/f3-widersprueche__kondensat.md](demo-material/antworten/f3-widersprueche__kondensat.md) |
| 16 | Understand-Anything (Skill) — mit einem Coding-Harness gegen eigengehostete LLMs betreibbar |
| 17 | [01-talking-points.md](01-talking-points.md) Block 5 |
| 18 | [videos/04-ask-local-8b-trim.mp4](videos/04-ask-local-8b-trim.mp4), [videos/05-ask-local-14b-trim.mp4](videos/05-ask-local-14b-trim.mp4) |
| 19 | [demo-material/antworten/f1-technologische-vorgaben__local_qwen3_8b_master__halluzination.md](demo-material/antworten/f1-technologische-vorgaben__local_qwen3_8b_master__halluzination.md) |
| 20 | [01-talking-points.md](01-talking-points.md) Block 6 |
