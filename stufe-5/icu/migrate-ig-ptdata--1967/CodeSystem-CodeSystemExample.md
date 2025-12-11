# TestKatalog - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **TestKatalog**

## CodeSystem: TestKatalog 

| | |
| :--- | :--- |
| *Official URL*:http://example.org/fhir/CodeSystem/TestKatalog | *Version*:0.0.1 |
| Active as of 2025-10-23 | *Computable Name*:TestKatalog |

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
  "version" : "0.0.1",
  "name" : "TestKatalog",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-10-23",
  "contact" : [
    {
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://www.gematik.de"
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
