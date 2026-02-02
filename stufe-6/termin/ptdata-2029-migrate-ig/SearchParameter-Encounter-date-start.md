# DateStart - ISiK Terminplanung Implementierungsleitfaden v6.0.0-rc

ISiK Terminplanung Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DateStart**

## SearchParameter: DateStart 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/SearchParameter/Encounter-date-start | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:DateStart |

 
The actual start date of the Encounter (Backport from R5). The parameter cannot repeat or have multiple values. 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "Encounter-date-start",
  "url" : "https://gematik.de/fhir/isik/SearchParameter/Encounter-date-start",
  "version" : "6.0.0-rc",
  "name" : "DateStart",
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
