# Akteur "ISiKCapabilityStatementBasisServerAkteur" - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Akteur &quot;ISiKCapabilityStatementBasisServerAkteur&quot;**

## CapabilityStatement: Akteur "ISiKCapabilityStatementBasisServerAkteur" 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementBasisServerAkteur | *Version*:0.0.1 |
| Active as of 2025-10-23 | *Computable Name*:ISiK-CapabilityStatementBasisServerAkteur |

 
Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diesen Akteur implementiert. 
Jede Instanz eines bestätigungsrelevanten Systems MUSS an ihrem Endpunkt eine CapabilityStatement-Ressource bereitstellen. Hierzu MUSS die[capabilities-Interaktion gemäß FHIR-Kernspezifikation](https://hl7.org/fhir/R4/http.html#capabilities)unterstützt werden. Der`MODE`-Parameter kann ignoriert werden.
Das CapabilityStatement in dieser Spezifikation stellt die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Rollen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Imports-Expectation-Extension](https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation)mit den möglichen Werten ‘SHALL’ (=MUSS) ‘SHOULD’ (=SOLL) ‘MAY’ (=KANN) ‘SHOULD-NOT’ (=SOLL NICHT) verwendet. 
Eine Server-Instanz MUSS ihrerseits ein CapabilityStatement vom`kind = instance`liefern und im Element`software`den Namen und die Versionsnummer angeben.
Darüber hinaus MÜSSEN in`CapabilityStatement.instantiates`sämtliche Canonical URLs der implementierten Rollen angegeben werden. Die mindestens zu implementierenden Profile für einen Akteur und Interaktionen entsprechen daher den aggregierten Anforderungen der einzelnen Rolle (per ‘imports’). In den CapabilityStatements zu den Rollen sind die Anforderungen tabellarisch gelistet und weisen so die zu implementierenden Profile aus. 
Das CapabilityStatement der Instanz MUSS alle Funktionalitäten auflisten, die im folgenden CapabilityStatement (bzw. der in ihm importierten Rollen - siehe ‘imports’) mit`SHALL`gekennzeichnet sind. Das CapabilityStatement KANN darüber hinaus die mit`MAY`gekennzeichneten Funktionalitäten, sowie weitere Funktionalitäten auflisten, sofern diese in der Instanz implementiert wurden. 
Die Verwendung der CapabilityStatement-Expectation-Extension ist im CapabilityStatement der Server-Instanz nicht erforderlich. 

 
CapabilityStatement für den Akteur "ISiKCapabilityStatementBasisServerAkteur". Dieser Akteur aggregiert die Rollen zur Abfrage von Stammdaten, Erweiterte Stammdaten, Aufbau-Struktur, Terminologie, klinischen Daten, Abrechnungsinformationen und Gesundheitsstatus. 

## Akteur &quot;ISiKCapabilityStatementBasisServerAkteur&quot;

* Implementation Guide Version: 0.0.1 
* FHIR Version: 4.0.1 
* Supported Formats: `application/fhir+xml`, `application/fhir+json`
* Published on: 2025-10-23 

> **Note to Implementers: FHIR Capabilities**Any FHIR capability may be 'allowed' by the system unless explicitly marked as 'SHALL NOT'. A few items are marked as MAY in the Implementation Guide to highlight their potential relevance to the use case.

This CapabilityStatement imports these CapabilityStatements [CapabilityStatement für Rolle &quot;StammdatenRolle&quot;](CapabilityStatement-ISiKCapabilityStatementStammdatenRolle.md), [CapabilityStatement für Rolle &quot;ISiKCapabilityStatementErweiterteStammdatenRolle&quot;](CapabilityStatement-ISiKCapabilityStatementErweiterteStammdatenRolle.md), [CapabilityStatement für Rolle &quot;AufbaustrukturRolle&quot;](CapabilityStatement-ISiKCapabilityStatementAufbaustrukturRolle.md), [CapabilityStatement für Rolle &quot;LeistungserbringerRolle&quot;](CapabilityStatement-ISiKCapabilityStatementLeistungserbringerRolle.md), [CapabilityStatement für Rolle &quot;ISiKCapabilityStatementGesundheitsstatusRolle&quot;](CapabilityStatement-ISiKCapabilityStatementGesundheitsstatusRolle.md), [CapabilityStatement für Rolle &quot;ISiKCapabilityStatementKlinischeRolle&quot;](CapabilityStatement-ISiKCapabilityStatementKlinischeRolle.md), [CapabilityStatement für Rolle &quot;ISiKCapabilityStatementTerminologieRolle&quot;](CapabilityStatement-ISiKCapabilityStatementTerminologieRolle.md), [CapabilityStatement für Rolle &quot;ISiKCapabilityStatementVersicherungsverhaeltnisRolle&quot;](CapabilityStatement-ISiKCapabilityStatementVersicherungsverhaeltnisRolle.md), [CapabilityStatement für Rolle &quot;ISiKCapabilityStatementCompositionKonsumentenRolle&quot;](CapabilityStatement-ISiKCapabilityStatementCompositionKonsumentenRolle.md)

