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

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2020-10-11

**performer**: [Practitioner/PractitionerWalterArzt](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Practitioner/PractitionerWalterArzt)

**value**: 11 Punktwert(Details: UCUM code1 = '1')

> **component****code**:Glasgow coma score verbal**value**:Confused

> **component****code**:Glasgow coma score motor**value**:Localizing pain

> **component****code**:Glasgow coma score eye opening**value**:Eye opening to verbal command



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKGCSExample",
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
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "248241002",
        "display" : "Glasgow coma score"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "153728",
        "display" : "MDC_SCORE_GLAS_COMA"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "effectiveDateTime" : "2020-10-11",
  "performer" : [
    {
      "reference" : "Practitioner/PractitionerWalterArzt"
    }
  ],
  "valueQuantity" : {
    "value" : 11,
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
            "code" : "LA6560-2",
            "display" : "Confused"
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
            "code" : "LA6566-9",
            "display" : "Localizing pain"
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
            "code" : "LA6555-2",
            "display" : "Eye opening to verbal command"
          }
        ]
      }
    }
  ]
}

```
