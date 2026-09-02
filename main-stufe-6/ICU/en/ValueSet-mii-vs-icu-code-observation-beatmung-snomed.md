# MII VS ICU Code Observation Beatmung SNOMED - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII VS ICU Code Observation Beatmung SNOMED**

## ValueSet: MII VS ICU Code Observation Beatmung SNOMED 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-code-observation-beatmung-snomed | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:MII_VS_ICU_Code_Observation_Beatmung_SNOMED |

 
Dieses ValueSet enthält Codes für die im Kontext einer Beatmung verwendeten Parameter. 
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
  "id" : "mii-vs-icu-code-observation-beatmung-snomed",
  "url" : "https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-code-observation-beatmung-snomed",
  "version" : "6.0.0",
  "name" : "MII_VS_ICU_Code_Observation_Beatmung_SNOMED",
  "title" : "MII VS ICU Code Observation Beatmung SNOMED",
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
  "description" : "Dieses ValueSet enthält Codes für die im Kontext einer Beatmung verwendeten Parameter.\n\nDie Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 16.03.2026",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "250822000",
        "display" : "Inspiration/expiration time ratio (observable entity)"
      },
      {
        "code" : "416811008",
        "display" : "Tidal volume setting (observable entity)"
      },
      {
        "code" : "250874002",
        "display" : "Ventilator delivered tidal volume (observable entity)"
      },
      {
        "code" : "250816009",
        "display" : "Spontaneous tidal volume (observable entity)"
      },
      {
        "code" : "426102006",
        "display" : "Inspiratory minute volume (observable entity)"
      },
      {
        "code" : "442720002",
        "display" : "Expired oxygen tension (observable entity)"
      },
      {
        "code" : "250823005",
        "display" : "Total dynamic compliance (observable entity)"
      },
      {
        "code" : "250854009",
        "display" : "Positive end expiratory pressure (observable entity)"
      },
      {
        "code" : "250784008",
        "display" : "End tidal carbon dioxide concentration (observable entity)"
      },
      {
        "code" : "250790007",
        "display" : "End tidal carbon dioxide tension (observable entity)"
      },
      {
        "code" : "250875001",
        "display" : "Ventilator delivered minute volume (observable entity)"
      },
      {
        "code" : "250820008",
        "display" : "Expiratory time (observable entity)"
      },
      {
        "code" : "250819002",
        "display" : "Inspiratory time (observable entity)"
      },
      {
        "code" : "27913002",
        "display" : "Maximum inspiratory pressure (observable entity)"
      },
      {
        "code" : "250876000",
        "display" : "Ventilator rate (observable entity)"
      },
      {
        "code" : "698821009",
        "display" : "Mean inspiratory airway pressure (observable entity)"
      },
      {
        "code" : "271625008",
        "display" : "Rate of spontaneous respiration (observable entity)"
      },
      {
        "code" : "250810003",
        "display" : "Total breath rate (observable entity)"
      },
      {
        "code" : "250774007",
        "display" : "Inspired oxygen concentration (observable entity)"
      }]
    }]
  }
}

```
