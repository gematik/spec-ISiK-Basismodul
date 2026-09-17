# ISiK Specific Kerntemperatur LOINC ValueSet - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiK Specific Kerntemperatur LOINC ValueSet**

## ValueSet: ISiK Specific Kerntemperatur LOINC ValueSet 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ISiKSpecificKernTempLoincVS | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKSpecificKernTempLoincVS |

 
ValueSet der spezifischen Körperkerntemperatur LOINC Konzepte 

 **References** 

* [ISiKKoerperkerntemperatur](StructureDefinition-ISiKKoerperkerntemperatur.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ISiKSpecificKernTempLoincVS",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ISiKSpecificKernTempLoincVS",
  "version" : "6.0.0",
  "name" : "ISiKSpecificKernTempLoincVS",
  "title" : "ISiK Specific Kerntemperatur LOINC ValueSet",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-07-01",
  "publisher" : "gematik GmbH",
  "contact" : [{
    "name" : "gematik GmbH",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.gematik.de"
    }]
  }],
  "description" : "ValueSet der spezifischen Körperkerntemperatur LOINC Konzepte",
  "compose" : {
    "include" : [{
      "system" : "http://loinc.org",
      "concept" : [{
        "code" : "8328-7",
        "display" : "Axillary temperature"
      },
      {
        "code" : "60834-9",
        "display" : "Körpertemperatur - gemessen im Blut"
      },
      {
        "code" : "8334-5",
        "display" : "Körpertemperatur - Harnblase"
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
      }]
    }]
  }
}

```
