# Akteur "ISiKCapabilityStatementFormularDatenQuelleAkteur" - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Akteur &quot;ISiKCapabilityStatementFormularDatenQuelleAkteur&quot;**

## CapabilityStatement: Akteur "ISiKCapabilityStatementFormularDatenQuelleAkteur" 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementFormularDatenQuelleAkteur | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiK-CapabilityStatementFormularDatenQuelleAkteur |

 
Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diesen Akteur implementiert. 
Jede Instanz eines bestätigungsrelevanten Systems MUSS an ihrem Endpunkt eine CapabilityStatement-Ressource bereitstellen. Hierzu MUSS die [capabilities-Interaktion gemäß FHIR-Kernspezifikation](https://hl7.org/fhir/R4/http.html#capabilities) unterstützt werden. Der `MODE`-Parameter kann ignoriert werden.
 Das CapabilityStatement in dieser Spezifikation stellt die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Rollen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die [CapabilityStatement-Imports-Expectation-Extension](https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation) mit den möglichen Werten ‘SHALL’ (=MUSS) ‘SHOULD’ (=SOLL) ‘MAY’ (=KANN) ‘SHOULD-NOT’ (=SOLL NICHT) verwendet. 
Eine Server-Instanz MUSS ihrerseits ein CapabilityStatement vom `kind = instance` liefern und im Element `software` den Namen und die Versionsnummer angeben. 
 Darüber hinaus MÜSSEN in `CapabilityStatement.instantiates` sämtliche Canonical URLs der implementierten Rollen angegeben werden. Die mindestens zu implementierenden Profile für einen Akteur und Interaktionen entsprechen daher den aggregierten Anforderungen der einzelnen Rolle (per ‘imports’). In den CapabilityStatements zu den Rollen sind die Anforderungen tabellarisch gelistet und weisen so die zu implementierenden Profile aus. 
Das CapabilityStatement der Instanz MUSS alle Funktionalitäten auflisten, die im folgenden CapabilityStatement (bzw. der in ihm importierten Rollen - siehe ‘imports’) mit `SHALL` gekennzeichnet sind. Das CapabilityStatement KANN darüber hinaus die mit `MAY` gekennzeichneten Funktionalitäten, sowie weitere Funktionalitäten auflisten, sofern diese in der Instanz implementiert wurden. 
Die Verwendung der CapabilityStatement-Expectation-Extension ist im CapabilityStatement der Server-Instanz nicht erforderlich. 

 
CapabilityStatement für den Akteur "ISiKCapabilityStatementFormularDatenQuelleAkteur". Dieser Akteur aggregiert die Rollen zur Abfrage von ausgefüllten Formularen, zur Datenbereitstellung für die Formularvorbelegung und zur Rückübermittlung von aus Formularen extrahierten Daten. Verpflichtend ist in diesem Kontext nur die Rolle "FormularDatenQuelleRolle" und "CompositionKonsumentenRolle", die weiteren Rollen sind optional, da sie ggf. auch von anderen Akteuren bereitgestellt werden können. 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "ISiKCapabilityStatementFormularDatenQuelleAkteur",
  "url" : "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementFormularDatenQuelleAkteur",
  "version" : "6.0.0-rc",
  "name" : "ISiK-CapabilityStatementFormularDatenQuelleAkteur",
  "title" : "Akteur &quot;ISiKCapabilityStatementFormularDatenQuelleAkteur&quot;",
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
  "description" : "Dieses CapabilityStatement beschreibt alle Interaktionen, \n  die ein System unterstützen MUSS, welches diesen Akteur implementiert.   \n\n  Jede Instanz eines bestätigungsrelevanten Systems MUSS an ihrem Endpunkt eine CapabilityStatement-Ressource bereitstellen.\nHierzu MUSS die [capabilities-Interaktion gemäß FHIR-Kernspezifikation](https://hl7.org/fhir/R4/http.html#capabilities) unterstützt werden. \nDer `MODE`-Parameter kann ignoriert werden.  \nDas CapabilityStatement in dieser Spezifikation stellt die Anforderungen seitens der gematik dar (`kind = requirements`). \nZur Unterscheidung von Rollen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, \nwird die [CapabilityStatement-Imports-Expectation-Extension](https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation) mit den möglichen Werten 'SHALL' (=MUSS)  'SHOULD' (=SOLL)  'MAY' (=KANN) 'SHOULD-NOT' (=SOLL NICHT) verwendet.  \n\nEine Server-Instanz MUSS ihrerseits ein CapabilityStatement vom `kind = instance` liefern und im Element `software` den Namen \nund die Versionsnummer angeben.   \nDarüber hinaus MÜSSEN in `CapabilityStatement.instantiates` sämtliche Canonical URLs der implementierten Rollen angegeben werden.\nDie mindestens zu implementierenden Profile für einen Akteur und Interaktionen entsprechen daher den aggregierten Anforderungen der einzelnen Rolle (per 'imports'). In den CapabilityStatements zu den Rollen sind die Anforderungen tabellarisch gelistet und weisen so die zu implementierenden Profile aus.\n\nDas CapabilityStatement der Instanz MUSS alle Funktionalitäten auflisten, die im folgenden CapabilityStatement (bzw. der in ihm importierten Rollen - siehe 'imports') mit `SHALL` gekennzeichnet sind. \nDas CapabilityStatement KANN darüber hinaus die mit `MAY` gekennzeichneten Funktionalitäten, sowie weitere Funktionalitäten auflisten, \nsofern diese in der Instanz implementiert wurden.  \n\nDie Verwendung der CapabilityStatement-Expectation-Extension ist im CapabilityStatement der Server-Instanz nicht erforderlich.",
  "purpose" : "CapabilityStatement für den Akteur &quot;ISiKCapabilityStatementFormularDatenQuelleAkteur&quot;.\nDieser Akteur aggregiert die Rollen zur Abfrage von ausgefüllten Formularen, zur Datenbereitstellung für die Formularvorbelegung und zur Rückübermittlung von aus Formularen extrahierten Daten.\nVerpflichtend ist in diesem Kontext nur die Rolle &quot;FormularDatenQuelleRolle&quot; und &quot;CompositionKonsumentenRolle&quot;, die weiteren Rollen sind optional, da sie ggf. auch von anderen Akteuren bereitgestellt werden können.",
  "kind" : "requirements",
  "imports" : [
    "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementFormularDatenQuelleRolle",
    "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementCompositionKonsumentenRolle",
    "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementStammdatenRolle",
    "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementGesundheitsstatusRolle",
    "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementAMTSRolle",
    "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementVitalSignStandardSourceRolle",
    "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementLaborMinimalRolle",
    "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementVitalSignICUSourceExtendedRolle",
    "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementVitalSignICUSourceMinimalRolle",
    "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementKlinischeRolle"
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
          "valueCode" : "MAY"
        }
      ]
    },
    {
      "extension" : [
        {
          "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation",
          "valueCode" : "MAY"
        }
      ]
    },
    {
      "extension" : [
        {
          "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation",
          "valueCode" : "MAY"
        }
      ]
    },
    {
      "extension" : [
        {
          "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation",
          "valueCode" : "MAY"
        }
      ]
    },
    {
      "extension" : [
        {
          "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation",
          "valueCode" : "MAY"
        }
      ]
    },
    {
      "extension" : [
        {
          "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation",
          "valueCode" : "MAY"
        }
      ]
    },
    {
      "extension" : [
        {
          "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation",
          "valueCode" : "MAY"
        }
      ]
    },
    {
      "extension" : [
        {
          "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation",
          "valueCode" : "MAY"
        }
      ]
    }
  ],
  "fhirVersion" : "4.0.1",
  "format" : ["application/fhir+xml", "application/fhir+json"],
  "implementationGuide" : [
    "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Formularmodul"
  ],
  "rest" : [
    {
      "mode" : "server"
    }
  ]
}

```
