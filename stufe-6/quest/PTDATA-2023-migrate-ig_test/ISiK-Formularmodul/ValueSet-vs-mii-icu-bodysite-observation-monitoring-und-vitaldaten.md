# VS MII ICU BodySite Observation Monitoring und Vitaldaten - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **VS MII ICU BodySite Observation Monitoring und Vitaldaten**

## ValueSet: VS MII ICU BodySite Observation Monitoring und Vitaldaten 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/vs-mii-icu-bodysite-observation-monitoring-und-vitaldaten | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:VS_MII_ICU_BodySite_Observation_Monitoring_und_Vitaldaten |

 
Dieses ValueSet enthält Codes für bodySites von Vitaldaten sowie Daten aus dem Patientenmonitoring. 

 **References** 

* [SD MII ICU Monitoring und Vitaldaten](StructureDefinition-sd-mii-icu-monitoring-und-vitaldaten.md)

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
  "id" : "vs-mii-icu-bodysite-observation-monitoring-und-vitaldaten",
  "url" : "https://gematik.de/fhir/isik/ValueSet/vs-mii-icu-bodysite-observation-monitoring-und-vitaldaten",
  "version" : "6.0.0-rc",
  "name" : "VS_MII_ICU_BodySite_Observation_Monitoring_und_Vitaldaten",
  "title" : "VS MII ICU BodySite Observation Monitoring und Vitaldaten",
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
  "description" : "Dieses ValueSet enthält Codes für bodySites von Vitaldaten sowie Daten aus dem Patientenmonitoring.",
  "compose" : {
    "include" : [
      {
        "system" : "http://snomed.info/sct",
        "concept" : [
          {
            "code" : "80891009"
          },
          {
            "code" : "81040000"
          },
          {
            "code" : "87878005"
          },
          {
            "code" : "727614001"
          },
          {
            "code" : "123851003"
          },
          {
            "code" : "11527006"
          },
          {
            "code" : "56459004"
          },
          {
            "code" : "85562004"
          },
          {
            "code" : "12738006"
          },
          {
            "code" : "264856002"
          },
          {
            "code" : "277633001"
          },
          {
            "code" : "244387002"
          },
          {
            "code" : "32849002"
          },
          {
            "code" : "244383003"
          },
          {
            "code" : "76752008"
          },
          {
            "code" : "91470000"
          },
          {
            "code" : "122495006"
          },
          {
            "code" : "39352004"
          },
          {
            "code" : "122494005"
          },
          {
            "code" : "89837001"
          },
          {
            "code" : "26893007"
          },
          {
            "code" : "122496007"
          },
          {
            "code" : "74281007"
          },
          {
            "code" : "71836000"
          },
          {
            "code" : "52795006"
          },
          {
            "code" : "42859004"
          },
          {
            "code" : "45206002"
          },
          {
            "code" : "34402009"
          },
          {
            "code" : "76784001"
          },
          {
            "code" : "89187006"
          }
        ]
      }
    ]
  }
}

```
