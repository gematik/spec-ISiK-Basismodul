# VS MII ICU Method Observation Blutdruck - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **VS MII ICU Method Observation Blutdruck**

## ValueSet: VS MII ICU Method Observation Blutdruck 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/vs-mii-icu-method-observation-blutdruck | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:VS_MII_ICU_Method_Observation_Blutdruck |

 
Dieses ValueSet enthält Codes zur Angabe, ob ein Blutdruck invasiv oder nicht-invasiv gemessen ist. 

 **References** 

* [SD MII ICU Sonstige pulsatile Druecke Generisch](StructureDefinition-sd-mii-icu-sonstige-pulsatile-druecke-generisch.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "vs-mii-icu-method-observation-blutdruck",
  "url" : "https://gematik.de/fhir/isik/ValueSet/vs-mii-icu-method-observation-blutdruck",
  "version" : "6.0.0",
  "name" : "VS_MII_ICU_Method_Observation_Blutdruck",
  "title" : "VS MII ICU Method Observation Blutdruck",
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
  "description" : "Dieses ValueSet enthält Codes zur Angabe, ob ein Blutdruck invasiv oder nicht-invasiv gemessen ist. ",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "10179008"
      },
      {
        "code" : "22762002"
      }]
    }]
  }
}

```
