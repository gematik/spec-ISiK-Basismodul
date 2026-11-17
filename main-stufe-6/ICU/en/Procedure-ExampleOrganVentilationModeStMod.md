# ExampleOrganVentilationModeStMod - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ExampleOrganVentilationModeStMod**

## Procedure: ExampleOrganVentilationModeStMod

Profile: [ISiK Prozedur Beatmung](StructureDefinition-ISiKProzedurBeatmung.md)

**status**: In Progress

**category**: Künstliche Beatmung

**code**: BiLevel spontaneous timed

**subject**: [Aelin Sternenfall (official) Unknown, DoB: ( Medical record number)](Patient-isik-patient-156722.md)

**performed**: 2020-03-11 20:17:06+0100



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "ExampleOrganVentilationModeStMod",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKProzedurBeatmung"]
  },
  "status" : "in-progress",
  "category" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "40617009",
      "display" : "Künstliche Beatmung"
    }]
  },
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "1186618000",
      "display" : "Bilevel artificial ventilation"
    }],
    "text" : "BiLevel spontaneous timed"
  },
  "subject" : {
    "reference" : "Patient/isik-patient-156722"
  },
  "performedDateTime" : "2020-03-11T20:17:06+01:00"
}

```
