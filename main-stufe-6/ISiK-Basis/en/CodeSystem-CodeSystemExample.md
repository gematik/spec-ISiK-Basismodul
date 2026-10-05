# TestKatalog - ISiK Basis Implementierungsleitfaden v6.0.0

ISiK Basis Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TestKatalog**

## CodeSystem: TestKatalog (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://example.org/fhir/CodeSystem/TestKatalog | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:TestKatalog |

This Code system is referenced in the definition of the following value sets:

* This CodeSystem is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "CodeSystemExample",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKCodeSystem"]
  },
  "url" : "http://example.org/fhir/CodeSystem/TestKatalog",
  "version" : "6.0.0",
  "name" : "TestKatalog",
  "status" : "active",
  "experimental" : true,
  "date" : "2026-07-01",
  "publisher" : "gematik GmbH",
  "contact" : [{
    "name" : "gematik GmbH",
    "telecom" : [{
      "system" : "url",
      "value" : "https://gematik.de"
    }]
  }],
  "caseSensitive" : true,
  "content" : "complete",
  "concept" : [{
    "code" : "test",
    "display" : "Test",
    "definition" : "Dies ist ein Test-Code"
  }]
}

```
