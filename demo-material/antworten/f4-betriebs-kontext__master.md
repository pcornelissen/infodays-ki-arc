# Antwort auf die Frage zum Betriebs- und Deployment-Modell

## 1. On-Premise, Cloud, Hybrid, souverän gehostet, Bundes-Cloud, kein Betriebsanteil?

**Keine explizite Festlegung auf ein bestimmtes Betriebs- oder Deployment-Modell.**

- Es wird **kein spezifisches Hosting-Modell** (On-Premise, Cloud, Hybrid, souverän gehostet, Bundes-Cloud) vorgeschrieben oder impliziert.
- Der Auftragnehmer ist **nicht verpflichtet, Betriebsleistungen zu erbringen** — die Leistung umfasst „integrierte Projekt- und Produktberatung“ mit Schwerpunkt auf Architektur, Software-Engineering und Steuerung [Allgemeine_Vergabedingungen_v.1.1.md §1.3].
- Die Disziplin „Software-Engineering, Softwareentwicklung und Betriebssteuerung“ ist zwar mit 30 % gewichtet [Allgemeine_Vergabedingungen_v.1.1.md §4.6], aber der Begriff „Betriebssteuerung“ bezieht sich hier auf **Steuerung und Koordination** der Betriebsaspekte, nicht auf die physische Betriebsführung.
- Es wird **keine Infrastruktur** (z. B. Server, Cloud-Plattformen) vom Auftraggeber bereitgestellt — der Auftragnehmer muss eigene Arbeitsmittel und Software bereitstellen [14_Hinweise_ANÜ.md Abschnitt 1].

> **Quelle**: Allgemeine_Vergabedingungen_v.1.1.md §1.3; 0_Rahmenvereinbarung.md §1 (3); 14_Hinweise_ANÜ.md Abschnitt 1; Allgemeine_Vergabedingungen_v.1.1.md §4.6.

---

## 2. Wer betreibt was (Auftraggeber, Auftragnehmer, Dritter)?

**Der Auftragnehmer betreibt keine Infrastruktur — es gibt keine Betriebsverantwortung im technischen Sinne.**

- Der Auftragnehmer schuldet **keine Betriebsleistung** im Sinne von Hosting, Monitoring oder Betrieb von Systemen.
- Die Leistung ist **beratend und architektonisch** ausgerichtet — der Auftragnehmer koordiniert und steuert, aber betreibt nicht [Allgemeine_Vergabedingungen_v.1.1.md §1.3].
- Der Auftraggeber (FITKO) betreibt seine eigene Infrastruktur — der Auftragnehmer arbeitet **extern und unabhängig** davon [14_Hinweise_ANÜ.md Abschnitt 1].
- Es gibt **keine Vorgabe**, dass Dritte (z. B. Cloud-Anbieter) beteiligt sein müssen — die Wahl der Technologie und Plattform liegt im Ermessen des Auftragnehmers, solange die Sicherheits- und Compliance-Anforderungen eingehalten werden.

> **Quelle**: Allgemeine_Vergabedingungen_v.1.1.md §1.3; 14_Hinweise_ANÜ.md Abschnitt 1; 1_Leistungsbeschreibung_v.1.0.md §10.2.2.

---

## 3. Geografische, jurisdiktionelle oder souveränitätsbezogene Anforderungen

**Daten dürfen nicht in Drittländer übermittelt werden — Verbleib im Geltungsbereich der DSGVO ist verpflichtend.**

- Alle personenbezogenen Daten müssen **im Geltungsbereich der DSGVO verbleiben** — keine Übermittlung an Drittländer ist zulässig [12_Datenschutzhinweis_FITKO_Vergabe_oeffAuftraege.md Abs. 7].
- Es gibt **keine explizite Forderung nach souveränem Hosting** (z. B. „deutsche Cloud“ oder „Bundes-Cloud“), aber die DSGVO-Konformität impliziert, dass die Datenverarbeitung in der EU stattfinden muss.
- Keine weiteren geografischen oder jurisdiktionellen Einschränkungen (z. B. Standort des Rechenzentrums) sind im Dokument genannt.

> **Quelle**: 12_Datenschutzhinweis_FITKO_Vergabe_oeffAuftraege.md Abs. 7.

---

## 4. Sicherheits- oder Compliance-Anforderungen (BSI-Grundschutz, C5, DSGVO, Sanktionsrecht)

