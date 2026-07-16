# Dokumentübergreifende Widersprüche und Diskrepanzen in der Ausschreibung

Nach sorgfältiger Analyse aller vorliegenden Dokumente (im Kondensat-Format) können **keine harten Widersprüche** identifiziert werden, bei denen sich Aussagen in verschiedenen Dokumenten logisch ausschließen. Es gibt jedoch **mehrere weiche Diskrepanzen und Unklarheiten**, die entweder in der Formulierung, der Benennung oder der Quantifizierung von Sachverhalten variieren und somit Interpretationsspielraum lassen. Diese sind architektur- und angebotsrelevant, da sie die Auslegung von Anforderungen, die Planung von Ressourcen und die Gestaltung von Schnittstellen beeinflussen können.

---

## **Weiche Diskrepanzen**

### 1. **Benennung und Quantifizierung von Referenzprojekten für Enterprise- und Lösungsarchitektur**
- **Dokument A sagt X**: In der Zusatzerklärung zur Eignung (6.4) werden **mindestens acht Referenzen** gefordert, davon mindestens zwei für Enterprise-Architekturmanagement, vier für Lösungsarchitektur, zwei für sicherheitskritische Umfelder, zwei für föderale Kontexte und eine außerhalb der öffentlichen Verwaltung. Zudem müssen mindestens vier Referenzen ein Leistungsvolumen von ≥1000 PT aufweisen, davon jeweils mindestens eine im EA- und LA-Bereich, und mindestens eine Referenz ≥2000 PT umfassen [6.4_Zusatzerklärung_zur_Eignung_Enterprise-und_Lösungsarchitektur.md].
- **Dokument B sagt Y**: Im Mitarbeiterprofil (8.4) wird für jedes benannte Profil (EA/LA) ein Referenzprojekt mit **mindestens 100 Personentagen** gefordert, das durch Kontaktdaten und Artefakte verifizierbar sein muss. Es wird jedoch nicht explizit auf die in 6.4 genannten Schwerpunkte (sicherheitskritisch, föderal, außerhalb öffentlicher Verwaltung) oder das Mindestvolumen (1000/2000 PT) Bezug genommen [8.4_Mitarbeiterprofile_Enterprise-und_Lösungsarchitektur.md].
- **Warum architektur- oder angebotsrelevant**: Die Diskrepanz lässt offen, ob die Referenzen im Mitarbeiterprofil nur zur Personaleignung dienen oder auch die in 6.4 geforderten fachlichen Schwerpunkte und Volumina abdecken müssen. Dies beeinflusst die Auswahl der Referenzen und die Architekturplanung, da Projekte mit hohem Volumen und spezifischen Kontexten (z. B. sicherheitskritisch) andere Anforderungen an die Architektur stellen als kleinere Projekte.

---

### 2. **Definition von „vergleichbaren Leistungen“ in Umsatznachweisen**
- **Dokument A sagt X**: In den Zusatzerklärungen zur Eignung (z. B. 6.4 für EA/LA, 6.8 für Software-Engineering) wird gefordert, dass der Umsatz mit „vergleichbaren Leistungen“ in Deutschland nachgewiesen werden muss. Es wird jedoch nicht definiert, was „vergleichbar“ konkret bedeutet — lediglich die Kategorie (z. B. „Beratungs- und Unterstützungsleistungen im Bereich Enterprise-Architektur“) wird genannt [6.4_Zusatzerklärung_zur_Eignung_Enterprise-und_Lösungsarchitektur.md, 6.8_Zusatzerklärung_zur_Eignung_Software-Engineering.md].
- **Dokument B sagt Y**: In der Leistungsbeschreibung (1) werden zwar konkrete Aufgaben und Qualifikationen für die Disziplinen definiert, aber es wird nicht explizit geklärt, welche Leistungen als „vergleichbar“ im Sinne der Umsatznachweise gelten. Auch in den Bieterfragen und -Antworten (260706) wird dieser Begriff nicht weiter präzisiert [1_Leistungsbeschreibung_v.1.0.md, 260706_Bieterfragen_und_Antworten.md].
- **Warum architektur- oder angebotsrelevant**: Die Unklarheit führt dazu, dass Bieter unterschiedlich interpretieren können, welche Projekte sie für den Umsatznachweis heranziehen dürfen. Dies kann zu einer ungleichen Bewertung führen und beeinflusst die Architekturplanung, da Projekte mit unterschiedlichen Schwerpunkten (z. B. rein technisch vs. strategisch) unterschiedliche Architekturansätze erfordern.

