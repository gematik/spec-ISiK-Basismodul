#  - AMTS ISiK Implementation Guide v6.0.0-rc

AMTS ISiK Implementation Guide

Version 6.0.0-rc - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Medication: 

Medikament (hier: Paracetamol) in Wasser aufgelöst



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "ExampleISiKMedikament7",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikament"
    ]
  },
  "code" : {
    "text" : "Paracetamol gelöst in Wasser"
  },
  "status" : "active",
  "ingredient" : [
    {
      "itemCodeableConcept" : {
        "coding" : [
          {
            "system" : "http://fhir.de/CodeSystem/bfarm/atc",
            "version" : "2024",
            "code" : "N02BE01",
            "display" : "Paracetamol"
          }
        ]
      },
      "isActive" : true,
      "strength" : {
        "numerator" : {
          "value" : 500,
          "unit" : "mg",
          "system" : "http://unitsofmeasure.org",
          "code" : "mg"
        },
        "denominator" : {
          "value" : 1,
          "system" : "http://unitsofmeasure.org",
          "code" : "1"
        }
      }
    },
    {
      "itemCodeableConcept" : {
        "text" : "Wasser"
      },
      "isActive" : false,
      "strength" : {
        "numerator" : {
          "value" : 1,
          "unit" : "Esslöffel",
          "system" : "http://unitsofmeasure.org",
          "code" : "1"
        },
        "denominator" : {
          "value" : 1,
          "system" : "http://unitsofmeasure.org",
          "code" : "1"
        }
      }
    }
  ]
}

```
