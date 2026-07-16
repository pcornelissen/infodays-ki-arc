# Antwort auf die Frage:  
**Gibt es in den Vergabeunterlagen Vorgaben zu Technologien, Frameworks, Standards, Programmiersprachen oder Cloud-/Hosting-Anbietern, die die zu erbringende Architektur beeinflussen?**

---

## **Explizite Vorgaben**

Es gibt **keine expliziten Vorgaben** zu konkreten Programmiersprachen, Cloud-/Hosting-Anbietern oder spezifischen technischen Plattformen (z. B. AWS, Azure, GCP, Kubernetes-Provider, Datenbank-Systeme wie PostgreSQL oder MongoDB).

**Begründung:**
- Die Leistungsbeschreibung und Mitarbeiterprofile nennen zwar Methoden und Frameworks (z. B. TOGAF, C4-Modell, Domain-Driven Design), aber **keine konkreten Technologien oder Plattformen** [1_Leistungsbeschreibung_v.1.0.md §10.2.3, 8.8_Mitarbeiterprofile_Software-Engineering.md Seite 8, 13, 23].
- Auch in den Bewertungskriterien, Eignungsanforderungen oder Vertragsbedingungen werden keine spezifischen Technologien oder Anbieter genannt.
- Die Anforderungen sind auf **Methoden, Standards und Werkzeuge** fokussiert, nicht auf Implementierungstechnologien.

---

## **Implizite Vorgaben**

Es gibt **mehrere implizite Vorgaben**, die die Architektur beeinflussen, da sie bestimmte technische oder methodische Richtungen vorgeben, ohne konkrete Technologien zu nennen:

### 1. **Verwendung bestimmter Architekturframeworks und -methoden**
- **TOGAF, ArchiMate, C4-Modell, Domain-Driven Design, iSAQB, arc42** sind explizit für Architekturleistungen vorgeschrieben [1_Leistungsbeschreibung_v.1.0.md §6.2.1, 10.2.2].
- **Implikation**: Die Architektur muss in diesen Frameworks dokumentiert und konzipiert werden, was die Struktur, Sichtweisen und Modellierungsebenen beeinflusst.

### 2. **Verwendung bestimmter Werkzeuge**
- **SonarQube, Snyk, ArchUnit, Jira, GitLab, Docker, Kubernetes, Terraform, OpenTelemetry, ELK-Stack** sind für Software-Engineering und Architekturleistungen vorgesehen [1_Leistungsbeschreibung_v.1.0.md §10.2.2, 10.2.4].
- **Implikation**: Die Architektur muss mit diesen Werkzeugen kompatibel sein — z. B. muss Code analysierbar sein (SonarQube), Containerisierung unterstützt werden (Docker/Kubernetes), Infrastruktur als Code realisiert werden (Terraform), und Monitoring/Logging über OpenTelemetry/ELK erfolgen.

### 3. **Anwendung agiler Methoden und Standards**
- **SCRUM, SAFe, PRINCE2 Agile, V-Modell XT** sind im Projektmanagement vorgeschrieben [1_Leistungsbeschreibung_v.1.0.md §3.1].
- **Implikation**: Die Architektur muss agil erweiterbar, iterativ entwickelbar und in Sprints planbar sein. Dies beeinflusst z. B. die Modularisierung, Schnittstellen-Design und Release-Strategien.

### 4. **Sicherheits- und Compliance-Anforderungen**
- **Security-by-Design, Privacy-by-Design, Zero-Trust-Architekturen** sind verpflichtend [1_Leistungsbeschreibung_v.1.0.md §6.2.1.5].
- **IT-Sicherheitsstandards**: BSI IT-Grundschutz, C5, NIS2 müssen integriert werden [1_Leistungsbeschreibung_v.1.0.md §10.2.2].
- **DSGVO-Konformität**: Daten dürfen nicht in Drittländer übermittelt werden [12_Datenschutzhinweis_FITKO_Vergabe_oeffAuftraege.md Abs. 7].
- **Implikation**: Die Architektur muss Verschlüsselung, Zugriffskontrolle, Datentrennung und Audit-Logging unterstützen. Cloud-Lösungen müssen DSGVO-konform sein (z. B. EU-Regionen, keine US-Anbieter ohne Zusatzvereinbarungen).

### 5. **Interoperabilitätsstandards**
- **XÖV, XZuFi, FIM, OSCI** müssen angewendet werden [1_Leistungsbeschreibung_v.1.0.md §10.2.2].
- **Implikation**: Schnittstellen müssen standardisiert sein, z. B. für E-Government-Integrationen, was die Protokolle, Datenformate und API-Designs beeinflusst.

