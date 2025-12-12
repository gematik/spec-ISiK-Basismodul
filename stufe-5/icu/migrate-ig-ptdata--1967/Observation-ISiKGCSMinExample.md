#  - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Observation: 

Profile: [ISiKGCS](StructureDefinition-ISiKGCS.md)

**status**: Final

**category**: Survey

**code**: Glasgow coma score total

**subject**: [Anna Müller (official) Female, DoB: 1957-08-12 ( Medical record number)](Patient-PatientinMinimal.md)

**effective**: 2024-01-15

**value**: 3 Punktwert(Details: UCUM code1 = '1')

> **component****code**:Glasgow coma score verbal**value**:No verbal response

> **component****code**:Glasgow coma score motor**value**:No motor response

> **component****code**:Glasgow coma score eye opening**value**:No eye opening



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKGCSMinExample",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKGCS"]
  },
  "status" : "final",
  "category" : [
    {
      "coding" : [
        {
          "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
          "code" : "survey"
        }
      ]
    }
  ],
  "code" : {
    "coding" : [
      {
        "system" : "http://loinc.org",
        "code" : "9269-2",
        "display" : "Glasgow coma score total"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinMinimal"
  },
  "effectiveDateTime" : "2024-01-15",
  "valueQuantity" : {
    "value" : 3,
    "unit" : "Punktwert",
    "system" : "http://unitsofmeasure.org",
    "code" : "1"
  },
  "component" : [
    {
      "code" : {
        "coding" : [
          {
            "system" : "http://loinc.org",
            "code" : "9270-0",
            "display" : "Glasgow coma score verbal"
          }
        ]
      },
      "valueCodeableConcept" : {
        "coding" : [
          {
            "system" : "http://loinc.org",
            "code" : "LA6557-8",
            "display" : "No verbal response"
          }
        ]
      }
    },
    {
      "code" : {
        "coding" : [
          {
            "system" : "http://loinc.org",
            "code" : "9268-4",
            "display" : "Glasgow coma score motor"
          }
        ]
      },
      "valueCodeableConcept" : {
        "coding" : [
          {
            "system" : "http://loinc.org",
            "code" : "LA6562-8",
            "display" : "No motor response"
          }
        ]
      }
    },
    {
      "code" : {
        "coding" : [
          {
            "system" : "http://loinc.org",
            "code" : "9267-6",
            "display" : "Glasgow coma score eye opening"
          }
        ]
      },
      "valueCodeableConcept" : {
        "coding" : [
          {
            "system" : "http://loinc.org",
            "code" : "LA6553-7",
            "display" : "No eye opening"
          }
        ]
      }
    }
  ]
}

```
