
# Zielbild zur Weiterentwicklung des ISiK Encounter- und Fallmodells bis April 2027

 Status: Diskussionsentwurf

 Dieses Dokument beschreibt identifizierte Fragestellungen und ein mögliches Zielbild für die Weiterentwicklung des ISiK Encounter- und Fallmodells bis April 2027. Es handelt sich ausdrücklich nicht um eine beschlossene Fachspezifikation.

 Kommentare und Rückmeldungen sind ausdrücklich erwünscht.

## Ausgangslage

ISiK Stufe 6 verfügt bereits über ein differenziertes Fallmodell auf Basis von Encounter und Account.

<https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0/Abbildung-des-Konstrukts-Fall.html>

Im Rahmen von Implementierungen in Krankenhäusern, Diskussionen mit der Medizininformatik-Initiative (MII), Rückmeldungen aus den Datenintegrationszentren (DIZ) sowie Erfahrungen aus der Spezifikationsarbeit wurden verschiedene offene Fragestellungen identifiziert.

Dabei geht es nicht nur um einzelne Modellierungsdetails, sondern zunehmend um die Frage, welches langfristige fachliche und technische Zielbild ISiK für die Abbildung von Fällen, Versorgungskontakten und Versorgungsepisoden verfolgen soll.

Dieses Dokument beschreibt die Themenfelder, die bis April 2027 untersucht und entschieden werden sollen, sowie ein realistisches Vorgehensmodell für die Weiterentwicklung.

## Nicht verhandelbare Tatsache

Folgende Grundannahmen gelten zunächst als gesetzt und sollen im Rahmen dieser Arbeiten nicht erneut grundsätzlich diskutiert werden:

- Die Trennung zwischen Encounter (Versorgungskontakt) und Account (Abrechnungsfall) bleibt bestehen.
- Die im deutschen Krankenhauswesen verwendete Fallnummer ist eine Abrechnungsnummer.
- Die Fallnummer wird über den Account repräsentiert und umfasst regelmäßig mehrere Encounter.
- Eine Fallnummer darf nicht als `Encounter.identifier` verwendet werden.
- Die grundlegende Orientierung am bestehenden ISiK-6-Fallmodell bleibt erhalten.

## Strategische Grundsatzfragen

### 1. Rolle der EpisodeOfCare

#### Ausgangslage

Derzeit existiert kein EpisodeOfCare-Profil in ISiK.

Das bestehende Fallmodell adressiert primär:

- **Aufenthalt/Besuch/Kontakt (Encounter)** - hier weiter als "Versorgungskontakte" bezeichnet
- **Abrechnungszusammenhänge oder Abrechnungsfall (Account)**

Nicht eindeutig adressiert werden dagegen medizinische Zusammenhänge, die sich über mehrere Encounter und gegebenenfalls mehrere Accounts erstrecken.

Beispiele:

- chronische Erkrankungen
- langfristige Behandlungspfade
- Wiederaufnahmen
- sektorübergreifende Versorgung
- medizinische Fallzusammenhänge unabhängig vom Abrechnungsfall

#### Fragestellung

Soll EpisodeOfCare künftig Teil des ISiK-Zielmodells werden?

#### Mögliche Optionen

**Option A**

Keine Einführung eines EpisodeOfCare-Profils.

Account und Encounter bleiben die zentralen Konzepte des Fallmodells.

**Option B**

Einführung eines EpisodeOfCare-Profils als zusätzliches fachliches Konzept zur Abbildung medizinischer Zusammenhänge jenseits des Abrechnungsfalls.

#### Ziel bis April 2027

Es soll entschieden werden,

- ob EpisodeOfCare Bestandteil des ISiK-Zielmodells werden soll,
- welche fachliche Rolle EpisodeOfCare einnimmt,
- welche Beziehungen zu Encounter, Account und Diagnosen spezifiziert werden müssen.

### 2. Rolle des Einrichtungskontakts

#### Ausgangslage

Die zukünftige Rolle des Einrichtungskontakts ist aus Sicht der ISiK-Spezifikationsarbeit bislang nicht abschließend geklärt.

Das bestehende Modell unterscheidet heute zwischen:

- Account
- Einrichtungskontakt
- Abteilungskontakt
- Versorgungsstellenkontakt

Während Abteilungskontakte und Versorgungsstellenkontakte einen unmittelbar nachvollziehbaren Versorgungskontext beschreiben, ist aus Sicht der Weiterentwicklung von ISiK zu prüfen, welchen eigenständigen fachlichen Mehrwert der Einrichtungskontakt gegenüber dem bereits vorhandenen Account liefert.

Dabei handelt es sich ausdrücklich nicht um eine Kritik an bestehenden Implementierungen oder bisherigen ISiK-Versionen. Vielmehr soll überprüft werden, ob die fachliche Bedeutung des Einrichtungskontakts ausreichend klar definiert ist und langfristig spezifikatorisch begründet werden kann.

