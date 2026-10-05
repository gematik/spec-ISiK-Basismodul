# ObservationUnitsTSH - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ObservationUnitsTSH**

## ValueSet: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ObservationUnitsTSH | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ObservationUnitsTSH |

 
Enthält UCUM-Einheiten für die Observation TSH 

 **References** 

* [ISiKLaboruntersuchungTSH](StructureDefinition-ISiKLaboruntersuchungTSH.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ObservationUnitsTSH",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ObservationUnitsTSH",
  "version" : "6.0.0",
  "name" : "ObservationUnitsTSH",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-07-01",
  "publisher" : "gematik GmbH",
  "contact" : [{
    "name" : "gematik GmbH",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.gematik.de"
    }]
  }],
  "description" : "Enthält UCUM-Einheiten für die Observation TSH",
  "compose" : {
    "include" : [{
      "system" : "http://unitsofmeasure.org",
      "concept" : [{
        "code" : "m[IU]/L",
        "display" : "milli IU per liter"
      },
      {
        "code" : "u[IU]/mL",
        "display" : "micro IU per milliliter"
      }]
    }]
  }
}

```