**Mehrere Sicherheits- und Compliance-Anforderungen sind explizit vorgegeben:**

- **BSI-Grundschutz**: Muss in der Architektur und im Software-Engineering berücksichtigt werden [1_Leistungsbeschreibung_v.1.0.md §10.2.2].
- **C5**: Muss in der Architektur und im Software-Engineering berücksichtigt werden [1_Leistungsbeschreibung_v.1.0.md §10.2.2].
- **NIS2**: Muss in der Architektur und im Software-Engineering berücksichtigt werden [1_Leistungsbeschreibung_v.1.0.md §10.2.2].
- **DSGVO**: Muss eingehalten werden — technische und organisatorische Maßnahmen entsprechend dem Stand der Technik sind sicherzustellen [0_Rahmenvereinbarung.md §14 (1); 12_Datenschutzhinweis_FITKO_Vergabe_oeffAuftraege.md Abs. 7].
- **Sanktionsrecht**: Alle Bewerber und Unterauftragnehmer mit mehr als 10 % Auftragswert müssen eine Erklärung zu den EU-Russlandsanktionen abgeben [3_Formularkonvolut_FITKO_v.1.1.md Formular 4, S. 1].

> **Quelle**: 1_Leistungsbeschreibung_v.1.0.md §10.2.2; 0_Rahmenvereinbarung.md §14 (1); 12_Datenschutzhinweis_FITKO_Vergabe_oeffAuftraege.md Abs. 7; 3_Formularkonvolut_FITKO_v.1.1.md Formular 4, S. 1.

---

## Zusammenfassung

| Aspekt | Aussage | Quelle |
|--------|---------|--------|
| **Betriebsmodell** | Kein spezifisches Modell vorgegeben — keine Betriebsverantwortung des Auftragnehmers | Allgemeine_Vergabedingungen_v.1.1.md §1.3; 14_Hinweise_ANÜ.md Abschnitt 1 |
| **Wer betreibt was** | Auftragnehmer betreibt keine Infrastruktur — Auftraggeber betreibt eigene Systeme | 14_Hinweise_ANÜ.md Abschnitt 1; 0_Rahmenvereinbarung.md §1 (3) |
| **Geografische Anforderungen** | Daten dürfen nicht in Drittländer übermittelt werden — Verbleib im Geltungsbereich der DSGVO | 12_Datenschutzhinweis_FITKO_Vergabe_oeffAuftraege.md Abs. 7 |
| **Sicherheits-/Compliance-Anforderungen** | BSI-Grundschutz, C5, NIS2, DSGVO, Sanktionskonformität sind verpflichtend | 1_Leistungsbeschreibung_v.1.0.md §10.2.2; 0_Rahmenvereinbarung.md §14 (1); 3_Formularkonvolut_FITKO_v.1.1.md Formular 4 |

---

## Nicht beantwortbare Aspekte

- **Konkrete Cloud-Anbieter oder Plattformen** (z. B. AWS, Azure, Google Cloud) sind **nicht vorgegeben** — dies bleibt im Ermessen des Auftragnehmers, solange die Compliance-Anforderungen eingehalten werden.
- **Hybrid- oder On-Premise-Modelle** sind **nicht explizit ausgeschlossen oder vorgeschrieben** — die Ausschreibung legt keine technische Infrastruktur fest.
- **Bundes-Cloud oder souveräne Hosting-Anforderungen** sind **nicht genannt** — die DSGVO-Konformität impliziert EU-Hosting, aber keine spezifische Souveränitätsanforderung.

> **Quelle**: Was das Modell nicht beantworten konnte — keine konkreten technischen oder architektonischen Standards (z. B. Cloud-Anbieter) sind vorgegeben [1_Leistungsbeschreibung_v.1.0.md §10.2.3, 8.8_Mitarbeiterprofile_Software-Engineering.md Seite 8, 13, 23].

---

## Fazit

Die Ausschreibung **impliziert kein spezifisches Betriebs- oder Deployment-Modell**. Der Auftragnehmer ist **nicht für den Betrieb von Systemen verantwortlich**, sondern für die **Architektur, Steuerung und Beratung**. Die **Sicherheits- und Compliance-Anforderungen** (BSI, C5, DSGVO, Sanktionen) sind streng vorgegeben, aber **keine konkreten technischen Plattformen oder Hosting-Modelle** sind festgelegt. Der Fokus liegt auf **beratender und architektonischer Leistung**, nicht auf Betrieb oder Infrastruktur.