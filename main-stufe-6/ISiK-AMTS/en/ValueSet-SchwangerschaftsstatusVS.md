# Schwangerschaftsstatus Valueset - AMTS ISiK Implementierungsleitfaden v6.0.0

AMTS ISiK Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Schwangerschaftsstatus Valueset**

## ValueSet: Schwangerschaftsstatus Valueset 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/SchwangerschaftsstatusVS | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:SchwangerschaftsstatusVS |

 
Dieses Valueset enthält die Codes zur Beschreibung des Schwangerschaftsstatus einer Patientin. 

 **References** 

* [ISiK Schwangerschaftsstatus](StructureDefinition-ISiKSchwangerschaftsstatus.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "SchwangerschaftsstatusVS",
  "url" : "https://gematik.de/fhir/isik/ValueSet/SchwangerschaftsstatusVS",
  "version" : "6.0.0",
  "name" : "SchwangerschaftsstatusVS",
  "title" : "Schwangerschaftsstatus Valueset",
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
  "description" : "Dieses Valueset enthält die Codes zur Beschreibung des Schwangerschaftsstatus einer Patientin.",
  "compose" : {
    "include" : [{
      "system" : "http://loinc.org",
      "concept" : [{
        "code" : "LA15173-0",
        "display" : "Pregnant"
      },
      {
        "code" : "LA26683-5",
        "display" : "Not pregnant"
      },
      {
        "code" : "LA4489-6",
        "display" : "Unknown"
      }]
    }]
  }
}

```
