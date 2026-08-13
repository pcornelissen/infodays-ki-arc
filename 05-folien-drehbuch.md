# Folien-Drehbuch

Für die Umsetzung in PowerPoint. Zielgruppe: Software-Architekt:innen im Live-Vortrag,
**20 Min Vortrag + 5 Min Q&A**, per Videokonferenz. Videos werden per Screenshare eingespielt.

**Design-Prinzipien:**
- 16:9, hoher Kontrast (Vortrag wird per Zoom o.ä. übertragen, Kompression schluckt Kleinteiliges)
- Große Typografie, wenig Text pro Folie
- Konsistentes Farbschema: eine Akzentfarbe für „souverän/EU", eine für „nicht-souverän/US" — zur Wiedererkennung im Entscheidungsraster
- Keine Bulletpoint-Wüsten. Wenn eine Aussage die Folie trägt, ist sie eine einzelne Zeile
- **Video-Folien** enthalten keinen Text neben dem eingebetteten Video, nur den Video-Titel. Der Sprecher spricht live drüber
- Alle Sprecher-Notizen unter „Speaker Notes" gehen in das Notizenfeld der jeweiligen Folie

**Gesamt: 18 Folien für 20 Min = ~65 s pro Folie im Schnitt.**

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

**Layout:** Titel + drei kurze Zeilen, evtl. rechts kleines Bild
**Inhalt:**
- 25+ Jahre Software-Architekt · Azure- und AWS-zertifiziert
- Bei Atvantage: Schwerpunkt digitale Souveränität
- Was du hörst, ist **ehrlicher Zwischenstand** aus laufender Praxis — kein abgeschlossener Erfahrungsbericht

**Speaker Notes (~40 s):**
- 30 Sekunden zur Person, nicht mehr
- Betonen: nutze die genannten Setups selbst, jeden Tag
- Ehrlichkeit vor Vollständigkeit — auch die Grenzen sitzen im Vortrag

---

## Folie 4 — Baseline: die faire Messlatte

**Layout:** Vollflächen-Zitat
**Inhalt:**
> Wir verlangen von KI 100 % Perfektion. Sind aber selbst keine Maschinen — und liegen ehrlich gemessen auch darunter.

**Speaker Notes (~60 s):**
- Frame für den ganzen Vortrag: KI vs. Mensch unter Zeitdruck, nicht KI vs. Perfektion
- Kurze Vignette aus eigener Praxis: zwei Ausschreibungen in den letzten 12 Monaten, KI zum Zusammenfassen genutzt — nicht falscher als ich selbst, aber deutlich schneller
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
- Das ist das Kernframework des Talks — kurz und deutlich vorstellen
- Drei Achsen: Schutzbedarf, Qualitätsbedarf, Kontextlänge
- Take-away-Merksatz: „Wähle das **stärkste** Modell, das der Schutzbedarf zulässt"

---

## Folie 6 — Ökosystem der EU-/DE-Anbieter

**Layout:** Titel + drei Boxen nebeneinander
**Inhalt:**

**Stackit** (Schwarz-Gruppe, DE)
- Managed OpenAI-kompatible API, BSI-C5, PhariaAI integriert
- Reifster voll deutscher Stack — aber ohne eigenes Frontier-Modell

**IONOS AI Model Hub** (Karlsruhe, DE)
- DE-RZ, DSGVO, Open-Weight-Modelle, Vector-DB integriert
- Zweiter ernstzunehmender deutscher Player

**Mistral la Plateforme** (Paris, FR)
- Einziger Frontier-fähiger Provider mit End-to-End-EU-Residency
- Für echte Frontier-Qualität in der EU aktuell alternativlos

Unter der letzten Box, kleiner: **In DE gibt es aktuell keinen 1:1-Frontier-Ersatz. Ehrlich benennen.**

**Speaker Notes (~75 s):**
- Kurz erwähnen, dass das nur die Praxis-Kandidaten sind, nicht die vollständige Liste
- Ausblick T-Systems SOOFI (eigenes ~100B-EU-LLM im Aufbau)
- Warnung ohne Namen: „Manche ‚deutsche KI-Plattformen' leiten im Kleingedruckten auf Azure OpenAI Frankfurt um" — immer nach Inferenz-Backend und Vertragspartner fragen

