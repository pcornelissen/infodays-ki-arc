# Folien-Drehbuch — Stand der ausgelieferten PPT

Spiegelt die tatsächliche Reihenfolge und den Inhalt von `ai-arc-vortrag.pptx`
(22 Folien, 6 eingebettete Videos). **20 Min Vortrag + 5 Min Q&A**, Live per Videokonferenz.

Dieses Dokument ist Sprecher-Begleittext, kein Design-Spec — die PP selbst ist der Master.

---

## Folie 1 — Titel

Titel: „Architekturarbeit mit lokalen und EU-gehosteten LLMs — Ein Praxisbericht"
Patrick Cornelißen · Atvantage · InfoDays Software Architektur · 06.10.2026

**Speaker Notes:** Begrüßen, Zeitrahmen anmoderieren (20 + 5).

---

## Folie 2 — Software-Architekt (Sprecher)

Zertifiziert auf Azure und AWS. Bei Atvantage: Schwerpunkt digitale Souveränität.

**Speaker Notes:** Kurz Person, dann direkt zum Haken.

---

## Folie 3 — Der Aufhänger

> Kann ein LLM bei Architekturentscheidungen mitdenken, ohne dass deine Entwürfe durch US-Cloud-Backends wandern?

**Speaker Notes:** Frage laut vorlesen, kurze Pause. „Ja, aber nicht überall gleich gut." Baseline-Rahmung mündlich: KI vs. Mensch unter Zeitdruck, nicht KI vs. Perfektion.

---

## Folie 4 — Wofür ich das nutze

Anwendungsbereiche: Optionen auffächern · Designentscheidungen breiter denken · …

**Speaker Notes:** Konkrete Vignetten aus eigener Praxis — zwei Ausschreibungen in den letzten 12 Monaten, KI zum Zusammenfassen genutzt, nicht falscher als ich selbst, deutlich schneller.

---

## Folie 5 — Entscheidungsraster: Lokal · EU-gehostet · Public

Dreispaltig: Schutzbedarf → Modellwahl.
- Lokal: Inhalt darf nicht raus
- EU-gehostet: braucht Qualität, Inhalt lässt es zu
- Public: nichts Schützenswertes oder ADV reicht

**Speaker Notes:** Kernframework. Merksatz: „Wähle das stärkste Modell, das der Schutzbedarf zulässt." Kurz zu Anbietern — Stackit/IONOS deutsch, Mistral Paris als einzige EU-Frontier-Option. Warnung: nicht blind „deutsche KI-Plattformen" vertrauen, Inferenz-Backend und Vertragspartner prüfen.

---

## Folie 6 — Übergang: der Engpass ist der Kontext

> Die Modellwahl ist nicht der Engpass. Der Engpass ist der Kontext.

**Speaker Notes:** Satz betont vorlesen. Legitimations-Verweis: CaSE-Podcast Ep. 62 bringt denselben Punkt als „Context Engineering: The Real Lever". FITKO-Vergabe als Praxisfall einführen (30 Dokumente, Rahmenvertrag, 254 Mio €, Architektur/Software-Engineering drin).

---

## Folie 7 — Video: 30 rohe PDFs an das „Frontier-Modell" (media1, ~8 s)

**Speaker Notes:** „Was passiert, wenn ich alle 30 PDFs direkt an Qwen3-VL-235B schicke — immerhin Frontier-Klasse mit 200k Kontextfenster?" Video anspielen. Beim HTTP 400 stehen bleiben: „192.001 Tokens, Maximum 200.000, Bad Request." **Vorbereitete Rückfrage:** „192k ist doch weniger als 200k?" — Kontextfenster teilen sich Input und Output; max_tokens 8.000 für Antwort reserviert, Total 200.001, 1 über Limit. Genau deshalb kondensieren.

---

## Folie 8 — Das Setup: Aufbereitung als Pipeline

Zwei Spuren: PDFs → condense.sh → Kondensate → master.sh → Master → ask.sh → Antwort. Daneben: Code → Understand-Anything → Knowledge Graph.

**Speaker Notes:** Drei Bash-Skripte gegen die Stackit-API, bewusst minimal. Für Code gibt's das fertig als Skill (Understand-Anything), mit Coding-Harness komplett souverän betreibbar. Überleitung: „Jetzt zeige ich die drei Schritte einzeln."

---

## Folie 9 — Condense Prompt

