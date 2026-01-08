#  - AMTS ISiK Implementation Guide v6.0.0-rc

AMTS ISiK Implementation Guide

Version 6.0.0-rc - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## MedicationStatement: 

Beispiel für Medikation/Einnahme am ersten Dienstag jedes dritten Monats



## Resource Content

```json
{
  "resourceType" : "MedicationStatement",
  "id" : "ExampleISiKMedikationsInformation5",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsInformation"
    ]
  },
  "status" : "active",
  "medicationCodeableConcept" : {
    "coding" : [
      {
        "system" : "http://fhir.de/CodeSystem/ifa/pzn",
        "code" : "07260796",
        "display" : "Vitamin-B12-ratiopharm® N Ampullen zur Injektion"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "context" : {
    "reference" : "Encounter/FachabteilungskontaktMinimal"
  },
  "effectivePeriod" : {
    "start" : "2024-02-06"
  },
  "dateAsserted" : "2024-01-31",
  "dosage" : [
    {
      "patientInstruction" : "alle 3 Monate am 1. Dienstag",
      "timing" : {
        "repeat" : {
          "frequency" : 1,
          "period" : 3,
          "periodUnit" : "mo",
          "dayOfWeek" : ["tue"]
        }
      },
      "doseAndRate" : [
        {
          "doseQuantity" : {
            "value" : 1,
            "unit" : "Tabl.",
            "system" : "http://unitsofmeasure.org",
            "code" : "1"
          }
        }
      ]
    }
  ]
}

```
