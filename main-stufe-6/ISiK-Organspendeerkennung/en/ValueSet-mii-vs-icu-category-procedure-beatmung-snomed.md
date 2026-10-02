# MII VS ICU Category Procedure Beatmung SNOMED - ISiK Organspendeerkennung v6.0.0

ISiK Organspendeerkennung

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **MII VS ICU Category Procedure Beatmung SNOMED**

## ValueSet: MII VS ICU Category Procedure Beatmung SNOMED 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-category-procedure-beatmung-snomed | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:MII_VS_ICU_Category_Procedure_Beatmung_SNOMED |

 
Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets/MII_VS_ICU_Category_Beatmung_SNOMED.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 04.03.2026 

 **References** 

* [ISiK Prozedur Beatmung](StructureDefinition-ISiKProzedurBeatmung.md)
* [MII PR ICU Parameter von Beatmung](StructureDefinition-mii-pr-vent-icu-parameter-von-beatmung.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "mii-vs-icu-category-procedure-beatmung-snomed",
  "url" : "https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-category-procedure-beatmung-snomed",
  "version" : "6.0.0",
  "name" : "MII_VS_ICU_Category_Procedure_Beatmung_SNOMED",
  "title" : "MII VS ICU Category Procedure Beatmung SNOMED",
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
  "description" : "Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets/MII_VS_ICU_Category_Beatmung_SNOMED.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 04.03.2026",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "40617009",
        "display" : "Künstliche Beatmung"
      },
      {
        "code" : "57485005",
        "display" : "Oxygen therapy (procedure)"
      }]
    }]
  }
}

```
