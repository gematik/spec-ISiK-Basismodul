# SctRouteOfAdministration - ISiK Medikation Implementierungsleitfaden v6.0.0-rc

ISiK Medikation Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artefakte**](artifacts.md)
* **SctRouteOfAdministration**

## ValueSet: SctRouteOfAdministration 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/SctRouteOfAdministration | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:SctRouteOfAdministration |

 
Enthaelt alle SNOMED CT Administrationsarten 

 **References** 

* [ISiKMedikationsInformation](StructureDefinition-ISiKMedikationsInformation.md)

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
  "id" : "SctRouteOfAdministration",
  "url" : "https://gematik.de/fhir/isik/ValueSet/SctRouteOfAdministration",
  "version" : "6.0.0-rc",
  "name" : "SctRouteOfAdministration",
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
  "description" : "Enthaelt alle SNOMED CT Administrationsarten",
  "compose" : {
    "include" : [
      {
        "system" : "http://snomed.info/sct",
        "filter" : [
          {
            "property" : "concept",
            "op" : "is-a",
            "value" : "284009009"
          }
        ]
      }
    ]
  }
}

```
