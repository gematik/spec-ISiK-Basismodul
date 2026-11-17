# DiagnosesSCT - ISiK Basis Implementierungsleitfaden v6.0.0

ISiK Basis Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **DiagnosesSCT**

## ValueSet: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/DiagnosesSCT | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:DiagnosesSCT |

 
Enthaelt alle SNOMED Clinical finding, Event und Situation with explicit context codes 

 **References** 

* [ISiKDiagnose](StructureDefinition-ISiKDiagnose.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "DiagnosesSCT",
  "url" : "https://gematik.de/fhir/isik/ValueSet/DiagnosesSCT",
  "version" : "6.0.0",
  "name" : "DiagnosesSCT",
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
  "description" : "Enthaelt alle SNOMED Clinical finding, Event und Situation with explicit context codes",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "filter" : [{
        "property" : "concept",
        "op" : "is-a",
        "value" : "404684003"
      }]
    },
    {
      "system" : "http://snomed.info/sct",
      "filter" : [{
        "property" : "concept",
        "op" : "is-a",
        "value" : "272379006"
      }]
    },
    {
      "system" : "http://snomed.info/sct",
      "filter" : [{
        "property" : "concept",
        "op" : "is-a",
        "value" : "243796009"
      }]
    }]
  }
}

```
