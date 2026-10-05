# ExampleOrganRASS20200311 - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ExampleOrganRASS20200311**

## Observation: ExampleOrganRASS20200311

Profile: [MII PR ICU Score RASS](StructureDefinition-mii-pr-icu-score-rass.md)

**status**: Final

**category**: Exam

**code**: Richmond Agitation Sedation Scale score

**subject**: [Aelin Sternenfall (official) Unknown, DoB: ( Medical record number)](Patient-isik-patient-156722.md)

**effective**: 2020-03-11 20:17:06+0100

**value**: Deep sedation -4



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ExampleOrganRASS20200311",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/mii-pr-icu-score-rass"]
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
      "code" : "1345050000",
      "display" : "Richmond Agitation Sedation Scale score"
    }]
  },
  "subject" : {
    "reference" : "Patient/isik-patient-156722"
  },
  "effectiveDateTime" : "2020-03-11T20:17:06+01:00",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "LA33966-5",
      "display" : "Deep sedation -4"
    }]
  }
}

```
