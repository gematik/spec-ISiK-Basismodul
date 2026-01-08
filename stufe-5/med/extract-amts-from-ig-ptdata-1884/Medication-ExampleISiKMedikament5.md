#  - AMTS ISiK Implementation Guide v6.0.0-rc

AMTS ISiK Implementation Guide

Version 6.0.0-rc - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Medication: 

Medikamentenrezeptur aus Wirkstoffen



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "ExampleISiKMedikament5",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikament"
    ]
  },
  "status" : "active",
  "form" : {
    "text" : "Tabletten"
  },
  "ingredient" : [
    {
      "itemCodeableConcept" : {
        "coding" : [
          {
            "system" : "http://fhir.de/CodeSystem/bfarm/atc",
            "version" : "2024",
            "code" : "M02AA13",
            "display" : "Ibuprofen"
          }
        ]
      },
      "isActive" : true,
      "strength" : {
        "numerator" : {
          "value" : 400,
          "unit" : "mg",
          "system" : "http://unitsofmeasure.org",
          "code" : "mg"
        },
        "denominator" : {
          "value" : 1,
          "unit" : "Tablette",
          "system" : "http://unitsofmeasure.org",
          "code" : "1"
        }
      }
    },
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
          "unit" : "Tablette",
          "system" : "http://unitsofmeasure.org",
          "code" : "1"
        }
      }
    }
  ]
}

```
