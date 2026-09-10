# Stillstatus LOINC Antwortoptionen - ISiK Basis Implementierungsleitfaden v6.0.0

ISiK Basis Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Stillstatus LOINC Antwortoptionen**

## ValueSet: Stillstatus LOINC Antwortoptionen 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/StillstatusVS | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:StillstatusVS |

 
Dieses Valueset enthält die Codes zur Beschreibung von Stillstatus LOINC. 

 **References** 

* [ISiKStillstatus](StructureDefinition-ISiKStillstatus.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "StillstatusVS",
  "url" : "https://gematik.de/fhir/isik/ValueSet/StillstatusVS",
  "version" : "6.0.0",
  "name" : "StillstatusVS",
  "title" : "Stillstatus LOINC Antwortoptionen",
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
  "description" : "Dieses Valueset enthält die Codes zur Beschreibung von Stillstatus LOINC.",
  "compose" : {
    "include" : [{
      "system" : "http://loinc.org",
      "concept" : [{
        "code" : "LA4489-6",
        "display" : "Unknown"
      },
      {
        "code" : "LA29253-4",
        "display" : "Not currently breastfeeding"
      },
      {
        "code" : "LA29252-6",
        "display" : "Currently breastfeeding"
      }]
    }]
  }
}

```
