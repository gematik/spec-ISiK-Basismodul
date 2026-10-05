# ExampleOrganVentilationModenC - ISiK Organspendeerkennung v6.0.0

ISiK Organspendeerkennung

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ExampleOrganVentilationModenC**

## Procedure: ExampleOrganVentilationModenC

Profile: [ISiK Prozedur Beatmung](StructureDefinition-ISiKProzedurBeatmung.md)

**status**: In Progress

**category**: Künstliche Beatmung

**code**: nC

**subject**: [Aelin Sternenfall (official) Unknown, DoB: ( Medical record number)](Patient-isik-patient-156722.md)

**performed**: 2020-03-11 20:17:06+0100



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "ExampleOrganVentilationModenC",
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
      "code" : "229312009",
      "display" : "Nasal ventilation therapy"
    }],
    "text" : "nC"
  },
  "subject" : {
    "reference" : "Patient/isik-patient-156722"
  },
  "performedDateTime" : "2020-03-11T20:17:06+01:00"
}

```
