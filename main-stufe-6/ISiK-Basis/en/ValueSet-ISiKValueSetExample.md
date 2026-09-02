# TestValueSet - ISiK Basis Implementierungsleitfaden v6.0.0

ISiK Basis Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TestValueSet**

## ValueSet: (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://example.org/fhir/ValueSet/TestValueSet | *Version*:6.0.0 |
| Active as of 2026-09-02 | *Computable Name*:TestValueSet |
| **Usage**: Clinical Focus: Encounter | |

 **References** 

This value set is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)

### Logical Definition (CLD)

No formal definition provided for this value set

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ISiKValueSetExample",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKValueSet"]
  },
  "url" : "http://example.org/fhir/ValueSet/TestValueSet",
  "version" : "6.0.0",
  "name" : "TestValueSet",
  "status" : "active",
  "experimental" : true,
  "date" : "2026-09-02T11:32:53+00:00",
  "publisher" : "gematik GmbH",
  "contact" : [{
    "name" : "gematik GmbH",
    "telecom" : [{
      "system" : "url",
      "value" : "https://gematik.de"
    }]
  }],
  "useContext" : [{
    "code" : {
      "system" : "http://terminology.hl7.org/CodeSystem/usage-context-type",
      "code" : "focus"
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://hl7.org/fhir/resource-types",
        "code" : "Encounter"
      }]
    }
  }],
  "expansion" : {
    "timestamp" : "2022-03-30",
    "contains" : [{
      "system" : "http://example.org/fhir/CodeSystem/TestKatalog",
      "version" : "1.0.0",
      "code" : "test",
      "display" : "Test"
    }]
  }
}

```
