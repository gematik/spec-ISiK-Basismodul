# ObservationUnitsHb - ISiK Vitalparameter Implementierungsleitfaden v6.0.0

ISiK Vitalparameter Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ObservationUnitsHb**

## ValueSet: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ObservationUnitsHb | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ObservationUnitsHb |

 
Enthält UCUM-Einheiten für die Observation Hb 

 **References** 

* [ISiKLaboruntersuchungHb](StructureDefinition-ISiKLaboruntersuchungHb.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ObservationUnitsHb",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ObservationUnitsHb",
  "version" : "6.0.0",
  "name" : "ObservationUnitsHb",
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
  "description" : "Enthält UCUM-Einheiten für die Observation Hb",
  "compose" : {
    "include" : [{
      "system" : "http://unitsofmeasure.org",
      "concept" : [{
        "code" : "g/dL",
        "display" : "gram per deciliter"
      },
      {
        "code" : "mmol/L",
        "display" : "millimol per liter"
      }]
    }]
  }
}

```
