# 11_Wichtige_Hinweise_zu_Rechnungen_und_Zahlungen_an_die_FITKO.pdf

## Rolle im Verfahren
Dieses Dokument enthält verbindliche Hinweise zur korrekten Erstellung, Adressierung und Übermittlung von Rechnungen an die FITKO sowie zur Durchführung von Zahlungen und Rückerstattungen. Es dient der Sicherstellung einer fehlerfreien und maschinellen Verarbeitung im Rahmen des Finanz- und Rechnungswesens.

## Kernaussagen (architekturrelevant)
- Rechnungen an FITKO müssen den Buchungskreis „BKR 5010“ und die Dienststelle „DST 2019“ maschinell lesbar enthalten, andernfalls drohen Ablehnungen oder Fehlbuchungen [S. 1].
- X-Rechnungen sind für FITKO nicht verpflichtend, aber möglich; bei Nutzung ist die Leitweg-ID „06-50102019-97“ zu verwenden [S. 1–2].
- E-Rechnungen müssen per E-Mail an E-Rechnung@ekrw.hessen.de gesendet werden, wobei pro E-Mail nur eine Rechnung und max. 22 MB Dateigröße erlaubt sind [S. 2].
- Alternativ können X-Rechnungen direkt über das E-Rechnungs-Portal des Landes Hessen eingereicht werden, ohne die Einschränkungen der E-Mail-Übermittlung [S. 2].

## Technologische, methodische oder standardbezogene Vorgaben
- Verwendung des X-Standards für E-Rechnungen ist optional, aber empfohlen [S. 1].
- Leitweg-ID-Format: „06-[Buchungskreis][Dienststelle]-[Prüfziffer]“ mit spezifischer ID für FITKO: „06-50102019-97“ [S. 2].
- E-Mail-Übermittlung mit strikter Begrenzung auf eine Rechnung pro E-Mail und max. 22 MB Dateigröße [S. 2].
- Alternativer Upload über das E-Rechnungs-Portal des Landes Hessen ohne Dateigrößen- oder Anzahlbeschränkung [S. 2].

## Nicht-funktionale Anforderungen
- Zuverlässigkeit: Fehlende oder falsche Buchungskreis-/Dienststellenangaben führen zu Rechnungsablehnungen und Mahnläufen [S. 1].
- Interoperabilität: Maschinelle Lesbarkeit der Buchungskreis-/Dienststellenangaben ist zwingend erforderlich; handschriftliche Angaben sind unzulässig [S. 1].
- Skalierbarkeit: Bei mehreren Rechnungen müssen separate E-Mails versendet werden [S. 2].
- Sicherheit: Rückerstattungen erfordern aussagekräftige buchungsbegründende Unterlagen [S. 2].

## Verweise auf andere Anlagen / Dokumente
- Verweis auf das Land Hessen: Informationen zu X-Rechnungen sind unter https://verwaltungsportal.hessen.de/information/elektronische-rechnungen-im-land-hessen abrufbar [S. 1].
- Verweis auf das E-Rechnungs-Portal des Landes Hessen für direkte Übersendung von Rechnungen an FITKO: https://verwaltungsportal.hessen.de/information/direkte-uebersendung-von-rechnungen [S. 2].

## Unklarheiten oder Widersprüche innerhalb des Dokuments
- Keine erkannt.

## Für die Architekturarbeit besonders relevant
Für die Architekturarbeit ist entscheidend, dass Rechnungssysteme maschinell lesbare Buchungskreis-/Dienststellenangaben (BKR 5010-DST 2019) integrieren müssen, um Fehlverarbeitungen zu vermeiden. Die Option der X-Rechnung mit Leitweg-ID „06-50102019-97“ bietet eine standardisierte Schnittstelle, die bei Integration in bestehende Systeme berücksichtigt werden sollte. Die Einschränkungen bei E-Mail-Übermittlung (1 Rechnung/E-Mail, 22 MB) erfordern ggf. eine Batch-Verarbeitung oder eine Alternative über das Portal des Landes Hessen, was Architekturentscheidungen zur Schnittstellenwahl beeinflusst.