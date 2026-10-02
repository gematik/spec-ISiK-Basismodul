# ISiKConfidentialityCodes - ISiK Dokumentenaustausch Implementierungsleitfaden v6.0.0

ISiK Dokumentenaustausch Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiKConfidentialityCodes**

## ValueSet: ISiKConfidentialityCodes 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ISiKConfidentialityCodes | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKConfidentialityCodes |

 
Vertraulichkeitsstufen 

 **References** 

* [Erforderliche Metadaten für Dokumentenaustausch in ISiK](StructureDefinition-ISiKDokumentenMetadaten.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ISiKConfidentialityCodes",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ISiKConfidentialityCodes",
  "version" : "6.0.0",
  "name" : "ISiKConfidentialityCodes",
  "title" : "ISiKConfidentialityCodes",
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
  "description" : "Vertraulichkeitsstufen",
  "compose" : {
    "include" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v3-Confidentiality",
      "version" : "5.0.0",
      "concept" : [{
        "code" : "N",
        "display" : "normal"
      },
      {
        "code" : "R",
        "display" : "restricted"
      },
      {
        "code" : "V",
        "display" : "very restricted"
      }]
    }]
  }
}

```