---

### 3. **Formulierung von „frühzeitig“ in der Kostenkontrolle**
- **Dokument A sagt X**: In der Rahmenvereinbarung (0) wird in § 5 (2) festgelegt, dass der Auftragnehmer bei Überschreitung von 75 % der geschätzten Maximalkosten informieren muss, bei Überschreitung von >5 % jedoch „frühzeitig“ hinweisen und die Schätzung aktualisieren muss [0_Rahmenvereinbarung.md].
- **Dokument B sagt Y**: In keinem anderen Dokument wird der Begriff „frühzeitig“ definiert oder quantifiziert. Auch in den Bieterfragen und -Antworten (260706) wird dieser Punkt nicht weiter erläutert [260706_Bieterfragen_und_Antworten.md].
- **Warum architektur- oder angebotsrelevant**: Der Begriff „frühzeitig“ lässt Spielraum für Interpretation und kann zu unterschiedlichen Verhaltensweisen führen. Für die Architekturarbeit bedeutet dies, dass Kostenkontrollmechanismen und -indikatoren im Angebot präzise definiert werden müssen, um Missverständnisse zu vermeiden.

---

### 4. **Benennung von „VZÄ“ in Mitarbeiterprofilen für Produktmanagement**
- **Dokument A sagt X**: Im Mitarbeiterprofil für Interims-Produktmanagement (8.2) wird für Junior-Profile „mindestens 10 Personen (VZÄ)“ und für Senior-Profile „25 Personen (VZÄ)“ gefordert [8.2_Mitarbeiterprofile_Interims-Produktmanagement.md].
- **Dokument B sagt Y**: Der Begriff „VZÄ“ wird im Dokument nicht definiert. Es bleibt unklar, ob es sich um Vollzeitäquivalente, reine Kopfzahlen oder eine andere Kennzahl handelt. Auch in anderen Dokumenten (z. B. Leistungsbeschreibung, Bieterfragen) wird dieser Begriff nicht erläutert [8.2_Mitarbeiterprofile_Interims-Produktmanagement.md].
- **Warum architektur- oder angebotsrelevant**: Die Unklarheit beeinflusst die Planung der Teamgröße und -struktur. Für die Architekturarbeit ist entscheidend, ob „VZÄ“ auf die tatsächliche Kapazität (z. B. Arbeitszeit) oder auf die Anzahl der Personen abzielt, da dies die Ressourcenplanung und die Skalierbarkeit der Architektur beeinflusst.

---

### 5. **Formulierung von „kumulativ“ in Referenzanforderungen für Datenschutz**
- **Dokument A sagt X**: In der Zusatzerklärung zur Eignung für Datenschutz (6.6) wird gefordert, dass drei Referenzen „kumulativ“ die Anforderungen erfüllen müssen — z. B. datenschutzrechtliche Beratungsleistungen für öffentliche Auftraggeber im Sinne des § 99 GWB [6.6_Zusatzerklärung_zur_Eignung_Datenschutz.md].
- **Dokument B sagt Y**: Es wird nicht klar definiert, ob „kumulativ“ bedeutet, dass jede Referenz alle Kriterien erfüllen muss oder ob die Gesamtheit der drei Referenzen die Anforderungen abdecken kann. In anderen Dokumenten (z. B. Leistungsbeschreibung, Bieterfragen) wird dieser Punkt nicht weiter erläutert [6.6_Zusatzerklärung_zur_Eignung_Datenschutz.md].
- **Warum architektur- oder angebotsrelevant**: Die Unklarheit führt dazu, dass Bieter unterschiedlich interpretieren können, wie viele Referenzen sie für welche Anforderungen vorlegen müssen. Dies beeinflusst die Auswahl der Referenzen und die Architekturplanung, da Projekte mit unterschiedlichen Schwerpunkten (z. B. rein rechtlich vs. technisch) unterschiedliche Architekturansätze erfordern.

---

## **Stärkste Unklarheiten innerhalb einzelner Dokumente**

