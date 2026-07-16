# Nicht-funktionale Anforderungen und ihre architektonische Relevanz

Die Ausschreibung legt keine expliziten technischen oder architektonischen Standards fest, definiert aber klare nicht-funktionale Rahmenbedingungen, die die Architekturwahl und -umsetzung maßgeblich beeinflussen. Die Anforderungen sind überwiegend personell, prozessual und rechtlich ausgerichtet, wobei Sicherheit, Datenschutz, Verfügbarkeit und Interoperabilität als zentrale architektonische Treiber hervortreten.

---

## Sicherheit

**Zusammenfassung der Anforderungen:**
- Alle Architekturprofile müssen praktische Erfahrung in **Security-by-Design, Privacy-by-Design und Zero-Trust-Architekturen** sowie in **sicherheitskritischen Umgebungen (Schutzbedarf hoch)** nachweisen [1_Leistungsbeschreibung_v.1.0.md, 6.4_Zusatzerklärung_zur_Eignung_Enterprise-und_Lösungsarchitektur.md, 8.4_Mitarbeiterprofile_Enterprise-und_Lösungsarchitektur.md].
- Konzeption sicherer Systeme und Integration von IT-Sicherheitsstandards wie **BSI IT-Grundschutz, C5, NIS2** ist Teil des Software-Engineering-Profils [1_Leistungsbeschreibung_v.1.0.md].
- Zertifikate wie **BSI Grundschutz, ISO 27001, CISSP, CISM** sind für Informationssicherheitsprofile verpflichtend [8.5_Mitarbeiterprofile_Informationssicherheit.md].
- Der Auftragnehmer muss technische und organisatorische Maßnahmen entsprechend dem **Stand der Technik** sicherstellen [0_Rahmenvereinbarung.md, § 14 (1)].
- Externe Mitarbeiter dürfen **keine FITKO-internen Arbeitsmittel** nutzen, außer bei berechtigten Sicherheits- oder Projektinteressen [14_Hinweise_ANÜ.md].

**Quellen:**  
[1_Leistungsbeschreibung_v.1.0.md, § 6.2.1.5, 10.2.2]  
[8.4_Mitarbeiterprofile_Enterprise-und_Lösungsarchitektur.md, Seite 5–6, 20–21, 31–32, 50–51]  
[8.5_Mitarbeiterprofile_Informationssicherheit.md, Seite 6, 9]  
[0_Rahmenvereinbarung.md, § 14 (1)]  
[14_Hinweise_ANÜ.md, Abschnitt 1]

**Trade-offs:**
- **Sicherheit vs. Integration**: Die strikte Trennung zwischen externen und internen Arbeitsmitteln [14_Hinweise_ANÜ.md] erfordert eine Architektur, die **unabhängig von FITKO-Infrastruktur** betrieben werden kann. Dies schränkt die Integration in bestehende Systeme ein und kann die **Interoperabilität** erschweren, da externe Tools und Plattformen verwendet werden müssen.
- **Zero-Trust vs. Agilität**: Die Forderung nach Zero-Trust-Architekturen und Security-by-Design [1_Leistungsbeschreibung_v.1.0.md] erfordert eine **höhere Komplexität** in der Architektur (z. B. strikte Authentifizierung, Mikrosegmentierung), was die **Agilität und schnelle Iteration** in agilen Teams behindern kann, wenn nicht von Anfang an in die Architektur integriert.

---

## Datenschutz

**Zusammenfassung der Anforderungen:**
- Der Auftragnehmer muss die **DSGVO einhalten** und technische/organisatorische Maßnahmen entsprechend dem Stand der Technik sicherstellen [0_Rahmenvereinbarung.md, § 14 (1)].
- **Privacy-by-Design** ist für alle Architekturprofile verpflichtend [1_Leistungsbeschreibung_v.1.0.md, 8.4_Mitarbeiterprofile_Enterprise-und_Lösungsarchitektur.md].
- Verarbeitung personenbezogener Daten erfolgt nur auf Grundlage von **Art. 6 Abs. 1 lit. c, e und b DSGVO** sowie nationalen Vergabegesetzen [12_Datenschutzhinweis_FITKO_Vergabe_oeffAuftraege.md].
- Externe Berater werden auf **Einhaltung des Datengeheimnisses** verpflichtet [12_Datenschutzhinweis_FITKO_Vergabe_oeffAuftraege.md].
- Keine **Übermittlung an Drittländer**; Daten verbleiben im Geltungsbereich der DSGVO [12_Datenschutzhinweis_FITKO_Vergabe_oeffAuftraege.md].
- Speicherung erfolgt gemäß **Aktenordnung und Aufbewahrungsfristen** [12_Datenschutzhinweis_FITKO_Vergabe_oeffAuftraege.md].

