# ISiK Selbstmedikation - ISiK Medikation Implementierungsleitfaden v6.0.0

ISiK Medikation Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artefakte**](artifacts.md)
* **ISiK Selbstmedikation**

## Extension: ISiK Selbstmedikation 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKSelbstmedikation | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ExtensionISiKSelbstmedikation |

Mit dieser Erweiterung kann kenntlich gemacht werden, ob ein Arzneimittel als Selbstmedikation (d. h. ohne ärztliche Verordnung) eingenommen wird. Sie trägt zur vollständigen Erfassung der aktuellen Medikation und zur Erhöhung der Therapiesicherheit bei.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [ISiKMedikationsInformation](StructureDefinition-ISiKMedikationsInformation.md)
* Examples for this Extension: [MedicationStatement/ExampleISiKMedikationsInformation1](MedicationStatement-ExampleISiKMedikationsInformation1.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/medikation|current/StructureDefinition/StructureDefinition-ExtensionISiKSelbstmedikation.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-ExtensionISiKSelbstmedikation.csv), [Excel](../StructureDefinition-ExtensionISiKSelbstmedikation.xlsx), [Schematron](../StructureDefinition-ExtensionISiKSelbstmedikation.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ExtensionISiKSelbstmedikation",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKSelbstmedikation",
  "version" : "6.0.0",
  "name" : "ExtensionISiKSelbstmedikation",
  "title" : "ISiK Selbstmedikation",
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
  "description" : "Mit dieser Erweiterung kann kenntlich gemacht werden, ob ein Arzneimittel als Selbstmedikation (d. h. ohne ärztliche Verordnung) eingenommen wird. Sie trägt zur vollständigen Erfassung der aktuellen Medikation und zur Erhöhung der Therapiesicherheit bei.",
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
      "fixedUri" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKSelbstmedikation"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "boolean"
      }]
    }]
  }
}

```
