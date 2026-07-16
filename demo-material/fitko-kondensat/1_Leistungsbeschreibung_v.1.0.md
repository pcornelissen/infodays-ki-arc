# 1_Leistungsbeschreibung_v.1.0.pdf

## Rolle im Verfahren
Dieses Dokument ist die Leistungsbeschreibung zur Rahmenvereinbarung FITKO/2026/0039 (Vergabenummer VG-FITKO-2026-0084) und definiert den Umfang, die Ausführung und die Qualifikationsanforderungen für die integrierte Projekt- und Produktberatung, die der Auftragnehmer für die FITKO erbringen muss. Es dient als vertragliche Grundlage für abrufbare Leistungen in acht Disziplinen und legt die Anforderungen an Personal, Methoden und Koordination fest.

## Kernaussagen (architekturrelevant)
- Die FITKO benötigt integrierte Beratungsleistungen in acht Disziplinen, darunter Enterprise- und Lösungsarchitektur, wobei der Auftragnehmer nicht nur fachliche Leistungen, sondern auch koordinative und übergreifende Steuerungsaufgaben übernimmt [2.1, 2.2].
- Enterprise-Architektur fokussiert auf organisationsübergreifende Zielbilder, Governance und Standardisierung, ohne lösungsspezifische Entscheidungen zu treffen; Lösungsarchitektur konkretisiert diese Leitplanken für konkrete Systeme und Vorhaben [6.1.1, 6.1.2].
- Architekturleistungen müssen auf dem Stand der Technik erfolgen, unter Einbeziehung von Frameworks wie TOGAF, ArchiMate, C4-Modell, iSAQB und arc42 sowie Prinzipien wie Security-by-Design, Privacy-by-Design und Zero-Trust [6.1, 6.2.1.5, 10.2.2].
- Der Auftragnehmer muss in der Lage sein, für jeden Abruf passende, qualifizierte Personen aus seinem Pool bereitzustellen, wobei die Seniorität anhand der Erfahrung in den für den Abruf relevanten Technologien bewertet wird [10.2].

## Technologische, methodische oder standardbezogene Vorgaben
- Verwendung von ArchiMate für Modellierung in Enterprise- und Lösungsarchitektur [6.2.1.1, 6.2.1.2, 6.2.1.3, 6.2.1.4].
- Einsatz von TOGAF, BIZBOK, Domain-Driven Design, C4-Modell, iSAQB, arc42, UML, BPMN, Architecture Decision Records [6.2.1.1–6.2.1.4, 10.2.2].
- Anwendung agiler Methoden (SCRUM, SAFe, PRINCE2 Agile) sowie klassischer Projektmanagementstandards (PRINCE2, V-Modell XT) [3.1].
- Einhaltung von Interoperabilitätsstandards wie XÖV, XZuFi, FIM, OSCI [10.2.2].
- Nutzung von DevOps-Tools wie GitLab, Kubernetes, Terraform, SonarQube, Snyk, ArchUnit [10.2.2, 10.2.4].
- Konzeption von Zero-Trust-Architekturen und Integration von IT-Sicherheitsstandards (BSI IT-Grundschutz, C5, NIS2) [6.2.1.5, 10.2.2].
- Keine expliziten Vorgaben für konkrete Programmiersprachen oder Plattformen, aber Nennung von Java, Python, C#, JavaScript/TypeScript, Rust, Drupal, Moodle, React, Angular, Vue.js, ElasticSearch, OpenSearch, Kafka, RabbitMQ [10.2.3].

## Nicht-funktionale Anforderungen
- **Sicherheit**: Praktische Erfahrung in Security-by-Design, Privacy-by-Design, Zero-Trust-Architekturen und Umsetzung in sicherheitskritischen Umfeldern (Schutzbedarf hoch) [6.2.1.5, 10.2.2].
- **Zuverlässigkeit**: Design von Hochverfügbarkeits- und Failover-Konzepten, Business Continuity Management [10.2.2].
- **Skalierbarkeit**: Konzeption skalierbarer verteilter Softwarearchitekturen und Cloud-Native Architekturen [10.2.2].
- **Barrierefreiheit**: Einhaltung von EN 301 549, WCAG, BITV 2.0, BFSG, BGG und landesspezifischen Vorgaben für alle digitalen Produkte und Dokumente [9.1].
- **Interoperabilität**: Kenntnis und Anwendung von verwaltungsspezifischen Standards (XÖV, XZuFi, FIM, OSCI) [10.2.2, 10.2.3.4].
- **Dokumentation**: Strukturierte Dokumentation gemäß arc42, Nutzung von Docs-as-Code (Docusaurus), OpenAPI für REST-Schnittstellen [10.2.2, 10.2.5.2].

## Verweise auf andere Anlagen / Dokumente
- Verweis auf Anlage 14_Hinweise_ANÜ zur Vermeidung von Eingliederung des Personals in die Betriebsorganisation der FITKO [2.3].
- Verweis auf das Rahmenkonzept „Föderales IT-Architekturmanagement“ (Version 2.0) [6.1].
- Verweis auf das Produktmanagement-Modell des IT-Planungsrats [4.1].
- Verweis auf die Geschäftsordnung für die Gremien der Produkte des IT-Planungsrats [4.1].
- Verweis auf das IT-Staatsvertrag (§ 1) [1].
- Verweis auf das Produktportfolio der FITKO (PVOG als Beispiel) [10.1].

## Unklarheiten oder Widersprüche innerhalb des Dokuments
- Keine erkannt.

## Für die Architekturarbeit besonders relevant
Die Architekturarbeit ist zentral in diesem Dokument verankert und umfasst sowohl Enterprise- als auch Lösungsarchitektur mit klaren Rollen- und Aufgabenabgrenzungen. Der Auftragnehmer muss nicht nur technische Architekturkonzepte erstellen, sondern auch strategische Zielbilder, Governance und Standardisierung begleiten. Besonders relevant ist die explizite Forderung nach praktischer Erfahrung in Zero-Trust, Security-by-Design und der Anwendung von Frameworks wie TOGAF und ArchiMate. Zudem wird erwartet, dass Architekten interdisziplinär mit IT-Sicherheit, Recht und Produktmanagement zusammenarbeiten und Architekturentscheidungen dokumentieren (z. B. mit Architecture Decision Records). Die Anforderungen an Senior-Architekten sind hoch: sie müssen mindestens 7 Jahre Berufserfahrung nachweisen, darunter leitende Positionen in großen IT-Landschaften und konkrete Referenzen für komplexe Projekte.