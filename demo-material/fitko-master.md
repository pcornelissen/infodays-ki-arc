# Architekturrelevante Gesamtsicht auf die Vergabe

## Verfahrenszweck und -kontext
Die Vergabe dient der Einrichtung einer Rahmenvereinbarung für „integrierte Projekt- und Produktberatung“ zwischen der FITKO und einem Auftragnehmer, der als Generalunternehmer für acht Disziplinen agiert — darunter Enterprise- und Lösungsarchitektur, Software-Engineering und Informationssicherheit. Der Auftragnehmer ist verantwortlich für die Gesamtabwicklung, Koordination und Steuerung aller Leistungen, auch wenn Unterauftragnehmer eingeschaltet werden. Die Leistungen werden über Einzelabrufe abgerufen, deren konkreter Umfang jeweils separat vereinbart wird. Der Vertragszweck ist die langfristige, flexible und integrierte Beratung im föderalen IT-Kontext, wobei der Auftragnehmer kontinuierlich qualifiziertes Personal bereitstellen und alle Arbeitsergebnisse an die FITKO übertragen muss.

## Übergreifende technologische, methodische und standardbezogene Vorgaben
- **Modellierungssprachen und Frameworks**: Verwendung von ArchiMate, TOGAF, C4-Modell, iSAQB, arc42, UML, BPMN, Architecture Decision Records, BIZBOK, Domain-Driven Design, DevOps-Tools (GitLab, Kubernetes, Terraform, SonarQube, Snyk, ArchUnit) [1_Leistungsbeschreibung_v.1.0.md §6.2.1.1–6.2.1.4, 10.2.2, 10.2.4; 8.4_Mitarbeiterprofile_Enterprise-und_Lösungsarchitektur.md §9, 19, 35, 43, 52, 59].
- **Methoden und Standards**: Agile Methoden (SCRUM, SAFe, PRINCE2 Agile), klassische Projektmanagementstandards (PRINCE2, V-Modell XT), Interoperabilitätsstandards (XÖV, XZuFi, FIM, OSCI), Zero-Trust-Architekturen, IT-Sicherheitsstandards (BSI IT-Grundschutz, C5, NIS2) [1_Leistungsbeschreibung_v.1.0.md §3.1, 6.2.1.5, 10.2.2; 8.4_Mitarbeiterprofile_Enterprise-und_Lösungsarchitektur.md §6, 20, 31, 50].
- **Dokumentation und Tools**: Strukturierte Dokumentation gemäß arc42, Docs-as-Code (Docusaurus), OpenAPI für REST-Schnittstellen, Jira oder GitLab als Projektmanagement-Werkzeuge [1_Leistungsbeschreibung_v.1.0.md §10.2.2, 10.2.5.2; 8.8_Mitarbeiterprofile_Software-Engineering.md §8, 13, 23].
- **Barrierefreiheit**: Einhaltung von EN 301 549, WCAG (2.1 und 2.2), BITV 2.0, BFSG, BGG und landesspezifischen Vorgaben [1_Leistungsbeschreibung_v.1.0.md §9.1; 260706_Bieterfragen_und_Antworten.md Frage 132, 145].
- **Rechnungsstellung**: Optionaler Einsatz von X-Rechnungen mit Leitweg-ID „06-50102019-97“; maschinelle Lesbarkeit von Buchungskreis (BKR 5010) und Dienststelle (DST 2019) ist zwingend [11_Wichtige_Hinweise_zu_Rechnungen_und_Zahlungen_an_die_FITKO.md S. 1–2].

## Übergreifende nicht-funktionale Anforderungen
- **Sicherheit & Datenschutz**: 
  - Einhaltung der DSGVO, technische/organisatorische Maßnahmen entsprechend dem Stand der Technik, Security-by-Design, Privacy-by-Design, Zero-Trust-Architekturen, Arbeit in sicherheitskritischen Umfeldern (Schutzbedarf hoch) [0_Rahmenvereinbarung.md §14 (1); 1_Leistungsbeschreibung_v.1.0.md §6.2.1.5, 10.2.2; 8.4_Mitarbeiterprofile_Enterprise-und_Lösungsarchitektur.md §6, 20, 31, 50; 8.5_Mitarbeiterprofile_Informationssicherheit.md §6, 9].
  - Verbot der Übermittlung an Drittländer; Daten verbleiben im Geltungsbereich der DSGVO [12_Datenschutzhinweis_FITKO_Vergabe_oeffAuftraege.md Abs. 7].
  - Verschlüsselung elektronischer Kommunikation (konkrete Technik nach Vertragsabschluss) [0_Rahmenvereinbarung.md §15 (12)].