**Quellen:**  
[0_Rahmenvereinbarung.md, § 14 (1)]  
[1_Leistungsbeschreibung_v.1.0.md, § 6.2.1.5]  
[12_Datenschutzhinweis_FITKO_Vergabe_oeffAuftraege.md, Abs. 4, 6, 7, 8]  
[8.4_Mitarbeiterprofile_Enterprise-und_Lösungsarchitektur.md, Seite 5–6, 20–21, 31–32, 50–51]

**Trade-offs:**
- **Datenschutz vs. Skalierbarkeit**: Die Forderung nach **Datenminimierung** und **Speicherung im Geltungsbereich der DSGVO** [12_Datenschutzhinweis_FITKO_Vergabe_oeffAuftraege.md] schränkt die Nutzung von **globalen Cloud-Diensten** ein, was die **Skalierbarkeit und Flexibilität** der Architektur beeinträchtigen kann.
- **Privacy-by-Design vs. Funktionalität**: Die Integration von Privacy-by-Design in alle Architekturprofile [1_Leistungsbeschreibung_v.1.0.md] erfordert eine **frühzeitige Berücksichtigung von Datenschutzaspekten**, was die **Entwicklungszeit und -komplexität** erhöhen kann, wenn nicht von Anfang an in die Architektur integriert.

---

## Verfügbarkeit

**Zusammenfassung der Anforderungen:**
- Der Auftragnehmer muss **montags bis freitags (9–17 Uhr) erreichbar** sein, ggf. durch Stellvertretung [0_Rahmenvereinbarung.md, § 7].
- **Design von Hochverfügbarkeits- und Failover-Konzepten** für kritische Infrastrukturen ist Teil des Software-Engineering-Profils [1_Leistungsbeschreibung_v.1.0.md].
- Der Auftragnehmer muss **kontinuierlich qualifiziertes Personal** bereitstellen, das den Anforderungen der Leistungsbeschreibung entspricht [0_Rahmenvereinbarung.md, § 6 (1), (2)].

**Quellen:**  
[0_Rahmenvereinbarung.md, § 7, § 6 (1), (2)]  
[1_Leistungsbeschreibung_v.1.0.md, § 10.2.2]

**Trade-offs:**
- **Verfügbarkeit vs. Kosten**: Die Forderung nach **kontinuierlichem, qualifiziertem Personal** [0_Rahmenvereinbarung.md, § 6 (1), (2)] und **Hochverfügbarkeitskonzepten** [1_Leistungsbeschreibung_v.1.0.md] erfordert eine **höhere Personalkapazität und technische Infrastruktur**, was die **Kosten** erhöhen kann.
- **Verfügbarkeit vs. Flexibilität**: Die **feste Erreichbarkeit (9–17 Uhr)** [0_Rahmenvereinbarung.md, § 7] schränkt die **Flexibilität** bei der Personalzuweisung ein, da **nicht-zeitgebundene oder nachtschichtbasierte Arbeiten** nicht möglich sind.

---

## Barrierefreiheit

