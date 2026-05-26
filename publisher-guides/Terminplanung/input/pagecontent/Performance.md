Da es sich im ISiK-Kontext bei dem Terminplanungs-Modul um ein dediziertes Modul zur Abbildung eines Workflows handelt, sind hier gesonderte Betrachtungen und Festlegungen zu Performance-Aspekten notwendig, um einen robusten und für Nutzende akzeptablen Einsatz der Schnittstelle zu ermöglichen.

### Performance-Anforderungen an ein Termin-Repository

tbd. (anderer PR/Ticket)

### Erwartbare Zeiträume bei Slot-Abfragen auf einzelne Kalender

Slot-Abfragen (Terminblock-Abfragen) bilden den performanzkritischen Kern des Buchungsworkflows: Nutzende erwarten beim Suchen nach freien Terminen eine unmittelbare Rückmeldung. Gleichzeitig können Slot-Ergebnismengen – abhängig von Slot-Dauer und Abfragezeitraum – sehr groß werden, weshalb klare Grenzen für zulässige Abfragezeiträume und die daran geknüpften Anforderungen notwendig sind.

#### Zulässige Abfragezeiträume und Antwortzeit-Anforderungen

**Annahme:** Eine Slot-Abfrage enthält in der Regel den Suchparameter `schedule` , um die Ergebnismenge auf einen einzelnen Kalender einzuschränken.
Client-Implementierungen können nicht davon ausgehen, dass `schedule`-unabhängige Anfragen innerhalb der unten definierten Zeiträume beantwortet werden können.
Für die zulässigen Abfragezeiträume – gemessen ab dem Zeitpunkt der Anfrage – MÜSSEN Termin Repositories für `schedule` bezogene Abfragen folgende Antwortzeiten einhalten:

| Abfragezeitraum | Beschreibung | Typischer Anwendungsfall | Antwortzeit-Anforderung |
|---|---|---|---|
| **Bis 4 Wochen** (Standardbereich) | Kurzfristige Verfügbarkeitsabfrage | Nächster freier Termin für Patientenbuchung | Unter 2 Sekunden (analog PK3 Basis) |
| **4 bis 12 Wochen** (erweiterter Bereich) | Mittelfristige Planung | Wiedervorstellungstermine, Vorausplanung | Unter 15 Sekunden (spezifisch Terminplanung, zwischen PK4 und PK5 Basis) |
| **Über 12 Wochen** | Langfristige Planung | Jahresplanung, Kapazitätsmanagement | Nicht normiert – Server **DARF** `OperationOutcome` mit Code `too-costly` zurückgeben oder Pagination erzwingen |

> **Hinweis:** Die Anforderungen beziehen sich jeweils auf Abfragen mit einem einzelnen Kalender als Bezugskontext (und i.d.R. ohne gleichzeitige Nutzung von `_include`, `_revinclude` oder Chaining).

#### Begründung der Antwortzeit-Anforderungen

**Warum überhaupt klare Zeitvorgaben?**
Ohne definierte Antwortzeiten müssen Client-Plattformen konservativ lange Timeouts konfigurieren (in der Praxis heute 10–30 Sekunden). Das führt zu vielen parallel offenen Requests auf Server-Seite – insbesondere zu Spitzenzeiten, wenn mehrere Patienten gleichzeitig einen Termin suchen (z. B. Montagmorgen nach Wochenende). Bei Spitzenlast können daraus Cascading Failures entstehen, bei denen einzelne langsame Anfragen das gesamte System zunehmend verlangsamen.

**Warum speziell unter 15 Sekunden für den erweiterten Bereich?**
Untersuchungen zur Nutzerwahrnehmung zeigen konsistent, dass ab ca. 10 Sekunden Wartezeit Konzentration und Compliance deutlich nachlassen und Frustration stark ansteigt. Dies führt zu einer Reihe unerwünschter Verhaltensweisen:
- Nutzende laden die Seite neu, weil sie einen Fehler vermuten
- Nutzende öffnen parallel neue Tabs oder wechseln das Gerät, weil sie sich von einem anderen Weg eine schnellere Antwort erhoffen – und lösen damit weitere Last aus
- Nutzende brechen den Vorgang ab und kontaktieren die Einrichtung auf anderem Weg (erhöhte Administrationslast) oder wandern ganz ab (Patientenverlust)

