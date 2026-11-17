# ObservationUnitsGFR - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ObservationUnitsGFR**

## ValueSet: ObservationUnitsGFR 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ObservationUnitsGFR | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ObservationUnitsGFR |

 
Enthält UCUM-Einheiten für die Observation GFR 

 **References** 

* [ISiKLaboruntersuchungGFR](StructureDefinition-ISiKLaboruntersuchungGFR.md)

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
  "id" : "ObservationUnitsGFR",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ObservationUnitsGFR",
  "version" : "6.0.0-rc",
  "name" : "ObservationUnitsGFR",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "description" : "Enthält UCUM-Einheiten für die Observation GFR",
  "compose" : {
    "include" : [
      {
        "system" : "http://unitsofmeasure.org",
        "concept" : [
          {
            "code" : "mL/min/(1.73)",
            "display" : "milliliter pro Minute pro Körperoberfläche von 1,73 m2"
          }
        ]
      }
    ]
  }
}

```
