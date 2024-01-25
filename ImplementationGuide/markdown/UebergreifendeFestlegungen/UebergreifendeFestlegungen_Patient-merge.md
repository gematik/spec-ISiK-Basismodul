# Patient-merge Notification

## patient-merge
Mergen von Patienten ist Aufgabe des zu bestätigenden Systems, ein externes Starten eines merge Prozesses, bspw. durch die $patient-merge Operation aus R5](https://hl7.org/fhir/R5/patient-operation-merge.html) ist nicht gefordert 

## Gemergte Patienten Instanz

### Datenelemente des ersetzten Patienten:
- .active = false
- .link.other = Reference(auf “neuen” Patient)
- .link.type = “replaced-by”

## Beispiele

Gemergte Patientin:
{{json:DorisDuplikat}}

"Neue" Patientin:
{{json:DorisOriginal}}

## Patient-merge Notification
Clients werden mittels FHIR Subscription über einen erfolgten Patienten-merge informiert. Hier wird aktuell geklärt ob dies mittels r4 Subscription oder R5 backport topic-based Subscription erfolgen soll.

