# 12_Datenschutzhinweis_FITKO_Vergabe_oeffAuftraege.pdf

## Rolle im Verfahren
Dieses Dokument ist ein datenschutzrechtlicher Hinweis im Rahmen der Ausschreibung und Vergabe öffentlicher Aufträge durch die FITKO. Es informiert Bieter über die Verarbeitung ihrer personenbezogenen Daten gemäß DSGVO und ergänzenden nationalen Gesetzen und dient der Transparenz- und Informationspflicht des Verantwortlichen.

## Kernaussagen (architekturrelevant)
- Die FITKO verarbeitet personenbezogene Daten im Rahmen von Vergabeverfahren zur Eignungsprüfung, Dokumentation und Vertragsabwicklung [Abs. 4].
- Daten stammen aus Bewerbungsunterlagen, öffentlichen Registern und Dritten (z. B. Auskunfteien) [Abs. 5].
- Weitergabe erfolgt nur bei gesetzlicher Zulässigkeit oder Einwilligung, u. a. an unterlegene Bieter, Vergabekammer, Gerichte oder externe Berater [Abs. 6].
- Keine Übermittlung an Drittländer; Daten verbleiben im Geltungsbereich der DSGVO [Abs. 7].
- Speicherung erfolgt gemäß Aktenordnung und Aufbewahrungsfristen [Abs. 8].

## Technologische, methodische oder standardbezogene Vorgaben
Keine expliziten Vorgaben.

## Nicht-funktionale Anforderungen
- **Datenschutz & Compliance**: Verarbeitung nur auf Grundlage von Art. 6 Abs. 1 lit. c, e und b DSGVO sowie nationalen Vergabegesetzen [Abs. 4].
- **Datenintegrität & -sicherheit**: Externe Dritte werden auf Einhaltung des Datengeheimnisses verpflichtet [Abs. 6].
- **Datenminimierung**: Nur erforderliche Daten werden verarbeitet, z. B. Kontaktdaten, Qualifikationsdaten, Referenzen [Abs. 5].
- **Recht auf Löschung/Einschränkung**: Betroffene können Löschung oder Einschränkung verlangen, sofern keine gesetzliche Aufbewahrungspflicht besteht [Abs. 9].

## Verweise auf andere Anlagen / Dokumente
- Verweis auf allgemeine Datenschutzerklärung unter https://www.fitko.de/datenschutz/ – diese gilt nur für unterschwellige Aufträge, nicht für Vergabeverfahren [Abs. 1].
- Verweis auf Hessischen Vergabeerlass, VgV, UVgO, KonzVgV, HVTG, LHO, GWB, HDSIG, BDSG, IT-Staatsvertrag [Abs. 4].
- Verweis auf Hessischen Beauftragten für Datenschutz und Informationsfreiheit als Beschwerdestelle [Abs. 9].

## Unklarheiten oder Widersprüche innerhalb des Dokuments
- Abs. 9 erwähnt das „Recht auf Widerspruch gegen die Verarbeitung“ (Art. 21 DSGVO) und verweist auf Profiling und Direktwerbung – im Kontext von Vergabeverfahren ist unklar, ob und wie Profiling oder Direktwerbung relevant sind [Abs. 9].
- Abs. 5 nennt „IP-Adresse des verwendeten Geräts“ als verarbeitete Daten, ohne zu klären, ob und wie diese im Vergabeverfahren technisch erfasst und genutzt wird [Abs. 5].

## Für die Architekturarbeit besonders relevant
Dieses Dokument legt fest, welche personenbezogenen Daten im Vergabeverfahren verarbeitet werden dürfen und unter welchen rechtlichen Rahmenbedingungen. Für die Architektur bedeutet dies, dass Systeme zur Vergabe und Eignungsprüfung nur die genannten Daten erfassen und speichern dürfen, und dass Schnittstellen zu externen Stellen (z. B. Vergabekammer, Register) datenschutzkonform gestaltet sein müssen. Zudem ist sicherzustellen, dass externe Berater über Datengeheimnis verpflichtet sind und keine Daten an Drittländer übermittelt werden. Die Speicherdauer ist an gesetzliche Aufbewahrungsfristen gebunden – dies muss in der Datenhaltungsarchitektur berücksichtigt werden.