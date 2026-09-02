# MII VS ICU Score RASS - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII VS ICU Score RASS**

## ValueSet: MII VS ICU Score RASS 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-score-rass | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:MII_VS_ICU_Score_RASS |

 
Value set for RASS Score 
Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets/MII_VS_ICU_Score_RASS.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 3.3.2026 

 **References** 

* [MII PR ICU Score RASS](StructureDefinition-mii-pr-icu-score-rass.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "mii-vs-icu-score-rass",
  "url" : "https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-score-rass",
  "version" : "6.0.0",
  "name" : "MII_VS_ICU_Score_RASS",
  "title" : "MII VS ICU Score RASS",
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
  "description" : "Value set for RASS Score\n\nDie Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets/MII_VS_ICU_Score_RASS.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 3.3.2026",
  "compose" : {
    "include" : [{
      "system" : "http://loinc.org",
      "concept" : [{
        "code" : "LA17287-6",
        "display" : "Combative"
      },
      {
        "code" : "LA33959-0",
        "display" : "Very agitated +3"
      },
      {
        "code" : "LA33960-8",
        "display" : "Agitated +2"
      },
      {
        "code" : "LA16474-1",
        "display" : "Restless +1"
      },
      {
        "code" : "LA33962-4",
        "display" : "Alert and calm 0"
      },
      {
        "code" : "LA33963-2",
        "display" : "Drowsy -1"
      },
      {
        "code" : "LA33964-0",
        "display" : "Light sedation -2"
      },
      {
        "code" : "LA33965-7",
        "display" : "Moderate sedation -3"
      },
      {
        "code" : "LA33966-5",
        "display" : "Deep sedation -4"
      },
      {
        "code" : "LA33967-3",
        "display" : "Unarousable -5"
      }]
    }]
  }
}

```
