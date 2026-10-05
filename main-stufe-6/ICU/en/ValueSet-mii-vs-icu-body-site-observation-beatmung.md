# MII VS ICU BodySite Observation Beatmung - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII VS ICU BodySite Observation Beatmung**

## ValueSet: MII VS ICU BodySite Observation Beatmung 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-body-site-observation-beatmung | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:MII_VS_ICU_BodySite_Observation_Beatmung |

 
Dieses ValueSet enthält Codes für bodySites für die im Kontext einer Beatmung eingestellten oder gemessenen Parametern. 
Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 16.03.2026 

 **References** 

* [MII PR ICU Parameter von Beatmung](StructureDefinition-mii-pr-vent-icu-parameter-von-beatmung.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "mii-vs-icu-body-site-observation-beatmung",
  "url" : "https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-body-site-observation-beatmung",
  "version" : "6.0.0",
  "name" : "MII_VS_ICU_BodySite_Observation_Beatmung",
  "title" : "MII VS ICU BodySite Observation Beatmung",
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
  "description" : "Dieses ValueSet enthält Codes für bodySites für die im Kontext einer Beatmung eingestellten oder gemessenen Parametern.\n\nDie Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 16.03.2026",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "11527006"
      },
      {
        "code" : "89187006"
      },
      {
        "code" : "181216001"
      }]
    }]
  }
}

```
