# ProzedurenReanimationCodesSCT - ISiK Organspendeerkennung v6.0.0

ISiK Organspendeerkennung

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ProzedurenReanimationCodesSCT**

## ValueSet: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ProzedurenReanimationCodesSCT | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ProzedurenReanimationCodesSCT |

 
Enthaelt alle SNOMED Procedure Codes für Reanimationsmaßnahmen 

 **References** 

* [ISiK Prozedur Reanimation](StructureDefinition-ISiKProzedurReanimation.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ProzedurenReanimationCodesSCT",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ProzedurenReanimationCodesSCT",
  "version" : "6.0.0",
  "name" : "ProzedurenReanimationCodesSCT",
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
  "description" : "Enthaelt alle SNOMED Procedure Codes für Reanimationsmaßnahmen",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "filter" : [{
        "property" : "concept",
        "op" : "descendent-of",
        "value" : "439569004"
      }]
    }]
  }
}

```
