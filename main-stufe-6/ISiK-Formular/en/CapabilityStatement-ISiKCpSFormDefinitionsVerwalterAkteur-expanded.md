# Akteur `ISiKCpSFormDefinitionsVerwalterAkteur` (Expanded) - ISiK Formularmodul Implementation Guide v6.0.0

ISiK Formularmodul Implementation Guide

Version 6.0.0 - ballot 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Akteur `ISiKCpSFormDefinitionsVerwalterAkteur` (Expanded)**

## CapabilityStatement: Akteur `ISiKCpSFormDefinitionsVerwalterAkteur` (Expanded) 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/CapabilityStatement/ISiKCpSFormDefinitionsVerwalterAkteur-expanded | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiK-CpSFormDefinitionsVerwalterAkteurExpanded |

 
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
  "id" : "ISiKCpSFormDefinitionsVerwalterAkteur-expanded",
  "url" : "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCpSFormDefinitionsVerwalterAkteur-expanded",
  "version" : "6.0.0",
  "name" : "ISiK-CpSFormDefinitionsVerwalterAkteurExpanded",
  "title" : "Akteur `ISiKCpSFormDefinitionsVerwalterAkteur` (Expanded)",
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
  "purpose" : "CapabilityStatement für den Akteur `ISiKCpSFormDefinitionsVerwalterAkteur`.\nDieser Akteur aggregiert die Rollen zur Abfrage von ausgefüllten Formularen, zur Datenbereitstellung für die Formularvorbelegung und zur Rückübermittlung von aus Formularen extrahierten Daten.\nVerpflichtend ist in diesem Kontext nur die Rolle `FormularDefinitionsVerwalterRolle` und `CompositionKonsumentenRolle`, die weiteren Rollen sind optional, da sie ggf. auch von anderen Akteuren bereitgestellt werden können.",
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
      "type" : "Questionnaire",
      "supportedProfile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKFormularDefinition"],
      "_supportedProfile" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }]
      }],
      "interaction" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "read"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "search-type"
      }],
      "searchParam" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_id",
        "definition" : "http://hl7.org/fhir/SearchParameter/Resource-id",
        "type" : "token",
        "documentation" : "**Beispiel:**\n        `GET [base]/[Resourcetype]?_id=103270`\n        **Anwendungshinweis:**\n        Der Parameter `_id` wird selten alleinstehend verwendet, da sich zum Abruf einer Ressource\n        anhand der `id`  die `READ`-Interaktion besser anbietet. Der Parameter kann jedoch verwendet werden,\n        um den Abruf einer Ressource bspw. mit einem `_include` weiterer Ressourcen zu verbinden,\n        z.B. zum Abruf eines Encounters in Verbindung mit dem zugehörigen Patienten:\n        `GET [base]/Encounter?_id=103270&_include=Encounter:patient`\n        Weitere Details siehe FHIR-Kernspezifikation, Abschnitt [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all).\n        Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_count",
        "type" : "number",
        "documentation" : "**Beispiel:**\n        `GET [base]/[Resourcetype]?_count=100`\n        **Anwendungshinweis:**\n        Weitere Details siehe FHIR-Kernspezifikation, Abschnitt [Page Count](https://www.hl7.org/fhir/R4/search.html#count).  "
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "MAY"
        }],
        "name" : "_has",
        "type" : "string",
        "documentation" : "**Beispiel:** Suche nach allen Patienten, die eine Observation  mit dem Code '1234-5' haben\n        `GET [base]/Patient?_has:Observation:patient:code=1234-5`\n        **Beispiel:** Suche nach allen Encountern, bei denen die Diagnose 'A12.3' gestellt wurde\n        `GET [base]/Encounter?_has:Condition:encounter:code=A12.3`\n        **Anwendungshinweis:**\n        Weitere Details siehe FHIR-Kernspezifikation, Abschnitt [Reverse Chaining](https://hl7.org/fhir/R4/search.html#has).  "
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_lastUpdated",
        "type" : "date",
        "documentation" : "**Beispiel:** Suche nach allen Patienten-Ressourcen, die seit dem 1. Januar neu angelegt oder geändert wurden:  \n        `GET [base]/Patient?_lastUpdated=ge2026-01-01`  \n        **Beispiel:** Suche nach allen Observations eines Patienten im Zeitraum einer Stunde:  \n        `GET [base]/Observation?_lastUpdated=ge2026-03-05T10:20:10.423+02:00&_lastUpdate=lt2026-03-05T11:20:10.423+02:00&patient=Patient/12345`  \n        **Anwendungshinweis:**\n        Dieser Suchparameter dient dem Datenabgleich zwischen Systemen und ist auch für die *patientenübergreifende* Suche zugelassen.\n        Server *können* die Anfrage mit einer OperationOutcome-Ressource und dem Fehlercode `too-costly` beantworten, wenn das vom Client gewählte Zeitfenster oder die Treffermenge zu groß ist\n        und die Durchführhung der Suchanfrage das System unverhältnismäßig stark belasten würde.\n        Weitere Details siehe FHIR-Kernspezifikation, Abschnitt [_lastUpdated](https://hl7.org/fhir/search.html#_lastUpdated). "
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "MAY"
        }],
        "name" : "_tag",
        "definition" : "http://hl7.org/fhir/SearchParameter/Resource-tag",
        "type" : "token",
        "documentation" : "**Beispiel:**\n        `GET [base]/[Resourcetype]?_tag=https://example.org/codes|needs-review`\n        **Anwendungshinweis:**\n        Weitere Details siehe FHIR-Kernspezifikation, Abschnitt [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all)\n        sowie Abschnitt [Tags](https://www.hl7.org/fhir/R4/resource.html#simple-tags).  "
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "identifier",
        "definition" : "http://hl7.org/fhir/SearchParameter/Questionnaire-identifier",
        "type" : "token",
        "documentation" : "**Beispiel:**    \n        `GET [base]/Questionnaire?identifier=http://example.org/fhir/sid/questionnaire|form-001`    \n        **Anwendungshinweis:**   \n        Externe Identifizierungsnummer für das Formular. Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "name",
        "definition" : "http://hl7.org/fhir/SearchParameter/Questionnaire-name",
        "type" : "string",
        "documentation" : "**Beispiel:**    \n        `GET [base]/Questionnaire?name=IntakeFormular`    \n        **Anwendungshinweis:**   \n        Maschinenlesbarer Name des Formulars. Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "MAY"
        }],
        "name" : "publisher",
        "definition" : "http://hl7.org/fhir/SearchParameter/Questionnaire-publisher",
        "type" : "string",
        "documentation" : "**Beispiel:**    \n        `GET [base]/Questionnaire?publisher=Gematik`    \n        **Anwendungshinweis:**   \n        Name des Herausgebers oder der Organisation. Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "status",
        "definition" : "http://hl7.org/fhir/SearchParameter/Questionnaire-status",
        "type" : "token",
        "documentation" : "**Beispiel:**    \n        `GET [base]/Questionnaire?status=active`  \n        `GET [base]/Questionnaire?status=draft`    \n        **Anwendungshinweis:**   \n        Gültige Werte: draft | active | retired | unknown. Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "title",
        "definition" : "http://hl7.org/fhir/SearchParameter/Questionnaire-title",
        "type" : "string",
        "documentation" : "**Beispiel:**    \n        `GET [base]/Questionnaire?title=Aufnahmebogen`    \n        **Anwendungshinweis:**   \n        Benutzerfreundlicher Name des Formulars. Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "url",
        "definition" : "http://hl7.org/fhir/SearchParameter/Questionnaire-url",
        "type" : "uri",
        "documentation" : "**Beispiel:**    \n        `GET [base]/Questionnaire?url=https://gematik.de/fhir/isik/Questionnaire/ISiKFormularDefinition`    \n        **Anwendungshinweis:**   \n        Kanonische URI-Identifikation des Formulars. Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#uri).  "
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "version",
        "definition" : "http://hl7.org/fhir/SearchParameter/Questionnaire-version",
        "type" : "token",
        "documentation" : "**Beispiel:**    \n        `GET [base]/Questionnaire?version=1.0.0`  \n        `GET [base]/Questionnaire?version=2.0.0`    \n        **Anwendungshinweis:**   \n        Geschäftsversion des Formulars. Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
      }]
    }]
  }]
}

```
