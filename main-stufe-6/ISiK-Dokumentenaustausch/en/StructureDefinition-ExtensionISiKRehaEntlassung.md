# ExtensionISiKRehaEntlassung - ISiK Dokumentenaustausch Implementierungsleitfaden v6.0.0

ISiK Dokumentenaustausch Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ExtensionISiKRehaEntlassung**

## Extension: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKRehaEntlassung | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ExtensionISiKRehaEntlassung |

Extension zur Dokumentation von Informationen nach §301 (4 und 4a) SGB V, entsprechend dem ärztliche Reha-Entlassungsbericht. Mit dieser Extension können spezifische Entlassungsinformationen im Kontext einer Rehabilitationsmaßnahme angegeben werden. Dies ist besonders relevant für Einrichtungen, die Leistungen im Bereich Rehabilitation erbringen, und unterstützt die strukturierte Kommunikation im Entlassmanagement.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [ISiKKontaktGesundheitseinrichtung](StructureDefinition-ISiKKontaktGesundheitseinrichtung.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/dokumentenaustausch|current/StructureDefinition/StructureDefinition-ExtensionISiKRehaEntlassung.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-ExtensionISiKRehaEntlassung.csv), [Excel](../StructureDefinition-ExtensionISiKRehaEntlassung.xlsx), [Schematron](../StructureDefinition-ExtensionISiKRehaEntlassung.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ExtensionISiKRehaEntlassung",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKRehaEntlassung",
  "version" : "6.0.0",
  "name" : "ExtensionISiKRehaEntlassung",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-07-01",
  "publisher" : "gematik GmbH",
  "contact" : [{
    "name" : "gematik GmbH",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.gematik.de"
    }]
  }],
  "description" : "Extension zur Dokumentation von Informationen nach §301 (4 und 4a) SGB V, entsprechend dem ärztliche Reha-Entlassungsbericht. Mit dieser Extension können spezifische Entlassungsinformationen im Kontext einer Rehabilitationsmaßnahme angegeben werden. Dies ist besonders relevant für Einrichtungen, die Leistungen im Bereich Rehabilitation erbringen, und unterstützt die strukturierte Kommunikation im Entlassmanagement.",
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
    "expression" : "Encounter.hospitalization.dischargeDisposition"
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
      "id" : "Extension.extension:Entlassform",
      "path" : "Extension.extension",
      "sliceName" : "Entlassform",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Extension.extension:Entlassform.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:Entlassform.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "Entlassform"
    },
    {
      "id" : "Extension.extension:Entlassform.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "Coding"
      }],
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "https://gematik.de/fhir/isik/ValueSet/ISiKEntlassformReha"
      }
    },
    {
      "id" : "Extension.extension:BesondereBehandlung",
      "path" : "Extension.extension",
      "sliceName" : "BesondereBehandlung",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Extension.extension:BesondereBehandlung.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:BesondereBehandlung.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "BesondereBehandlung"
    },
    {
      "id" : "Extension.extension:BesondereBehandlung.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "Coding"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/isik/ValueSet/ISiKBesondereBehandlungsformReha"
      }
    },
    {
      "id" : "Extension.extension:BehandlungsergebnisReha",
      "path" : "Extension.extension",
      "sliceName" : "BehandlungsergebnisReha",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Extension.extension:BehandlungsergebnisReha.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:BehandlungsergebnisReha.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "BehandlungsergebnisReha"
    },
    {
      "id" : "Extension.extension:BehandlungsergebnisReha.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "Coding"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/isik/ValueSet/ISiKBehandlungsergebnisReha"
      }
    },
    {
      "id" : "Extension.extension:UnterbrechnungReha",
      "path" : "Extension.extension",
      "sliceName" : "UnterbrechnungReha",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Extension.extension:UnterbrechnungReha.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:UnterbrechnungReha.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "UnterbrechnungReha"
    },
    {
      "id" : "Extension.extension:UnterbrechnungReha.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "Coding"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/isik/ValueSet/ISiKUnterbrechungReha"
      }
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKRehaEntlassung"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "max" : "0"
    }]
  }
}

```
