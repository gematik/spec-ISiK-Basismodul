
# Zielbild zur Weiterentwicklung des ISiK Encounter- und Fallmodells bis April 2027

> Status: Diskussionsentwurf
>
> Dieses Dokument beschreibt identifizierte Fragestellungen und ein mögliches Zielbild für die Weiterentwicklung des ISiK Encounter- und Fallmodells bis April 2027. Es handelt sich ausdrücklich nicht um eine beschlossene Fachspezifikation.
>
> Kommentare und Rückmeldungen sind ausdrücklich erwünscht.

## Ausgangslage

ISiK Stufe 6 verfügt bereits über ein differenziertes Fallmodell auf Basis von Encounter und Account.

Referenz:
https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0/Abbildung-des-Konstrukts-Fall.html

Im Rahmen von Implementierungen in Krankenhäusern, Diskussionen mit der Medizininformatik-Initiative (MII), Rückmeldungen aus den Datenintegrationszentren (DIZ) sowie Erfahrungen aus der Spezifikationsarbeit wurden verschiedene offene Fragestellungen identifiziert.

Dabei geht es nicht nur um einzelne Modellierungsdetails, sondern zunehmend um die Frage, welches langfristige fachliche und technische Zielbild ISiK für die Abbildung von Fällen, Versorgungskontakten und Versorgungsepisoden verfolgen soll.

Dieses Dokument beschreibt die Themenfelder, die bis April 2027 untersucht und entschieden werden sollen, sowie ein realistisches Vorgehensmodell für die Weiterentwicklung.

## Nicht verhandelbare Tatsachen

Folgende Grundannahmen gelten zunächst als gesetzt und sollen im Rahmen dieser Arbeiten nicht erneut grundsätzlich diskutiert werden:

1. Die Trennung zwischen Encounter (Versorgungskontakt) und Account (Abrechnungsfall) bleibt bestehen.
2. Die im deutschen Krankenhauswesen verwendete Fallnummer ist eine Abrechnungsnummer.
3. Die Fallnummer wird über den Account repräsentiert und umfasst regelmäßig mehrere Encounter.
4. Eine Fallnummer darf nicht als `Encounter.identifier` verwendet werden.
5. Die grundlegende Orientierung am bestehenden ISiK-6-Fallmodell bleibt erhalten.

# Strategische Grundsatzfragen

## 1. Rolle der EpisodeOfCare

### Ausgangslage

Derzeit existiert kein EpisodeOfCare-Profil in ISiK.

Das bestehende Fallmodell adressiert primär:

- Versorgungskontakt (Encounter)
- Abrechnungsfall (Account)

Nicht eindeutig adressiert werden dagegen medizinische Zusammenhänge, die sich über mehrere Encounter und gegebenenfalls mehrere Accounts erstrecken.

Beispiele:

- chronische Erkrankungen
- langfristige Behandlungspfade
- Wiederaufnahmen
- sektorübergreifende Versorgung
- medizinische Fallzusammenhänge unabhängig vom Abrechnungsfall

### Fragestellung

Soll EpisodeOfCare künftig Teil des ISiK-Zielmodells werden?

### Optionen

**Option A**

Keine Einführung eines EpisodeOfCare-Profils.

**Option B**

Einführung eines EpisodeOfCare-Profils als zusätzliches fachliches Konzept zur Abbildung medizinischer Zusammenhänge jenseits des Abrechnungsfalls.

### Ziel bis April 2027

- Entscheidung über die Aufnahme von EpisodeOfCare
- Festlegung der fachlichen Rolle
- Definition der Beziehungen zu Encounter, Account und Diagnosen

## 2. Rolle des Einrichtungskontakts

### Ausgangslage

Das bestehende Modell unterscheidet heute zwischen:

- Account
- Einrichtungskontakt
- Abteilungskontakt
- Versorgungsstellenkontakt

Während Abteilungskontakte und Versorgungsstellenkontakte einen unmittelbar nachvollziehbaren Versorgungskontext beschreiben, soll geprüft werden, welchen eigenständigen fachlichen Mehrwert der Einrichtungskontakt gegenüber dem Account liefert.

### Fragestellungen

- Welche Informationen gehören fachlich ausschließlich auf den Einrichtungskontakt?
- Welche Informationen sind bereits über den Account ableitbar?
- Welche Anwendungsfälle benötigen zwingend einen Einrichtungskontakt?
- Ist der Einrichtungskontakt für Fallakte, Berechtigungen und Suchstrategien erforderlich?
- Ist der Einrichtungskontakt langfristig Bestandteil des fachlichen Zielmodells?

### Ziel bis April 2027

**Option A:** Eigenständige und klar abgegrenzte Ebene.

**Option B:** Zulässig, aber nicht mehr zentrale Ebene.

**Option C:** Langfristig alternative Modellierungsansätze.

## 3. Geltungsbereich des ISiK-Fallmodells

### Ausgangslage

Zu klären ist der fachliche Anwendungsbereich hinsichtlich:

