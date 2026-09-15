# ISiK CapabilityStatement Metadaten Update Rolle - ISiK Dokumentenaustausch Implementierungsleitfaden v6.0.0

ISiK Dokumentenaustausch Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiK CapabilityStatement Metadaten Update Rolle**

## CapabilityStatement: ISiK CapabilityStatement Metadaten Update Rolle 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementMetadatenUpdateRolle | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKCapabilityStatementMetadatenUpdateRolle |

 
Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert. 
Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die [CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) mit den möglichen Werten `SHALL` (=MUSS) und `MAY` (=KANN) verwendet. 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "ISiKCapabilityStatementMetadatenUpdateRolle",
  "url" : "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementMetadatenUpdateRolle",
  "version" : "6.0.0",
  "name" : "ISiKCapabilityStatementMetadatenUpdateRolle",
  "title" : "ISiK CapabilityStatement Metadaten Update Rolle",
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
  "description" : "Dieses CapabilityStatement beschreibt alle Interaktionen, \n  die ein System unterstützen MUSS, welches diese Rolle implementiert.   \n  \nDie CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). \nZur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, \nwird die [CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) mit den möglichen Werten `SHALL` (=MUSS) und `MAY` (=KANN) verwendet.",
  "purpose" : "\nCapabilityStatement für die Rolle &quot;ISiKCapabilityStatementMetadatenUpdateRolle&quot;.\nDiese Rolle beschreibt verpflichtende Interaktionen zur Aktualisierung von Metadaten für Dokumente.\n",
  "kind" : "requirements",
  "fhirVersion" : "4.0.1",
  "format" : ["application/fhir+xml", "application/fhir+json"],
  "implementationGuide" : ["https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Dokumentenaustausch"],
  "rest" : [{
    "mode" : "server",
    "resource" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHALL"
      }],
      "type" : "DocumentReference",
      "operation" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "update-metadata",
        "definition" : "https://gematik.de/fhir/isik/OperationDefinition/UpdateMetadata"
      }]
    }]
  }]
}

```
