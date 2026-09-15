# ExampleISiKMedikament1 - AMTS ISiK Implementierungsleitfaden v6.0.0

AMTS ISiK Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ExampleISiKMedikament1**

## Medication: ExampleISiKMedikament1

Medikament codiert (Wirkstoff)



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "ExampleISiKMedikament1",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikament"]
  },
  "code" : {
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/bfarm/atc",
      "version" : "2024",
      "code" : "V03AB23",
      "display" : "Acetylcystein"
    }]
  },
  "status" : "active"
}

```
