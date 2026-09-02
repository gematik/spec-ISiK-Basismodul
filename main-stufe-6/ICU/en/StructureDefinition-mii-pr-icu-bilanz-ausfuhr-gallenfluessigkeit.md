# MII PR ICU Bilanz Ausfuhr Gallenfluessigkeit - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII PR ICU Bilanz Ausfuhr Gallenfluessigkeit**

## Resource Profile: MII PR ICU Bilanz Ausfuhr Gallenfluessigkeit 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/mii-pr-icu-bilanz-ausfuhr-gallenfluessigkeit | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:MII_PR_ICU_Bilanz_Ausfuhr_Gallenfluessigkeit |

 
Dieses Profil wurde aus dem Modul KDS ICU entnommen und dient der Abbildung der Gallenflüssigkeitsausfuhr als Teil der Bilanzierung von Patienten. Es ermöglicht die Erfassung der Menge der Gallenflüssigkeit, die ein Patient über einen bestimmten Zeitraum ausgeschieden hat, und bietet somit eine spezifische Lösung für die Dokumentation dieses Aspekts der Flüssigkeitsbilanz. 

**Usages:**

* Examples for this Profile: [Observation/BilanzAusfuhrGallenfluessigkeitBeispiel](Observation-BilanzAusfuhrGallenfluessigkeitBeispiel.md)
* CapabilityStatements using this Profile: [ISiK CapabilityStatement Vitalparameter Server Extended (Expanded)](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceExtendedAkteur-expanded.md) and [ISiK CapabilityStatement VitalSign ICU Source Extended](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceExtendedRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/icu|current/StructureDefinition/StructureDefinition-mii-pr-icu-bilanz-ausfuhr-gallenfluessigkeit.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-mii-pr-icu-bilanz-ausfuhr-gallenfluessigkeit.csv), [Excel](../StructureDefinition-mii-pr-icu-bilanz-ausfuhr-gallenfluessigkeit.xlsx), [Schematron](../StructureDefinition-mii-pr-icu-bilanz-ausfuhr-gallenfluessigkeit.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-icu-bilanz-ausfuhr-gallenfluessigkeit",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/mii-pr-icu-bilanz-ausfuhr-gallenfluessigkeit",
  "version" : "6.0.0",
  "name" : "MII_PR_ICU_Bilanz_Ausfuhr_Gallenfluessigkeit",
  "title" : "MII PR ICU Bilanz Ausfuhr Gallenfluessigkeit",
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
  "description" : "Dieses Profil wurde aus dem Modul KDS ICU entnommen und dient der Abbildung der Gallenflüssigkeitsausfuhr als Teil der Bilanzierung von Patienten. Es ermöglicht die Erfassung der Menge der Gallenflüssigkeit, die ein Patient über einen bestimmten Zeitraum ausgeschieden hat, und bietet somit eine spezifische Lösung für die Dokumentation dieses Aspekts der Flüssigkeitsbilanz.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "sct-concept",
    "uri" : "http://snomed.info/conceptdomain",
    "name" : "SNOMED CT Concept Domain Binding"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "sct-attr",
    "uri" : "http://snomed.org/attributebinding",
    "name" : "SNOMED CT Attribute Binding"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "https://gematik.de/fhir/isik/StructureDefinition/mii-pr-icu-bilanz",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Observation",
      "path" : "Observation"
    },
    {
      "id" : "Observation.category.coding:hl7-category",
      "path" : "Observation.category.coding",
      "sliceName" : "hl7-category"
    },
    {
      "id" : "Observation.category.coding:hl7-category.code",
      "path" : "Observation.category.coding.code",
      "patternCode" : "exam"
    },
    {
      "id" : "Observation.code.coding",
      "path" : "Observation.code.coding",
      "min" : 2
    },
    {
      "id" : "Observation.code.coding:sct",
      "path" : "Observation.code.coding",
      "sliceName" : "sct",
      "min" : 1,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://snomed.info/sct",
        "code" : "1162667009"
      }
    },
    {
      "id" : "Observation.code.coding:loinc",
      "path" : "Observation.code.coding",
      "sliceName" : "loinc",
      "min" : 1,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://loinc.org",
        "code" : "9113-2"
      }
    },
    {
      "id" : "Observation.code.coding:IEEE-11073",
      "path" : "Observation.code.coding",
      "sliceName" : "IEEE-11073",
      "max" : "0"
    },
    {
      "id" : "Observation.value[x].unit",
      "path" : "Observation.value[x].unit",
      "short" : "Display unit (SI)",
      "definition" : "Human-readable display for the unit. SI display unit SHALL be 'ml', independent of whether code is 'mL' or 'ml'.",
      "min" : 1,
      "patternString" : "ml",
      "example" : [{
        "label" : "Preferred display",
        "valueString" : "ml"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.value[x].code",
      "path" : "Observation.value[x].code",
      "min" : 1,
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "description" : "equivalent codes for milliliter",
        "valueSet" : "https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-unit-equivalent-ucum-milliliter"
      }
    }]
  }
}

```
