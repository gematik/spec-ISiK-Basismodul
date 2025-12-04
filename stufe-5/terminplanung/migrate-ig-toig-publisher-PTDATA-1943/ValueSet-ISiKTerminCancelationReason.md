# ISiKTerminCancelationReason - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiKTerminCancelationReason**

## ValueSet: ISiKTerminCancelationReason 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ISiKTerminCancelationReason | *Version*:0.0.1 |
| Active as of 2025-10-23 | *Computable Name*:ISiKTerminCancelationReason |

 
Enthaelt alle erlaubten Gruende fuer eine Stornierung eines ISiKTermins 

 **References** 

* [ISiKTermin](StructureDefinition-ISiKTermin.md)

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
  "id" : "ISiKTerminCancelationReason",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ISiKTerminCancelationReason",
  "version" : "0.0.1",
  "name" : "ISiKTerminCancelationReason",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-10-23",
  "description" : "Enthaelt alle erlaubten Gruende fuer eine Stornierung eines ISiKTermins",
  "compose" : {
    "include" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/appointment-cancellation-reason",
        "concept" : [
          {
            "code" : "pat",
            "display" : "Patient"
          },
          {
            "code" : "prov",
            "display" : "Provider"
          },
          {
            "code" : "maint",
            "display" : "Equipment Maintenance/Repair"
          },
          {
            "code" : "meds-inc",
            "display" : "Prep/Med Incomplete"
          },
          {
            "code" : "other",
            "display" : "Other"
          }
        ]
      }
    ]
  }
}

```
