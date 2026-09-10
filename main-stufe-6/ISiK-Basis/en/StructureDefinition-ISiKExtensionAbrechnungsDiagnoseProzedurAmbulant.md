# Fallbezogene Abrechnungsrelevanz von Diagnosen und Prozeduren - ISiK Basis Implementierungsleitfaden v6.0.0

ISiK Basis Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Fallbezogene Abrechnungsrelevanz von Diagnosen und Prozeduren**

## Extension: Fallbezogene Abrechnungsrelevanz von Diagnosen und Prozeduren 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKExtensionAbrechnungsDiagnoseProzedurAmbulant | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKExtensionAbrechnungsDiagnoseProzedurAmbulant |

Diese Extension erlaubt es, angelehnt an die Basisprofil Extension [Fallbezogene Abrechnungsrelevanz von Diagnosen und Prozeduren](http://fhir.de/StructureDefinition/ExtensionAbrechnungsDiagnoseProzedur), Diagnosen und Prozeduren als abrechnungsrelevant in einem Fallkontext anzugeben. Allerdings ohne die Verpflichtung, einen Use anzugeben. Dies ist im ambulanten Kontext nicht üblich.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [ISiKAbrechnungsfallAmbulant](StructureDefinition-ISiKAbrechnungsfallAmbulant.md)
* Examples for this Extension: [Account/AbrechnungsfallAmbulantMvzImKrankenhaus](Account-AbrechnungsfallAmbulantMvzImKrankenhaus.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/basis|current/StructureDefinition/StructureDefinition-ISiKExtensionAbrechnungsDiagnoseProzedurAmbulant.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-ISiKExtensionAbrechnungsDiagnoseProzedurAmbulant.csv), [Excel](../StructureDefinition-ISiKExtensionAbrechnungsDiagnoseProzedurAmbulant.xlsx), [Schematron](../StructureDefinition-ISiKExtensionAbrechnungsDiagnoseProzedurAmbulant.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKExtensionAbrechnungsDiagnoseProzedurAmbulant",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKExtensionAbrechnungsDiagnoseProzedurAmbulant",
  "version" : "6.0.0",
  "name" : "ISiKExtensionAbrechnungsDiagnoseProzedurAmbulant",
  "title" : "Fallbezogene Abrechnungsrelevanz von Diagnosen und Prozeduren",
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
  "description" : "Diese Extension erlaubt es, angelehnt an die Basisprofil Extension [Fallbezogene Abrechnungsrelevanz von Diagnosen und Prozeduren](http://fhir.de/StructureDefinition/ExtensionAbrechnungsDiagnoseProzedur), Diagnosen und Prozeduren als abrechnungsrelevant in einem Fallkontext anzugeben. Allerdings ohne die Verpflichtung, einen Use anzugeben. Dies ist im ambulanten Kontext nicht üblich.",
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
    "expression" : "Element"
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
      "fixedUri" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKExtensionAbrechnungsDiagnoseProzedurAmbulant"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Condition",
        "http://hl7.org/fhir/StructureDefinition/Procedure"]
      }]
    }]
  }
}

```
