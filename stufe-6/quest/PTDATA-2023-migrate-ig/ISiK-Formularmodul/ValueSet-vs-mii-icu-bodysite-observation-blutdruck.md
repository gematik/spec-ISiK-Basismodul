# VS MII ICU BodySite Observation Blutdruck - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **VS MII ICU BodySite Observation Blutdruck**

## ValueSet: VS MII ICU BodySite Observation Blutdruck 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/vs-mii-icu-bodysite-observation-blutdruck | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:VS_MII_ICU_BodySite_Observation_Blutdruck |

 
Dieses ValueSet enthält Codes für bodySites von Blutdrücken (pulsatilen Drücken). 

 **References** 

* [SD MII ICU Sonstige pulsatile Druecke Generisch](StructureDefinition-sd-mii-icu-sonstige-pulsatile-druecke-generisch.md)

### Logical Definition (CLD)

 

### Expansion

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "vs-mii-icu-bodysite-observation-blutdruck",
  "url" : "https://gematik.de/fhir/isik/ValueSet/vs-mii-icu-bodysite-observation-blutdruck",
  "version" : "6.0.0-rc",
  "name" : "VS_MII_ICU_BodySite_Observation_Blutdruck",
  "title" : "VS MII ICU BodySite Observation Blutdruck",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "publisher" : "gematik GmbH",
  "contact" : [
    {
      "name" : "gematik GmbH",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://gematik.de"
        }
      ]
    }
  ],
  "description" : "Dieses ValueSet enthält Codes für bodySites von Blutdrücken (pulsatilen Drücken).",
  "compose" : {
    "include" : [
      {
        "system" : "http://snomed.info/sct",
        "concept" : [
          {
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
          }
        ]
      }
    ]
  }
}

```
