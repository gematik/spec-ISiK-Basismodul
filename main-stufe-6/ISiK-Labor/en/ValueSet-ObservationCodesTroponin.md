# ObservationCodesTroponin - ISiK Labor Implementierungsleitfaden v6.0.0

ISiK Labor Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ObservationCodesTroponin**

## ValueSet: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ObservationCodesTroponin | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ObservationCodesTroponin |

 
Enthält LOINC-Codes für die Observation Troponin 

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
  "id" : "ObservationCodesTroponin",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ObservationCodesTroponin",
  "version" : "6.0.0",
  "name" : "ObservationCodesTroponin",
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
  "description" : "Enthält LOINC-Codes für die Observation Troponin",
  "compose" : {
    "include" : [{
      "system" : "http://loinc.org",
      "concept" : [{
        "code" : "48425-3",
        "display" : "Troponin T.cardiac [Mass/volume] in Blood"
      },
      {
        "code" : "42757-5",
        "display" : "Troponin I.kardial [Masse/Volumen] in Blut"
      },
      {
        "code" : "6597-9",
        "display" : "Troponin T.kardial [Masse/Volumen] in venösem Blut"
      },
      {
        "code" : "10839-9",
        "display" : "Troponin I.kardial [Masse/Volumen] in Serum oder Plasma"
      },
      {
        "code" : "6598-7",
        "display" : "Troponin T.kardial [Masse/Volumen] in Serum oder Plasma"
      },
      {
        "code" : "89579-7",
        "display" : "Troponin I.kardial [Masse/Volumen] in Serum oder Plasma mittels Hochsensitivitätsmethode"
      },
      {
        "code" : "67151-1",
        "display" : "Troponin T.kardial [Masse/Volumen] in Serum oder Plasma mittels Hochsensitivitätsmethode"
      },
      {
        "code" : "49563-0",
        "display" : "Troponin I.kardial [Masse/Volumen] in Serum oder Plasma mittels Nachweisgrenze <= 0,01 ng/mL"
      }]
    }]
  }
}

```
