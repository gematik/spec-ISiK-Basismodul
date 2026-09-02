# FhirMimeTypeVS - ISiK Terminplanung Implementierungsleitfaden v6.0.0

ISiK Terminplanung Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **FhirMimeTypeVS**

## ValueSet: FhirMimeTypeVS 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/FhirMimeTypeVS | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:FhirMimeTypeVS |

 
FHIR Mime Types 

 **References** 

* [ISiK Subscription](StructureDefinition-ISiKSubscription.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "FhirMimeTypeVS",
  "url" : "https://gematik.de/fhir/isik/ValueSet/FhirMimeTypeVS",
  "version" : "6.0.0",
  "name" : "FhirMimeTypeVS",
  "title" : "FhirMimeTypeVS",
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
  "description" : "FHIR Mime Types",
  "compose" : {
    "include" : [{
      "system" : "urn:ietf:bcp:13",
      "concept" : [{
        "code" : "application/fhir+json"
      },
      {
        "code" : "application/fhir+xml"
      }]
    }]
  }
}

```
