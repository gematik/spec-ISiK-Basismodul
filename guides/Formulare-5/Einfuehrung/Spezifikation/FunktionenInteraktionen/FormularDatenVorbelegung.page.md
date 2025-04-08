---
topic: FormularDatenVorbelegung
---
## Interaktion: FormularDatenVorbelegung

Ein FormularRenderer prüft eine {{pagelink:FormularDefinition}} auf entsprechende Annotationen für die automatische Vorbelegung.
Dies kann entweder mittels der [Expression based population](https://build.fhir.org/ig/HL7/sdc/populate.html#exp-pop)  
oder der [Observation based prepopulation](https://build.fhir.org/ig/HL7/sdc/populate.html#obs-pop) geschehen.

<plantuml>
@startuml
FormularRenderer -> FormularDatenBereitsteller : GET Patient
FormularRenderer -> FormularDatenBereitsteller : GET Encounter
FormularRenderer -> FormularDatenBereitsteller : SEARCH Observation
@enduml
</plantuml>

Die folgenden Core und SDC Extensions sind für die Vorbelegung in dieser Stufe relevant. Unter {{pagelink:Extensions}} sind mehr Informationen dazu zu finden.

- [Launch Contexts](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-launchContext.html)
- [Initial Expression](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-initialExpression.html)
- [Obervation link period](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-observationLinkPeriod.html)