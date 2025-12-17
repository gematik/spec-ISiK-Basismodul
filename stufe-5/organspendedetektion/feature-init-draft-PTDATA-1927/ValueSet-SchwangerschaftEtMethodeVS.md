# Schwangerschaft Erwarteter Entbindungstermin Methode - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Schwangerschaft Erwarteter Entbindungstermin Methode**

## ValueSet: Schwangerschaft Erwarteter Entbindungstermin Methode 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/SchwangerschaftEtMethodeVS | *Version*:0.0.1 |
| Active as of 2025-12-11 | *Computable Name*:SchwangerschaftEtMethodeVS |

 **References** 

* [ISiK Schwangerschaft - Erwarteter Entbindungstermin](StructureDefinition-ISiKSchwangerschaftErwarteterEntbindungstermin.md)

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
  "id" : "SchwangerschaftEtMethodeVS",
  "url" : "https://gematik.de/fhir/isik/ValueSet/SchwangerschaftEtMethodeVS",
  "version" : "0.0.1",
  "name" : "SchwangerschaftEtMethodeVS",
  "title" : "Schwangerschaft Erwarteter Entbindungstermin Methode",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-11",
  "compose" : {
    "include" : [
      {
        "system" : "http://loinc.org",
        "concept" : [
          {
            "code" : "11778-8",
            "display" : "Delivery date Estimated"
          },
          {
            "code" : "53692-0",
            "display" : "Delivery date Estimated from conception date"
          },
          {
            "code" : "11780-4",
            "display" : "Delivery date Estimated from ovulation date"
          },
          {
            "code" : "57063-0",
            "display" : "Delivery date Estimated from quickening date"
          },
          {
            "code" : "11779-6",
            "display" : "Delivery date Estimated from last menstrual period"
          },
          {
            "code" : "11781-2",
            "display" : "Delivery date US composite estimate"
          },
          {
            "code" : "57064-8",
            "display" : "Delivery date Estimated from date fundal height reaches umb"
          },
          {
            "code" : "90368-2",
            "display" : "Delivery date Estimated from physical exam"
          }
        ]
      }
    ]
  }
}

```
