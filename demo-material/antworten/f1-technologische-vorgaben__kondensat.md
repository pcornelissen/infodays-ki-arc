### **Explizite Vorgaben**

Es gibt **keine expliziten Vorgaben** zu Technologien, Frameworks, Standards, Programmiersprachen oder Cloud-/Hosting-Anbietern, die die zu erbringende Architektur beeinflussen.

- In keiner der analysierten Dokumente (Rahmenvereinbarung, Leistungsbeschreibung, Bewertungsmatrix, Mitarbeiterprofile, Zusatzerklärungen, Allgemeine Vergabebedingungen etc.) wird eine konkrete Technologie, ein bestimmtes Framework, eine vorgeschriebene Programmiersprache oder ein spezifischer Cloud-/Hosting-Anbieter explizit gefordert.
- Auch in den technologischen oder methodischen Abschnitten der Dokumente (z. B. in der Leistungsbeschreibung oder den Mitarbeiterprofilen) werden zwar Methoden und Werkzeuge genannt, aber diese sind als **empfohlen oder üblich**, nicht als **verpflichtend** formuliert.

---

### **Implizite Vorgaben**

Trotz fehlender expliziter Vorgaben ergeben sich aus dem Kontext **mehrere implizite Vorgaben**, die die Architektur beeinflussen:

#### 1. **Verwendung bestimmter Architekturframeworks und -methoden**
- Die **Leistungsbeschreibung (1_Leistungsbeschreibung_v.1.0.md)** fordert explizit, dass Architekturleistungen auf dem Stand der Technik erfolgen müssen und **etablierte Methoden und Frameworks** wie **ArchiMate, TOGAF, C4-Modell, arc42, iSAQB, UML, BPMN, ATAM, TARA, DCAR, LASR** einbezogen werden müssen [6.1, 6.2.1].
- Im **Mitarbeiterprofil für Enterprise- und Lösungsarchitektur (8.4_Mitarbeiterprofile_Enterprise-und_Lösungsarchitektur.md)** werden diese Frameworks und Modellierungssprachen als Muss-Kriterien für die Qualifikation der Architekten genannt [Seite 9, 19, 35, 43, 52, 59].
- **Implikation**: Die Architektur muss mit diesen Frameworks und Modellen kompatibel sein, da sie für die Dokumentation, Modellierung und Bewertung der Architekturleistungen verbindlich sind.

#### 2. **Anwendung bestimmter Sicherheits- und Compliance-Standards**
- Die **Leistungsbeschreibung** verlangt, dass alle Architekturprofile **Erfahrung in Security-by-Design, Privacy-by-Design und Zero-Trust-Architekturen** nachweisen müssen [6.2.1.5].
- Zudem müssen **IT-Sicherheitsstandards wie BSI IT-Grundschutz, C5 und NIS2** angewendet werden [10.2.2].
- Im **Mitarbeiterprofil für Informationssicherheit (8.5_Mitarbeiterprofile_Informationssicherheit.md)** sind Zertifikate wie **BSI Grundschutz, ISO 27001, CISSP, CISM** verpflichtend [Seite 6, 9].
- **Implikation**: Die Architektur muss Sicherheitsprinzipien wie Zero-Trust und Privacy-by-Design von Anfang an integrieren und mit den genannten Standards kompatibel sein.

#### 3. **Verwendung bestimmter Werkzeuge und Technologien im Software-Engineering**
- Die **Leistungsbeschreibung** nennt Werkzeuge wie **SonarQube, Snyk, ArchUnit, Jira, GitLab, Docker, Kubernetes, Terraform, OpenTelemetry, ELK-Stack** als Teil der Software-Engineering- und Architekturleistungen [10.2.2, 10.2.4].
- Im **Mitarbeiterprofil für Software-Engineering (8.8_Mitarbeiterprofile_Software-Engineering.md)** ist die Verwendung von **Jira oder GitLab** als Muss-Kriterium genannt [Seite 8, 13, 23].
- **Implikation**: Die Architektur muss mit diesen Werkzeugen interoperabel sein, insbesondere im Bereich Continuous Integration/Continuous Deployment (CI/CD), Monitoring und Infrastrukturautomatisierung.

#### 4. **Anwendung von Interoperabilitätsstandards**
- Die **Leistungsbeschreibung** fordert Kenntnis und Anwendung von **Industrie- und verwaltungsspezifischen Interoperabilitätsstandards** wie **XÖV, XZuFi, FIM, OSCI** [10.2.2].
- **Implikation**: Die Architektur muss Schnittstellen und Datenformate bereitstellen, die mit diesen Standards kompatibel sind, um eine Integration in bestehende öffentliche IT-Systeme zu ermöglichen.