**Zusammenfassung der Anforderungen:**
- **Einhaltung von EN 301 549, WCAG, BITV 2.0, BFSG, BGG und landesrechtlichen Vorgaben** ist für digitale Produkte und Dokumente verpflichtend [1_Leistungsbeschreibung_v.1.0.md, § 9.1].
- Für Barrierefreiheit sind **26 Referenzprojekte** innerhalb der letzten drei Jahre nachzuweisen, davon mindestens 10 Prüf-/Testprojekte (BITV/WCAG) [6.7_Zusatzerklärung_zur_Eignung_Barrierefreiheit_v.1.1.md].
- Mitarbeiterprofile im Bereich Barrierefreiheit müssen **Kenntnisse der jeweils gültigen rechtlichen Vorgaben, Standards und Rahmenbedingungen** sowie **Erfahrung mit Testverfahren wie BIK, BITV-Test, WCAG-Checks** nachweisen [8.7_Mitarbeiterprofile_Barrierefreiheit.md].
- **Fließende mündliche und schriftliche Kommunikation in Deutsch (mindestens Niveau C2)** sowie **Englisch (mindestens Niveau B2)** ist für alle Barrierefreiheitsprofile verpflichtend [8.7_Mitarbeiterprofile_Barrierefreiheit.md].

**Quellen:**  
[1_Leistungsbeschreibung_v.1.0.md, § 9.1]  
[6.7_Zusatzerklärung_zur_Eignung_Barrierefreiheit_v.1.1.md, Abschnitt II.2]  
[8.7_Mitarbeiterprofile_Barrierefreiheit.md, Seite 6, 9, 12]

**Trade-offs:**
- **Barrierefreiheit vs. Entwicklungsgeschwindigkeit**: Die Forderung nach **Einhaltung von WCAG und BITV** [1_Leistungsbeschreibung_v.1.0.md] erfordert eine **höhere Test- und Validierungsaufwand**, was die **Entwicklungsgeschwindigkeit** verringern kann.
- **Barrierefreiheit vs. Technologieauswahl**: Die Notwendigkeit, **assistive Technologien** (Screenreader, Braille-Displays) zu unterstützen [8.7_Mitarbeiterprofile_Barrierefreiheit.md] schränkt die **Technologieauswahl** ein, da nicht alle Frameworks und Bibliotheken barrierefrei sind.

---

## Betrieb

**Zusammenfassung der Anforderungen:**
- **DevSecOps** ist im Lead-Profil als bevorzugter Regelbetrieb genannt [8.8_Mitarbeiterprofile_Software-Engineering.md].
- **Betriebssteuerung** ist Teil der Disziplin „Software-Engineering, Softwareentwicklung und Betriebssteuerung“ [1_Leistungsbeschreibung_v.1.0.md, § 10.2.2].
- Der Auftragnehmer muss **alle Arbeitsergebnisse** an die Auftraggeberin übertragen; Methoden und Werkzeuge bleiben bei ihm, jedoch mit nicht-ausschließlichem Nutzungsrecht für die Auftraggeberin [0_Rahmenvereinbarung.md, § 16].
- **Koordinierung und Steuerung von Projekten**, einschließlich Finanz- und Kapazitätsmanagement, ist explizit gefordert [10_Bewertungsmatrix_Konzept_v.1.1.md].

**Quellen:**  
[8.8_Mitarbeiterprofile_Software-Engineering.md, Seite 14]  
[1_Leistungsbeschreibung_v.1.0.md, § 10.2.2]  
[0_Rahmenvereinbarung.md, § 16]  
[10_Bewertungsmatrix_Konzept_v.1.1.md, S. 1]

**Trade-offs:**
- **Betrieb vs. Ownership**: Die Übertragung aller Arbeitsergebnisse an die Auftraggeberin [0_Rahmenvereinbarung.md, § 16] erfordert eine **klare Trennung zwischen Betrieb und Entwicklung**, da die Auftraggeberin die Ergebnisse übernimmt, aber der Auftragnehmer weiterhin für den Betrieb verantwortlich ist.
- **DevSecOps vs. Legacy-Systeme**: Die Forderung nach **DevSecOps** [8.8_Mitarbeiterprofile_Software-Engineering.md] erfordert eine **automatisierte und integrierte Pipeline**, was mit **Legacy-Systemen** oder **manuellen Prozessen** in Konflikt stehen kann.

---

## Wartbarkeit