- MVZ
- ambulanten Krankenhausleistungen
- organisatorisch getrennten ambulanten Subsystemen
- sektorübergreifenden Versorgungskontexten

### Fragestellungen

- Welche Versorgungsformen sollen adressiert werden?
- Wo verläuft die fachliche Grenze?
- Soll das Encounter-Modell diese Kontexte explizit berücksichtigen?
- Entstehen zusätzliche Anforderungen an Encounter, Account oder EpisodeOfCare?

### Ziel bis April 2027

Festlegung des fachlichen Geltungsbereichs als Grundlage weiterer Modellierungsentscheidungen.

# Fachliche Problemstellungen

## Ambulantes Konsil bzw. Notaufnahme während stationärem Aufenthalt

### Zu klärende Fragen

- Bleibt der stationäre Aufenthalt durchgängig bestehen?
- Entsteht ein zusätzlicher ambulanter Kontakt?
- Wie wird die Gesamtverweildauer bestimmt?
- Wie werden Konsile und Notaufnahmekontakte eingeordnet?

### Zielbild

Zusätzliche Versorgungskontakte dürfen nicht als Wechsel der Fallart interpretiert werden.

## Wiederaufnahme

### Zu klärende Fragen

- Nutzung derselben Fallnummer?
- Zusammenführung von Accounts?
- Nutzung von `Account.relatedAccount`?
- Auswirkungen auf Fallaktenbildung und Suchstrategien?

### Zielbild

Konsistente interoperable Empfehlung für Wiederaufnahmen.

## Fachabteilungswechsel bei gleichbleibender Location

### Zu klärende Fragen

- Auf welcher Ebene werden Locations geführt?
- Wie wird ein Fachabteilungswechsel ohne Bettwechsel modelliert?
- Welche Auswirkungen ergeben sich durch EncounterHistory in FHIR R5/R6?

## Diagnosen

### Grundsatzfrage

Sind Diagnosen:

- fallbezogene Instanzen

oder

- langlebige medizinische Fakten?

### Zu prüfen

- ePA-Unterstützung
- EHDS-Kompatibilität
- Vermeidung von Dubletten
- Vereinfachung von Patient Summaries

## Fallakte

### Zu klärende Fragen

- Welche Ressourcen gehören zu einer Fallakte?
- Wie werden diese ermittelt?
- Welche Suchstrategien werden empfohlen?

### Relevante Anwendungsfälle

- Datenmigration
- Entlassbriefschreibung
- SMART-on-FHIR
- Berechtigungsmanagement

# Technisches Zielbild

## Dreiebenenmodell

```text
Einrichtungskontakt
└─ Abteilungskontakt
   └─ Versorgungsstellenkontakt
```

Bis April 2027 soll geprüft werden:

- ob diese Struktur langfristig bestätigt wird,
- welche Ebenen verpflichtend sind,
- wie mit fehlenden Ebenen umzugehen ist.

## Heterogene Datenverfügbarkeit

Zu untersuchen:

- Welche Ebenen sind tatsächlich verfügbar?
- Welche Ebenen müssen rekonstruiert werden?
- Welche Mindestanforderungen sind für Interoperabilität erforderlich?
- Soll die Erzeugung fehlender Ebenen empfohlen werden?

## Profilstruktur

Zu prüfen ist die Aufteilung in:

- Encounter Einrichtungskontakt
- Encounter Abteilungskontakt
- Encounter Versorgungsstellenkontakt

### Motivation

- Klarere Dokumentation
- Eindeutigere Regeln
- Weniger Redundanzen
- Präzisere Must-Support-Festlegungen

## Spezifikation der Kontaktebenen

Zu definieren für:

- Location
- Fachabteilungsschlüssel
- Diagnosenbezug
- Account-Referenzen
- Organisationsreferenzen
- Encounter.period
- Fachdisziplinen
- Konsile

## partOf und Hierarchien

### Zu klären

- Soll `partOf` verpflichtend sein?
- Darf eine Ebene ausgelassen werden?
- Wie werden überlappende Kontakte modelliert?
- Wie werden verschachtelte Kontakte modelliert?

### Arbeitshypothese

1. Die bestehende dreistufige Hierarchie bleibt Zielmodell.
2. Direkte Beziehungen von Versorgungsstellenkontakten auf Einrichtungskontakte sollen vermieden werden.
3. Fehlende Abteilungskontakte sollten nach Möglichkeit ergänzt werden.

# Zusammenfassung

Die Arbeiten konzentrieren sich auf drei übergreifende Architekturfragen:

1. Soll EpisodeOfCare künftig Bestandteil von ISiK werden?
2. Welche langfristige Rolle soll der Einrichtungskontakt einnehmen?
3. Welchen fachlichen Geltungsbereich soll das ISiK-Fallmodell künftig abdecken?

Von der Beantwortung dieser Fragen hängen wesentliche Teile der zukünftigen Encounter-Modellierung und der Weiterentwicklung des ISiK-Fallkonzepts ab.
