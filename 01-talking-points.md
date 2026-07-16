# Talking Points — 20 Min + 5 Min Q&A

Zeitbudget insgesamt: 20 Min Vortrag. Puffer ca. 1–2 Min für Übergänge/Atempausen einrechnen.

---

## 1. Aufhänger / Problem (2 Min)

**Kernfrage:** Kann ein LLM bei Architekturentscheidungen mitdenken, ohne dass Entwürfe durch US-Cloud-Backends wandern?

**Aufhänger-Optionen (eine wählen):**
- [ ] Kurze Szene: "Ich sitze vor einem Architekturentwurf für einen Kunden aus dem Gesundheitswesen, will ein LLM als Sparringspartner — und darf den Entwurf nicht in ChatGPT kippen."
- [ ] Provokante These: "Die spannende Frage ist nicht, ob KI Architekturarbeit verändert. Sondern welches Modell du wo einsetzt, ohne dass dein Compliance-Officer weint."
- [ ] Zahl / Beobachtung aus der Praxis

**Was hier auf keinen Fall passieren darf:** "KI ist ja jetzt überall" — dieser Einstieg ist verbrannt.

**Notizen / Ideen:**
-

---

## 2. Entscheidungsraster: lokal / EU-gehostet / public (4 Min)

**Das ist dein Kernframework — hier bleibt eine Folie hängen.**

Drei Achsen, die die Wahl treiben:
- **Schutzbedarf des Inhalts** (darf raus? unter welchen Bedingungen?)
- **Benötigte Modell-Qualität** (reicht ein 8B-Modell, oder brauche ich Frontier-Niveau?)
- **Kontextlänge** (passt das Architekturdokument rein?)

**Die drei Stufen:**
- **Lokal** — wenn Inhalte nicht raus dürfen. Was heißt "lokal" bei dir konkret? (Hardware, Modelle, Runtime)
- **EU-gehostet** — wenn Qualität nötig ist und Inhalt es zulässt. Welche Anbieter nutzt du? Warum?
- **Public** — wenn nichts Schützenswertes im Spiel ist oder ADV/AVV reicht.

**Wichtige Nuance:** Das ist keine Hierarchie ("public = besser"), sondern eine Zuordnung nach Fall.

**Visualisierung:** Entscheidungsbaum oder 2×3 Matrix. → als Folie skizzieren

**Notizen / Ideen:**
-

---

## 3. Kontext-Aufbereitung — die eigentliche Arbeit (5 Min)

**Kernaussage:** Die Modellwahl ist nicht der Engpass. Der Engpass ist, den Architektur-Kontext so aufzubereiten, dass ein Modell **architektonisch** damit arbeiten kann — nicht nur inhaltlich.

**Wichtige Unterscheidung — sonst kippt der Punkt:**
Für reine Faktenextraktion aus einem PDF-Stapel ("Was steht drin? Wer hat wann was entschieden?") ist ein LLM einem Menschen zeitlich klar überlegen. **Das ist nicht die Frage.** Die Frage ist: kann das Modell aus dem Material Trade-offs erkennen, Optionen gegeneinanderstellen, ADR-taugliche Argumente bauen? Dafür reicht "Verzeichnis voller PDFs" eben nicht.

**Der eigentliche Wertschöpfungsschritt: Strukturieren und Kondensieren.**
Aus dem Roh-Material eine kondensierte, strukturierte Repräsentation bauen — Fakten von Absichten trennen, Redundanzen entfernen, Bezüge explizit machen. Erst *danach* wird das Material für die spannenden Aufgaben nutzbar:
- **Widerspruchserkennung** zwischen Dokumenten
- Trade-off-Analyse mit sauberen Alternativen
- ADR-Argumentation, die auf einer belastbaren Faktenbasis steht

Ohne diesen Kondensations-Schritt kann ein LLM nur wiedergeben, was drinsteht — nicht damit *architektonisch arbeiten*.

**Warum nicht:**
- Bezüge zwischen Dokumenten (Anforderung → Entscheidung → Konsequenz) sind implizit, nicht im Text
- Diagramme als Bild transportieren Struktur, aber nicht das Warum
- Confluence-Export hat 80% Rauschen, das die Antwortqualität verwässert
- Kontextfenster wird von Redundanz und Layout-Kram gefressen, bevor die relevanten Stellen dran sind

