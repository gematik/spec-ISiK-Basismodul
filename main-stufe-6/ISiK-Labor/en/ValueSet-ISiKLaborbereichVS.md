# ISiK Laborbereich - ISiK Labor Implementierungsleitfaden v6.0.0

ISiK Labor Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiK Laborbereich**

## ValueSet: ISiK Laborbereich 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ISiKLaborbereichVS | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKLaborbereichVS |

 
LOINC-Codes zur Kategorisierung von Laboruntersuchungen nach Fachbereichen. 

 **References** 

* [ISiKLaboruntersuchung](StructureDefinition-ISiKLaboruntersuchung.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ISiKLaborbereichVS",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ISiKLaborbereichVS",
  "version" : "6.0.0",
  "name" : "ISiKLaborbereichVS",
  "title" : "ISiK Laborbereich",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-07-01",
  "publisher" : "gematik GmbH",
  "contact" : [{
    "name" : "gematik GmbH",
    "telecom" : [{
      "system" : "url",
      "value" : "https://gematik.de"
    }]
  }],
  "description" : "LOINC-Codes zur Kategorisierung von Laboruntersuchungen nach Fachbereichen.",
  "compose" : {
    "include" : [{
      "system" : "http://loinc.org",
      "concept" : [{
        "code" : "18717-9",
        "display" : "BLOOD BANK STUDIES"
      },
      {
        "code" : "18718-7",
        "display" : "CELL MARKER STUDIES"
      },
      {
        "code" : "18719-5",
        "display" : "CHEMISTRY STUDIES"
      },
      {
        "code" : "18720-3",
        "display" : "COAGULATION STUDIES"
      },
      {
        "code" : "18721-1",
        "display" : "THERAPEUTIC DRUG MONITORING STUDIES"
      },
      {
        "code" : "18722-9",
        "display" : "FERTILITY STUDIES"
      },
      {
        "code" : "18723-7",
        "display" : "HEMATOLOGY STUDIES"
      },
      {
        "code" : "18727-8",
        "display" : "SEROLOGY STUDIES"
      },
      {
        "code" : "18728-6",
        "display" : "TOXICOLOGY STUDIES"
      },
      {
        "code" : "18729-4",
        "display" : "URINALYSIS STUDIES"
      },
      {
        "code" : "18767-4",
        "display" : "BLOOD GAS STUDIES"
      },
      {
        "code" : "18768-2",
        "display" : "CELL COUNTS+DIFFERENTIAL STUDIES"
      },
      {
        "code" : "26436-6",
        "display" : "LABORATORY STUDIES"
      },
      {
        "code" : "26437-4",
        "display" : "CHEMISTRY CHALLENGE STUDIES"
      }]
    }]
  }
}

```