**Zusammenfassung der Anforderungen:**
- **Bewusstes Management technischer Schulden**, Nutzung von Metriken und Priorisierungstechniken wie **Cost of Delay, Little’s Law, WSJF** ist Teil des Software-Engineering-Profils [1_Leistungsbeschreibung_v.1.0.md, § 10.2.2].
- **Dokumentation gemäß arc42** und Nutzung von **Architecture Decision Records** ist verpflichtend [1_Leistungsbeschreibung_v.1.0.md, § 6.2.1, 10.2.2].
- **Strukturierung und Umsetzung von Koordinierungs- und Steuerungsleistungen**, einschließlich Finanz- und Kapazitätsmanagement, ist explizit gefordert [10_Bewertungsmatrix_Konzept_v.1.1.md].

**Quellen:**  
[1_Leistungsbeschreibung_v.1.0.md, § 10.2.2, 6.2.1]  
[10_Bewertungsmatrix_Konzept_v.1.1.md, S. 1]

**Trade-offs:**
- **Wartbarkeit vs. Geschwindigkeit**: Die Forderung nach **strukturierter Dokumentation (arc42, ADR)** [1_Leistungsbeschreibung_v.1.0.md] und **Management technischer Schulden** [1_Leistungsbeschreibung_v.1.0.md] erfordert eine **höhere Aufwand in der Dokumentation und Planung**, was die **Entwicklungsgeschwindigkeit** verringern kann.
- **Wartbarkeit vs. Flexibilität**: Die **strukturierte Dokumentation** kann die **Flexibilität** bei schnellen Änderungen einschränken, da Änderungen dokumentiert und genehmigt werden müssen.

---

## Skalierbarkeit

**Zusammenfassung der Anforderungen:**
- **Konzeption skalierbarer verteilter Softwarearchitekturen und Cloud-Native-Architekturen** ist Teil des Software-Engineering-Profils [1_Leistungsbeschreibung_v.1.0.md, § 10.2.2].
- Der Bewerber muss nachweisen, dass er in den letzten drei Geschäftsjahren jährlich über eine bestimmte Mindestanzahl an qualifiziertem Personal verfügte (z. B. 60 Personen für Enterprise-Architektur, 30 für Software-Engineering) [260706_Bieterfragen_und_Antworten.md, Frage 49, 50, 51].
- Mindestumsatzanforderungen pro Disziplin (z. B. 18 Mio. EUR für Enterprise-Architektur, 45 Mio. EUR für Software-Engineering) [6.4_Zusatzerklärung_zur_Eignung_Enterprise-und_Lösungsarchitektur.md, 6.8_Zusatzerklärung_zur_Eignung_Software-Engineering.md].

**Quellen:**  
[1_Leistungsbeschreibung_v.1.0.md, § 10.2.2]  
[260706_Bieterfragen_und_Antworten.md, Frage 49, 50, 51]  
[6.4_Zusatzerklärung_zur_Eignung_Enterprise-und_Lösungsarchitektur.md, Abschnitt I.2]  
[6.8_Zusatzerklärung_zur_Eignung_Software-Engineering.md, Abschnitt I.2]

**Trade-offs:**
- **Skalierbarkeit vs. Kosten**: Die Forderung nach **Cloud-Native-Architekturen** und **skalierbaren verteiltern Systemen** [1_Leistungsbeschreibung_v.1.0.md] erfordert eine **höhere Infrastruktur- und Betriebskosten**, was die **Gesamtkosten** erhöhen kann.
- **Skalierbarkeit vs. Komplexität**: Die **hohe Anzahl an qualifiziertem Personal** [260706_Bieterfragen_und_Antworten.md] und **Mindestumsatzanforderungen** [6.4_Zusatzerklärung_zur_Eignung_Enterprise-und_Lösungsarchitektur.md] erfordern eine **komplexe Organisationsstruktur**, was die **Koordination und Steuerung** erschweren kann.

---

## Interoperabilität

