---
topic: ISiKTerminblock-MS
canonical: https://gematik.de/fhir/isik/StructureDefinition/ISiKTerminblock
---

### Anmerkungen zu Must-Support-Feldern

<fql>
from
	StructureDefinition
where 
    url = %canonical
for differential.element
where mustSupport = true
select
	Feldname: id, Kurzbeschreibung: short, Hinweise: comment
</fql>

### `Slot.schedule`

**Bedeutung:** Verknüpfung einer Termins / Terminblocks und den dazugehörigen Terminlisten bzw. deren Ressourcen.

**Hinweise:** Die Referenz auf Schedule bietet die Möglichkeit der Abfrage eines Appointments / Slots auf Basis einer Verknüpfung mit einem Schedule bzw. eines Schedules für eine bestimmte Ressource (Schedule.actor).

### `Slot.status`

**Bedeutung:** Indikator ob ein Slot verwendbar ist für die Buchung eines Appointments.

**Hinweise:** Insbesondere eine Differenzierung des Status ‚busy‘ ermöglicht es einem Termin-Requestor, einem Benutzer passende Termine zur Verfügung zu stellen. Durch entsprechende Kombinationen können somit Termine in einer passenden Länge gebucht werden.

### `Slot.start`

**Bedeutung:** Startdatum des Slots (sekundengenau).

**Hinweise:** Falls sich ein Appoinment über mehrere Slots erstreckt, kann mit Hilfe des Startdatums der Beginn eines zu vereinbarenden Termins gefunden werden.

### `Slot.end`

**Bedeutung:** Enddatum des Slots (sekundengenau).

**Hinweise:** Falls sich ein Appointment über mehrere Slots erstreckt, kann mithilfe des Enddatums der Slot gefunden werden, der als nächster innerhalb einer Reihe gebucht werden muss, sodass das Appointment die gewünschte Länge erreicht.
