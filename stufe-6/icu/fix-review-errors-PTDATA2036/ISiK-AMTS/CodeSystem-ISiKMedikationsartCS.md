# ISiK Medikationsart - AMTS ISiK Implementierungsleitfaden v6.0.0-rc

AMTS ISiK Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiK Medikationsart**

## CodeSystem: ISiK Medikationsart 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/CodeSystem/ISiKMedikationsartCS | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKMedikationsartCS |

 
ISiK Therapiearten für Medikation 

 This Code system is referenced in the content logical definition of the following value sets: 

* [ISiKMedikationsartVS](ValueSet-ISiKMedikationsartVS.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "ISiKMedikationsartCS",
  "url" : "https://gematik.de/fhir/isik/CodeSystem/ISiKMedikationsartCS",
  "version" : "6.0.0-rc",
  "name" : "ISiKMedikationsartCS",
  "title" : "ISiK Medikationsart",
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
  "description" : "ISiK Therapiearten für Medikation",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 2,
  "concept" : [
    {
      "code" : "akut",
      "display" : "Akutmedikation"
    },
    {
      "code" : "dauer",
      "display" : "Dauermedikation"
    }
  ]
}

```
