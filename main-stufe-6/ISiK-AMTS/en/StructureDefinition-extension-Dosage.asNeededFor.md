# Dosage AsNeededFor - AMTS ISiK Implementierungsleitfaden v6.0.0

AMTS ISiK Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Dosage AsNeededFor**

## Extension: Dosage AsNeededFor 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.org/fhir/5.0/StructureDefinition/extension-Dosage.asNeededFor | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:DosageAsNeededFor |

R5 Backport-Extension zur Angabe einer oder mehrerer Bedingungen, unter denen eine Bedarfsmedikation angewendet werden soll.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [ISiKMedikationsInformation](StructureDefinition-ISiKMedikationsInformation.md) and [ISiKMedikationsVerordnung](StructureDefinition-ISiKMedikationsVerordnung.md)
* Examples for this Extension: [MedicationRequest/ExampleISiKMedikationsVerordnungBedarfsmedikation](MedicationRequest-ExampleISiKMedikationsVerordnungBedarfsmedikation.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/amts|current/StructureDefinition/StructureDefinition-extension-Dosage.asNeededFor.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-extension-Dosage.asNeededFor.csv), [Excel](../StructureDefinition-extension-Dosage.asNeededFor.xlsx), [Schematron](../StructureDefinition-extension-Dosage.asNeededFor.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "extension-Dosage.asNeededFor",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg",
    "valueCode" : "fhir"
  }],
  "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-Dosage.asNeededFor",
  "version" : "6.0.0",
  "name" : "DosageAsNeededFor",
  "title" : "Dosage AsNeededFor",
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
  "description" : "R5 Backport-Extension zur Angabe einer oder mehrerer Bedingungen, unter denen eine Bedarfsmedikation angewendet werden soll.",
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
    "expression" : "Dosage"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-Dosage.asNeededFor"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "example",
        "valueSet" : "http://hl7.org/fhir/ValueSet/medication-as-needed-reason"
      }
    }]
  }
}

```
