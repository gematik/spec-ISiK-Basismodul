# ISiK Medikationsart - ISiK Medikation Implementierungsleitfaden v6.0.0

ISiK Medikation Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artefakte**](artifacts.md)
* **ISiK Medikationsart**

## CodeSystem: ISiK Medikationsart 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/CodeSystem/ISiKMedikationsartCS | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKMedikationsartCS |

 
ISiK Therapiearten für Medikation 

This Code system is referenced in the definition of the following value sets:

* [ISiKMedikationsartVS](ValueSet-ISiKMedikationsartVS.md)

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "ISiKMedikationsartCS",
  "language" : "de-DE",
  "url" : "https://gematik.de/fhir/isik/CodeSystem/ISiKMedikationsartCS",
  "version" : "6.0.0",
  "name" : "ISiKMedikationsartCS",
  "title" : "ISiK Medikationsart",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-07-01",
  "publisher" : "gematik GmbH",
  "contact" : [{
    "name" : "gematik GmbH",
    "telecom" : [{
      "system" : "url",
      "value" : "https://gematik.de"
    }]
  }],
  "description" : "ISiK Therapiearten für Medikation",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 2,
  "concept" : [{
    "code" : "akut",
    "display" : "Akutmedikation"
  },
  {
    "code" : "dauer",
    "display" : "Dauermedikation"
  }]
}

```
