# MII VS ICU Category Observation Bilanzen HL7 - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII VS ICU Category Observation Bilanzen HL7**

## ValueSet: MII VS ICU Category Observation Bilanzen HL7 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-category-observation-bilanzen-hl7 | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:MII_VS_ICU_Category_Observation_Bilanzen_HL7 |

 
ValueSet defining HL7 observation categories for ICU Bilanzen 

 **References** 

* [MII PR ICU Bilanz](StructureDefinition-mii-pr-icu-bilanz.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "mii-vs-icu-category-observation-bilanzen-hl7",
  "url" : "https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-category-observation-bilanzen-hl7",
  "version" : "6.0.0",
  "name" : "MII_VS_ICU_Category_Observation_Bilanzen_HL7",
  "title" : "MII VS ICU Category Observation Bilanzen HL7",
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
  "description" : "ValueSet defining HL7 observation categories for ICU Bilanzen",
  "compose" : {
    "include" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
      "version" : "2.0.0",
      "concept" : [{
        "code" : "vital-signs",
        "display" : "Vital-Signs"
      },
      {
        "code" : "exam",
        "display" : "Exam"
      },
      {
        "code" : "therapy",
        "display" : "Therapy"
      }]
    }]
  }
}

```