System-Prompt für `condense.sh`: Analyst für Vergabeunterlagen, nur was im Dokument steht, Quellenverweise verpflichtend, feste Markdown-Struktur.

**Speaker Notes:** Prompt kurz einordnen — ehrlich gehalten, keine Kunst. Feste Struktur, Quellenverweise verpflichtend. Überleitung zum Video.

---

## Folie 10 — Video: `condense.sh` auf einem PDF (media2, ~10 s) + Benchmark-Textblock

Benchmark-Einblendung: **Stackit (Qwen3-VL-235B) 17 s pro Dokument vs. Lokal (qwen3:14b auf M3) 443 s — 26× langsamer.** 30 Dokumente: 5 min bei Stackit, ~3:42 h lokal.

**Speaker Notes:** „Aufbereitungs-Modell Qwen3-VL-235B bei Stackit, souverän in Deutschland. Pro Dokument 17 s." Benchmark-Zahl explizit nennen: „Für die Souveränität zahlst du Zeit — lokal 7 Minuten pro Dokument. Für die Erstaufbereitung einmal über Nacht okay, für iteratives Arbeiten eng. Qualität ist in beiden Varianten sauber."

---

## Folie 11 — So sieht ein Kondensat aus

Markdown-Ausschnitt aus `1_Leistungsbeschreibung_v.1.0.md`: Kernaussagen, Vorgaben, Widersprüche mit Quellenverweisen.

**Speaker Notes:** Feste Struktur, alle Aussagen quellenverankert. „Das Modell findet Widersprüche schon innerhalb eines Dokuments."

---

## Folie 12 — Master Prompt

System-Prompt für `master.sh`: 30 Kondensate → architekturrelevante Gesamtsicht. Verfahrenszweck, übergreifende Vorgaben, Widersprüche, Grauzonen, Prioritäten, offene Punkte.

**Speaker Notes:** Jetzt der mittlere Schritt der Pipeline. „Nur was in den Kondensaten steht, Referenzen durchreichen."

---

## Folie 13 — Video: `master.sh` — 30 Kondensate zu einer Gesamtsicht (media3, ~11 s)

**Speaker Notes:** „~55 s live für den vollen Merge. Ergebnis ist der Master-Kontext, mit dem danach ask.sh arbeitet."

---

## Folie 14 — Kleiner Ausschnitt aus master.md

„Architekturrelevante Gesamtsicht auf die Vergabe" — Markdown-Ausschnitt.

**Speaker Notes:** Das ist der strukturierte Kontext, auf dem die Fragen aufsetzen. Nicht Zeile für Zeile vorlesen, nur Format und Verweise zeigen.

---

## Folie 15 — Frage an unser Modell (F1)

Frage F1: Gibt es Vorgaben zu Technologien, Frameworks, Standards, Programmiersprachen oder Cloud-/Hosting-Anbietern? Explizit vs. implizit trennen.

**Speaker Notes:** Frage ist bewusst so formuliert, dass das Modell zwischen explizit und implizit unterscheiden muss.

---

## Folie 16 — Video: ask-master („Welche technologischen Vorgaben…?") (media4, ~10 s)

**Speaker Notes:** „25 s für die Antwort, gegen Master-Kontext von 2.200 Wörtern — statt der 130.000+ Tokens aus den rohen PDFs."

---

## Folie 17 — Und die Antwort (Auszug)

Markdown-Ausschnitt der tatsächlichen F1-Antwort: Explizite Vorgaben (keine konkreten Technologien) vs. implizite (TOGAF, ArchiMate, BSI-Grundschutz etc.) — mit Quellenverweisen.

**Speaker Notes:** „Nicht nur eine Liste, sondern architektonisch strukturiert — explizit vs. implizit, jede Aussage mit Quelle. Keine erfundenen Frameworks, keine ‚das sollte man auch nehmen'-Ergänzungen."

---

## Folie 18 — 10 fundamentale Architekturfragen, die die Ausschreibung nicht beantwortet

**Harte Funde aus dem Master:**
- 10 Architekturfragen bleiben offen (Programmiersprachen, Cloud, Datenmodelle, Schnittstellen …)
- 4 harte Widersprüche zwischen Anlagen
- Frameworks vollständig gebündelt
- Falsch-Positiv: VZÄ als „unklar" markiert, obwohl Standardbegriff → **warum menschlicher Lektorlauf bleibt**