- **Verfügbarkeit & Betrieb**: 
  - Erreichbarkeit montags bis freitags (9–17 Uhr), ggf. durch Stellvertretung [0_Rahmenvereinbarung.md §7].
  - Design von Hochverfügbarkeits- und Failover-Konzepten, Business Continuity Management [1_Leistungsbeschreibung_v.1.0.md §10.2.2].
  - DevSecOps als bevorzugter Regelbetrieb für Lead Software-Engineer [8.8_Mitarbeiterprofile_Software-Engineering.md §14].
- **Barrierefreiheit**: 
  - Einhaltung von EN 301 549, WCAG, BITV 2.0, BFSG, BGG und landesspezifischen Vorgaben für alle digitalen Produkte und Dokumente [1_Leistungsbeschreibung_v.1.0.md §9.1; 8.7_Mitarbeiterprofile_Barrierefreiheit.md §6, 9, 12].
  - Erfahrung mit Testverfahren (BIK, BITV-Test, WCAG-Checks), assistiven Technologien und barrierefreier Gestaltung [8.7_Mitarbeiterprofile_Barrierefreiheit.md §9, 13].
- **Interoperabilität**: 
  - Kenntnis und Anwendung von verwaltungsspezifischen Standards (XÖV, XZuFi, FIM, OSCI) [1_Leistungsbeschreibung_v.1.0.md §10.2.2, 10.2.3.4].
  - Kenntnisse in internationalen EAM-Frameworks (DoDAF, EIRA, NORA) [8.4_Mitarbeiterprofile_Enterprise-und_Lösungsarchitektur.md §64].
- **Haftung & Versicherung**: 
  - Haftung für einfache Fahrlässigkeit auf mindestens 10 Mio. EUR begrenzt [0_Rahmenvereinbarung.md §13 (1); 260706_Bieterfragen_und_Antworten.md Frage 62, 83, 110].
  - Berufshaftpflichtversicherung mit mindestens 10 Mio. EUR Deckungssumme [0_Rahmenvereinbarung.md §17].
- **Vertraulichkeit**: 
  - Alle vertraulichen Informationen sind dauerhaft zu schützen, auch nach Vertragsende [0_Rahmenvereinbarung.md §14 (2), §15 (3)].
  - Verbot der Nutzung von FITKO-internen E-Mail-Adressen und Meetings für externe Mitarbeiter [14_Hinweise_ANÜ.md Abschnitt 1].
- **Qualität & Nachvollziehbarkeit**: 
  - Konzept muss vollständig, schlüssig, verständlich und fachlich zutreffend sein [10_Bewertungsmatrix_Konzept_v.1.1.md S. 1].
  - Dokumentation gemäß arc42, Nutzung von Docs-as-Code, Architektur-Decision-Records [1_Leistungsbeschreibung_v.1.0.md §10.2.2, 10.2.5.2; 8.4_Mitarbeiterprofile_Enterprise-und_Lösungsarchitektur.md §35, 47, 53, 62].
- **Agilität & Teamkultur**: 
  - Forderung nach agiler, feedbackorientierter Teamkultur, kontinuierlicher Fortbildung und fachübergreifenden Weiterbildungsangeboten [10_Bewertungsmatrix_Konzept_v.1.1.md S. 3].
  - Agile Methoden und interdisziplinäre Teams für alle Software-Engineering-Profile [8.8_Mitarbeiterprofile_Software-Engineering.md §7, 13, 23].

## Widersprüche zwischen Dokumenten
- **Widerspruch in der Definition von „Berufserfahrung“ für Architekten**:
  - Dokument A sagt X: Für Senior Enterprise Architekt:in wird explizit ausgeschlossen, dass Beratungsmandate für Enterprise-Architektur-Teams gezählt werden [8.4_Mitarbeiterprofile_Enterprise-und_Lösungsarchitektur.md Seite 7].
  - Dokument B sagt Y: Für Senior Lösungsarchitekt:in ist keine solche Einschränkung formuliert, obwohl die Rollen vergleichbar sind [8.4_Mitarbeiterprofile_Enterprise-und_Lösungsarchitektur.md Seite 33].
  - Architektonische Konsequenz: Dies führt zu einer unklaren Abgrenzung der Verantwortlichkeiten und könnte bei der Personalzuweisung zu Diskrepanzen führen, da die gleiche Tätigkeit je nach Rolle unterschiedlich gewertet wird.
