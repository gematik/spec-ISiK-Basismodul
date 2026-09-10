# ProzedurenReanimationCodesOPS - ISiK Organspendeerkennung v6.0.0

ISiK Organspendeerkennung

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ProzedurenReanimationCodesOPS**

## ValueSet: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ProzedurenReanimationCodesOPS | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ProzedurenReanimationCodesOPS |

 
Enthaelt alle OPS Procedure Codes für Reanimationsmaßnahmen 

 **References** 

* [ISiK Prozedur Reanimation](StructureDefinition-ISiKProzedurReanimation.md)

### Logical Definition (CLD)

 

### Expansion

No Expansion for this valueset (Unknown Code System)

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ProzedurenReanimationCodesOPS",
  "language" : "de-DE",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ProzedurenReanimationCodesOPS",
  "version" : "6.0.0",
  "name" : "ProzedurenReanimationCodesOPS",
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
  "description" : "Enthaelt alle OPS Procedure Codes für Reanimationsmaßnahmen",
  "compose" : {
    "include" : [{
      "system" : "http://fhir.de/CodeSystem/bfarm/ops",
      "concept" : [{
        "code" : "8-771",
        "display" : "Kardiale oder kardiopulmonale Reanimation"
      },
      {
        "code" : "8-772",
        "display" : "Operative Reanimation"
      },
      {
        "code" : "8-779",
        "display" : "Andere Reanimationsmaßnahmen"
      }]
    }]
  }
}

```
