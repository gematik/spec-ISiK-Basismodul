# ISiK CapabilityStatement Organspendeerkennung Server - ISiK Organspendeerkennung v6.0.0

ISiK Organspendeerkennung

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiK CapabilityStatement Organspendeerkennung Server**

## CapabilityStatement: ISiK CapabilityStatement Organspendeerkennung Server 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementOrganspendeerkennungSourceAkteur | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKCapabilityStatementOrganspendeerkennungSourceAkteur |

 
Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diesen Akteur implementiert. 
Jede Instanz eines bestätigungsrelevanten Systems MUSS an ihrem Endpunkt eine CapabilityStatement-Ressource bereitstellen. Hierzu MUSS die [capabilities-Interaktion gemäß FHIR-Kernspezifikation](https://hl7.org/fhir/R4/http.html#capabilities) unterstützt werden. Der `MODE`-Parameter kann ignoriert werden.
 Das CapabilityStatement in dieser Spezifikation stellt die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Rollen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die [CapabilityStatement-Imports-Expectation-Extension](https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation) mit den möglichen Werten 'SHALL' (=MUSS) 'SHOULD' (=SOLL) 'MAY' (=KANN) 'SHOULD-NOT' (=SOLL NICHT) verwendet. 
Eine Server-Instanz MUSS ihrerseits ein CapabilityStatement vom `kind = instance` liefern und im Element `software` den Namen und die Versionsnummer angeben. 
 Darüber hinaus MÜSSEN in `CapabilityStatement.instantiates` sämtliche Canonical URLs der implementierten Rollen angegeben werden. Die mindestens zu implementierenden Profile für einen Akteur und Interaktionen entsprechen daher den aggregierten Anforderungen der einzelnen Rolle (per 'imports'). In den CapabilityStatements zu den Rollen sind die Anforderungen tabellarisch gelistet und weisen so die zu implementierenden Profile aus. 
Das CapabilityStatement der Instanz MUSS alle Funktionalitäten auflisten, die im folgenden CapabilityStatement (bzw. der in ihm importierten Rollen - siehe 'imports') mit `SHALL` gekennzeichnet sind. Das CapabilityStatement KANN darüber hinaus die mit `MAY` gekennzeichneten Funktionalitäten, sowie weitere Funktionalitäten auflisten, sofern diese in der Instanz implementiert wurden. 
Die Verwendung der CapabilityStatement-Expectation-Extension ist im CapabilityStatement der Server-Instanz nicht erforderlich. 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "ISiKCapabilityStatementOrganspendeerkennungSourceAkteur",
  "url" : "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementOrganspendeerkennungSourceAkteur",
  "version" : "6.0.0",
  "name" : "ISiKCapabilityStatementOrganspendeerkennungSourceAkteur",
  "title" : "ISiK CapabilityStatement Organspendeerkennung Server",
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
  "description" : "Dieses CapabilityStatement beschreibt alle Interaktionen, \n  die ein System unterstützen MUSS, welches diesen Akteur implementiert.   \n\n  Jede Instanz eines bestätigungsrelevanten Systems MUSS an ihrem Endpunkt eine CapabilityStatement-Ressource bereitstellen.\nHierzu MUSS die [capabilities-Interaktion gemäß FHIR-Kernspezifikation](https://hl7.org/fhir/R4/http.html#capabilities) unterstützt werden. \nDer `MODE`-Parameter kann ignoriert werden.  \nDas CapabilityStatement in dieser Spezifikation stellt die Anforderungen seitens der gematik dar (`kind = requirements`). \nZur Unterscheidung von Rollen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, \nwird die [CapabilityStatement-Imports-Expectation-Extension](https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation) mit den möglichen Werten 'SHALL' (=MUSS)  'SHOULD' (=SOLL)  'MAY' (=KANN) 'SHOULD-NOT' (=SOLL NICHT) verwendet.  \n\nEine Server-Instanz MUSS ihrerseits ein CapabilityStatement vom `kind = instance` liefern und im Element `software` den Namen \nund die Versionsnummer angeben.   \nDarüber hinaus MÜSSEN in `CapabilityStatement.instantiates` sämtliche Canonical URLs der implementierten Rollen angegeben werden.\nDie mindestens zu implementierenden Profile für einen Akteur und Interaktionen entsprechen daher den aggregierten Anforderungen der einzelnen Rolle (per 'imports'). In den CapabilityStatements zu den Rollen sind die Anforderungen tabellarisch gelistet und weisen so die zu implementierenden Profile aus.\n\nDas CapabilityStatement der Instanz MUSS alle Funktionalitäten auflisten, die im folgenden CapabilityStatement (bzw. der in ihm importierten Rollen - siehe 'imports') mit `SHALL` gekennzeichnet sind. \nDas CapabilityStatement KANN darüber hinaus die mit `MAY` gekennzeichneten Funktionalitäten, sowie weitere Funktionalitäten auflisten, \nsofern diese in der Instanz implementiert wurden.  \n\nDie Verwendung der CapabilityStatement-Expectation-Extension ist im CapabilityStatement der Server-Instanz nicht erforderlich.",
  "purpose" : "Das vorliegende CapabilityStatement fasst die Rollen (und entsprechende Interaktionen) zusammen, die ein Akteur für die Organspendeerkennung zur Unterstützung des Organspendeerkennungs-Workflows implementieren muss.\n\nZur Implementierung der Interaktionen sind insbesondere die zu implementierenden Rollen (siehe 'imports' in der CapabilityStatement-Ressource) zu beachten.\n\n**HISTORIE:**  \n\n*Historie*: mit der Version 6.0.0-rc des IG Organspendeerkennung wurde das vorliegende CapabilityStatement im Sinne eines eigenständigen Akteurs erstellt und damit ein eigenständiger Schnittstellen-Akteur für die Bereitstellung von Vitalparametern im Kontext der Organspendeerkennung etabliert - samt neuer Funktionalität in der Abfrage.\n",
  "kind" : "requirements",
  "imports" : ["https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementStammdatenRolle",
  "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementErweiterteStammdatenRolle",
  "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementOrganspendeerkennungSourceRolle"],
  "_imports" : [{
    "extension" : [{
      "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation",
      "valueCode" : "SHALL"
    }]
  },
  {
    "extension" : [{
      "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation",
      "valueCode" : "SHALL"
    }]
  },
  {
    "extension" : [{
      "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation",
      "valueCode" : "SHALL"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "format" : ["application/fhir+xml", "application/fhir+json"],
  "rest" : [{
    "mode" : "server"
  }]
}

```