### SHALL Support the Following Implementation Guides

* https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Basismodul

## FHIR RESTful Capabilities

### Mode: server



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "ISiKCapabilityStatementBasisServerAkteur",
  "url" : "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementBasisServerAkteur",
  "version" : "0.0.1",
  "name" : "ISiK-CapabilityStatementBasisServerAkteur",
  "title" : "Akteur &quot;ISiKCapabilityStatementBasisServerAkteur&quot;",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-10-23",
  "contact" : [
    {
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://www.gematik.de"
        }
      ]
    }
  ],
  "description" : "Dieses CapabilityStatement beschreibt alle Interaktionen, \n  die ein System unterstützen MUSS, welches diesen Akteur implementiert.   \n\n  Jede Instanz eines bestätigungsrelevanten Systems MUSS an ihrem Endpunkt eine CapabilityStatement-Ressource bereitstellen.\nHierzu MUSS die [capabilities-Interaktion gemäß FHIR-Kernspezifikation](https://hl7.org/fhir/R4/http.html#capabilities) unterstützt werden. \nDer `MODE`-Parameter kann ignoriert werden.  \nDas CapabilityStatement in dieser Spezifikation stellt die Anforderungen seitens der gematik dar (`kind = requirements`). \nZur Unterscheidung von Rollen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, \nwird die [CapabilityStatement-Imports-Expectation-Extension](https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation) mit den möglichen Werten 'SHALL' (=MUSS)  'SHOULD' (=SOLL)  'MAY' (=KANN) 'SHOULD-NOT' (=SOLL NICHT) verwendet.  \n\nEine Server-Instanz MUSS ihrerseits ein CapabilityStatement vom `kind = instance` liefern und im Element `software` den Namen \nund die Versionsnummer angeben.   \nDarüber hinaus MÜSSEN in `CapabilityStatement.instantiates` sämtliche Canonical URLs der implementierten Rollen angegeben werden.\nDie mindestens zu implementierenden Profile für einen Akteur und Interaktionen entsprechen daher den aggregierten Anforderungen der einzelnen Rolle (per 'imports'). In den CapabilityStatements zu den Rollen sind die Anforderungen tabellarisch gelistet und weisen so die zu implementierenden Profile aus.\n\nDas CapabilityStatement der Instanz MUSS alle Funktionalitäten auflisten, die im folgenden CapabilityStatement (bzw. der in ihm importierten Rollen - siehe 'imports') mit `SHALL` gekennzeichnet sind. \nDas CapabilityStatement KANN darüber hinaus die mit `MAY` gekennzeichneten Funktionalitäten, sowie weitere Funktionalitäten auflisten, \nsofern diese in der Instanz implementiert wurden.  \n\nDie Verwendung der CapabilityStatement-Expectation-Extension ist im CapabilityStatement der Server-Instanz nicht erforderlich.",
  "purpose" : "CapabilityStatement für den Akteur &quot;ISiKCapabilityStatementBasisServerAkteur&quot;.\nDieser Akteur aggregiert die Rollen zur Abfrage von Stammdaten, Erweiterte Stammdaten, Aufbau-Struktur, Terminologie, klinischen Daten, Abrechnungsinformationen und Gesundheitsstatus.",
  "kind" : "requirements",
  "imports" : [
    "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementStammdatenRolle",
    "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementErweiterteStammdatenRolle",
    "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementAufbaustrukturRolle",
    "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementLeistungserbringerRolle",
    "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementGesundheitsstatusRolle",
    "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementKlinischeRolle",
    "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementTerminologieRolle",
    "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementVersicherungsverhaeltnisRolle",
    "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementCompositionKonsumentenRolle"
  ],
  "_imports" : [
    {
      "extension" : [
        {
          "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation",
          "valueCode" : "SHALL"
        }
      ]
    },
    {
      "extension" : [
        {
          "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation",
          "valueCode" : "SHALL"
        }
      ]
    },
    {
      "extension" : [
        {
          "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation",
          "valueCode" : "SHALL"
        }
      ]
    },
    {
      "extension" : [
        {
          "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation",
          "valueCode" : "SHALL"
        }
      ]
    },
    {
      "extension" : [
        {
          "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation",
          "valueCode" : "SHALL"
        }
      ]
    },
    {
      "extension" : [
        {
          "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation",
          "valueCode" : "SHALL"
        }
      ]
    },
    {
      "extension" : [
        {
          "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation",
          "valueCode" : "SHALL"
        }
      ]
    },
    {
      "extension" : [
        {
          "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation",
          "valueCode" : "SHALL"
        }
      ]
    },
    {
      "extension" : [
        {
          "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation",
          "valueCode" : "SHALL"
        }
      ]
    }
  ],
  "fhirVersion" : "4.0.1",
  "format" : ["application/fhir+xml", "application/fhir+json"],
  "implementationGuide" : [
    "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Basismodul"
  ],
  "rest" : [
    {
      "mode" : "server"
    }
  ]
}

```
