# ObservationUnitsGFR - ISiK Vitalparameter Implementierungsleitfaden v6.0.0

ISiK Vitalparameter Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ObservationUnitsGFR**

## ValueSet: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ObservationUnitsGFR | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ObservationUnitsGFR |

 
Enthält UCUM-Einheiten für die Observation GFR 

 **References** 

* [ISiKLaboruntersuchungGFR](StructureDefinition-ISiKLaboruntersuchungGFR.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ObservationUnitsGFR",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ObservationUnitsGFR",
  "version" : "6.0.0",
  "name" : "ObservationUnitsGFR",
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
  "description" : "Enthält UCUM-Einheiten für die Observation GFR",
  "compose" : {
    "include" : [{
      "system" : "http://unitsofmeasure.org",
      "concept" : [{
        "code" : "mL/min/(1.73)",
        "display" : "milliliter pro Minute pro Körperoberfläche von 1,73 m2"
      }]
    }]
  }
}

```
