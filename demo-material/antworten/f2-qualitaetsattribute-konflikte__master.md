```markdown
# Nicht-funktionale Anforderungen und ihre architektonische Relevanz

## Sicherheit

**Zusammenfassung der Anforderungen:**
- Praktische Erfahrung in Security-by-Design, Privacy-by-Design und Zero-Trust-Architekturen ist für alle Architekturprofile verpflichtend [1_Leistungsbeschreibung_v.1.0.md §6.2.1.5].
- Integration von IT-Sicherheitsstandards (BSI IT-Grundschutz, C5, NIS2) in die Software-Engineering-Leistungen [1_Leistungsbeschreibung_v.1.0.md §10.2.2].
- Der Auftragnehmer muss technische und organisatorische Maßnahmen entsprechend dem Stand der Technik sicherstellen [0_Rahmenvereinbarung.md §14 (1)].
- Vertrauliche Informationen sind dauerhaft zu schützen, auch nach Vertragsende [0_Rahmenvereinbarung.md §14 (2), §15 (3)].

**Architektonische Trade-offs:**
- **Zero-Trust vs. Benutzerfreundlichkeit**: Eine strikte Zero-Trust-Architektur erfordert kontinuierliche Authentifizierung und Autorisierung, was die Benutzererfahrung beeinträchtigen kann. Dies muss architektonisch durch intelligente Sitzungsmanagement- und Tokenisierungsmechanismen abgefangen werden.
- **Sicherheit vs. Agilität**: Security-by-Design und Security-Testing (z. B. Snyk, SonarQube) müssen in agile Entwicklungsprozesse integriert werden, was zu Verzögerungen führen kann. Architektonisch muss dies durch automatisierte Security-Pipelines und Shift-Left-Ansätze kompensiert werden.

---

## Datenschutz

**Zusammenfassung der Anforderungen:**
- Einhaltung der DSGVO ist verpflichtend [0_Rahmenvereinbarung.md §14 (1)].
- Keine Übermittlung von Daten an Drittländer; Daten verbleiben im Geltungsbereich der DSGVO [12_Datenschutzhinweis_FITKO_Vergabe_oeffAuftraege.md Abs. 7].
- Privacy-by-Design ist Teil der Architekturprofile [1_Leistungsbeschreibung_v.1.0.md §6.2.1.5].

**Architektonische Trade-offs:**
- **Datenschutz vs. Interoperabilität**: Die Forderung nach Datenlokalität (keine Drittlandübermittlung) kann mit der Nutzung von Cloud-Diensten oder externen APIs kollidieren, die in Drittländern gehostet sind. Architektonisch muss dies durch regionale Cloud-Deployments oder Data-Proxy-Lösungen gelöst werden.
- **Privacy-by-Design vs. Funktionalität**: Anonymisierung oder Pseudonymisierung von Daten kann die Funktionalität von Analysen oder personalisierten Diensten einschränken. Architektonisch muss dies durch differenzierte Datenzugriffskonzepte (z. B. Rollenbasierte Zugriffssteuerung mit Datensparsamkeit) abgefangen werden.

---

## Verfügbarkeit

**Zusammenfassung der Anforderungen:**
- Design von Hochverfügbarkeits- und Failover-Konzepten für kritische Infrastrukturen ist gefordert [1_Leistungsbeschreibung_v.1.0.md §10.2.2].
- Der Auftragnehmer muss montags bis freitags (9–17 Uhr) erreichbar sein, ggf. durch Stellvertretung [0_Rahmenvereinbarung.md §7].

**Architektonische Trade-offs:**
- **Hochverfügbarkeit vs. Kosten**: Redundante Systeme und automatisierte Failover-Mechanismen erhöhen die Betriebskosten. Architektonisch muss dies durch eine klare Trennung von kritischen und nicht-kritischen Komponenten und entsprechende SLA-Definitionen gemanagt werden.
- **Verfügbarkeit vs. Sicherheit**: Hochverfügbarkeitsarchitekturen (z. B. aktive-active-Cluster) können Angriffsflächen erweitern. Architektonisch muss dies durch segmentierte Netzwerke und Zero-Trust-Prinzipien abgesichert werden.

---

## Barrierefreiheit

**Zusammenfassung der Anforderungen:**
- Einhaltung von EN 301 549, WCAG 2.1/2.2, BITV 2.0, BFSG, BGG und landesrechtlichen Vorgaben ist verpflichtend [1_Leistungsbeschreibung_v.1.0.md §9.1, 260706_Bieterfragen_und_Antworten.md Frage 132, 145].
- Fließende mündliche und schriftliche Kommunikation in Deutsch (mindestens C2) und Englisch (mindestens B2) für Barrierefreiheit-Profile [8.7_Mitarbeiterprofile_Barrierefreiheit.md Seite 6, 9, 12].

**Architektonische Trade-offs:**
- **Barrierefreiheit vs. Designflexibilität**: WCAG-Konformität kann Design- und Interaktionsfreiheiten einschränken (z. B. Farbkontraste, Tastatur-Navigation). Architektonisch muss dies durch ein barrierefreies Designsystem und Komponentenbibliotheken gelöst werden.
- **Barrierefreiheit vs. Performance**: Zugängliche UI-Komponenten (z. B. ARIA-Labels, Screenreader-Optimierungen) können die Ladezeiten erhöhen. Architektonisch muss dies durch Lazy-Loading und serverseitige Rendering-Optimierungen kompensiert werden.

---

## Betrieb

**Zusammenfassung der Anforderungen:**
- Betriebssteuerung ist Teil der Software-Engineering-Leistung [1_Leistungsbeschreibung_v.1.0.md §10.2.2].
- Nutzung von Monitoring- und Logging-Werkzeugen wie OpenTelemetry, ELK-Stack [1_Leistungsbeschreibung_v.1.0.md §10.2.4].
- DevSecOps ist im Lead-Profil als bevorzugter Regelbetrieb genannt [8.8_Mitarbeiterprofile_Software-Engineering.md Seite 14].

**Architektonische Trade-offs:**
- **Betrieb vs. Sicherheit**: Monitoring- und Logging-Daten enthalten oft sensible Informationen. Architektonisch muss dies durch verschlüsselte Logs, Zugriffskontrollen und Datenminimierung gelöst werden.
- **Betrieb vs. Skalierbarkeit**: Einheitliche Monitoring-Infrastrukturen müssen bei verteilten, skalierbaren Architekturen (z. B. Microservices) zentralisiert werden, was zu Latenz und Single-Point-of-Failure führen kann. Architektonisch muss dies durch verteilte Logging- und Tracing-Systeme (z. B. OpenTelemetry mit Collector-Clustern) gelöst werden.

---

## Wartbarkeit

**Zusammenfassung der Anforderungen:**
- Bewusstes Management technischer Schulden, Nutzung von Metriken und Priorisierungstechniken wie Cost of Delay, Little’s Law, WSJF [1_Leistungsbeschreibung_v.1.0.md §10.2.2].
- Dokumentation gemäß arc42 und Nutzung von Architecture Decision Records [1_Leistungsbeschreibung_v.1.0.md §6.2.1, 10.2.2].

**Architektonische Trade-offs:**
- **Wartbarkeit vs. Geschwindigkeit**: Technische Schulden müssen priorisiert werden, was zu Verzögerungen bei der Feature-Entwicklung führen kann. Architektonisch muss dies durch ein klares Tech-Debt-Backlog und integrierte Refactoring-Zyklen gelöst werden.
- **Dokumentation vs. Agilität**: Umfangreiche Dokumentation (arc42, ADRs) kann agilen Prozessen entgegenstehen. Architektonisch muss dies durch automatisierte Dokumentation und „Living Documentation“-Ansätze kompensiert werden.

---

## Skalierbarkeit

**Zusammenfassung der Anforderungen:**
- Konzeption skalierbarer verteilter Softwarearchitekturen und Cloud-Native-Architekturen ist Teil des Software-Engineering-Profils [1_Leistungsbeschreibung_v.1.0.md §10.2.2].
- Der Bewerber muss über eine bestimmte Mindestanzahl an qualifiziertem Personal verfügen, um die Leistungserbringung sicherzustellen [6.1_Zusatzerklärung_zur_Eignung_Projektmanagement.md Abschnitt II.1].

**Architektonische Trade-offs:**
- **Skalierbarkeit vs. Komplexität**: Verteilte Architekturen (Microservices, Event-Driven) erhöhen die Systemkomplexität. Architektonisch muss dies durch klare Schnittstellen, Service-Discovery und Observability gelöst werden.
- **Skalierbarkeit vs. Kosten**: Cloud-Native-Architekturen können bei hoher Last teuer werden. Architektonisch muss dies durch Auto-Scaling, Spot-Instances und Kosten-Monitoring gemanagt werden.

---

## Interoperabilität

**Zusammenfassung der Anforderungen:**
- Kenntnis und Anwendung von Industrie- und verwaltungsspezifischen Interoperabilitätsstandards (XÖV, XZuFi, FIM, OSCI) [1_Leistungsbeschreibung_v.1.0.md §10.2.2].
- Maschinelle Lesbarkeit der Buchungskreis-/Dienststellenangaben ist zwingend erforderlich; handschriftliche Angaben sind unzulässig [11_Wichtige_Hinweise_zu_Rechnungen_und_Zahlungen_an_die_FITKO.md S. 1].

**Architektonische Trade-offs:**
- **Interoperabilität vs. Flexibilität**: Die Einhaltung von XÖV, XZuFi etc. kann die technische Flexibilität einschränken (z. B. feste XML-Schemata). Architektonisch muss dies durch Adapter-Schichten und Schema-Transformationen gelöst werden.
- **Interoperabilität vs. Sicherheit**: Offene Schnittstellen für Interoperabilität können Angriffsflächen erweitern. Architektonisch muss dies durch API-Gateways, Authentifizierung und Verschlüsselung abgesichert werden.

---

## Zusammenfassende architektonische Schlussfolgerung

Die Architektur der zu erbringenden Leistung wird maßgeblich von folgenden Faktoren geprägt:
- **Integrierte Gesamtleistung**: Der Auftragnehmer schuldet eine miteinander verzahnte Gesamtleistung mit Koordinations- und Steuerungsverantwortung [Allgemeine_Vergabedingungen_v.1.1.md §1.3].
- **Hohe Gewichtung von Software-Engineering (30 %)**: Dies impliziert eine starke technische Ausrichtung und Umsetzungsrelevanz [Allgemeine_Vergabedingungen_v.1.1.md §4.6].
- **Sicherheits- und Datenschutzanforderungen**: Security-by-Design, Zero-Trust und DSGVO-Konformität sind architektonische Grundprinzipien [1_Leistungsbeschreibung_v.1.0.md §6.2.1.5, 0_Rahmenvereinbarung.md §14 (1)].
- **Agile und interdisziplinäre Teams**: Die Architektur muss in agile Prozesse integriert werden und interdisziplinäre Zusammenarbeit ermöglichen [1_Leistungsbeschreibung_v.1.0.md §6.2.1].
- **Plattformunabhängigkeit**: Da das Personal eigene Arbeitsmittel und Software nutzen muss [14_Hinweise_ANÜ.md Abschnitt 1], muss die Architektur plattformübergreifend und unabhängig von FITKO-Infrastruktur betrieben werden können.

**Offene architektonische Fragen (nicht im Kontext beantwortbar):**
- Konkrete Technologien (Programmiersprachen, Cloud-Anbieter, Datenbanken) sind nicht vorgegeben [1_Leistungsbeschreibung_v.1.0.md §10.2.3, 8.8_Mitarbeiterprofile_Software-Engineering.md Seite 8, 13, 23].
- Konkrete Schnittstellen zwischen den acht Disziplinen sind nicht definiert [1_Leistungsbeschreibung_v.1.0.md §2.1, Allgemeine_Vergabedingungen_v.1.1.md §1.3].
- Konkrete technische Spezifikationen für Skalierbarkeit, Verfügbarkeit, Wartbarkeit, Sicherheit, Datenhaltung, UI/UX, Betrieb, Test und DevOps fehlen [1_Leistungsbeschreibung_v.1.0.md §10.2.2, 8.8_Mitarbeiterprofile_Software-Engineering.md Seite 14, 8.7_Mitarbeiterprofile_Barrierefreiheit.md Seite 9, 13].

Diese offenen Punkte müssen durch direkte Abstimmung mit der FITKO geklärt werden, um eine vollständige und präzise Architekturplanung durchführen zu können.
```