---

## Folie 7 — Übergang: die eigentliche Arbeit

**Layout:** Titel-Zentriert, kein weiterer Inhalt
**Inhalt (mittig, groß):**
> Die Modellwahl ist nicht der Engpass. Der Engpass ist der Kontext.

**Speaker Notes (~45 s):**
- Diesen Satz betont vorlesen
- Kurzer Legitimations-Verweis: „Das ist keine Nischenbeobachtung — die CaSE-Podcast-Episode ‚Agent Harness, State of Play, Risk and AI Company Culture' bringt genau denselben Punkt als **Context Engineering: The Real Lever** auf den Punkt."
- Zum nächsten Teil überleiten: „Ich zeige das an einer echten öffentlichen Ausschreibung."
- Kurz FITKO-Vergabe einordnen: 30 Vergabedokumente, Rahmenvertrag Projekt-/Produktberatung, 254 Mio €, 8 Fachdisziplinen inklusive Enterprise-Architektur und Software-Engineering

---

## Folie 8 — Video: „Alles reinwerfen" scheitert (Szene 03)

**Layout:** Video-Vollflächen-Einbettung
**Inhalt:**
- Eingebettetes Video: [videos/03-ask-raw-fail.mov](videos/03-ask-raw-fail.mov)
- Kleiner Titel oben rechts: *30 rohe PDFs an das Modell*

**Speaker Notes (~50 s):**
- Kurz einleiten: „Was passiert, wenn ich alle 30 PDFs direkt an das Frontier-Modell schicke?"
- Video anspielen (~5 s)
- Beim HTTP 400 stehen bleiben, laut vorlesen: „192.001 Tokens, Maximum 200.000, Bad Request"
- Punkt landen: „Selbst das Frontier-Modell kann meine Halde nicht anfassen. Das ist keine Ausnahme, das ist der Normalfall bei realistischen Dokumentmengen."

---

## Folie 9 — Deshalb: strukturieren und kondensieren

**Layout:** Titel + 3 Kernaussagen als große Punkte
**Inhalt:**
- **Faktenextraktion** aus PDF-Halde → ist ein LLM einem Menschen sowieso überlegen
- **Architektonisches Arbeiten** (Trade-offs, Widersprüche, ADR-Argumente) → braucht **strukturierten, kondensierten Kontext**
- Kontext-Aufbereitung ist der **eigentliche Wertschöpfungsschritt**, nicht die Modellwahl

**Speaker Notes (~60 s):**
- Klar unterscheiden: „Was steht drin?" vs. „Was folgt daraus für die Architektur?"
- Für das erste braucht's keine Kunst. Für das zweite: aufbereiten, damit das Modell Bezüge sehen kann
- Kurzer Ausblick: „Ich zeige jetzt, wie ich das mache."

---

## Folie 10 — Video: Kondensat eines Dokuments (Szene 01)

**Layout:** Video-Vollflächen-Einbettung
**Inhalt:**
- Eingebettetes Video: [videos/01-condense-single.mov](videos/01-condense-single.mov)
- Kleiner Titel: *`condense.sh` auf einem PDF — Qwen3-VL-235B auf Stackit*

**Speaker Notes (~60 s):**
- Vor dem Video: „Ich fahre pro Dokument ein Aufbereitungs-Modell — hier Qwen3-VL-235B bei Stackit, souverän, in Deutschland."
- Video läuft (~20 s)
- Zeitanker sichtbar machen: „17 Sekunden, PDF rein, strukturiertes Markdown raus, mit Quellenverweisen."
- Ganz kurz erwähnen: „Ich habe dasselbe für alle 30 Dokumente gemacht — insgesamt gut 5 Minuten."

---

## Folie 11 — So sieht ein Kondensat aus

**Layout:** Titel + Markdown-Ausschnitt (großer Font)
**Inhalt:**

