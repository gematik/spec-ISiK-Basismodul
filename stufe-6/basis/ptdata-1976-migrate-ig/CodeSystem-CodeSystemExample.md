# TestKatalog - Basis Implementation Guide v6.0.0-rc

Basis Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TestKatalog**

## CodeSystem: TestKatalog 

| | |
| :--- | :--- |
| *Official URL*:http://example.org/fhir/CodeSystem/TestKatalog | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:TestKatalog |

 This Code system is referenced in the content logical definition of the following value sets: 

* This CodeSystem is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "CodeSystemExample",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKCodeSystem"
    ]
  },
  "url" : "http://example.org/fhir/CodeSystem/TestKatalog",
  "version" : "6.0.0-rc",
  "name" : "TestKatalog",
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
  "caseSensitive" : true,
  "content" : "complete",
  "concept" : [
    {
      "code" : "test",
      "display" : "Test",
      "definition" : "Dies ist ein Test-Code"
    }
  ]
}

```
