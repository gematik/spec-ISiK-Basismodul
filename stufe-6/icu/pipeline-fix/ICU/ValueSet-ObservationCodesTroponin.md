# ObservationCodesTroponin - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ObservationCodesTroponin**

## ValueSet: ObservationCodesTroponin 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ObservationCodesTroponin | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ObservationCodesTroponin |

 
Enthält LOINC-Codes für die Observation Troponin 

 **References** 

* [ISiKLaboruntersuchungTroponin](StructureDefinition-ISiKLaboruntersuchungTroponin.md)

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
  "id" : "ObservationCodesTroponin",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ObservationCodesTroponin",
  "version" : "6.0.0-rc",
  "name" : "ObservationCodesTroponin",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "description" : "Enthält LOINC-Codes für die Observation Troponin",
  "compose" : {
    "include" : [
      {
        "system" : "http://loinc.org",
        "concept" : [
          {
            "code" : "48425-3",
            "display" : "Troponin T.kardial [Masse/Volumen] in Blut"
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
          }
        ]
      }
    ]
  }
}

```
