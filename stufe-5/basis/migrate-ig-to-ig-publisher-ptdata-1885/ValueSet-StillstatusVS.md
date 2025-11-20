# Stillstatus LOINC Antwortoptionen - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stillstatus LOINC Antwortoptionen**

## ValueSet: Stillstatus LOINC Antwortoptionen 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/StillstatusVS | *Version*:0.0.1 |
| Active as of 2025-10-23 | *Computable Name*:StillstatusVS |

 
Dieses Valueset enthält die Codes zur Beschreibung von Stillstatus LOINC. 

 **References** 

* [ISiKStillstatus](StructureDefinition-ISiKStillstatus.md)

### Logical Definition (CLD)

 

### Expansion

Expansion from tx.fhir.org based on Loinc v2.81

This value set contains 3 concepts

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
  "id" : "StillstatusVS",
  "url" : "https://gematik.de/fhir/isik/ValueSet/StillstatusVS",
  "version" : "0.0.1",
  "name" : "StillstatusVS",
  "title" : "Stillstatus LOINC Antwortoptionen",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-10-23",
  "description" : "Dieses Valueset enthält die Codes zur Beschreibung von Stillstatus LOINC.",
  "compose" : {
    "include" : [
      {
        "system" : "http://loinc.org",
        "concept" : [
          {
            "code" : "LA4489-6",
            "display" : "Unknown"
          },
          {
            "code" : "LA29253-4",
            "display" : "Not currently breastfeeding"
          },
          {
            "code" : "LA29252-6",
            "display" : "Currently breastfeeding"
          }
        ]
      }
    ]
  }
}

```