Da keine harten Widersprüche zwischen Dokumenten vorliegen, werden hier die **stärksten Unklarheiten innerhalb einzelner Dokumente** aufgeführt, die für die Architekturarbeit relevant sind:

### 1. **Unklarheit in der Definition von „vergleichbaren Studiengängen“ in Mitarbeiterprofilen**
- **Dokument**: 8.4_Mitarbeiterprofile_Enterprise-und_Lösungsarchitektur.md
- **Unklarheit**: Obwohl „vergleichbare Studiengänge“ als Alternative zum genannten Hochschulstudium zugelassen sind, wird nicht definiert, was als „vergleichbar“ gilt [8.4_Mitarbeiterprofile_Enterprise-und_Lösungsarchitektur.md].
- **Warum architekturrelevant**: Die Unklarheit beeinflusst die Auswahl der Mitarbeiter und deren Qualifikationen. Für die Architekturarbeit ist entscheidend, ob „vergleichbar“ auf technische, wirtschaftliche oder methodische Studiengänge abzielt, da dies die fachliche Ausrichtung der Architektur beeinflusst.

### 2. **Unklarheit in der Bewertung von Zusatzqualifikationen in Mitarbeiterprofilen**
- **Dokument**: 8.4_Mitarbeiterprofile_Enterprise-und_Lösungsarchitektur.md
- **Unklarheit**: Es wird zwar festgelegt, dass pro Profil maximal 2 (Senior) bzw. 1 (nicht-Senior) Zusatzpunkte erreichbar sind, aber nicht, ob diese Punkte pro Qualifikation oder insgesamt vergeben werden — die Formulierung „pro nachgewiesener Zusatzqualifikation pro Profil ein Punkt“ lässt Raum für Interpretation [8.4_Mitarbeiterprofile_Enterprise-und_Lösungsarchitektur.md].
- **Warum architekturrelevant**: Die Unklarheit beeinflusst die Auswahl der Zusatzqualifikationen und deren Gewichtung im Angebot. Für die Architekturarbeit ist entscheidend, welche Zusatzqualifikationen (z. B. DoDAF, EIRA) priorisiert werden, da dies die Ausrichtung der Architektur auf öffentliche Standards beeinflusst.

### 3. **Unklarheit in der Definition von „Berufserfahrung“ für Senior Enterprise Architekt:in**
- **Dokument**: 8.4_Mitarbeiterprofile_Enterprise-und_Lösungsarchitektur.md
- **Unklarheit**: Für Senior Enterprise Architekt:in wird explizit ausgeschlossen, dass Beratungsmandate für Enterprise-Architektur-Teams gezählt werden, während für Senior Lösungsarchitekt:in keine solche Einschränkung formuliert ist. Ob dies absichtlich oder ein redaktioneller Fehler ist, bleibt unklar [8.4_Mitarbeiterprofile_Enterprise-und_Lösungsarchitektur.md].
- **Warum architekturrelevant**: Die Unklarheit beeinflusst die Auswahl der Mitarbeiter und deren Erfahrung. Für die Architekturarbeit ist entscheidend, ob Beratungsmandate für Teams als relevante Erfahrung gelten, da dies die Art der Architekturarbeit (z. B. strategisch vs. operativ) beeinflusst.

---

## **Zusammenfassung**

Es gibt **keine harten Widersprüche** zwischen den Dokumenten. Die identifizierten **weichen Diskrepanzen** betreffen vor allem die Formulierung, Benennung und Quantifizierung von Sachverhalten, insbesondere in Bezug auf Referenzprojekte, vergleichbare Leistungen, Kostenkontrolle und Personalkennzahlen. Diese Diskrepanzen erfordern eine klare Interpretation und Dokumentation im Angebot, um Missverständnisse zu vermeiden und eine faire Bewertung sicherzustellen. Die **stärksten Unklarheiten innerhalb einzelner Dokumente** betreffen die Definition von Begriffen wie „vergleichbar“, „kumulativ“ und „VZÄ“, die für die Architekturplanung und Ressourcensteuerung relevant sind. Bieter sollten diese Unklarheiten im Rahmen von Verhandlungsvorschlägen oder durch Rückfragen klären, um eine eindeutige Auslegung sicherzustellen.