**Zusammenfassung der Anforderungen:**
- **Kenntnis und Anwendung von Industrie- und verwaltungsspezifischen Interoperabilitätsstandards** (XÖV, XZuFi, FIM, OSCI) ist Teil des Software-Engineering-Profils [1_Leistungsbeschreibung_v.1.0.md, § 10.2.2].
- **Maschinelle Lesbarkeit** der Buchungskreis-/Dienststellenangaben (BKR 5010-DST 2019) ist zwingend erforderlich für Rechnungen an FITKO [11_Wichtige_Hinweise_zu_Rechnungen_und_Zahlungen_an_die_FITKO.md].
- **X-Rechnungen** sind optional, aber empfohlen; bei Nutzung ist die Leitweg-ID „06-50102019-97“ zu verwenden [11_Wichtige_Hinweise_zu_Rechnungen_und_Zahlungen_an_die_FITKO.md].
- **Integration in bestehende Systeme** und **Schnittstellen zu externen Stellen** (z. B. Vergabekammer, Register) müssen datenschutzkonform gestaltet sein [12_Datenschutzhinweis_FITKO_Vergabe_oeffAuftraege.md].

**Quellen:**  
[1_Leistungsbeschreibung_v.1.0.md, § 10.2.2]  
[11_Wichtige_Hinweise_zu_Rechnungen_und_Zahlungen_an_die_FITKO.md, S. 1–2]  
[12_Datenschutzhinweis_FITKO_Vergabe_oeffAuftraege.md, Abs. 6]

**Trade-offs:**
- **Interoperabilität vs. Flexibilität**: Die Forderung nach **spezifischen Interoperabilitätsstandards** (XÖV, XZuFi, FIM, OSCI) [1_Leistungsbeschreibung_v.1.0.md] schränkt die **Technologieauswahl** ein, da nicht alle Systeme diese Standards unterstützen.
- **Interoperabilität vs. Sicherheit**: Die **Integration in bestehende Systeme** und **Schnittstellen zu externen Stellen** [12_Datenschutzhinweis_FITKO_Vergabe_oeffAuftraege.md] erfordert eine **höhere Sicherheitskomplexität**, da externe Systeme potenzielle Angriffsvektoren darstellen können.

---

## Zusammenfassung der architektonischen Trade-offs

| Kategorie | Trade-off | Begründung |
|-----------|-----------|-----------|
| **Sicherheit vs. Integration** | Externe Arbeitsmittel vs. FITKO-Infrastruktur | Strikte Trennung erfordert unabhängige Architektur, erschwert Integration |
| **Sicherheit vs. Agilität** | Zero-Trust vs. schnelle Iteration | Hohe Sicherheitskomplexität kann agile Prozesse behindern |
| **Datenschutz vs. Skalierbarkeit** | DSGVO vs. globale Cloud-Dienste | Datenlokalität schränkt Nutzung skalierbarer Cloud-Lösungen ein |
| **Datenschutz vs. Funktionalität** | Privacy-by-Design vs. Entwicklungsgeschwindigkeit | Frühzeitige Berücksichtigung erhöht Aufwand und Komplexität |
| **Verfügbarkeit vs. Kosten** | Hochverfügbarkeit vs. Personalkosten | Kontinuierliche Verfügbarkeit erfordert höhere Ressourcen |
| **Barrierefreiheit vs. Entwicklungsgeschwindigkeit** | WCAG vs. schnelle Entwicklung | Hoher Testaufwand verlangsamt Entwicklung |
| **Betrieb vs. Ownership** | Arbeitsergebnisse vs. Betrieb | Übertragung der Ergebnisse an Auftraggeberin erfordert klare Trennung |
| **Wartbarkeit vs. Geschwindigkeit** | Dokumentation vs. schnelle Entwicklung | Strukturierte Dokumentation erhöht Aufwand |
| **Skalierbarkeit vs. Kosten** | Cloud-Native vs. Infrastrukturkosten | Skalierbare Architekturen erfordern höhere Betriebskosten |
| **Interoperabilität vs. Flexibilität** | Standards vs. Technologieauswahl | Spezifische Standards schränken Technologieauswahl ein |

Diese Trade-offs müssen architektonisch entschieden werden, um eine ausgewogene Lösung zu finden, die den Anforderungen gerecht wird, ohne die Umsetzbarkeit oder Wirtschaftlichkeit zu gefährden.