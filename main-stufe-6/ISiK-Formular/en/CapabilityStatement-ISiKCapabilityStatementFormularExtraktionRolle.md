# CapabilityStatement für Rolle `FormularExtraktionRolle` - ISiK Formularmodul Implementation Guide v6.0.0

ISiK Formularmodul Implementation Guide

Version 6.0.0 - ballot 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **CapabilityStatement für Rolle `FormularExtraktionRolle`**

## CapabilityStatement: CapabilityStatement für Rolle `FormularExtraktionRolle` 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementFormularExtraktionRolle | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKCapabilityStatementFormularExtraktionRolle |

 
Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert. 
Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die [CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) mit den möglichen Werten `SHALL` (=MUSS) und `MAY` (=KANN) verwendet. 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "ISiKCapabilityStatementFormularExtraktionRolle",
  "url" : "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementFormularExtraktionRolle",
  "version" : "6.0.0",
  "name" : "ISiKCapabilityStatementFormularExtraktionRolle",
  "title" : "CapabilityStatement für Rolle `FormularExtraktionRolle`",
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
  "description" : "Dieses CapabilityStatement beschreibt alle Interaktionen, \n  die ein System unterstützen MUSS, welches diese Rolle implementiert.   \n  \nDie CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). \nZur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, \nwird die [CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) mit den möglichen Werten `SHALL` (=MUSS) und `MAY` (=KANN) verwendet.",
  "purpose" : "CapabilityStatement für Rolle `FormularExtraktionRolle`\nDiese Rolle stellt die Operation zur Extraktion von FormularenDaten bereit.",
  "kind" : "requirements",
  "fhirVersion" : "4.0.1",
  "format" : ["application/fhir+xml", "application/fhir+json"],
  "implementationGuide" : ["https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Formularmodul"],
  "rest" : [{
    "mode" : "server",
    "resource" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHALL"
      }],
      "type" : "QuestionnaireResponse",
      "operation" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "extract",
        "definition" : "http://hl7.org/fhir/uv/sdc/OperationDefinition/QuestionnaireResponse-extract"
      }]
    }]
  }]
}

```