**Was bei mir funktioniert:**
- [ ] Strukturierte Aufbereitung der Entwürfe (wie? Text? Markdown? C4 als Text?)
- [ ] Zerlegung in verdauliche Blöcke
- [ ] Kontext-Priorisierung (was ist relevant für die Frage?)
- [ ] Umgang mit Diagrammen (Text-Repräsentation? Mermaid? PlantUML?)
- [ ] Umgang mit ADRs als Kontext

**Konkretes Mini-Beispiel** — Vorher/Nachher-Demo mit der FITKO-Halde. Fragen-Kandidaten in [03-demo-fragen.md](03-demo-fragen.md), aktuelle Empfehlung: F1 (technologische Vorgaben) + F3 (Widersprüche zwischen Anlagen). Alles architektonisch, nichts HR/Staffing.

**Notizen / Ideen:**
-

---

## 4. Was geht: ADRs, Optionen, Trade-offs (4 Min)

**Konkrete Anwendungsfälle, live oder mit aufbereiteten Beispielen:**

- [ ] **Optionen auffächern:** "Ich habe Anforderung X, welche 3–5 Architekturansätze kommen in Frage?" — LLM als Ideen-Fächer, nicht als Entscheider.
- [ ] **ADRs strukturiert vorbereiten** — Template befüllen lassen, dann selbst schärfen. Standard-Markdown-Stil von adr.github.io.
- [ ] **ADRs nachträglich dokumentieren** — der oft unterschätzte Use Case: Entscheidung wurde damals „vergessen" zu dokumentieren, Kontext ist noch da (Chat, Code, alte Mails). LLM baut daraus eine saubere retrospektive ADR, die man dann selbst nachschärft.
- [ ] **Trade-offs durchdiskutieren:** "Argumentiere für Option A, dann für Option B" — Rollenwechsel als Werkzeug.
- [ ] **Eigene Annahmen hinterfragen lassen:** "Welche Annahmen mache ich hier stillschweigend?" — der wertvollste Prompt-Typ.

**Für jeden Anwendungsfall: welches Modell-Niveau reicht?** — verbindet zurück zu Block 2.

**Notizen / Ideen:**
-

---

## 5. Fallstricke und wie man sie umgeht (3 Min)

**Das ist der Vertrauensbau. Wer die Kanten offen benennt UND sagt, wie man sie schleift, wird beim Rest ernstgenommen.**

**Rahmung vorweg — die Baseline-Frage:**
> Menschen verlangen von KI 100 % Perfektion, sind aber selbst keine Maschinen und liegen — ehrlich gemessen — auch darunter.

Der ehrliche Vergleich ist nicht „KI vs. Perfektion", sondern „KI vs. Mensch unter Zeitdruck". Wer eine 40-seitige Ausschreibung selbst zusammenfasst, macht auch Fehler. Der Punkt: den Erwartungshorizont fair setzen, bevor man über Fallstricke redet.

„Scheitern" ist zu viel gesagt — die meisten Probleme sind lösbar, wenn man sie kennt.

| Fallstrick | Was passiert | Gegenmittel |
|---|---|---|
| **Kontextlänge zu kurz** | Lokales Modell frisst das 40-seitige Architekturdokument nicht. | Frontier-Modelle haben inzwischen 1 Mio Kontext — kein Thema mehr. Für souveräne Setups: EU-gehostete Anbieter mit Frontier-Klasse (z.B. Stackit auf Spezialhardware). Lokale Modelle sind hier der Dealbreaker. |
| **Zu höfliche Modelle** | Stimmen zu, statt zu widersprechen. | System-Prompt auf Ehrlichkeit trimmen: „Widersprich, wenn Annahmen wackeln. Keine Bestätigung ohne Beleg." Rollenwechsel („argumentiere dagegen"). |
| **Halluzinierte Referenzen** | Erfindet Patterns, Bibliotheken, Best Practices. | Pflichtreferenzen im Prompt: „Nur nennen, was im Kontext belegbar ist." Separater Lektorlauf durch zweites Modell / gleiches Modell mit Prüf-Prompt, der jede Behauptung gegen die Quelle abgleicht. |
| **Overconfidence bei Domänen-Spezifika** | Tut so als wüsste es Bescheid, wo Praxiswissen fehlt. | Belege einfordern, Lektorlauf mit Fokus „was ist unbelegt / spekulativ?". Realistischer wird's damit. |
| **Fehlendes Fachvokabular als „Unklarheit"** | Modell kennt gängige Fachbegriffe nicht (z. B. **VZÄ = Vollzeitäquivalente**) und markiert sie als unklar. | Menschlicher Lektorlauf streicht Falsch-Positive raus. Genau der Punkt: Domänenwissen bleibt beim Menschen. **Belegstelle in unserer Demo: F3-Antwort listet VZÄ als vermeintlichen Widerspruch — nutze das live als Beispiel für die Lektor-Notwendigkeit.** |
| **Lokales Modell schlicht zu schwach** | Für die konkrete Frage reicht die Modellgröße nicht. | Ehrlich sein, hochstufen zu EU-gehostet. Kein Selbstzweck, unterhalb Frontier-Klasse zu bleiben. |