```markdown
# 1_Leistungsbeschreibung_v.1.0.pdf

## Rolle im Verfahren
Leistungsbeschreibung zur Rahmenvereinbarung FITKO/2026/0039.
Definiert Leistungsumfang, Rollen und Zusammenarbeit.

## Kernaussagen (architekturrelevant)
- Enterprise- und Lösungsarchitektur als eigenständige
  Beratungsfelder mit klaren Rollen [§6.1]
- TOGAF, ArchiMate, C4-Modell, DDD, iSAQB, arc42
  verpflichtend [§6.1.1, §6.2.1.5]

## Unklarheiten im Dokument
- Definitorisch: „Führung von Teams" bleibt undefiniert [§10.2.6]
- Widerspruch: Nicht-Eingliederung (§2.3) vs. Präsenzpflicht (§9.1)
```

**Speaker Notes (~50 s):**
- Feste Struktur: Rolle, Kernaussagen, Vorgaben, NFRs, Verweise, Unklarheiten, architekturrelevante Prioritäten
- Alle Aussagen mit Quellenverweis — für den späteren Master-Merge und für nachvollziehbare Antworten
- „Und ja, hier findet das Modell auch schon Widersprüche innerhalb eines einzelnen Dokuments."

---

## Folie 12 — Video: Frage an den aufbereiteten Kontext (Szene 02)

**Layout:** Video-Vollflächen-Einbettung
**Inhalt:**
- Eingebettetes Video: [videos/02-ask-master.mov](videos/02-ask-master.mov)
- Kleiner Titel: *„Welche technologischen Vorgaben beeinflussen die Architektur?"*

**Speaker Notes (~65 s):**
- Video läuft (~25 s)
- Zeitanker: „25 Sekunden für die Antwort, gegen einen kondensierten Master-Kontext von 2200 Wörtern — statt der 130.000+ Tokens aus den rohen PDFs."
- „Und die Antwort ist präzise, mit Quellen, differenziert nach explizit und implizit."

---

## Folie 13 — Was rauskommt: harte Funde

**Layout:** Titel + 4 Aufzählungspunkte mit fetten Highlights
**Inhalt:**

**Aus 30 Kondensaten synthetisiert (`fitko-master.md`):**
- **10 fundamentale Architekturfragen**, die die Ausschreibung selbst **nicht beantwortet** (Programmiersprachen, Cloud-Provider, Datenmodelle, Schnittstellen …)
- **4 harte Widersprüche zwischen Anlagen** — Referenzzählung, Definitionslücken
- **Genutzte Standards und Frameworks** vollständig gebündelt: TOGAF, ArchiMate, C4, DDD, iSAQB, arc42, BSI-Grundschutz, ISO 27001, C5, XÖV, XZuFi, OSCI
- **Falsch-Positiv gefunden:** VZÄ als „unklar" markiert — obwohl Standardbegriff. **Genau warum menschlicher Lektorlauf bleibt.**

**Speaker Notes (~75 s):**
- Der 10-Fragen-Punkt ist der Wow: die KI zeigt, was in der Ausschreibung **fehlt**. Das ist Architektenarbeit auf hohem Niveau
- Bei VZÄ betonen: Modell ist domänenfremd, kennt den Begriff nicht als Standard → markiert als Grauzone. Menschlicher Reviewer streicht das mit einem Federstrich
- „Die Ehrlichkeit dieses Falls ist der Vortragskern. KI liefert, aber sie liefert nicht perfekt. Menschlicher Review bleibt zwingend."

---

## Folie 14 — Fallstricke — und wie man sie umgeht

**Layout:** Tabelle (dreispaltig): Fallstrick / Was passiert / Gegenmittel
**Inhalt:**

| Fallstrick | Was passiert | Gegenmittel |
|---|---|---|
| Kontextlänge zu kurz | 40-Seiten-Doc passt lokal nicht | Frontier-Modelle mit 200k+ Kontext; für lokal: dealbreaker → hochstufen |
| Zu höfliches Modell | Stimmt zu, statt zu widersprechen | System-Prompt auf Ehrlichkeit trimmen, Rollenwechsel |
| Halluzinierte Referenzen | Erfindet Patterns, Bibliotheken, URLs | Pflichtreferenzen, Lektorlauf mit Prüf-Prompt |
| Overconfidence bei Domänen | Wirkt sicher, wo Wissen fehlt | Belege einfordern, Lektorlauf „was ist unbelegt?" |
| Fehlendes Fachvokabular | Standardbegriffe als „unklar" markieren (VZÄ!) | Menschlicher Lektor, Domänenwissen bleibt beim Menschen |

