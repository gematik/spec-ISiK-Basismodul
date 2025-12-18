# DiagnosesSCT - Organspendeerkennung v0.0.1

Organspendeerkennung

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DiagnosesSCT**

## ValueSet: DiagnosesSCT 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/DiagnosesSCT | *Version*:0.0.1 |
| Active as of 2025-12-17 | *Computable Name*:DiagnosesSCT |

 
Enthaelt alle SNOMED Clinical finding, Event und Situation with explicit context codes 

 **References** 

* [ISiKDiagnose](StructureDefinition-ISiKDiagnose.md)

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
  "id" : "DiagnosesSCT",
  "url" : "https://gematik.de/fhir/isik/ValueSet/DiagnosesSCT",
  "version" : "0.0.1",
  "name" : "DiagnosesSCT",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "description" : "Enthaelt alle SNOMED Clinical finding, Event und Situation with explicit context codes",
  "compose" : {
    "include" : [
      {
        "system" : "http://snomed.info/sct",
        "filter" : [
          {
            "property" : "concept",
            "op" : "is-a",
            "value" : "404684003"
          }
        ]
      },
      {
        "system" : "http://snomed.info/sct",
        "filter" : [
          {
            "property" : "concept",
            "op" : "is-a",
            "value" : "272379006"
          }
        ]
      },
      {
        "system" : "http://snomed.info/sct",
        "filter" : [
          {
            "property" : "concept",
            "op" : "is-a",
            "value" : "243796009"
          }
        ]
      }
    ]
  }
}

```