- **Widerspruch in der Anzahl der erforderlichen Referenzen**:
  - Dokument A sagt X: In Frage 29 wird gefordert, dass mindestens 10 separate Referenzen vorliegen müssen [260706_Bieterfragen_und_Antworten.md Frage 29].
  - Dokument B sagt Y: In Frage 138 wird korrigiert, dass ein Projekt mehrere Teilanforderungen abdecken kann, sodass weniger als 10 separate Referenzen genügen können [260706_Bieterfragen_und_Antworten.md Frage 138].
  - Architektonische Konsequenz: Dies beeinflusst die Planung der Referenzprojekte und die Auswahl der Architekturansätze, da weniger Projekte mit breiterem Umfang akzeptiert werden können.
- **Widerspruch in der Einreichung von Zusatzerklärungen durch Unterauftragnehmer**:
  - Dokument A sagt X: In Frage 86 wird angedeutet, dass eignungsleihende Unterauftragnehmer eigene Zusatzerklärungen einreichen müssen [260706_Bieterfragen_und_Antworten.md Frage 86].
  - Dokument B sagt Y: In Frage 156 wird klargestellt, dass die Umsatz- und Personalressourcen ausschließlich gebündelt in den vom Bewerber eingereichten Zusatzerklärungen auszuweisen sind [260706_Bieterfragen_und_Antworten.md Frage 156].
  - Architektonische Konsequenz: Dies hat direkte Auswirkungen auf die Planung der Ressourcen und Schnittstellen, da die Verantwortlichkeiten und Kapazitätszusagen klar definiert sein müssen, um Haftungsrisiken zu steuern.

## Grauzonen und offene Punkte
- **Unklarheit bei der Definition von „vergleichbaren Leistungen“**: In mehreren Zusatzerklärungen (z. B. 6.1, 6.2, 6.3, 6.4, 6.5, 6.6, 6.7, 6.8) wird der Begriff „vergleichbare Leistungen“ verwendet, ohne eine konkrete Abgrenzung oder Beispiele zu nennen [6.1_Zusatzerklärung_zur_Eignung_Projektmanagement.md Abschnitt I.2; 6.2_Zusatzerklärung_zur_Eignung_Interims-Produktmanagement.md I.2; 6.3_Zusatzerklärung_zur_Eignung_Strategieberatung.md I.2; 6.4_Zusatzerklärung_zur_Eignung_Enterprise-und_Lösungsarchitektur.md I.2; 6.5_Zusatzerklärung_zur_Eignung_Informationssicherheit.md I.2; 6.6_Zusatzerklärung_zur_Eignung_Datenschutz.md I.2; 6.7_Zusatzerklärung_zur_Eignung_Barrierefreiheit_v.1.1.md I.2; 6.8_Zusatzerklärung_zur_Eignung_Software-Engineering.md I.2].
- **Unklarheit bei der Bewertung von Zusatzqualifikationen**: In 8.4_Mitarbeiterprofile_Enterprise-und_Lösungsarchitektur.md wird festgelegt, dass pro Profil maximal 2 (Senior) bzw. 1 (nicht-Senior) Zusatzpunkte erreichbar sind, aber nicht, ob diese Punkte pro Qualifikation oder insgesamt vergeben werden [8.4_Mitarbeiterprofile_Enterprise-und_Lösungsarchitektur.md Seite 4].
- **Unklarheit bei der Definition von „VZÄ“**: In 8.2_Mitarbeiterprofile_Interims-Produktmanagement.md wird die Angabe „mindestens 10 Personen (VZÄ)“ (Junior) bzw. „25 Personen (VZÄ)“ (Senior) verwendet, ohne eine Erklärung, was „VZÄ“ bedeutet und ob es sich um Vollzeitäquivalente oder reine Kopfzahlen handelt [8.2_Mitarbeiterprofile_Interims-Produktmanagement.md Seite 7, 10].
- **Unklarheit bei der Definition von „vergleichbaren Studiengängen“**: In 8.4_Mitarbeiterprofile_Enterprise-und_Lösungsarchitektur.md wird „vergleichbare Studiengänge“ als Alternative zum genannten Hochschulstudium zugelassen, aber nicht definiert, was als „vergleichbar“ gilt [8.4_Mitarbeiterprofile_Enterprise-und_Lösungsarchitektur.md Seite 6, 21, 32, 50].
- **Unklarheit bei der Definition von „frühzeitig“**: In 0_Rahmenvereinbarung.md §5 (2) wird festgelegt, dass der Auftragnehmer bei Überschreitung von 75 % der geschätzten Maximalkosten informieren muss, bei >5 % Überschreitung jedoch „frühzeitig“ hinweisen und die Schätzung aktualisieren muss. Der Begriff „frühzeitig“ ist nicht definiert und lässt Spielraum für Interpretation [0_Rahmenvereinbarung.md §5 (2)].