### 6. **Barrierefreiheitsstandards**
- **EN 301 549, WCAG 2.1/2.2, BITV 2.0, BFSG, BGG** sind verpflichtend [1_Leistungsbeschreibung_v.1.0.md §9.1, 260706_Bieterfragen_und_Antworten.md Frage 132, 145].
- **Implikation**: Die Architektur muss barrierefreie UI/UX-Designs unterstützen, z. B. durch semantische HTML, ARIA-Attribute, Kontrastanforderungen — auch wenn keine konkreten Frameworks (z. B. React mit ARIA) genannt werden.

### 7. **Cloud-Native und skalierbare Architekturen**
- **Konzeption skalierbarer verteilter Softwarearchitekturen und Cloud-Native-Architekturen** ist Teil des Software-Engineering-Profils [1_Leistungsbeschreibung_v.1.0.md §10.2.2].
- **Implikation**: Die Architektur muss Microservices, Containerisierung, Orchestrierung (Kubernetes), CI/CD und Infrastructure as Code unterstützen — auch wenn keine konkreten Cloud-Anbieter genannt werden.

### 8. **DevSecOps als bevorzugter Regelbetrieb**
- Im Software-Engineering-Profil wird **DevSecOps als bevorzugter Regelbetrieb** genannt [8.8_Mitarbeiterprofile_Software-Engineering.md Seite 14].
- **Implikation**: Die Architektur muss Sicherheit in den Entwicklungsprozess integrieren (z. B. SAST/DAST, IaC-Security, Secrets-Management), was die Tooling- und Pipeline-Architektur beeinflusst.

### 9. **Dokumentation nach arc42 und Architecture Decision Records**
- **arc42** und **Architecture Decision Records (ADRs)** sind verpflichtend [1_Leistungsbeschreibung_v.1.0.md §6.2.1, 10.2.2].
- **Implikation**: Die Architektur muss dokumentiert werden — nicht nur technisch, sondern auch mit Entscheidungslogik, was die Architekturkommunikation und -nachvollziehbarkeit beeinflusst.

---

## **Zusammenfassung**

| Kategorie             | Vorgaben vorhanden? | Begründung / Quellen                                                                 |
|-----------------------|---------------------|--------------------------------------------------------------------------------------|
| **Explizite Vorgaben** | ❌ Nein             | Keine konkreten Programmiersprachen, Cloud-Anbieter oder Plattformen genannt.        |
| **Implizite Vorgaben** | ✅ Ja               | Frameworks, Werkzeuge, Sicherheitsstandards, Interoperabilität, Cloud-Native, DevSecOps, Dokumentation beeinflussen die Architektur indirekt. |

---

## **Offene Punkte / Unklarheiten**

- **Keine konkreten Technologien oder Anbieter** sind vorgegeben — z. B. keine Vorgabe zu Java vs. Python, AWS vs. Azure, PostgreSQL vs. MongoDB.
- **Keine konkreten Schnittstellen oder Integrationspunkte** zwischen den Disziplinen sind definiert — obwohl eine integrierte Gesamtleistung gefordert ist [1_Leistungsbeschreibung_v.1.0.md §2.1, Allgemeine_Vergabedingungen_v.1.1.md §1.3].
- **Keine konkreten technischen Spezifikationen** für Skalierbarkeit, Verfügbarkeit, Datenarchitektur, Sicherheitsarchitektur, UI/UX, Betriebsarchitektur oder Testarchitektur sind definiert — obwohl allgemeine Anforderungen bestehen [siehe „Was das Modell nicht beantworten konnte“ im Kontext].

---

## **Fazit**

Die Architektur wird **nicht durch konkrete Technologien oder Anbieter vorgegeben**, sondern durch **Methoden, Standards, Werkzeuge und Compliance-Anforderungen** geprägt. Der Auftragnehmer hat Freiheit bei der Technologieauswahl, muss aber sicherstellen, dass die gewählte Architektur mit den vorgegebenen Frameworks, Werkzeugen und Standards kompatibel ist — insbesondere in Bezug auf Sicherheit, Interoperabilität, Agilität und Dokumentation.

**Quellenverweise:**
- [1_Leistungsbeschreibung_v.1.0.md §6.2.1, 10.2.2, 10.2.3, 10.2.4]
- [8.8_Mitarbeiterprofile_Software-Engineering.md Seite 8, 13, 14, 23]
- [12_Datenschutzhinweis_FITKO_Vergabe_oeffAuftraege.md Abs. 7]
- [260706_Bieterfragen_und_Antworten.md Frage 132, 145]
- [Was das Modell nicht beantworten konnte] – explizit genannt im Kontext

--- 

> **Hinweis**: Für eine vollständige Architekturplanung müssten diese offenen Punkte durch direkte Abstimmung mit der FITKO geklärt werden.