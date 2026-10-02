# VS MII ICU BodySite Observation Blutdruck - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **VS MII ICU BodySite Observation Blutdruck**

## ValueSet: VS MII ICU BodySite Observation Blutdruck 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/vs-mii-icu-bodysite-observation-blutdruck | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:VS_MII_ICU_BodySite_Observation_Blutdruck |

 
Dieses ValueSet enthält Codes für bodySites von Blutdrücken (pulsatilen Drücken). 

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
  "id" : "vs-mii-icu-bodysite-observation-blutdruck",
  "url" : "https://gematik.de/fhir/isik/ValueSet/vs-mii-icu-bodysite-observation-blutdruck",
  "version" : "6.0.0",
  "name" : "VS_MII_ICU_BodySite_Observation_Blutdruck",
  "title" : "VS MII ICU BodySite Observation Blutdruck",
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
  "description" : "Dieses ValueSet enthält Codes für bodySites von Blutdrücken (pulsatilen Drücken).",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "11527006"
      },
      {
        "code" : "81040000"
      },
      {
        "code" : "264856002"
      },
      {
        "code" : "277633001"
      },
      {
        "code" : "244383003"
      },
      {
        "code" : "244387002"
      }]
    }]
  }
}

```