#### Fragestellungen

- Welche Informationen gehören fachlich ausschließlich auf den Einrichtungskontakt?
- Welche Informationen sind bereits über den Account ableitbar?
- Welche Anwendungsfälle benötigen zwingend einen Einrichtungskontakt?
- Ist der Einrichtungskontakt für Fallakte, Berechtigungen und Suchstrategien erforderlich?
- Ist der Einrichtungskontakt langfristig Bestandteil des fachlichen Zielmodells?

#### Ziel bis April 2027

Es soll eine belastbare Entscheidungsvorlage erarbeitet werden, ob:

**Option A**

Der Einrichtungskontakt weiterhin eine eigenständige und klar abgegrenzte Ebene des ISiK-Zielmodells darstellt.

**Option B**

Der Einrichtungskontakt weiterhin zulässig bleibt, aber nicht mehr als zentrale Ebene des Zielmodells betrachtet wird.

**Option C**

Langfristig alternative Modellierungsansätze verfolgt werden sollen.

#### Bedeutung für die weitere Arbeit

Die Klärung dieser Frage beeinflusst unmittelbar:

- Encounter-Hierarchien
- partOf-Regeln
- Profilstruktur
- Definition der Fallakte
- Nutzung von Locations
- Umgang mit fehlenden Encounter-Ebenen

### 3. Geltungsbereich des ISiK-Fallmodells

#### Ausgangslage

Das bestehende ISiK-Fallmodell wurde primär aus Sicht klassischer Krankenhaus-Informationssysteme entwickelt.

Zunehmend stellt sich jedoch die Frage, wie mit Versorgungsformen umzugehen ist, die organisatorisch mit Krankenhäusern verbunden sind, aber nicht dem klassischen stationären Versorgungskontext entsprechen.

Hierzu gehören insbesondere:

- Medizinische Versorgungszentren (MVZ)
- ambulante Krankenhausleistungen
- organisatorisch getrennte ambulante Subsysteme
- sektorübergreifende Versorgungskontexte

#### Fragestellungen

- Welche Versorgungsformen sollen durch das ISiK-Fallmodell grundsätzlich adressiert werden?
- Wo verläuft die fachliche Grenze zwischen Krankenhausversorgung und anderen Versorgungsformen?
- Soll das Encounter-Modell auch ambulante Krankenhausstrukturen und MVZ-Kontexte explizit berücksichtigen?
- Reicht das bestehende Modell aus oder entstehen zusätzliche Anforderungen an Encounter, Account oder EpisodeOfCare?

#### Ziel bis April 2027

Festlegung des fachlichen Geltungsbereichs des ISiK-Fallmodells als Grundlage für alle weiteren Modellierungsentscheidungen.

## Fachliche Problemstellungen

### Ambulantes Konsil bzw. Notaufnahme während stationärem Aufenthalt

#### Ziel

Klärung der Modellierung von Versorgungssituationen (anhand von Szenarien), in denen während eines stationären Aufenthaltes weitere organisatorische Einheiten beteiligt werden.

#### Zu klärende Fragen

- Bleibt der stationäre Aufenthalt durchgängig bestehen?
- Entsteht ein zusätzlicher ambulanter Kontakt?
- Wie wird die Gesamtverweildauer bestimmt?
- Wie werden Konsile und Notaufnahmekontakte eingeordnet?

#### Zielbild

Das Modell soll sicherstellen, dass zusätzliche Versorgungskontakte nicht fälschlich als Wechsel der Fallart (stationär → ambulant) interpretiert werden.

### Wiederaufnahme

#### Ziel

Einheitliche Modellierung von Wiederaufnahmen im DRG-Kontext.

#### Zu klärende Fragen

- Nutzung derselben Fallnummer?
- Zusammenführung von Accounts?
- Nutzung von `Account.relatedAccount`?
- Auswirkungen auf Fallaktenbildung und Suchstrategien?

#### Zielbild

ISiK soll eine konsistente und interoperable Empfehlung für Wiederaufnahmen bereitstellen.

### Fachabteilungswechsel bei gleichbleibender Location

#### Ziel

Klärung der Modellierung organisatorischer und physischer Bewegungen innerhalb eines Aufenthaltes.

#### Zu klärende Fragen

- Auf welcher Ebene werden Locations geführt?
- Wie wird ein Fachabteilungswechsel ohne Bettwechsel modelliert?
- Welche Auswirkungen ergeben sich durch EncounterHistory in FHIR R5/R6?

#### Zielbild

Eine konsistente und nachvollziehbare Modellierung von fachlicher Zuständigkeit und physischem Aufenthaltsort (ggf. unter Berücksichtigung von R5/R6).

### Diagnosen

#### Ausgangspunkt

Eine zentrale Grundsatzfrage betrifft den Lebenszyklus von Diagnosen.

#### Zu klärende Frage

Sind Diagnosen grundsätzlich:

