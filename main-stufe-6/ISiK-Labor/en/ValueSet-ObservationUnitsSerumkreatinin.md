# ObservationUnitsSerumkreatinin - ISiK Labor Implementierungsleitfaden v6.0.0

ISiK Labor Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ObservationUnitsSerumkreatinin**

## ValueSet: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ObservationUnitsSerumkreatinin | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ObservationUnitsSerumkreatinin |

 
Enthält UCUM-Einheiten für die Observation Serumkreatinin 

 **References** 

* [ISiKLaboruntersuchungSerumkreatinin](StructureDefinition-ISiKLaboruntersuchungSerumkreatinin.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ObservationUnitsSerumkreatinin",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ObservationUnitsSerumkreatinin",
  "version" : "6.0.0",
  "name" : "ObservationUnitsSerumkreatinin",
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
  "description" : "Enthält UCUM-Einheiten für die Observation Serumkreatinin",
  "compose" : {
    "include" : [{
      "system" : "http://unitsofmeasure.org",
      "concept" : [{
        "code" : "mg/dL",
        "display" : "milligram per deciliter"
      },
      {
        "code" : "umol/L",
        "display" : "micromol per liter"
      }]
    }]
  }
}

```
