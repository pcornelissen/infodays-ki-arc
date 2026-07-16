# Demo-Fragen für Block 3 (Kontext-Aufbereitung)

Grundmuster: gleiche Frage, gleiches Modell, einmal auf der **rohen PDF-Halde**,
einmal auf dem **strukturierten/kondensierten Kontext**. Der Kontrast trägt die Demo.

Alle Fragen sind auf **Architekturarbeit** ausgerichtet — nicht auf HR, Staffing, kaufmännische Aspekte.

---

## Kandidaten

### F1 — Technologische Vorgaben aufspüren
> „Gibt es in den Vergabeunterlagen Vorgaben zu Technologien, Frameworks, Standards oder Cloud-Anbietern, die die Architektur beeinflussen? Liste jede Vorgabe mit exakter Quellstelle."

**Warum stark:** Das ist die typische **erste** Architektenfrage an eine Ausschreibung. Vorher/Nachher-Kontrast ist gut erwartbar:
- Roh: LLM listet auf, was in der Leistungsbeschreibung explizit steht, übersieht aber verstreute Hinweise in Bewertungsmatrix, AGB, EVB-IT-Anhängen
- Aufbereitet: erkennt auch implizite Vorgaben („muss BSI-Grundschutz-kompatibel", „Anbindung an FIT-Store"), fasst redundante Nennungen zusammen

### F2 — Qualitätsattribute und Konflikte
> „Welche nicht-funktionalen Anforderungen (Sicherheit, Datenschutz, Verfügbarkeit, Betrieb, Barrierefreiheit) formen die Architektur? Wo widersprechen sie sich oder erzeugen Trade-offs?"

**Warum stark:** Erzeugt echte architektonische Aussagen, nicht nur Listing. Widersprüche sind das Salz.

### F3 — Widersprüche und Redundanzen zwischen den Anlagen
> „Wo widersprechen sich die Anlagen untereinander? Wo werden gleiche Sachverhalte unterschiedlich benannt? Kennzeichne jeweils die betroffenen Dokumente."