Untertitel: **Fast alles ist mit Prompt-Disziplin lösbar. Harte Grenze: Modellgröße bei lokalen Setups.**

**Speaker Notes (~70 s):**
- Kurz durch die Tabelle gehen, Highlight auf die letzten beiden Zeilen
- VZÄ konkret aus unserem Master zeigen (wenn Zeit: kurz mündlich, sonst nur erwähnen)
- Kernbotschaft: „Das sind Fallstricke, keine Sackgassen"

---

## Folie 15 — Video: Lokale Modelle — 8B vs. 14B (Szenen 04 + 05)

**Layout:** Zwei Videos nebeneinander oder Split-Screen
**Inhalt:**
- Links: [videos/04-ask-local-8b.mov](videos/04-ask-local-8b.mov) — *qwen3:8b lokal auf M3*
- Rechts: [videos/05-ask-local-14b.mov](videos/05-ask-local-14b.mov) — *qwen3:14b lokal auf M3*
- Untertitel unten: **Gleiche Frage, gleicher Kontext, unterschiedliche Modellgrößen. ~4 vs. ~5 Minuten.**

**Speaker Notes (~65 s):**
- Auf den Zeitraffer hinweisen (Videos werden auf ~30 s beschleunigt gezeigt)
- Vergleich zur Stackit-Antwort (25 s): „Faktor 8–10 langsamer, deutlich kleineres Modell — aber es läuft komplett offline"
- Take-away hier: „Für Inhalte, die nicht raus dürfen, ist das der Preis. Und der Preis ist zahlbar."

---

## Folie 16 — Halluzinationen live gefangen

**Layout:** Titel + Code-Screenshot mit sichtbar rot hervorgehobenen Halluzinationen
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

**Speaker Notes (~60 s):**
- Direkt sagen: „Das Video davor lief sauber. In diesem Lauf hat dasselbe Modell 10 URLs erfunden."
- Betonen: „Mal ja, mal nein. Genau das ist das Problem — nicht dass die URLs kommen, sondern dass du es beim nächsten Lauf nicht siehst."
- Zurückverweisen auf Fallstricke-Tabelle: „Genau deshalb: Lektorlauf zwingend."

---

## Folie 17 — Was du mitnimmst

**Layout:** Titel + 4 klare Punkte, große Typografie
**Inhalt:**

- Souveränität ist eine **Entscheidung pro Use Case**, kein Etikett
- Wähle das **stärkste Modell**, das der Schutzbedarf zulässt — nicht das gerade angesagteste
- Die **Arbeit liegt in der Kontext-Aufbereitung**, nicht in der Modellwahl
- **LLM als Sparringspartner**, nicht als Entscheider — die Verantwortung bleibt beim Architekten

**Speaker Notes (~45 s):**
- Vier Sätze, jeder einzeln kurz durchgehen, nichts weiter dazusagen
- Puffer für Übergang zu Kontakt / Q&A

---

## Folie 18 — Kontakt & weiterführend

**Layout:** Titel + zwei Blöcke (Kontakt / Repo)
**Inhalt:**

**Kontakt**
- Patrick Cornelißen
- Atvantage
- LinkedIn / E-Mail (konkret einfügen)

**Alles zum Nachbauen**
- GitHub-Repo (Link einfügen, sobald public)
- Enthält Skripte, Prompts, Kondensate, Antworten und die Videos
- Original-PDFs zieht man selbst mit `./scripts/download-fitko.sh`

**Weiterführend**
- CaSE Podcast, Episode 62 — *„Agent Harness, State of Play, Risk and AI Company Culture"* (case-podcast.org)
- **arc42** Skill — dieselbe Kondensations-Idee für Architekturdokumentation
- **Understand-Anything** — dasselbe Prinzip für Code: Knowledge Graph aus einer Codebase, mit dem die KI dann arbeitet

