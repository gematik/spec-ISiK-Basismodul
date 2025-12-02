---
topic: Kompatibilitaet
---

## Kompatibilität zu anderen nationalen FHIR-basierten Spezifikationen

Die vorliegende Spezifikation orientiert sich teilweise an bereits vorhandenen (internationalen) FHIR-Projekten zum Thema Terminvergabe. Hier sei vorallem das [Argonaut Scheduling Project](https://fhir.org/guides/argonaut/scheduling/) hervorgehoben.

## Kompatibilität zum KBV eTerminService

Bei folgenden FHIR-Ressourcen wurde zum Zeitpunkt der Erstveröffentlichung eine inhaltliche Überschneidung mit dem [eTerminService der KBV](https://simplifier.net/eTerminservice-R4/~introduction) erreicht, die auch weiter angestrebt wird. Erforderliche Maßnahmen zur Kompatibilitätswahrung sind:

* [Patient](https://simplifier.net/eterminservice-r4/patientets) - Die Validität der ISiK "Patient"-Instanz gegen das entsprechende KBV ETS Profil, kann erreicht werden, wenn zumindest:
  * Elemente, die auf eine Kardinalität von 0..0 beschränkt sind, entfernt werden

* [Appointment](https://simplifier.net/eterminservice-r4/appointmentets-duplicate-2) - Die Validität von ISiK "Appointment"-Instanz gegen das entsprechende KBV ETS Profil, kann erreicht werden, wenn zumindest:
  * Elemente, die auf eine Kardinalität von 0..0 beschränkt sind, entfernt werden
  * Eine PractitionerRole Referenz als Akteur angegeben wird

Aufgrund von fachlichen Unterschieden in den zu unterstützenden Arbeitsabläufen sind die OperationDefinitions für die Buchung eines Termins nicht vergleichbar.