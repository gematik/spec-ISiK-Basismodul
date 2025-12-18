# EndDate - Organspendeerkennung v0.0.1

Organspendeerkennung

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **EndDate**

## SearchParameter: EndDate 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/SearchParameter/Encounter-end-date | *Version*:0.0.1 |
| Active as of 2025-12-17 | *Computable Name*:EndDate |

 
The actual end date of the Encounter (Backport from R5). The parameter cannot repeat or have multiple values. 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "Encounter-end-date",
  "url" : "https://gematik.de/fhir/isik/SearchParameter/Encounter-end-date",
  "version" : "0.0.1",
  "name" : "EndDate",
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
  "description" : "The actual end date of the Encounter (Backport from R5). The parameter cannot repeat or have multiple values.",
  "code" : "end-date",
  "base" : ["Encounter"],
  "type" : "date",
  "expression" : "Encounter.period.end",
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
