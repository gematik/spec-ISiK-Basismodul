# ObservationUnitsThrombozyten - AMTS ISiK Implementierungsleitfaden v6.0.0

AMTS ISiK Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ObservationUnitsThrombozyten**

## ValueSet: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ObservationUnitsThrombozyten | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ObservationUnitsThrombozyten |

 
Enthält UCUM-Einheiten für die Observation Thrombozyten 

 **References** 

* [ISiKLaboruntersuchungThrombozyten](StructureDefinition-ISiKLaboruntersuchungThrombozyten.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ObservationUnitsThrombozyten",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ObservationUnitsThrombozyten",
  "version" : "6.0.0",
  "name" : "ObservationUnitsThrombozyten",
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
  "description" : "Enthält UCUM-Einheiten für die Observation Thrombozyten",
  "compose" : {
    "include" : [{
      "system" : "http://unitsofmeasure.org",
      "concept" : [{
        "code" : "10*3/uL",
        "display" : "10^3 per microliter"
      }]
    }]
  }
}

```
