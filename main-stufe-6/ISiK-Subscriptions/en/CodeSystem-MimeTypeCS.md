# MIME Types (Fragment) - ISiK Subscription Implementierungsleitfaden v6.0.0

ISiK Subscription Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **MIME Types (Fragment)**

## CodeSystem: MIME Types (Fragment) 

| | |
| :--- | :--- |
| *Official URL*:urn:ietf:bcp:13 | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:MimeTypeCS |

 
Fragment des CodeSystems urn:ietf:bcp:13 mit den in ISiK relevanten MIME-Typen. 

This Code system is referenced in the definition of the following value sets:

* [FhirMimeTypeVS](ValueSet-FhirMimeTypeVS.md)

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "MimeTypeCS",
  "url" : "urn:ietf:bcp:13",
  "version" : "6.0.0",
  "name" : "MimeTypeCS",
  "title" : "MIME Types (Fragment)",
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
  "description" : "Fragment des CodeSystems urn:ietf:bcp:13 mit den in ISiK relevanten MIME-Typen.",
  "caseSensitive" : false,
  "content" : "fragment",
  "concept" : [{
    "code" : "application/fhir+xml",
    "display" : "FHIR XML"
  },
  {
    "code" : "application/fhir+json",
    "display" : "FHIR JSON"
  },
  {
    "code" : "application/pdf",
    "display" : "PDF"
  },
  {
    "code" : "image/jpeg",
    "display" : "JPEG"
  }]
}

```
