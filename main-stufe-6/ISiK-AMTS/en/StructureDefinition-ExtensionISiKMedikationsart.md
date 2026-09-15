# ISiK Medikationsart - AMTS ISiK Implementierungsleitfaden v6.0.0

AMTS ISiK Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiK Medikationsart**

## Extension: ISiK Medikationsart 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKMedikationsart | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ExtensionISiKMedikationsart |

Diese Erweiterung ermöglicht die genaue Angabe der Art der Medikation, beispielsweise ob es sich um eine Dauermedikation, Bedarfsmedikation oder eine situative Medikation handelt. Dies trägt zur besseren Strukturierung von Medikationsplänen und zur eindeutigen Kommunikation über die Medikation bei.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [ISiKMedikationsInformation](StructureDefinition-ISiKMedikationsInformation.md) and [ISiKMedikationsVerordnung](StructureDefinition-ISiKMedikationsVerordnung.md)
* Examples for this Extension: [MedicationRequest/ExampleISiKMedikationsVerordnung](MedicationRequest-ExampleISiKMedikationsVerordnung.md), [MedicationRequest/ExampleISiKMedikationsVerordnungBedarfsmedikation](MedicationRequest-ExampleISiKMedikationsVerordnungBedarfsmedikation.md) and [MedicationStatement/ExampleISiKMedikationsInformation1](MedicationStatement-ExampleISiKMedikationsInformation1.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/amts|current/StructureDefinition/StructureDefinition-ExtensionISiKMedikationsart.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-ExtensionISiKMedikationsart.csv), [Excel](../StructureDefinition-ExtensionISiKMedikationsart.xlsx), [Schematron](../StructureDefinition-ExtensionISiKMedikationsart.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ExtensionISiKMedikationsart",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKMedikationsart",
  "version" : "6.0.0",
  "name" : "ExtensionISiKMedikationsart",
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
  "description" : "Diese Erweiterung ermöglicht die genaue Angabe der Art der Medikation, beispielsweise ob es sich um eine Dauermedikation, Bedarfsmedikation oder eine situative Medikation handelt. Dies trägt zur besseren Strukturierung von Medikationsplänen und zur eindeutigen Kommunikation über die Medikation bei.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "MedicationStatement"
  },
  {
    "type" : "element",
    "expression" : "MedicationRequest"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension"
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKMedikationsart"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "Coding"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/isik/ValueSet/ISiKMedikationsartVS"
      }
    },
    {
      "id" : "Extension.value[x].system",
      "path" : "Extension.value[x].system",
      "min" : 1
    },
    {
      "id" : "Extension.value[x].code",
      "path" : "Extension.value[x].code",
      "min" : 1
    }]
  }
}

```
