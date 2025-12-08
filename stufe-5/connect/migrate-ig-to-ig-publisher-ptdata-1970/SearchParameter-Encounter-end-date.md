# EndDate - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **EndDate**

## SearchParameter: EndDate 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/SearchParameter/Encounter-end-date | *Version*:0.0.1 |
| Active as of 2025-10-23 | *Computable Name*:EndDate |

 
The actual end date of the Encounter (Backport from R5). The parameter cannot repeat or have multiple values. 

## EndDate

Parameter `end-date`:`date`

The actual end date of the Encounter (Backport from R5). The parameter cannot repeat or have multiple values.

| | |
| :--- | :--- |
| Resource | [Encounter](http://hl7.org/fhir/R4/encounter.html) |
| Expression | `Encounter.period.end` |
| Multiples | * multipleAnd: It's up to the server whether the parameter may repeat in order to specify multiple values that must all be true
* multipleOr: It's up to the server whether the parameter can have multiple values (separated by comma) where at least one must be true
 |
| Comparators | Allowed: eq, ne, gt, ge, lt, le, sa, eb, ap |



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
  "date" : "2025-10-23",
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
