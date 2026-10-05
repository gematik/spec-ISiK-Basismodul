# ISiKMedikationsartVS - AMTS ISiK Implementierungsleitfaden v6.0.0

AMTS ISiK Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKMedikationsartVS**

## ValueSet: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ISiKMedikationsartVS | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKMedikationsartVS |

 
ISiK Therapiearten für Medikation 

 **References** 

* [ISiK Medikationsart](StructureDefinition-ExtensionISiKMedikationsart.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ISiKMedikationsartVS",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ISiKMedikationsartVS",
  "version" : "6.0.0",
  "name" : "ISiKMedikationsartVS",
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
  "description" : "ISiK Therapiearten für Medikation",
  "compose" : {
    "include" : [{
      "system" : "https://gematik.de/fhir/isik/CodeSystem/ISiKMedikationsartCS"
    }]
  }
}

```
