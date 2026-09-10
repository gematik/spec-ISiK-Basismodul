# Medikationslisten-Modes - AMTS ISiK Implementierungsleitfaden v6.0.0

AMTS ISiK Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Medikationslisten-Modes**

## ValueSet: Medikationslisten-Modes 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/MedikationsListeListModeVS | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:MedikationsListeListModeVS |

 
Erlaubte ListModes der ISiK MedikationsListe 

 **References** 

* [ISiK Medikationsliste](StructureDefinition-ISiKMedikationsListe.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "MedikationsListeListModeVS",
  "url" : "https://gematik.de/fhir/isik/ValueSet/MedikationsListeListModeVS",
  "version" : "6.0.0",
  "name" : "MedikationsListeListModeVS",
  "title" : "Medikationslisten-Modes",
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
  "description" : "Erlaubte ListModes der ISiK MedikationsListe",
  "compose" : {
    "include" : [{
      "system" : "http://hl7.org/fhir/list-mode",
      "version" : "4.0.1",
      "concept" : [{
        "code" : "working"
      },
      {
        "code" : "snapshot"
      }]
    }]
  }
}

```
