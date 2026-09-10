# ISiK Specific Generische Koerpertemperatur LOINC Konzepte - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiK Specific Generische Koerpertemperatur LOINC Konzepte**

## ValueSet: ISiK Specific Generische Koerpertemperatur LOINC Konzepte 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ISiKSpecificGenericTempLoincVS | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKSpecificGenericTempLoincVS |

 
ValueSet der spezifischen generischen Körperkerntemperatur LOINC Konzepte die nicht dazu dienen eine Körperkerntemperatur zu messen 

 **References** 

* [SD MII ICU Koerpertemperatur Generisch](StructureDefinition-sd-mii-icu-koerpertemperatur-generisch.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ISiKSpecificGenericTempLoincVS",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ISiKSpecificGenericTempLoincVS",
  "version" : "6.0.0",
  "name" : "ISiKSpecificGenericTempLoincVS",
  "title" : "ISiK Specific Generische Koerpertemperatur LOINC Konzepte",
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
  "description" : "ValueSet der spezifischen generischen Körperkerntemperatur LOINC Konzepte die nicht dazu dienen eine Körperkerntemperatur zu messen",
  "compose" : {
    "include" : [{
      "system" : "http://loinc.org",
      "concept" : [{
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
      }]
    }]
  }
}

```
