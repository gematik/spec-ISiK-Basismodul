# VS MII ICU Code Monitoring und Vitaldaten [sct] - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **VS MII ICU Code Monitoring und Vitaldaten [sct]**

## ValueSet: VS MII ICU Code Monitoring und Vitaldaten [sct] 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/vs-mii-icu-code-monitoring-und-vitaldaten-snomed | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:VS_MII_ICU_Code_Monitoring_und_Vitaldaten_SNOMED |

 
Dieses ValueSet enthaelt Codes fuer Vitaldaten sowie Daten aus dem Patientenmonitoring. 

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
  "id" : "vs-mii-icu-code-monitoring-und-vitaldaten-snomed",
  "url" : "https://gematik.de/fhir/isik/ValueSet/vs-mii-icu-code-monitoring-und-vitaldaten-snomed",
  "version" : "6.0.0-rc",
  "name" : "VS_MII_ICU_Code_Monitoring_und_Vitaldaten_SNOMED",
  "title" : "VS MII ICU Code Monitoring und Vitaldaten [sct]",
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
  "description" : "Dieses ValueSet enthaelt Codes fuer Vitaldaten sowie Daten aus dem Patientenmonitoring.",
  "compose" : {
    "include" : [
      {
        "system" : "http://snomed.info/sct",
        "concept" : [
          {
            "code" : "364075005",
            "display" : "Heart rate"
          },
          {
            "code" : "75367002",
            "display" : "Blood pressure"
          },
          {
            "code" : "271649006",
            "display" : "Systolic blood pressure"
          },
          {
            "code" : "6797001",
            "display" : "Mean blood pressure"
          },
          {
            "code" : "271650006",
            "display" : "Diastolic blood pressure"
          },
          {
            "code" : "71420008",
            "display" : "Central venous pressure"
          },
          {
            "code" : "118433006",
            "display" : "Pulmonary artery wedge pressure"
          },
          {
            "code" : "82799009",
            "display" : "Cardiac output"
          },
          {
            "code" : "54993008",
            "display" : "Cardiac index"
          },
          {
            "code" : "276900001",
            "display" : "Systemic vascular Resistance index"
          },
          {
            "code" : "276902009",
            "display" : "Pulmonary vascular Resistance index"
          },
          {
            "code" : "90096001",
            "display" : "Stroke volume"
          },
          {
            "code" : "277381004",
            "display" : "Stroke index"
          },
          {
            "code" : "276885007",
            "display" : "Core body temperature"
          },
          {
            "code" : "250844005",
            "display" : "Intracranial pressure"
          },
          {
            "code" : "27113001",
            "display" : "Body weight"
          },
          {
            "code" : "170804003",
            "display" : "Ideal body weight"
          },
          {
            "code" : "1153637007",
            "display" : "Body height"
          },
          {
            "code" : "1153605006",
            "display" : "Body height for age percentile"
          },
          {
            "code" : "1153592008",
            "display" : "Weight for age percentile"
          },
          {
            "code" : "415974002",
            "display" : "Core body temperature measured at tympanic membrane"
          },
          {
            "code" : "307047009",
            "display" : "Core body temperature measured in rectum"
          },
          {
            "code" : "431598003",
            "display" : "Core body temperature measured in esophagus"
          },
          {
            "code" : "698831002",
            "display" : "Core body temperature measured in nasopharynx"
          },
          {
            "code" : "698832009",
            "display" : "Core body temperature measured at urinary bladder"
          },
          {
            "code" : "364246006",
            "display" : "Core body temperature measured vaginally"
          },
          {
            "code" : "415882003",
            "display" : "Estimated core body temperature measured in axillary region"
          },
          {
            "code" : "415945006",
            "display" : "Estimated core body temperature measured in sublingual space"
          },
          {
            "code" : "415929009",
            "display" : "Estimated core body temperature measured in inguinal region"
          },
          {
            "code" : "1222808002",
            "display" : "Core body temperature measured in blood"
          },
          {
            "code" : "248835004",
            "display" : "Temperature of breast"
          },
          {
            "code" : "364419004",
            "display" : "Temperature of cervical spine"
          },
          {
            "code" : "415922000",
            "display" : "Temperature of forehead"
          },
          {
            "code" : "250124002",
            "display" : "Temperature of joint"
          },
          {
            "code" : "364429006",
            "display" : "Temperature of lumbar spine"
          },
          {
            "code" : "364424001",
            "display" : "Temperature of thoracic spine"
          },
          {
            "code" : "8499008",
            "display" : "Pulse, function"
          },
          {
            "code" : "442476006",
            "display" : "Arterial oxygen saturation"
          },
          {
            "code" : "364090009",
            "display" : "Systemic arterial pressure"
          }
        ]
      }
    ]
  }
}

```
