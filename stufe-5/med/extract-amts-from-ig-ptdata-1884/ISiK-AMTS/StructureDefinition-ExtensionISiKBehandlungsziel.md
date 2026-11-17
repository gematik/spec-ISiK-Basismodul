# ISiK Behandlungsziel - AMTS ISiK Implementierungsleitfaden v6.0.0-rc

AMTS ISiK Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiK Behandlungsziel**

## Extension: ISiK Behandlungsziel 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKBehandlungsziel | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ExtensionISiKBehandlungsziel |

Mit dieser Erweiterung kann das mit einer Medikation angestrebte Behandlungsziel ausführlich dokumentiert werden (z. B. Symptomkontrolle, Heilung, Prävention). Dies unterstützt die individuelle Therapieplanung, die Erfolgskontrolle und die Kommunikation zwischen verschiedenen Leistungserbringern.

**Context of Use**

This extension may be used on the following element(s):

* Element ID MedicationStatement
* Element ID MedicationRequest

**Usage info**

**Usages:**

* Use this Extension: [ISiKMedikationsInformation](StructureDefinition-ISiKMedikationsInformation.md) and [ISiKMedikationsVerordnung](StructureDefinition-ISiKMedikationsVerordnung.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/amts|current/StructureDefinition/ExtensionISiKBehandlungsziel)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ExtensionISiKBehandlungsziel.csv), [Excel](StructureDefinition-ExtensionISiKBehandlungsziel.xlsx), [Schematron](StructureDefinition-ExtensionISiKBehandlungsziel.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ExtensionISiKBehandlungsziel",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKBehandlungsziel",
  "version" : "6.0.0-rc",
  "name" : "ExtensionISiKBehandlungsziel",
  "title" : "ISiK Behandlungsziel",
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
  "description" : "Mit dieser Erweiterung kann das mit einer Medikation angestrebte Behandlungsziel ausführlich dokumentiert werden (z. B. Symptomkontrolle, Heilung, Prävention). Dies unterstützt die individuelle Therapieplanung, die Erfolgskontrolle und die Kommunikation zwischen verschiedenen Leistungserbringern.",
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
        "fixedUri" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKBehandlungsziel"
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
