# ObservationCodesThrombozyten - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ObservationCodesThrombozyten**

## ValueSet: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ObservationCodesThrombozyten | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ObservationCodesThrombozyten |

 
Enthält LOINC-Codes für die Observation Thrombozyten 

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
  "id" : "ObservationCodesThrombozyten",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ObservationCodesThrombozyten",
  "version" : "6.0.0",
  "name" : "ObservationCodesThrombozyten",
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
  "description" : "Enthält LOINC-Codes für die Observation Thrombozyten",
  "compose" : {
    "include" : [{
      "system" : "http://loinc.org",
      "concept" : [{
        "code" : "13057-5",
        "display" : "Platelets [Units/volume] in Dialysis fluid"
      },
      {
        "code" : "26515-7",
        "display" : "Thrombozyten [#/Volumen] in Blut"
      },
      {
        "code" : "26516-5",
        "display" : "Thrombozyten [#/Volumen] in Plasma"
      },
      {
        "code" : "49497-1",
        "display" : "Thrombozyten [#/Volumen] in Blut mittels Schätzung"
      },
      {
        "code" : "778-1",
        "display" : "Thrombozyten [#/Volumen] in Blut mittels manueller Zählung"
      },
      {
        "code" : "777-3",
        "display" : "Thrombozyten [#/Volumen] in Blut mittels automatisierter Zählung"
      },
      {
        "code" : "13056-7",
        "display" : "Thrombozyten [#/Volumen] in Plasma mittels automatisierter Zählung"
      },
      {
        "code" : "74775-8",
        "display" : "Thrombozyten [#/Volumen] in thrombozytenreichem Plasma mittels automatisierter Zählung"
      },
      {
        "code" : "74464-9",
        "display" : "Thrombozyten [#/Volumen] in Kapillarblut mittels manueller Zählung"
      },
      {
        "code" : "40574-6",
        "display" : "Thrombozyten [#/Volumen] in Körperflüssigkeit mittels automatisierter Zählung"
      }]
    }]
  }
}

```
