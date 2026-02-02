# ObservationCodesThrombozyten - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ObservationCodesThrombozyten**

## ValueSet: ObservationCodesThrombozyten 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ObservationCodesThrombozyten | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ObservationCodesThrombozyten |

 
Enthält LOINC-Codes für die Observation Thrombozyten 

 **References** 

* [ISiKLaboruntersuchungThrombozyten](StructureDefinition-ISiKLaboruntersuchungThrombozyten.md)

### Logical Definition (CLD)

 

### Expansion

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ObservationCodesThrombozyten",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ObservationCodesThrombozyten",
  "version" : "6.0.0-rc",
  "name" : "ObservationCodesThrombozyten",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "description" : "Enthält LOINC-Codes für die Observation Thrombozyten",
  "compose" : {
    "include" : [
      {
        "system" : "http://loinc.org",
        "concept" : [
          {
            "code" : "13057-5",
            "display" : "Thrombozyten [Einheiten/Volumen] in Dialysat"
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
          }
        ]
      }
    ]
  }
}

```
