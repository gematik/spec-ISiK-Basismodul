# ObservationCodesPCT - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ObservationCodesPCT**

## ValueSet: ObservationCodesPCT 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ObservationCodesPCT | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ObservationCodesPCT |

 
Enthält LOINC-Codes für die Observation PCT 

 **References** 

* [ISiKLaboruntersuchungPCT](StructureDefinition-ISiKLaboruntersuchungPCT.md)

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
  "id" : "ObservationCodesPCT",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ObservationCodesPCT",
  "version" : "6.0.0-rc",
  "name" : "ObservationCodesPCT",
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
  "description" : "Enthält LOINC-Codes für die Observation PCT",
  "compose" : {
    "include" : [
      {
        "system" : "http://loinc.org",
        "concept" : [
          {
            "code" : "33959-8",
            "display" : "Procalcitonin [Masse/Volumen] in Serum oder Plasma"
          },
          {
            "code" : "75241-0",
            "display" : "Procalcitonin [Masse/Volumen] in Serum oder Plasma mittels Immunoassay"
          },
          {
            "code" : "51637-7",
            "display" : "Thrombokrit [Volumenfraktion] in Blut"
          }
        ]
      }
    ]
  }
}

```