#### 5. **Barrierefreiheit nach WCAG und BITV**
- Die **Leistungsbeschreibung** verlangt, dass digitale Produkte und Dokumente **EN 301 549, WCAG, BITV 2.0, BFSG, BGG und landesrechtliche Vorgaben** einhalten müssen [9.1].
- Im **Mitarbeiterprofil für Barrierefreiheit (8.7_Mitarbeiterprofile_Barrierefreiheit.md)** sind Kenntnisse der **rechtlichen Vorgaben, Standards und Testverfahren (WCAG, BITV-Test)** verpflichtend [Seite 6, 9, 12].
- **Implikation**: Die Architektur muss barrierefreie Gestaltung und Prüfung von Web- und Softwarelösungen von Anfang an berücksichtigen.

#### 6. **Agile Methoden und DevSecOps**
- Die **Leistungsbeschreibung** fordert Kenntnisse in **agilen Methoden (SCRUM, SAFe, PRINCE2 Agile)** und **DevOps/DevSecOps** [10.2.2].
- Im **Mitarbeiterprofil für Software-Engineering** ist **DevSecOps** im Lead-Profil als bevorzugter Regelbetrieb genannt [Seite 14].
- **Implikation**: Die Architektur muss agil entwickelbar und betreibbar sein, mit integrierter Sicherheit (DevSecOps) und kontinuierlicher Lieferung.

#### 7. **Verwendung von Architektur-Dokumentationsstandards**
- Die **Leistungsbeschreibung** fordert die **Konzeption und Dokumentation gemäß arc42** und die Nutzung von **Architecture Decision Records (ADR)** [6.2.1, 10.2.2].
- Im **Mitarbeiterprofil für Enterprise- und Lösungsarchitektur** ist die Dokumentation nach **arc42 und ADR** verpflichtend [Seite 35, 47, 53, 62].
- **Implikation**: Die Architektur muss in einem standardisierten Format dokumentiert werden, das für die Nachvollziehbarkeit und Weiterentwicklung geeignet ist.

#### 8. **Einschränkungen bei der Nutzung von FITKO-Infrastruktur**
- Die **Anlage 14_Hinweise_ANÜ** verbietet die Nutzung von **FITKO-internen E-Mail-Adressen und Meetings** sowie die **Nutzung von FITKO-Arbeitsmitteln** (außer bei berechtigten Sicherheits- oder Projektbedingungen) [Abschnitt 1].
- **Implikation**: Die Architektur muss unabhängig von FITKO-Infrastruktur betrieben werden können, mit eigenen Arbeitsmitteln und externen Kommunikationskanälen.

#### 9. **Verwendung von X-Rechnungen und maschinell lesbaren Buchungskreisen**
- Die **Anlage 11_Wichtige_Hinweise_zu_Rechnungen_und_Zahlungen_an_die_FITKO** fordert, dass Rechnungen **maschinell lesbare Buchungskreise (BKR 5010) und Dienststellen (DST 2019)** enthalten müssen [S. 1].
- Die Verwendung von **X-Rechnungen** ist optional, aber empfohlen, mit der Leitweg-ID **06-50102019-97** [S. 2].
- **Implikation**: Die Architektur muss Schnittstellen bereitstellen, die mit diesen Rechnungsstandards kompatibel sind, um eine fehlerfreie maschinelle Verarbeitung zu gewährleisten.

---

### **Zusammenfassung**

- **Explizite Vorgaben**: Keine.
- **Implizite Vorgaben**: Mehrere, die sich aus den geforderten Methoden, Frameworks, Standards, Werkzeugen und Compliance-Anforderungen ergeben. Diese beeinflussen die Architektur in Bezug auf:
  - **Methodik und Dokumentation** (TOGAF, ArchiMate, arc42, ADR)
  - **Sicherheit und Compliance** (Zero-Trust, BSI, C5, NIS2)
  - **Technologie und Werkzeuge** (Docker, Kubernetes, Jira, GitLab)
  - **Interoperabilität** (XÖV, XZuFi, FIM, OSCI)
  - **Barrierefreiheit** (WCAG, BITV)
  - **Agilität und Betrieb** (DevSecOps, agile Methoden)
  - **Infrastruktur und Kommunikation** (eigene Arbeitsmittel, externe Kommunikation)
  - **Rechnungsstellung** (maschinell lesbare Buchungskreise, X-Rechnungen)

Diese impliziten Vorgaben sind für die Architekturarbeit **verbindlich**, da sie in den Leistungsbeschreibungen, Mitarbeiterprofilen und Zusatzerklärungen als Muss-Kriterien oder Qualifikationsanforderungen genannt werden.