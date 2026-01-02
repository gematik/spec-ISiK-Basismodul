#  - AMTS ISiK Implementation Guide v0.0.1

AMTS ISiK Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Medication: 

Medikament codiert (mit PZN)



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "ExampleISiKMedikament3",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikament"
    ]
  },
  "code" : {
    "coding" : [
      {
        "system" : "http://fhir.de/CodeSystem/ifa/pzn",
        "code" : "07265233",
        "display" : "Pantozol® 40 mg 98 St."
      }
    ]
  },
  "status" : "active"
}

```
