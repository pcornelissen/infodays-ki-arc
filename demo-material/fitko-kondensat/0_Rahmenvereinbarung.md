# 0_Rahmenvereinbarung.pdf

## Rolle im Verfahren
Dieses Dokument ist eine Rahmenvereinbarung zwischen der FITKO (Auftraggeberin) und einem noch nicht benannten Auftragnehmer („[XXX]“), die als rechtliche Grundlage für zukünftige Einzelabrufe im Bereich „integrierte Projekt- und Produktberatung“ dient. Es wird erst durch Zuschlag auf ein Angebot wirksam und regelt Rahmenbedingungen, Leistungen, Vergütung, Haftung und Vertragslaufzeit.

## Kernaussagen (architekturrelevant)
- Der Vertragsgegenstand umfasst integrierte Projekt- und Produktberatung gemäß Leistungsbeschreibung (Anlage 1) und ist nicht auf Rechtsdienstleistungen ausgerichtet [§ 1 (1), (2)].
- Leistungen werden über Einzelabrufe abgerufen, deren konkreter Umfang, Termine und Kosten jeweils separat vereinbart werden [§ 1 (3), § 5 (1)].
- Der Auftragnehmer muss über das gesamte Vertragsverhältnis hinweg qualifiziertes, kontinuierlich einsetzbares Personal bereitstellen, das den Anforderungen der Leistungsbeschreibung entspricht [§ 6 (1), (2)].
- Der Auftragnehmer haftet für die ordnungsgemäße Gesamtabwicklung, auch wenn Unterauftragnehmer eingeschaltet werden [§ 8 (3)].
- Alle Arbeitsergebnisse, insbesondere Gutachten, gehen in das ausschließliche Nutzungsrecht der Auftraggeberin über; Methoden und Werkzeuge des Auftragnehmers bleiben bei ihm, jedoch mit nicht-ausschließlichem Nutzungsrecht für die Auftraggeberin [§ 16].

## Technologische, methodische oder standardbezogene Vorgaben
- Keine expliziten Vorgaben.

## Nicht-funktionale Anforderungen
- **Verfügbarkeit**: Der Auftragnehmer muss montags bis freitags (9–17 Uhr) erreichbar sein, ggf. durch Stellvertretung [§ 7].
- **Datenschutz & IT-Sicherheit**: Der Auftragnehmer muss die DSGVO einhalten und technische/organisatorische Maßnahmen entsprechend dem Stand der Technik sicherstellen [§ 14 (1)].
- **Verschlüsselung**: Elektronische Kommunikation muss verschlüsselbar sein; konkrete Technik wird nach Vertragsabschluss vereinbart [§ 15 (12)].
- **Vertraulichkeit**: Alle vertraulichen Informationen sind dauerhaft zu schützen, auch nach Vertragsende [§ 14 (2), § 15 (3)].
- **Haftung**: Haftung für einfache Fahrlässigkeit ist auf mindestens 10 Mio. EUR begrenzt [§ 13 (1)].
- **Versicherung**: Berufshaftpflichtversicherung mit mindestens 10 Mio. EUR Deckungssumme ist vorgeschrieben [§ 17].

## Verweise auf andere Anlagen / Dokumente
- **Anlage 1 (Leistungsbeschreibung)**: Enthält konkrete Anforderungen an Leistungen und Personal; ist vertragsbestandteil [§ 1 (1), § 2, § 6 (1)].
- **Anlage 2 (Preisblatt)**: Teil der Vertragsgrundlagen [§ 2].
- **Anlage 14 (Hinweise zur Arbeitnehmerüberlassung)**: Vertragsbestandteil, relevant für sozialversicherungsrechtliche Stellung des Personals [§ 6 (5)].
- **Bieterfragen und -Antworten**: Teil der Vertragsgrundlagen [§ 2].
- **Einzelabrufmuster**: Wird nach Zuschlag abgestimmt und dient als Grundlage für Einzelabrufe [§ 5 (3) c].

## Unklarheiten oder Widersprüche innerhalb des Dokuments
- **Unklarheit**: In § 5 (2) wird festgelegt, dass der Auftragnehmer bei Überschreitung von 75 % der geschätzten Maximalkosten informieren muss, bei >5 % Überschreitung jedoch „frühzeitig“ hinweisen und die Schätzung aktualisieren muss. Der Begriff „frühzeitig“ ist nicht definiert und lässt Spielraum für Interpretation [§ 5 (2)].
- **Unklarheit**: In § 10 (11) wird der Auftragnehmer verpflichtet, den Bearbeitungsstand bei Erreichen von 50 %, 75 % und 100 % einer Obergrenze mitzuteilen – jedoch ist unklar, ob dies auch für die Gesamtvergütungsobergrenze (§ 10 (10)) gilt, da der Satz unvollständig bleibt [§ 10 (11)].
- **Widerspruch**: § 14 (5) und § 15 (5) enthalten ähnliche Ausnahmen von der Vertraulichkeitspflicht, jedoch mit unterschiedlichen Formulierungen (z. B. „offenkundig“ vs. „bekannt“), was zu Interpretationsspielraum führen kann.

## Für die Architekturarbeit besonders relevant
Die Rahmenvereinbarung legt keine technischen oder architektonischen Standards fest, definiert aber klare Rahmenbedingungen für die Zusammenarbeit: Der Auftragnehmer muss kontinuierlich qualifiziertes Personal bereitstellen, mit anderen Partnern kooperieren und alle Arbeitsergebnisse an die Auftraggeberin übertragen. Die Haftungs- und Versicherungsanforderungen sowie die strengen Vorgaben zur Vertraulichkeit und IT-Sicherheit (DSGVO, Verschlüsselung) beeinflussen die Architekturwahl und -umsetzung maßgeblich. Zudem ist die Abrechnung auf Stundenbasis mit 6-Minuten-Genauigkeit und ohne gesonderte Gemeinkostenvergütung strukturell relevant für die Kostentransparenz und -steuerung.