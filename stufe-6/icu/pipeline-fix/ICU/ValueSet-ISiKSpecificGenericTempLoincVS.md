# ISiK Specific Generische Koerpertemperatur LOINC Konzepte - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiK Specific Generische Koerpertemperatur LOINC Konzepte**

## ValueSet: ISiK Specific Generische Koerpertemperatur LOINC Konzepte 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ISiKSpecificGenericTempLoincVS | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKSpecificGenericTempLoincVS |

 
ValueSet der spezifischen generischen Körperkerntemperatur LOINC Konzepte die nicht dazu dienen eine Körperkerntemperatur zu messen 

 **References** 

* [SD MII ICU Koerpertemperatur Generisch](StructureDefinition-sd-mii-icu-koerpertemperatur-generisch.md)

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
  "id" : "ISiKSpecificGenericTempLoincVS",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ISiKSpecificGenericTempLoincVS",
  "version" : "6.0.0-rc",
  "name" : "ISiKSpecificGenericTempLoincVS",
  "title" : "ISiK Specific Generische Koerpertemperatur LOINC Konzepte",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "description" : "ValueSet der spezifischen generischen Körperkerntemperatur LOINC Konzepte die nicht dazu dienen eine Körperkerntemperatur zu messen",
  "compose" : {
    "include" : [
      {
        "system" : "http://loinc.org",
        "concept" : [
          {
            "code" : "60955-2",
            "display" : "Airway temperature"
          },
          {
            "code" : "61009-7",
            "display" : "Myocardial temperature"
          },
          {
            "code" : "76010-8",
            "display" : "Nasal temperature"
          },
          {
            "code" : "60838-0",
            "display" : "Nasopharyngeal temperature"
          }
        ]
      }
    ]
  }
}

```
