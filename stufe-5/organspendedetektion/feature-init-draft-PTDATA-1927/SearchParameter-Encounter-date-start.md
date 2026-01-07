# DateStart - Organspendeerkennung v0.0.1-rc

Organspendeerkennung

Version 0.0.1-rc - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DateStart**

## SearchParameter: DateStart 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/SearchParameter/Encounter-date-start | *Version*:0.0.1-rc |
| Active as of 2025-12-17 | *Computable Name*:DateStart |

 
The actual start date of the Encounter (Backport from R5). The parameter cannot repeat or have multiple values. 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "Encounter-date-start",
  "url" : "https://gematik.de/fhir/isik/SearchParameter/Encounter-date-start",
  "version" : "0.0.1-rc",
  "name" : "DateStart",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "contact" : [
    {
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://www.gematik.de"
        }
      ]
    }
  ],
  "description" : "The actual start date of the Encounter (Backport from R5). The parameter cannot repeat or have multiple values.",
  "code" : "date-start",
  "base" : ["Encounter"],
  "type" : "date",
  "expression" : "Encounter.period.start",
  "comparator" : [
    "eq",
    "ne",
    "gt",
    "ge",
    "lt",
    "le",
    "sa",
    "eb",
    "ap"
  ]
}

```
