# DateStart - ISiK Medikation Implementierungsleitfaden v6.0.0

ISiK Medikation Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artefakte**](artifacts.md)
* **DateStart**

## SearchParameter: DateStart 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/SearchParameter/Encounter-date-start | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:DateStart |



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "Encounter-date-start",
  "url" : "https://gematik.de/fhir/isik/SearchParameter/Encounter-date-start",
  "version" : "6.0.0",
  "name" : "DateStart",
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
  "description" : "The actual start date of the Encounter (Backport from R5). The parameter cannot repeat or have multiple values.",
  "code" : "date-start",
  "base" : ["Encounter"],
  "type" : "date",
  "expression" : "Encounter.period.start",
  "comparator" : ["eq",
  "ne",
  "gt",
  "ge",
  "lt",
  "le",
  "sa",
  "eb",
  "ap"]
}

```
