# CapabilityStatement für Rolle "ISiKCapabilityStatementCompositionKonsumentenRolle" - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **CapabilityStatement für Rolle &quot;ISiKCapabilityStatementCompositionKonsumentenRolle&quot;**

## CapabilityStatement: CapabilityStatement für Rolle "ISiKCapabilityStatementCompositionKonsumentenRolle" 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementCompositionKonsumentenRolle | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKCapabilityStatementCompositionKonsumentenRolle |

 
Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert. 
Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die [CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) mit den möglichen Werten `SHALL` (=MUSS) und `MAY` (=KANN) verwendet. 

 
CapabilityStatement für die Rolle "ISiKCapabilityStatementCompositionKonsumentenRolle". Diese Rolle beschreibt verpflichtende Interaktionen zum Abruf und der Verarbeitung von ISiKBerichtBundles. 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "ISiKCapabilityStatementCompositionKonsumentenRolle",
  "url" : "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementCompositionKonsumentenRolle",
  "version" : "6.0.0-rc",
  "name" : "ISiKCapabilityStatementCompositionKonsumentenRolle",
  "title" : "CapabilityStatement für Rolle &quot;ISiKCapabilityStatementCompositionKonsumentenRolle&quot;",
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
  "description" : "Dieses CapabilityStatement beschreibt alle Interaktionen, \n  die ein System unterstützen MUSS, welches diese Rolle implementiert.   \n  \nDie CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). \nZur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, \nwird die [CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) mit den möglichen Werten `SHALL` (=MUSS) und `MAY` (=KANN) verwendet.",
  "purpose" : "\nCapabilityStatement für die Rolle &quot;ISiKCapabilityStatementCompositionKonsumentenRolle&quot;.\nDiese Rolle beschreibt verpflichtende Interaktionen zum Abruf und der Verarbeitung von ISiKBerichtBundles.\n",
  "kind" : "requirements",
  "fhirVersion" : "4.0.1",
  "format" : ["application/fhir+xml", "application/fhir+json"],
  "implementationGuide" : [
    "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Basismodul"
  ],
  "document" : [
    {
      "extension" : [
        {
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }
      ],
      "mode" : "consumer",
      "documentation" : "Endpunkt zur Entgegennahme von Subsystem-Berichten in Form eines ISiKBerichtBundles. Weitere Hinweise siehe {{pagelink:BerichtSubsystem}}",
      "profile" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKBerichtBundle"
    }
  ]
}

```
