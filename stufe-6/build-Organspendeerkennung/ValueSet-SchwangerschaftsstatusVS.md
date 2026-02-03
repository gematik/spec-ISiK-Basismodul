# Schwangerschaftsstatus Valueset - ISiK Organspendeerkennung v0.0.1-rc

ISiK Organspendeerkennung

Version 0.0.1-rc - STU1 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Schwangerschaftsstatus Valueset**

## ValueSet: Schwangerschaftsstatus Valueset 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/SchwangerschaftsstatusVS | *Version*:0.0.1-rc |
| Active as of 2025-12-17 | *Computable Name*:SchwangerschaftsstatusVS |

 **References** 

* [ISiK Schwangerschaftsstatus](StructureDefinition-ISiKSchwangerschaftsstatus.md)

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
  "id" : "SchwangerschaftsstatusVS",
  "url" : "https://gematik.de/fhir/isik/ValueSet/SchwangerschaftsstatusVS",
  "version" : "0.0.1-rc",
  "name" : "SchwangerschaftsstatusVS",
  "title" : "Schwangerschaftsstatus Valueset",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "compose" : {
    "include" : [
      {
        "system" : "http://loinc.org",
        "concept" : [
          {
            "code" : "LA15173-0",
            "display" : "Pregnant"
          },
          {
            "code" : "LA26683-5",
            "display" : "Not pregnant"
          },
          {
            "code" : "LA4489-6",
            "display" : "Unknown"
          }
        ]
      }
    ]
  }
}

```