**Kernaussage:** Fast alle Fallstricke lassen sich mit Prompt-Disziplin und Lektorläufen abfangen. Die harte Grenze ist die Modellgröße bei lokalen Setups — die kauft man sich mit EU-Hosting weg, nicht mit besserem Prompting.

**Notizen / Ideen:**
-

---

## 6. Take-aways (2 Min)

Drei bis fünf Sätze zum Mitnehmen. Muss man auf einer Folie erfassen können.

- [ ] Souveränität ist eine Entscheidung pro Use Case, kein Etikett.
- [ ] Wähle das **stärkste** Modell, das der Schutzbedarf zulässt — nicht das gerade angesagteste.
- [ ] Die Arbeit liegt in der Kontext-Aufbereitung, nicht in der Modellwahl.
- [ ] LLM als Sparringspartner, nicht als Entscheider — die Verantwortung bleibt beim Architekten.
- [ ] Was du getrost weglassen kannst: ...

**Call-to-Action / Andockpunkt:** LinkedIn-Videoreihe? Kontaktangebot? Konkrete Frage ans Publikum?

---

## Q&A-Vorbereitung (5 Min Slot)

Fragen, die mit hoher Wahrscheinlichkeit kommen — Antworten vorbereiten:
- [ ] "Welche Hardware brauche ich für lokale Modelle?"
- [ ] "Welches EU-gehostete Modell empfiehlst du konkret?"
- [ ] "Wie sieht das mit RAG aus?"
- [ ] "Was ist mit Code-Generierung vs. Architekturarbeit?"
- [ ] "Wie überzeugt man Compliance/Datenschutz von so einem Setup?"
- [ ] "Wie viel Zeit spart das wirklich?"

---

## Setup-Fakten für den Vortrag

1. **Demo-Fall:** FITKO-Ausschreibung (TED 431936-2026) — 49 öffentliche Vergabedokumente, dedizierte Anlagen zu Enterprise-/Lösungsarchitektur und Software-Engineering. Liegt in `demo-material/fitko/`.
2. **Lokales Setup:** Mac M3, 32 GB RAM, Ollama. Aktuell **Mistral**, für die Aufnahme zusätzlich **Qwen** ausprobieren. Faktisch **die untere Grenze** — was hier läuft, läuft nicht mit Frontier-Qualität. Das ist Teil der ehrlichen Aussage im Vortrag.
3. **EU-gehostet:** **Stackit** (KI-Hosting auf Spezialhardware) als Hauptbeispiel eines deutschen souveränen Anbieters. Zusätzlich mindestens einen weiteren Anbieter nennen, damit klar wird: das ist kein Einzelfall, sondern ein Ökosystem (Kandidaten: Ionos AI, Aleph Alpha, IONOS/OpenTelekomCloud, ScaleUp, T-Systems Sovereign Cloud).
4. **ADR-Stil:** Standard-Markdown von [adr.github.io](https://adr.github.io) — kein exotisches Custom-Template.
5. **Demo-Modus:** **Vorher aufnehmen**, nicht live. Grund: KI-Ergebnisse sind nicht deterministisch — live geht garantiert etwas schief oder das Modell antwortet anders als geplant. Aufnahme mit **QuickTime** oder **OBS**, Post-Prod je nach Bedarf.

## Persönliche Beispiele

Siehe [02-beispiele-und-vignetten.md](02-beispiele-und-vignetten.md).
Aktuelle Vignette: 2 Ausschreibungen der letzten 12 Monate, KI zum Zusammenfassen und Widerspruchssuche. Baseline-Beobachtung ist der Aufhänger für Block 5.
