# ISiK Accepted Risk - AMTS ISiK Implementierungsleitfaden v6.0.0-rc

AMTS ISiK Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiK Accepted Risk**

## Extension: ISiK Accepted Risk 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKAcceptedRisk | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ExtensionISiKAcceptedRisk |

Extension zur Dokumentation eines im Rahmen der AMTS bewusst eingegangenen Risikos. In diesem Freitext kann die Begründung und ggf. zu treffende besondere Maßnahmen dokumentiert werden.

**Context of Use**

This extension may be used on the following element(s):

* Element ID RiskAssessment
* Element ID MedicationStatement
* Element ID MedicationRequest

**Usage info**

**Usages:**

* Use this Extension: [ISiK AMTS-Bewertung](StructureDefinition-ISiKAMTSBewertung.md), [ISiKMedikationsInformation](StructureDefinition-ISiKMedikationsInformation.md) and [ISiKMedikationsVerordnung](StructureDefinition-ISiKMedikationsVerordnung.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/amts|current/StructureDefinition/ExtensionISiKAcceptedRisk)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ExtensionISiKAcceptedRisk.csv), [Excel](StructureDefinition-ExtensionISiKAcceptedRisk.xlsx), [Schematron](StructureDefinition-ExtensionISiKAcceptedRisk.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ExtensionISiKAcceptedRisk",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKAcceptedRisk",
  "version" : "6.0.0-rc",
  "name" : "ExtensionISiKAcceptedRisk",
  "title" : "ISiK Accepted Risk",
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
  "description" : "Extension zur Dokumentation eines im Rahmen der AMTS bewusst eingegangenen Risikos. In diesem Freitext kann die Begründung und ggf. zu treffende besondere Maßnahmen dokumentiert werden.",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [
    {
      "type" : "element",
      "expression" : "RiskAssessment"
    },
    {
      "type" : "element",
      "expression" : "MedicationStatement"
    },
    {
      "type" : "element",
      "expression" : "MedicationRequest"
    }
  ],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
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
        "fixedUri" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKAcceptedRisk"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "min" : 1,
        "type" : [
          {
            "code" : "string"
          }
        ]
      }
    ]
  }
}

```