Teile dieses Verhaltens lassen sich durch geeignete UI-Rückmeldungen (z. B. Ladeanimation, Zwischenstatusanzeige) abfedern, aber nicht vollständig vermeiden. Die Grenze von 15 Sekunden für den erweiterten Bereich (4–12 Wochen) setzt daher einen Rahmen, der technisch realisierbar ist und gleichzeitig die nutzerseitige Toleranzschwelle nicht überschreitet.

**Begründung der Zeitraum-Grenzen**

Die Grenze von **4 Wochen** ergibt sich aus dem typischen Buchungshorizont in der ambulanten Versorgung (Praxen, MVZ, Ambulanzen). Bei üblichen Slot-Dauern von 15–30 Minuten entstehen in einem 4-Wochen-Fenster (20 Werktage × 8 Stunden) etwa 320–640 Terminblöcke pro Kalender – eine Ergebnismenge, die serverseitig ohne Pagination in kurzer Antwortzeit beherrschbar ist.

Die Grenze von **12 Wochen** trägt dem Planungshorizont von Kliniken und spezialisierten Einrichtungen Rechnung, in denen Termine mehrere Monate im Voraus gebucht werden. Für diesen Bereich sind längere Antwortzeiten akzeptabel.

Für Abfragen **über 12 Wochen** ist keine normierte Antwortzeit vorgesehen, da die Ergebnismenge unkalkulierbar wird und Terminblöcke für weit in der Zukunft liegende Zeiträume häufig noch nicht angelegt sind.

#### Client-Pflichten bei Slot-Abfragen

Client-Implementierungen **SOLLEN**:
- den Suchparameter `schedule` angeben,
- den Abfragezeitraum mittels `start=ge<Datum>&start=le<Datum>` eingrenzen,
- Paging (`_count`) nutzen, sofern mehr Ergebnisse benötigt werden als die Standard-Seitengröße liefert,
- den Abfragezeitraum so klein wie fachlich notwendig wählen (initial z. B. 2 Wochen, bei Bedarf erweiterbar),
- Slot-Ergebnisse für denselben Kalender und Zeitraum lokal zwischenspeichern und nicht bei jeder Nutzerinteraktion neu laden.

### Buchungsstatus-Rückmeldung (confirmed / pending)

Die Rückmeldung des Buchungsstatus – d. h. ob ein Termin direkt bestätigt (`confirmed`) oder zunächst als Anfrage vorgemerkt (`pending`) wurde – ist mindestens genauso zeitkritisch wie die vorgelagerte Slot-Abfrage.

**Antwortzeit-Anforderungen:**
- `$book`-Operation: Unter 2 Sekunden (Antwortzeit als Baseline; Zielwert analog PK3 Basis)
- `GET Appointment/<id>` (Statusabfrage): Unter 1 Sekunde (Antwortzeit als Baseline; siehe Festlegung PK1 Basis)

Zusammen decken diese beiden Anforderungen den vollständigen Buchungs-Roundtrip ab: die schreibende Buchungsoperation sowie die nachgelagerte Abfrage, mit der der Termin-Requestor den aktuellen Buchungsstatus abruft.

#### Begründung

Das Risiko einer Doppelbuchung steigt überproportional mit der Antwortzeit: Wird dem Nutzenden keine zügige Rückmeldung gegeben, ob die Buchung erfolgreich war oder nicht, können parallele Buchungsversuche desselben Slots entstehen. Zudem nimmt mit zunehmender Wartezeit die Verunsicherung der Patienten zu – mehr noch als bei der Slot-Abfrage –, was zu unerwünschtem Verhalten (z. B. Mehrfachbuchungen, Abbruch und erneuter Buchungsversuch) führen kann.

### Gültigkeit Vorgaben Basis

Über die hier getroffenen Festlegungen hinaus gelten die [Festlegungen zur Performance des ISiK Moduls Basis](https://gemspec.gematik.de/ig/fhir/isik/basis/latest/UebergreifendeFestlegungen_Performance.html).