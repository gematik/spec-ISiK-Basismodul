# ISiKLocationPhysicalType - AMTS ISiK Implementation Guide v0.0.1

AMTS ISiK Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKLocationPhysicalType**

## ValueSet: ISiKLocationPhysicalType 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ISiKLocationPhysicalType | *Version*:0.0.1 |
| Active as of 2025-12-17 | *Computable Name*:ISiKLocationPhysicalType |

 **References** 

* [ISiKKontaktGesundheitseinrichtung](StructureDefinition-ISiKKontaktGesundheitseinrichtung.md)

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
  "id" : "ISiKLocationPhysicalType",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ISiKLocationPhysicalType",
  "version" : "0.0.1",
  "name" : "ISiKLocationPhysicalType",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "compose" : {
    "include" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/location-physical-type",
        "concept" : [
          {
            "code" : "bd",
            "display" : "Bed"
          },
          {
            "code" : "ro",
            "display" : "Room"
          },
          {
            "code" : "wa",
            "display" : "Ward"
          }
        ]
      }
    ]
  }
}

```
