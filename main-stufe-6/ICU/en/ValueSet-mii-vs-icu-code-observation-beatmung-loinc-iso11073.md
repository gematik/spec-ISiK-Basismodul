# MII VS ICU Code Observation Beatmung ISO11073 - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII VS ICU Code Observation Beatmung ISO11073**

## ValueSet: MII VS ICU Code Observation Beatmung ISO11073 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-code-observation-beatmung-loinc-iso11073 | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:MII_VS_ICU_Code_Observation_Beatmung_ISO11073 |

 
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
  "id" : "mii-vs-icu-code-observation-beatmung-loinc-iso11073",
  "url" : "https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-code-observation-beatmung-loinc-iso11073",
  "version" : "6.0.0",
  "name" : "MII_VS_ICU_Code_Observation_Beatmung_ISO11073",
  "title" : "MII VS ICU Code Observation Beatmung ISO11073",
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
      "system" : "urn:iso:std:iso:11073:10101",
      "concept" : [{
        "code" : "150656",
        "display" : "Oxygenation Ratio"
      },
      {
        "code" : "151586",
        "display" : "Ventilation rate"
      },
      {
        "code" : "152498",
        "display" : "Unassisted spontaneous breath rate; respiration rate"
      },
      {
        "code" : "152490",
        "display" : "Total respiratory rate; total breath rate"
      },
      {
        "code" : "16929632",
        "display" : "Inspiratory time setting"
      },
      {
        "code" : "151832",
        "display" : "Ratio inspiration expiration time"
      },
      {
        "code" : "16929196",
        "display" : "Tidal volume setting"
      },
      {
        "code" : "151980",
        "display" : "Ventilation tidal volume"
      },
      {
        "code" : "152004",
        "display" : "Ventilation inspiratory minute volume"
      },
      {
        "code" : "16929860",
        "display" : "High pressure hold time setting Ventilator"
      },
      {
        "code" : "16929864",
        "display" : "Low pressure hold time setting Ventilator"
      },
      {
        "code" : "151948",
        "display" : "Ventilation inspiratory flow"
      },
      {
        "code" : "151944",
        "display" : "Ventilation expiratory flow"
      },
      {
        "code" : "153132",
        "display" : "Expired oxygen concentration (or partial pressure) in airway gas"
      },
      {
        "code" : "151975",
        "display" : "Mean pressure Respiratory system airway --on ventilator"
      },
      {
        "code" : "151973",
        "display" : "Pressure.max Respiratory system airway --on ventilator"
      },
      {
        "code" : "151692",
        "display" : "Thoracic compliance"
      },
      {
        "code" : "151976",
        "display" : "Applied PEEP"
      },
      {
        "code" : "152720",
        "display" : "Inspiratory airway pressure relative to PEEP or BAP"
      },
      {
        "code" : "151708",
        "display" : "End tidal carbon dioxide concentration (or partial pressure) in airway gas"
      }]
    }]
  }
}

```
