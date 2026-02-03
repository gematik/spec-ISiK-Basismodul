# ObservationUnitsThrombozyten - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ObservationUnitsThrombozyten**

## ValueSet: ObservationUnitsThrombozyten 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ObservationUnitsThrombozyten | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ObservationUnitsThrombozyten |

 
Enthält UCUM-Einheiten für die Observation Thrombozyten 

 **References** 

* [ISiKLaboruntersuchungThrombozyten](StructureDefinition-ISiKLaboruntersuchungThrombozyten.md)

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
  "id" : "ObservationUnitsThrombozyten",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ObservationUnitsThrombozyten",
  "version" : "6.0.0-rc",
  "name" : "ObservationUnitsThrombozyten",
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
  "description" : "Enthält UCUM-Einheiten für die Observation Thrombozyten",
  "compose" : {
    "include" : [
      {
        "system" : "http://unitsofmeasure.org",
        "concept" : [
          {
            "code" : "10*3/uL",
            "display" : "10^3 per microliter"
          }
        ]
      }
    ]
  }
}

```
