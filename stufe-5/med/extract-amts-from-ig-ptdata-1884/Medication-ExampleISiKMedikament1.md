#  - AMTS ISiK Implementation Guide v6.0.0-rc

AMTS ISiK Implementation Guide

Version 6.0.0-rc - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Medication: 

Medikament codiert (Wirkstoff)



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "ExampleISiKMedikament1",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikament"
    ]
  },
  "code" : {
    "coding" : [
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/atc",
        "version" : "2024",
        "code" : "V03AB23",
        "display" : "Acetylcystein"
      }
    ]
  },
  "status" : "active"
}

```
