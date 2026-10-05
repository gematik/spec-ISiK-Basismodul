# ObservationUnitsTroponin - ISiK Labor Implementierungsleitfaden v6.0.0

ISiK Labor Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ObservationUnitsTroponin**

## ValueSet: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ObservationUnitsTroponin | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ObservationUnitsTroponin |

 
Enthält UCUM-Einheiten für die Observation Troponin 

 **References** 

* [ISiKLaboruntersuchungTroponin](StructureDefinition-ISiKLaboruntersuchungTroponin.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ObservationUnitsTroponin",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ObservationUnitsTroponin",
  "version" : "6.0.0",
  "name" : "ObservationUnitsTroponin",
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
  "description" : "Enthält UCUM-Einheiten für die Observation Troponin",
  "compose" : {
    "include" : [{
      "system" : "http://unitsofmeasure.org",
      "concept" : [{
        "code" : "ng/mL",
        "display" : "nanogram per milliliter"
      },
      {
        "code" : "ug/L",
        "display" : "microgram per liter"
      }]
    }]
  }
}

```