**Am Ende:** *Fragen?*

**Speaker Notes (~30 s + Q&A):**
- Q&A-Slot (5 Min): auf vorbereitete Fragen aus [01-talking-points.md](01-talking-points.md) achten (Hardware, EU-Anbieter, RAG, Codegen, Compliance, Zeitersparnis)
- Nicht ausschweifen — Antworten kurz und präzise halten

---

## Timing-Kontrolle

| # | Folie | Sprech-Zeit | Video | Kumul. |
|---|---|---|---|---|
| 1 | Titel | 30 s | — | 0:30 |
| 2 | Aufhänger | 45 s | — | 1:15 |
| 3 | Wer da vorne redet | 40 s | — | 1:55 |
| 4 | Baseline | 60 s | — | 2:55 |
| 5 | Entscheidungsraster | 75 s | — | 4:10 |
| 6 | Ökosystem-Anbieter | 75 s | — | 5:25 |
| 7 | Übergang: Kontext ist die Arbeit | 45 s | — | 6:10 |
| 8 | Video: raw-fail | 50 s | ~5 s | 7:05 |
| 9 | Deshalb strukturieren | 60 s | — | 8:05 |
| 10 | Video: condense-single | 60 s | ~20 s | 9:25 |
| 11 | Kondensat-Struktur | 50 s | — | 10:15 |
| 12 | Video: ask-master | 65 s | ~25 s | 11:45 |
| 13 | Harte Funde | 75 s | — | 13:00 |
| 14 | Fallstricke-Tabelle | 70 s | — | 14:10 |
| 15 | Video: 8b vs. 14b | 65 s | ~60 s Zeitraffer | 16:15 |
| 16 | Halluzinationen live gefangen | 60 s | — | 17:15 |
| 17 | Take-aways | 45 s | — | 18:00 |
| 18 | Kontakt | 30 s | — | 18:30 |

**Ergebnis: ~18:30 Vortrag + 1:30 Puffer für Übergänge, Nachdenken, atmen → passt in die 20 Min.**

Wenn's eng wird, kürzt du in dieser Reihenfolge:
1. Folie 3 (Wer da vorne redet) — reicht als Nebensatz auf Folie 1
2. Folie 9 (Deshalb strukturieren) — mündlich neben Video 8 einbauen
3. Folie 11 (Kondensat-Struktur) — mündlich neben Video 10 abhandeln

---

## Anhang: Mapping Folien → Material

| Folie | Nutzt |
|---|---|
| 4 | [02-beispiele-und-vignetten.md](02-beispiele-und-vignetten.md) — Vignette 1 |
| 5 | [01-talking-points.md](01-talking-points.md) Block 2 |
| 6 | [04-eu-anbieter.md](04-eu-anbieter.md) |
| 8 | [videos/03-ask-raw-fail.mov](videos/03-ask-raw-fail.mov) |
| 10 | [videos/01-condense-single.mov](videos/01-condense-single.mov) |
| 11 | [demo-material/fitko-kondensat/1_Leistungsbeschreibung_v.1.0.md](demo-material/fitko-kondensat/1_Leistungsbeschreibung_v.1.0.md) |
| 12 | [videos/02-ask-master.mov](videos/02-ask-master.mov) |
| 13 | [demo-material/fitko-master.md](demo-material/fitko-master.md), [demo-material/antworten/f3-widersprueche__kondensat.md](demo-material/antworten/f3-widersprueche__kondensat.md) |
| 14 | [01-talking-points.md](01-talking-points.md) Block 5 |
| 15 | [videos/04-ask-local-8b.mov](videos/04-ask-local-8b.mov), [videos/05-ask-local-14b.mov](videos/05-ask-local-14b.mov) |
| 16 | [demo-material/antworten/f1-technologische-vorgaben__local_qwen3_8b_master__halluzination.md](demo-material/antworten/f1-technologische-vorgaben__local_qwen3_8b_master__halluzination.md) |
| 17 | [01-talking-points.md](01-talking-points.md) Block 6 |
