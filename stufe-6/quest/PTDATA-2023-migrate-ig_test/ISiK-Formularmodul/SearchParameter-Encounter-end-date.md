# EndDate - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
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
