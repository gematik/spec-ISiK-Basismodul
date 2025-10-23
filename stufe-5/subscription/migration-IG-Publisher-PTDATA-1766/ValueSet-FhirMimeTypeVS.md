# FhirMimeTypeVS - Test Implementation Guide v0.0.1

Implementation Guide

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **FhirMimeTypeVS**

## ValueSet: FhirMimeTypeVS 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/FhirMimeTypeVS | *Version*:0.0.1 |
| Active as of 2025-06-26 | *Computable Name*:FhirMimeTypeVS |

 
FHIR Mime Types 

 **References** 

* [ISiK Subscription](StructureDefinition-ISiKSubscription.md)

### Logical Definition (CLD)

 

### Expansion

This value set contains 2 concepts

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
  "id" : "FhirMimeTypeVS",
  "url" : "https://gematik.de/fhir/isik/ValueSet/FhirMimeTypeVS",
  "version" : "0.0.1",
  "name" : "FhirMimeTypeVS",
  "title" : "FhirMimeTypeVS",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-06-26",
  "description" : "FHIR Mime Types",
  "compose" : {
    "include" : [
      {
        "system" : "urn:ietf:bcp:13",
        "concept" : [
          {
            "code" : "application/fhir+json"
          },
          {
            "code" : "application/fhir+xml"
          }
        ]
      }
    ]
  }
}

```
