# EndDate - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **EndDate**

## SearchParameter: EndDate 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/SearchParameter/Encounter-end-date | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:EndDate |

 
The actual end date of the Encounter (Backport from R5). The parameter cannot repeat or have multiple values. 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "Encounter-end-date",
  "url" : "https://gematik.de/fhir/isik/SearchParameter/Encounter-end-date",
  "version" : "6.0.0-rc",
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
