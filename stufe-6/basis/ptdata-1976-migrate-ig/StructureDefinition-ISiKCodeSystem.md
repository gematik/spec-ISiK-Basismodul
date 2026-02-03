# ISiKCodeSystem - Basis Implementation Guide v6.0.0-rc

Basis Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiKCodeSystem**

## Resource Profile: ISiKCodeSystem 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKCodeSystem | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKCodeSystem |

 
Dieses Profil beschreibt die maschinenlesbare Repräsentation von system-spezifischen Kodierungen in ISiK-Szenarien. 

### Motivation

 
ISiK erlaubt in diversen Kontexten die Erweiterung der Kodierung durch Krankenhaus-/System-interne Kodierungen. Das Profil ISiKKatalog (CodeSystem) als Profil erlaubt die Repräsentation der dazugehörigen Codes und Display-Werte. 
Eine maschinenlesbare Repräsentation dieser Kodierungen erlaubt es Clients, dazugehörige Anzeigetext und Definitionen zu verarbeiten. 
Ein Codesystem eignet sich auch dazu, auf dessen Basis definierte [ValueSets zu expandieren](https://hl7.org/fhir/R4/valueset-operation-expand.html). Da ISiKValueSet expandierte Valuesets vorsieht, ist eine dynamische Expansion in der Regel nicht erforderlich. Darüber hinausgehend ist ein Use Case im Kontext der Katalogabfrage folgender: Ein Client möchte eine Expansion neu generieren (z.B. mit anderen Expansionen-Parametern), um das ValueSet beispielsweise in einer anderen Sprache auszugeben. 

**Usages:**

* Examples for this Profile: [TestKatalog](CodeSystem-CodeSystemExample.md)
* CapabilityStatements using this Profile: [Akteur "ISiKCapabilityStatementBasisServerAkteur" (Expanded)](CapabilityStatement-ISiKCapabilityStatementBasisServerAkteur-expanded.md) and [CapabilityStatement für Rolle "ISiKCapabilityStatementTerminologieRolle"](CapabilityStatement-ISiKCapabilityStatementTerminologieRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/basis|current/StructureDefinition/ISiKCodeSystem)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKCodeSystem.csv), [Excel](StructureDefinition-ISiKCodeSystem.xlsx), [Schematron](StructureDefinition-ISiKCodeSystem.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKCodeSystem",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKCodeSystem",
  "version" : "6.0.0-rc",
  "name" : "ISiKCodeSystem",
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
  "description" : "Dieses Profil beschreibt die maschinenlesbare Repräsentation von \nsystem-spezifischen Kodierungen in ISiK-Szenarien.  \n\n### Motivation\n\nISiK erlaubt in diversen Kontexten die Erweiterung der Kodierung durch Krankenhaus-/System-interne Kodierungen. Das Profil ISiKKatalog (CodeSystem) als Profil erlaubt die Repräsentation der dazugehörigen Codes und Display-Werte. \n\nEine maschinenlesbare Repräsentation dieser Kodierungen erlaubt es Clients, dazugehörige Anzeigetext und Definitionen zu verarbeiten.\n\nEin Codesystem eignet sich auch dazu, auf dessen Basis definierte [ValueSets zu expandieren](https://hl7.org/fhir/R4/valueset-operation-expand.html).\nDa ISiKValueSet expandierte Valuesets vorsieht, ist eine dynamische Expansion in der Regel nicht erforderlich.\nDarüber hinausgehend ist ein Use Case im Kontext der Katalogabfrage folgender: Ein Client möchte eine Expansion neu generieren (z.B. mit anderen Expansionen-Parametern), um das ValueSet beispielsweise in einer anderen Sprache auszugeben. ",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "workflow",
      "uri" : "http://hl7.org/fhir/workflow",
      "name" : "Workflow Pattern"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "objimpl",
      "uri" : "http://hl7.org/fhir/object-implementation",
      "name" : "Object Implementation Information"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "CodeSystem",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/CodeSystem",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "CodeSystem",
        "path" : "CodeSystem"
      },
      {
        "id" : "CodeSystem.id",
        "path" : "CodeSystem.id",
        "short" : "serverseitige, interne ID des Datensatzes",
        "comment" : "**bedingtes Pflichtfeld/bedingtes MS:** Alle von einem Server bereitgestellten Ressourcen MÜSSEN über eine `id` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `id`verfügen. ",
        "mustSupport" : true
      },
      {
        "id" : "CodeSystem.meta.versionId",
        "path" : "CodeSystem.meta.versionId",
        "short" : "Eindeutiger Name der serverseitigen Version des Datensatzes",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über eine `versionID` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `versionID`verfügen. "
      },
      {
        "id" : "CodeSystem.meta.lastUpdated",
        "path" : "CodeSystem.meta.lastUpdated",
        "short" : "Zeitpunkt der letzten Änderung",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über ein `lastUpdate` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über ein `lastUpdate`verfügen. "
      },
      {
        "id" : "CodeSystem.url",
        "path" : "CodeSystem.url",
        "short" : "Kanonische URL",
        "comment" : "**Bedeutung:** Eindeutige Url zur Identifizierung des CodeSystems. Absolute Url sind zu bevorzugen.  \n    **Hinweise:** OIDs SOLLTEN als weitere Identifier des CodeSystems verwendet werden. In jedem Fall SOLLTE eine Canonical Url vergeben werden.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "CodeSystem.version",
        "path" : "CodeSystem.version",
        "short" : "Version",
        "comment" : "**Bedeutung:** Version des CodeSystems  \n    **Hinweise:** Jede Änderung des CodeSystems MUSS eine Änderung in der Version des CodeSystems und gebundenen ValueSets nach sich ziehen. Die Versionierung SOLLTE auf dem Konzept von [Semantic Versioning](https://semver.org) basieren.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "CodeSystem.name",
        "path" : "CodeSystem.name",
        "short" : "Name des Codesystems",
        "comment" : "**Bedeutung:** Maschinenlesbarer Name des CodeSystems  \n    **Hinweise:** Der Constraint [cps-0](https://www.hl7.org/fhir/R4/codesystem.html#invs) ist hierbei zu beachten.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "CodeSystem.status",
        "path" : "CodeSystem.status",
        "short" : "Status",
        "comment" : "Zeigt den aktuellen Status der Ressource an.     \n  **WICHTIGER Hinweis für Implementierer:**    \n  * Alle server-seitigen Implementierungen MÜSSEN in der Lage sein, \n  die systemintern möglichen Statuswerte korrekt in FHIR abzubilden, mindestens jedoch 'active' und 'retired''.\n  * Alle client-seitigen Implementierungen MÜSSEN in der Lage sein, sämtliche Status-Codes zu interpretieren und dem Anwender in angemessener Form darstellen zu können, \n  beispielsweise durch Ausblenden/Durchstreichen von Ressourcen mit dem status `entered-in-error` und Ausgrauen von Ressourcen, die einen Plan- oder Entwurfs-Status haben.",
        "mustSupport" : true
      },
      {
        "id" : "CodeSystem.content",
        "path" : "CodeSystem.content",
        "short" : "Vollständigkeit der Repräsentation",
        "comment" : "**Bedeutung:** Angabe, ob es sich um eine vollständige Repräsentation des CodeSystems oder nur um einen Auszug handelt.\n    **Hinweise:** Alle in einem System möglichen Status-Werte müssen über FHIR korrekt repräsentiert werden können, mindestens jedoch die Status-Werte `fragment` und `complete`. Deren korrekte Abbildung wird im Rahmen des Bestätigungsverfahrens überprüft.",
        "mustSupport" : true
      },
      {
        "id" : "CodeSystem.concept",
        "path" : "CodeSystem.concept",
        "short" : "Konzept",
        "comment" : "**Bedeutung:** Angabe der Konzepte, aus denen sich das CodeSystem zusammensetzt.  \n     **Hinweise:** Es MUSS mindestens ein Code und ein Anzeigetext spezifiziert werden.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "CodeSystem.concept.code",
        "path" : "CodeSystem.concept.code",
        "short" : "Code",
        "comment" : "Der eindeutige Code, der das Konzept im CodeSystem identifiziert.",
        "mustSupport" : true
      },
      {
        "id" : "CodeSystem.concept.display",
        "path" : "CodeSystem.concept.display",
        "short" : "Anzeigetext",
        "comment" : "Die menschlich lesbare Darstellung des Konzepts.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "CodeSystem.concept.definition",
        "path" : "CodeSystem.concept.definition",
        "short" : "Definition",
        "comment" : "Eine ausführliche Beschreibung oder Definition des Konzepts.",
        "mustSupport" : true
      }
    ]
  }
}

```
