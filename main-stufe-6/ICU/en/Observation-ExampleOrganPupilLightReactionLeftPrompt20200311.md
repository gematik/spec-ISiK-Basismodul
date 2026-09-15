# ExampleOrganPupilLightReactionLeftPrompt20200311 - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ExampleOrganPupilLightReactionLeftPrompt20200311**

## Observation: ExampleOrganPupilLightReactionLeftPrompt20200311

Profile: [MII PR ICU Untersuchung Pupillenlichtreaktion Direkt](StructureDefinition-mii-pr-icu-untersuchung-pupillenlichtreaktion-direkt.md)

**status**: Final

**category**: Exam

**code**: Pupil afferent light reaction

**subject**: [Aelin Sternenfall (official) Unknown, DoB: ( Medical record number)](Patient-isik-patient-156722.md)

**effective**: 2020-03-11 20:17:06+0100

**value**: Reactive to light

**note**: 

> 

Quelle: left pupil reaction = prompt


**bodySite**: Structure of pupil of left eye



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ExampleOrganPupilLightReactionLeftPrompt20200311",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/mii-pr-icu-untersuchung-pupillenlichtreaktion-direkt"]
  },
  "status" : "final",
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
      "code" : "exam",
      "display" : "Exam"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "45832002",
      "display" : "Pupil afferent light reaction"
    }]
  },
  "subject" : {
    "reference" : "Patient/isik-patient-156722"
  },
  "effectiveDateTime" : "2020-03-11T20:17:06+01:00",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "LA25441-9",
      "display" : "Reactive to light"
    }]
  },
  "note" : [{
    "text" : "Quelle: left pupil reaction = prompt"
  }],
  "bodySite" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "16089004",
      "display" : "Structure of pupil of left eye"
    }]
  }
}

```