**Warum stark:** Deckt direkt deine Vignette („KI zum Widersprüche-Finden") ab.
Bringt den Wert von Struktur/Kondensation drastisch auf den Punkt: **ohne** Kondensat ist Widerspruchserkennung Zufall.

### F4 — Impliziter Betriebs-/Deployment-Kontext
> „Welches Betriebsmodell wird von der Ausschreibung vorausgesetzt oder impliziert? (On-Prem, Cloud, hybrid, souverän gehostet, Bundes-Cloud?) Nenne die Quellstellen, aus denen du das ableitest."

**Warum stark:** Klassische Architektur-Vorfrage. Der Wert der Aufbereitung zeigt sich darin, dass das rohe Modell hier oft halluziniert oder nur den offensichtlichsten Hinweis findet.

---

## Aufnahmestrategie

**Beide Paare in der Vorbereitung aufnehmen, dann nach Ergebnisqualität wählen:**

- **Paar A: F1 + F3** — technologische Vorgaben + Widersprüche
- **Paar B: F2 + F4** — Qualitätsattribute/Trade-offs + Betriebsmodell

Nach den Aufnahmen entscheiden, welches Paar den stärkeren Vorher/Nachher-Kontrast liefert.
Das andere Paar bleibt als Reservematerial (Q&A, LinkedIn-Ausschnitt, Nachbereitung).

**Aufnahme-Regel für Vergleichbarkeit:**
- Gleiches Modell für Vorher/Nachher (nur der Kontext-Unterschied wirkt)
- Gleiche Modell-Parameter (Temperatur, System-Prompt bis auf den nötigen Unterschied)
- Wenn möglich: gleiche Frage identisch abgeschickt, Ergebnis unretuschiert

## Aufbereitungs-Workflow (Option 2: KI-generiert + Review)

**Grundmuster:** Ein starkes Modell macht den ersten Schnitt, du schärfst nach.
Das ist auch ein Meta-Bonus für den Vortrag: **KI bereitet den Kontext für KI vor** — ehrlich benannt, nicht versteckt.

**Wichtige Konsistenz:** Das Aufbereitungs-Modell soll zum Vortragsthema passen — also **EU-gehostet** (Stackit oder vergleichbar), nicht US-Cloud. Sonst untergräbt der Vortrag sich selbst.

**Schritte:**
1. Alle PDFs zu Text konvertieren (`pdftotext`, `pdfplumber` oder ähnlich) → Vorstufe, damit das Aufbereitungs-Modell strukturiert lesen kann
2. **Pro-Dokument-Kondensat** nach festem Template:
   - Zweck / Rolle im Verfahren
   - Kernaussagen mit Quellenverweis (Abschnitt/Seite)
   - Verweise auf andere Anlagen
   - Widersprüche oder Unklarheiten, die auffallen
3. **Master-Dokument** aus den Einzelkondensaten mergen — thematisch, nicht dokumentenweise
4. **Review** durch dich: schärfen, falsche Bezüge korrigieren, Priorisierung setzen
5. Master-Dokument dient in der Demo als „aufbereiteter Kontext"

**Warum das im Vortrag stark ist:**
- Zeigt den echten Workflow, nicht ein Idealbild
- Macht die Aussage „die Arbeit liegt in der Kontext-Aufbereitung" konkret
- Der Review-Schritt macht die Verantwortung des Architekten sichtbar — genau der Punkt aus Block 6

## Produktions-Todos (das echte Kondensat)

- [x] Aufbereitungs-Modell festgelegt: **Qwen3-VL-235B-A22B-Instruct-FP8** auf Stackit
- [x] PDF→Text-Konvertierung festgelegt: `pdftotext -layout` (Poppler)
- [x] Template geschrieben und an zwei Dokumenten getestet
- [x] Kondensat für alle 30 FITKO-PDFs erzeugt
- [x] Master-Dokument aus Einzelkondensaten synthetisiert
- [x] Vier Fragen (F1–F4) formuliert und je gegen `kondensat` + `master` durchgespielt
- [x] Roh-Modus bewusst als 400-Fail dokumentiert (Kontextfenster überschritten)
- [ ] Antworten inhaltlich sichten und für jede Frage entscheiden: welcher Modus liefert den stärksten Aha-Effekt für den Vortrag?
- [ ] Demo-Modell lokal auswählen: Mistral (aktuell), Qwen kleiner (Kontinuität zur Aufbereitung)

## Aufnahme-Todos (das Video)

Alle Schritte müssen für den Vortrag aufgenommen werden. Das Produktions-Kondensat oben nutzen wir für die spätere Master-Analyse; für die eigentliche Video-Demo werden die relevanten Schritte separat gefilmt.

- [ ] Aufnahme 1: `condense.sh` auf einem einzelnen Dokument (Leistungsbeschreibung) — zeigt die Bühne (Zeitmarken, Modell-Namen)
- [ ] Aufnahme 2: die `for`-Schleife über alle PDFs — im Zeitraffer schön anzusehen
- [ ] Aufnahme 3: Master-Merge / Analyse-Prompt auf dem Kondensat — der eigentliche Wert
- [ ] Aufnahme 4a: F1 oder F2 (siehe oben) — roh vs. aufbereitet
- [ ] Aufnahme 4b: F3 oder F4 — roh vs. aufbereitet
- [ ] Sichten, straffen, im Video-Playback auf sinnvolle Geschwindigkeit bringen (Zeitmarken bleiben lesbar)
- [ ] F1 aufnehmen: roh
- [ ] F1 aufnehmen: aufbereitet
- [ ] F2 aufnehmen: roh
- [ ] F2 aufnehmen: aufbereitet
- [ ] F3 aufnehmen: roh
- [ ] F3 aufnehmen: aufbereitet
- [ ] F4 aufnehmen: roh
- [ ] F4 aufnehmen: aufbereitet
- [ ] Sichten, Paar auswählen, straffen auf ~4 Min
- [ ] Alternativpaar als Reserve markieren

---

## Offene Punkte

- [ ] Welches lokale Modell für die Aufnahme? Vermutlich Mistral (aktuell) plus Qwen als Vergleich für die Kontext-/Qualitäts-Aussage
- [ ] Wie sieht der "aufbereitete Kontext" konkret aus? Format? Werkzeug zur Aufbereitung?
- [ ] Bewusste Auswahl der Modelle für Vorher/Nachher: gleich lassen (nur Kontext-Unterschied) — sonst mischt man zwei Effekte in einer Demo