- fallbezogene Instanzen

oder

- langlebige medizinische Fakten?

#### Zielrichtung

Zu prüfen ist insbesondere, ob Conditions grundsätzlich wiederverwendbare medizinische Sachverhalte darstellen sollten.

Mögliche Vorteile:

- Unterstützung von ePA-Szenarien
- EHDS-Kompatibilität
- Vermeidung von Dubletten
- Vereinfachung von Patient Summaries

Parallel muss der fachliche Kontext eines Aufenthaltes erhalten bleiben.

### Fallakte

#### Ziel

Definition einer standardisierten Sicht auf den Umfang einer Fallakte.

#### Zu klärende Fragen

- Welche Ressourcen gehören zu einer Fallakte?
- Wie werden diese ermittelt?
- Welche Suchstrategien werden empfohlen?

Relevante Anwendungsfälle:

- Datenmigration
- Entlassbriefschreibung
- SMART-on-FHIR
- Berechtigungsmanagement

## Technisches Zielbild

### Dreiebenenmodell

Das bestehende dreistufige Modell bleibt zunächst fachlicher Referenzpunkt:

```text
Einrichtungskontakt
└─ Abteilungskontakt
   └─ Versorgungsstellenkontakt
```

Bis April 2027 soll geprüft werden,

- ob diese Struktur langfristig bestätigt wird,
- welche Ebenen verpflichtend sind,
- wie mit fehlenden Ebenen umzugehen ist.

Dabei sind IST-Zustand und Zielmodell bewusst voneinander zu trennen.

### Heterogene Datenverfügbarkeit

Die Diskussionen der vergangenen Jahre haben gezeigt, dass die Datenlage zwischen den Standorten teilweise erheblich variiert.

Folgende Fragestellungen sollen untersucht werden:

- Welche Ebenen sind tatsächlich verfügbar?
- Welche Ebenen müssen rekonstruiert werden?
- Welche Mindestanforderungen sind für Interoperabilität erforderlich?
- Soll die Erzeugung fehlender Ebenen empfohlen werden?

Dabei soll ausdrücklich vermieden werden, das Zielmodell ausschließlich aus aktuellen Einschränkungen einzelner Systeme abzuleiten.

### Profilstruktur

Es soll geprüft werden, ob langfristig drei getrennte Encounter-Profile sinnvoller sind als ein gemeinsames Profil.

#### Zu untersuchende Variante

- Encounter Einrichtungskontakt
- Encounter Abteilungskontakt
- Encounter Versorgungsstellenkontakt

#### Motivation

- Klarere Dokumentation
- Eindeutigere Regeln
- Weniger Redundanzen
- Präzisere Must-Support-Festlegungen

### Spezifikation der Kontaktebenen

Für alle relevanten Elemente soll festgelegt werden:

- Auf welcher Ebene das Element erwartet wird
- Auf welcher Ebene das Element zulässig ist
- Auf welcher Ebene das Element vermieden werden sollte

Insbesondere zu prüfen:

- Location
- Fachabteilungsschlüssel
- Diagnosenbezug
- Account-Referenzen
- Referenzen auf Organisationen
- Encounter.period
- Fachdisziplinen
- Konsile

### partOf und Hierarchien

Zu klären sind insbesondere:

- Soll partOf bei vorhandenen Hierarchien verpflichtend sein?
- Darf eine Ebene ausgelassen werden?
- Wie werden überlappende Kontakte modelliert?
- Wie werden verschachtelte Kontakte modelliert?

Aktuelle Arbeitshypothese:

- Die bestehende dreistufige Hierarchie bleibt Zielmodell.
- Direkte Beziehungen von Versorgungsstellenkontakten auf Einrichtungskontakte sollen vermieden werden.
- Fehlende Abteilungskontakte sollten nach Möglichkeit ergänzt bzw. erzeugt werden.

## Zusammenfassung

Die Arbeiten konzentrieren sich auf drei übergreifende Architekturfragen:

1. Soll EpisodeOfCare künftig als eigenes Konzept zur Abbildung medizinischer Versorgungsepisoden Bestandteil von ISiK werden?
2. Welche langfristige Rolle soll der Einrichtungskontakt innerhalb des ISiK-Fallmodells neben dem Account einnehmen?
3. Welchen fachlichen Geltungsbereich soll das ISiK-Fallmodell künftig abdecken, insbesondere hinsichtlich MVZs, ambulanter Krankenhausversorgung und sektorübergreifender Versorgungskontexte?

Von der Beantwortung dieser drei Fragen hängen wesentliche Teile der zukünftigen Encounter-Modellierung und der Weiterentwicklung des ISiK-Fallkonzepts ab. Insbesondere die Detailfragen zu Wiederaufnahmen, Diagnosen, Hierarchien, Profilstruktur, Locations und Fallakten können erst auf Basis dieser strategischen Entscheidungen abschließend spezifiziert werden.
