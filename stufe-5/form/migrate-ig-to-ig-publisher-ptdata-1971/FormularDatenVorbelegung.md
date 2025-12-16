# Formular Daten Vorbelegung - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* **Formular Daten Vorbelegung**

## Formular Daten Vorbelegung

## Interaktion: FormularDatenVorbelegung

Ein FormularRenderer prüft eine auf entsprechende Annotationen für die automatische Vorbelegung. Dies kann entweder mittels der [Expression based population](https://build.fhir.org/ig/HL7/sdc/populate.html#exp-pop)
 oder der [Observation based prepopulation](https://build.fhir.org/ig/HL7/sdc/populate.html#obs-pop) geschehen.

@startuml FormularRenderer -> FormularDatenBereitsteller : GET Patient FormularRenderer -> FormularDatenBereitsteller : GET Encounter FormularRenderer -> FormularDatenBereitsteller : SEARCH Observation @enduml
Die folgenden Core und SDC Extensions sind für die Vorbelegung in dieser Stufe relevant. Unter sind mehr Informationen dazu zu finden.

* [Launch Contexts](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-launchContext.html)
* [Initial Expression](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-initialExpression.html)
* [Obervation link period](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-observationLinkPeriod.html)

