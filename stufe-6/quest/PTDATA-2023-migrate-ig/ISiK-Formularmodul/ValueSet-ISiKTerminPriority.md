# ISiKTerminPriority - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiKTerminPriority**

## ValueSet: ISiKTerminPriority 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ISiKTerminPriority | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKTerminPriority |

 
Enthaelt alle SNOMED Codes, die eine valide Priorität für den ISiKTermin sind 

 **References** 

* [ISiKTerminPriorityExtension](StructureDefinition-ISiKTerminPriorityExtension.md)

### Logical Definition (CLD)

 

### Expansion

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ISiKTerminPriority",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ISiKTerminPriority",
  "version" : "6.0.0-rc",
  "name" : "ISiKTerminPriority",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "publisher" : "gematik GmbH",
  "contact" : [
    {
      "name" : "gematik GmbH",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://gematik.de"
        }
      ]
    }
  ],
  "description" : "Enthaelt alle SNOMED Codes, die eine valide Priorität für den ISiKTermin sind",
  "compose" : {
    "include" : [
      {
        "system" : "http://snomed.info/sct",
        "concept" : [
          {
            "code" : "709122007",
            "display" : "ASAP"
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
          }
        ]
      }
    ]
  }
}

```
