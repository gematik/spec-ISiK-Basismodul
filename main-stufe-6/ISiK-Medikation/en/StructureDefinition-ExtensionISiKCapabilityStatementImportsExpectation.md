# ISiK CapabilityStatement Imports Expectation - ISiK Medikation Implementierungsleitfaden v6.0.0

ISiK Medikation Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artefakte**](artifacts.md)
* **ISiK CapabilityStatement Imports Expectation**

## Extension: ISiK CapabilityStatement Imports Expectation 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ExtensionISiKCapabilityStatementImportsExpectation |

Defines the level of expectation associated with a given system capability. See the capabilitystatement-prohibited modifier extension to set expectations to **not** support a feature.

**Context of Use**

**Usage info**

**Usages:**

* Examples for this Extension: [ISiKCapabilityStatementMedikationInformationAkteur](CapabilityStatement-ISiKCapabilityStatementMedikationInformationAkteur.md), [ISiKCapabilityStatementMedikationVerabreichungMedikationsinformationAkteur](CapabilityStatement-ISiKCapabilityStatementMedikationVerabreichungAkteur.md) and [ISiKCapabilityStatementMedikationVerordnungAkteur](CapabilityStatement-ISiKCapabilityStatementMedikationVerordnungAkteur.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/medikation|current/StructureDefinition/StructureDefinition-ExtensionISiKCapabilityStatementImportsExpectation.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-ExtensionISiKCapabilityStatementImportsExpectation.csv), [Excel](../StructureDefinition-ExtensionISiKCapabilityStatementImportsExpectation.xlsx), [Schematron](../StructureDefinition-ExtensionISiKCapabilityStatementImportsExpectation.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ExtensionISiKCapabilityStatementImportsExpectation",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation",
  "version" : "6.0.0",
  "name" : "ExtensionISiKCapabilityStatementImportsExpectation",
  "title" : "ISiK CapabilityStatement Imports Expectation",
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
  "description" : "Defines the level of expectation associated with a given system capability. See the capabilitystatement-prohibited modifier extension to set expectations to *not* support a feature.",
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
    "expression" : "CapabilityStatement.imports"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "SHALL | SHOULD | MAY |SHOULD-NOT",
      "definition" : "Defines the level of expectation associated with a given system capability.",
      "comment" : "If \"SHALL NOT\" is desired, use the \"prohibited\" modifier extension.  This extension should only be used with CapabilityStatements documenting requirements, not those documenting actual system capabilities."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "code"
      }],
      "binding" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName",
          "valueString" : "ConformanceExpectation"
        }],
        "strength" : "required",
        "description" : "Indicates the degree of adherence to a specified behavior or capability expected for a system to be deemed conformant with a specification.",
        "valueSet" : "http://terminology.hl7.org/ValueSet/conformance-expectation"
      }
    }]
  }
}

```
