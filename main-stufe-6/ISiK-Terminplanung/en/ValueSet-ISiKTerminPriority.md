# ISiKTerminPriority - ISiK Terminplanung Implementierungsleitfaden v6.0.0

ISiK Terminplanung Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKTerminPriority**

## ValueSet: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ISiKTerminPriority | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKTerminPriority |

 
Enthaelt alle SNOMED Codes, die eine valide Priorität für den ISiKTermin sind 

 **References** 

* [ISiKTerminPriorityExtension](StructureDefinition-ISiKTerminPriorityExtension.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ISiKTerminPriority",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ISiKTerminPriority",
  "version" : "6.0.0",
  "name" : "ISiKTerminPriority",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-07-01",
  "publisher" : "gematik GmbH",
  "contact" : [{
    "name" : "gematik GmbH",
    "telecom" : [{
      "system" : "url",
      "value" : "https://gematik.de"
    }]
  }],
  "description" : "Enthaelt alle SNOMED Codes, die eine valide Priorität für den ISiKTermin sind",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "709122007",
        "display" : "As soon as possible"
      },
      {
        "code" : "441808003",
        "display" : "Delayed priority"
      },
      {
        "code" : "103390000",
        "display" : "Elective"
      },
      {
        "code" : "25876001",
        "display" : "Emergency"
      },
      {
        "code" : "394849002",
        "display" : "High priority"
      },
      {
        "code" : "88694003",
        "display" : "Immediate"
      },
      {
        "code" : "1251527002",
        "display" : "Low priority"
      },
      {
        "code" : "394848005",
        "display" : "Normal priority"
      },
      {
        "code" : "76561005",
        "display" : "Reclassified"
      },
      {
        "code" : "44408006",
        "display" : "Reclassified and rescheduled"
      },
      {
        "code" : "64695001",
        "display" : "Repeat elective"
      },
      {
        "code" : "21282002",
        "display" : "Repeat emergency"
      },
      {
        "code" : "58334001",
        "display" : "Rescheduled"
      },
      {
        "code" : "50811001",
        "display" : "Routine"
      },
      {
        "code" : "416774000",
        "display" : "Scheduled - priority"
      },
      {
        "code" : "49499008",
        "display" : "Stat"
      },
      {
        "code" : "103391001",
        "display" : "Urgent"
      }]
    }]
  }
}

```
