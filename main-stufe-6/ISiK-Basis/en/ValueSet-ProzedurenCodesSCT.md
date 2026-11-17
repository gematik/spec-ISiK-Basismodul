# ProzedurenCodesSCT - ISiK Basis Implementierungsleitfaden v6.0.0

ISiK Basis Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ProzedurenCodesSCT**

## ValueSet: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ProzedurenCodesSCT | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ProzedurenCodesSCT |

 
Enthaelt alle SNOMED Procedure Codes 

 **References** 

* [ISiKProzedur](StructureDefinition-ISiKProzedur.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ProzedurenCodesSCT",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ProzedurenCodesSCT",
  "version" : "6.0.0",
  "name" : "ProzedurenCodesSCT",
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
  "description" : "Enthaelt alle SNOMED Procedure Codes",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "filter" : [{
        "property" : "concept",
        "op" : "descendent-of",
        "value" : "71388002"
      }]
    }]
  }
}

```