## Architekturrelevante Prioritäten
Die Architektur des zu erbringenden Systems oder der zu erbringenden Leistung wird maßgeblich von der Forderung nach einer integrierten, vorhabenübergreifenden Steuerung aller acht Disziplinen geprägt. Der Auftragnehmer muss als Generalunternehmer agieren und die Gesamtabwicklung sicherstellen, auch wenn Unterauftragnehmer eingeschaltet werden. Die Architektur muss auf dem Stand der Technik erfolgen, unter Einbeziehung von Frameworks wie TOGAF, ArchiMate, C4-Modell, iSAQB und arc42 sowie Prinzipien wie Security-by-Design, Privacy-by-Design und Zero-Trust. Besonders relevant ist die explizite Forderung nach praktischer Erfahrung in Zero-Trust, Security-by-Design und der Anwendung von Frameworks wie TOGAF und ArchiMate. Zudem wird erwartet, dass Architekten interdisziplinär mit IT-Sicherheit, Recht und Produktmanagement zusammenarbeiten und Architekturentscheidungen dokumentieren (z. B. mit Architecture Decision Records). Die Anforderungen an Senior-Architekten sind hoch: sie müssen mindestens 7 Jahre Berufserfahrung nachweisen, darunter leitende Positionen in großen IT-Landschaften und konkrete Referenzen für komplexe Projekte. Die Haftungs- und Versicherungsanforderungen sowie die strengen Vorgaben zur Vertraulichkeit und IT-Sicherheit (DSGVO, Verschlüsselung) beeinflussen die Architekturwahl und -umsetzung maßgeblich. Zudem ist die Abrechnung auf Stundenbasis mit 6-Minuten-Genauigkeit und ohne gesonderte Gemeinkostenvergütung strukturell relevant für die Kostentransparenz und -steuerung.

## Was das Modell nicht beantworten konnte
Mit der vorliegenden Kondensat-Basis bleiben folgende architekturrelevante Fragen offen:
- **Konkrete Technologien und Plattformen**: Obwohl in 1_Leistungsbeschreibung_v.1.0.md Programmiersprachen und Plattformen wie Java, Python, C#, JavaScript/TypeScript, Rust, Drupal, Moodle, React, Angular, Vue.js, ElasticSearch, OpenSearch, Kafka, RabbitMQ genannt werden, gibt es keine Vorgaben, welche davon konkret verwendet werden müssen oder welche technischen Anforderungen an die Architektur gestellt werden.
- **Detaillierte Rollenprofile**: In mehreren Zusatzerklärungen (z. B. 6.1, 6.2, 6.3, 6.4, 6.5, 6.6, 6.7, 6.8) wird auf die Leistungsbeschreibung verwiesen, um die Anforderungen an die Rollenprofile zu definieren, aber diese sind in den Kondensaten nicht enthalten.
- **Konkrete Architekturansätze**: Obwohl Frameworks und Methoden genannt werden, gibt es keine Vorgaben, welche Architekturansätze (z. B. Microservices, Monolith, Event-Driven) konkret verwendet werden müssen oder welche technischen Anforderungen an die Architektur gestellt werden.
- **Integration von Unterauftragnehmern**: Obwohl in 5_236_Verpflichtungserklaerung_anderer_Unternehmen.md und 4_235_Verzeichnis_Leistungen_Kapazitäten_anderer_Unternehmen.md die Verpflichtungserklärung und das Verzeichnis der Leistungen und Kapazitäten anderer Unternehmen erwähnt werden, gibt es keine konkreten Angaben, welche Teilleistungen extern vergeben werden und welche Schnittstellen, Integrationspunkte oder Abhängigkeiten in der Systemarchitektur zu berücksichtigen sind.
- **Detaillierte Anforderungen an die Dokumentation**: Obwohl in 1_Leistungsbeschreibung_v.1.0.md und 8.4_Mitarbeiterprofile_Enterprise-und_Lösungsarchitektur.md die Dokumentation gemäß arc42 und Docs-as-Code erwähnt wird, gibt es keine konkreten Anforderungen, welche Dokumente erstellt werden müssen oder welche Struktur und Inhalte diese haben müssen.