**Speaker Notes:** Der Wow: KI zeigt, was in der Ausschreibung fehlt. Bei VZÄ: Modell ist domänenfremd, kennt den Begriff nicht als Standard → Grauzone. „KI liefert. Aber sie liefert nicht perfekt. Menschlicher Review bleibt zwingend."

---

## Folie 19 — Video: 8B vs. 14B lokal (media5 + media6, je ~8 s)

Zwei Videos nebeneinander: qwen3:8b und qwen3:14b, gleiche Frage, Wartezeit stark beschleunigt.

**Speaker Notes:** „Für Inhalte, die nicht raus dürfen, ist das der Preis — Faktor 8–10 langsamer. Zahlbar." **Zum Nicht-Determinismus:** Verweis auf gesicherte Halluzinations-Datei — gleiches Modell, anderer Lauf, 10 erfundene URLs. „Das Video davor lief sauber. In einem anderen Lauf nicht. Genau das ist das Problem."

---

## Folie 20 — Fallstricke und Gegenmittel

Kompakte Tabelle:
- Kontextlänge zu kurz → Frontier mit 200k+; lokal: hochstufen
- Zu höfliches Modell → Prompt auf Ehrlichkeit trimmen
- Halluzinierte Referenzen → Pflichtreferenzen, Lektorlauf
- Overconfidence → Belege einfordern
- Fehlendes Fachvokabular (VZÄ!) → menschlicher Lektor

**Speaker Notes:** „Fast alles lösbar mit Prompt-Disziplin. Harte Grenze: Modellgröße lokal."

---

## Folie 21 — Begrabe diese Erwartungen

- Ein Verzeichnis voller PDFs reicht als Input
- KI ersetzt die Architekturarbeit
- Lokal ist überall gleich schnell wie Cloud
- Souveränität ist eine Checkbox, keine Entscheidung

**Speaker Notes:** Zusammenfassende Antihaltung. Realistische Erwartungen setzen, bevor die Zuhörer eigene Experimente starten.

---

## Folie 22 — Fragen? / Kontakt

Patrick Cornelißen · Atvantage · LinkedIn/Mail · Repo (nach Vortrag public): github.com/pcornelissen/infodays-ki-arc

Weiterführend: CaSE Podcast Ep. 62, arc42 Skill, Understand-Anything.

**Speaker Notes:** Q&A-Slot (5 Min). Vorbereitete Fragen aus [01-talking-points.md](01-talking-points.md) parat (Hardware, EU-Anbieter, RAG, Compliance, Zeitersparnis).

---

## Video-Zuordnung

| Folie | Media in PPT | Inhalt | Dauer |
|---|---|---|---|
| 7 | media1 | raw-fail (HTTP 400) | 7.9 s |
| 10 | media2 | condense.sh | 10.3 s |
| 13 | media3 | master.sh | 11.0 s |
| 16 | media4 | ask-master | 9.5 s |
| 19 | media5 | 8B lokal | 7.6 s |
| 19 | media6 | 14B lokal | 7.8 s |

## Material-Mapping

| Folie | Nutzt |
|---|---|
| 5 | [04-eu-anbieter.md](04-eu-anbieter.md), [01-talking-points.md](01-talking-points.md) Block 2 |
| 9 | [prompts/kondensat-system.md](prompts/kondensat-system.md) |
| 11 | [demo-material/fitko-kondensat/1_Leistungsbeschreibung_v.1.0.md](demo-material/fitko-kondensat/1_Leistungsbeschreibung_v.1.0.md) |
| 12 | [prompts/master-system.md](prompts/master-system.md) |
| 14 | [demo-material/fitko-master.md](demo-material/fitko-master.md) |
| 15 | [prompts/fragen/f1-technologische-vorgaben.md](prompts/fragen/f1-technologische-vorgaben.md) |
| 17 | [demo-material/antworten/f1-technologische-vorgaben__master.md](demo-material/antworten/f1-technologische-vorgaben__master.md) |
| 18 | [demo-material/fitko-master.md](demo-material/fitko-master.md), [demo-material/antworten/f3-widersprueche__kondensat.md](demo-material/antworten/f3-widersprueche__kondensat.md) |
| 19 | [demo-material/antworten/f1-technologische-vorgaben__local_qwen3_8b_master__halluzination.md](demo-material/antworten/f1-technologische-vorgaben__local_qwen3_8b_master__halluzination.md) |
| 20 | [01-talking-points.md](01-talking-points.md) Block 5 |
