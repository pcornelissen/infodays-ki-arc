# 14_Hinweise_ANÜ.pdf

## Rolle im Verfahren
Dieses Dokument ist eine vertragliche Anlage, die organisatorische Maßnahmen zur Vermeidung einer faktischen Eingliederung externer Mitarbeiter in die Organisationsstrukturen der Auftraggeberin (FITKO) festlegt. Es dient der klaren Trennung zwischen internem und externem Personal im Rahmen der Vertragsdurchführung.

## Kernaussagen (architekturrelevant)
- Externe Mitarbeiter dürfen keine FITKO-internen E-Mail-Adressen nutzen und keine internen Meetings besuchen. [Abschnitt 1]
- Externe Mitarbeiter müssen eigene Arbeitsmittel (Laptop, Software etc.) verwenden, Nutzung von FITKO-Mitteln ist nur unter strengen Sicherheits- oder Projektbedingungen erlaubt. [Abschnitt 1]
- Externe dürfen keine Aufgaben des Tagesgeschäfts übernehmen, es sei denn, dies ist explizit in der Leistungsbeschreibung vorgesehen. [Abschnitt 1]

## Technologische, methodische oder standardbezogene Vorgaben
- Keine expliziten Vorgaben.

## Nicht-funktionale Anforderungen
- Kategorie: Sicherheit – Nutzung von FITKO-internen Arbeitsmitteln nur bei berechtigten Sicherheits- oder Projektinteressen. [Abschnitt 1]
- Kategorie: Compliance – Verbot der Vertretung interner Mitarbeiter, keine Unterzeichnung von Schreiben als FITKO-Vertreter. [Abschnitt 1]

## Verweise auf andere Anlagen / Dokumente
- Verweis auf Leistungsbeschreibung: Aufgaben des Tagesgeschäfts dürfen nur übernommen werden, wenn sie konkret in der Leistungsbeschreibung umfasst sind. [Abschnitt 1]

## Unklarheiten oder Widersprüche innerhalb des Dokuments
- Keine erkannt.

## Für die Architekturarbeit besonders relevant
Die Vorgabe, dass externe Mitarbeiter eigene Arbeitsmittel (inkl. Software) nutzen müssen, hat direkte Auswirkungen auf die Architektur: Es muss sichergestellt werden, dass die Softwarelösungen plattformübergreifend und unabhängig von FITKO-Infrastruktur betrieben werden können. Zudem schränkt das Verbot der Nutzung interner E-Mail-Adressen und Meetings die Integration in bestehende Kommunikations- und Kollaborationsinfrastrukturen ein – dies erfordert klare Schnittstellen und ggf. externe Kommunikationskanäle. Die strikte Trennung zwischen internem und externem Personal muss auch in der Systemarchitektur berücksichtigt werden, z. B. durch getrennte Zugriffsrechte und Identitätsmanagement.