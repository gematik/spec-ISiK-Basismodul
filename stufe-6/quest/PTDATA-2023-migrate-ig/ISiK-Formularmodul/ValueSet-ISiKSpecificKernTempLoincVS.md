# ISiK Specific Kerntemperatur LOINC ValueSet - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiK Specific Kerntemperatur LOINC ValueSet**

## ValueSet: ISiK Specific Kerntemperatur LOINC ValueSet 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ISiKSpecificKernTempLoincVS | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKSpecificKernTempLoincVS |

 
ValueSet der spezifischen Körperkerntemperatur LOINC Konzepte 

 **References** 

* [ISiKKoerperkerntemperatur](StructureDefinition-ISiKKoerperkerntemperatur.md)

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
  "id" : "ISiKSpecificKernTempLoincVS",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ISiKSpecificKernTempLoincVS",
  "version" : "6.0.0-rc",
  "name" : "ISiKSpecificKernTempLoincVS",
  "title" : "ISiK Specific Kerntemperatur LOINC ValueSet",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "publisher" : "gematik GmbH",
  "contact" : [
    {
      "name" : "gematik GmbH",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://gematik.de"
        }
      ]
    }
  ],
  "description" : "ValueSet der spezifischen Körperkerntemperatur LOINC Konzepte",
  "compose" : {
    "include" : [
      {
        "system" : "http://loinc.org",
        "concept" : [
          {
            "code" : "8328-7",
            "display" : "Axillary temperature"
          },
          {
            "code" : "60834-9",
            "display" : "Blood temperature"
          },
          {
            "code" : "8334-5",
            "display" : "Body temperature - Urinary bladder"
          },
          {
            "code" : "104063-3",
            "display" : "Body temperature - Groin"
          },
          {
            "code" : "8331-1",
            "display" : "Oral temperature"
          },
          {
            "code" : "8332-9",
            "display" : "Rectal temperature"
          },
          {
            "code" : "60836-4",
            "display" : "Esophageal temperature"
          },
          {
            "code" : "8333-7",
            "display" : "Tympanic membrane temperature"
          }
        ]
      }
    ]
  }
}

```
