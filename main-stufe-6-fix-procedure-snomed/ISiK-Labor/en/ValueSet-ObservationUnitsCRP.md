# ObservationUnitsCRP - ISiK Labor Implementierungsleitfaden v6.0.0

ISiK Labor Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ObservationUnitsCRP**

## ValueSet: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ObservationUnitsCRP | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ObservationUnitsCRP |

 
Enthält UCUM-Einheiten für die Observation CRP 

 **References** 

* [ISiKLaboruntersuchungCRP](StructureDefinition-ISiKLaboruntersuchungCRP.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ObservationUnitsCRP",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ObservationUnitsCRP",
  "version" : "6.0.0",
  "name" : "ObservationUnitsCRP",
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
  "description" : "Enthält UCUM-Einheiten für die Observation CRP",
  "compose" : {
    "include" : [{
      "system" : "http://unitsofmeasure.org",
      "concept" : [{
        "code" : "mg/L",
        "display" : "milligram per liter"
      },
      {
        "code" : "nmol/L",
        "display" : "nanomol per liter"
      }]
    }]
  }
}

```
