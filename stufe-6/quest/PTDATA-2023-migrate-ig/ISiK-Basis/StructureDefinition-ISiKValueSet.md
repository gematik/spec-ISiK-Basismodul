# ISiKValueSet - ISiK Basis Implementierungsleitfaden v6.0.0-rc

ISiK Basis Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiKValueSet**

## Resource Profile: ISiKValueSet 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKValueSet | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKValueSet |

 
Dieses Profil beschreibt die maschinenlesbare Auswahl von Codes für die Kodierung spezifischer FHIR-Elemente in ISiK-Szenarien. 

### Motivation

 
ISiK erlaubt in diversen Kontexten die Erweiterung der Kodierung durch Krankenhaus- / System-interne Kodierungen. Mittels der Veröffentlichung von ValueSets können Auswahllisten für externe Clients bereitgestellt werden, sodass diese entsprechende Kodierungen ebenfalls anbieten können. 

### Kompatibilität

 
Für das Profil ISiKValueSet wurde bis zum Zeitpunkt der Veröffentlichung kein Abgleich der Kompatibilität zu anderen Profilen (der KBV und der Medizininformatik-Initiative) durchgeführt. Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. 

**Usages:**

* Examples for this Profile: [TestValueSet](ValueSet-ISiKValueSetExample.md)
* CapabilityStatements using this Profile: [Akteur ISiKCapabilityStatementBasisServerAkteur (Expanded)](CapabilityStatement-ISiKCapabilityStatementBasisServerAkteur-expanded.md) and [CapabilityStatement für Rolle ISiKCapabilityStatementTerminologieRolle](CapabilityStatement-ISiKCapabilityStatementTerminologieRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/basis|current/StructureDefinition/ISiKValueSet)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKValueSet.csv), [Excel](StructureDefinition-ISiKValueSet.xlsx), [Schematron](StructureDefinition-ISiKValueSet.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKValueSet",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKValueSet",
  "version" : "6.0.0-rc",
  "name" : "ISiKValueSet",
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
  "description" : "Dieses Profil beschreibt die maschinenlesbare Auswahl von Codes \nfür die Kodierung spezifischer FHIR-Elemente in ISiK-Szenarien.\n### Motivation\n\nISiK erlaubt in diversen Kontexten die Erweiterung der Kodierung durch Krankenhaus- / System-interne Kodierungen.\nMittels der Veröffentlichung von ValueSets können Auswahllisten für externe Clients bereitgestellt werden, sodass diese entsprechende Kodierungen ebenfalls anbieten können.\n### Kompatibilität\n\nFür das Profil ISiKValueSet wurde bis zum Zeitpunkt der Veröffentlichung kein Abgleich der Kompatibilität zu anderen Profilen (der KBV und der Medizininformatik-Initiative) durchgeführt.\nHinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden.",
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
  "type" : "ValueSet",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/ValueSet",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "ValueSet",
        "path" : "ValueSet"
      },
      {
        "id" : "ValueSet.id",
        "path" : "ValueSet.id",
        "short" : "serverseitige, interne ID des Datensatzes",
        "comment" : "**bedingtes Pflichtfeld/bedingtes MS:** Alle von einem Server bereitgestellten Ressourcen MÜSSEN über eine `id` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `id`verfügen. ",
        "mustSupport" : true
      },
      {
        "id" : "ValueSet.meta.versionId",
        "path" : "ValueSet.meta.versionId",
        "short" : "Eindeutiger Name der serverseitigen Version des Datensatzes",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über eine `versionID` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `versionID`verfügen. "
      },
      {
        "id" : "ValueSet.meta.lastUpdated",
        "path" : "ValueSet.meta.lastUpdated",
        "short" : "Zeitpunkt der letzten Änderung",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über ein `lastUpdate` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über ein `lastUpdate`verfügen. "
      },
      {
        "id" : "ValueSet.url",
        "path" : "ValueSet.url",
        "short" : "Eindeutige Url des ValueSets",
        "comment" : "**Bedeutung:** Eindeutige Url zur Identifizierung des ValueSets. Absolute Urls sind zu bevorzugen.\n\n**Hinweise:** OIDs SOLLTEN als weitere Identifier des CodeSystems verwendet werden. In jedem Fall SOLLTE eine Canonical Url vergeben werden.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "ValueSet.version",
        "path" : "ValueSet.version",
        "short" : "Version des ValueSets",
        "comment" : "\n**Bedeutung:** Version des ValueSets\n\n**Hinweise:** Jede Änderung des dazugehörigen CodeSystems MUSS eine Änderung in der Version des CodeSystems und ValueSets nach sich ziehen.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "ValueSet.name",
        "path" : "ValueSet.name",
        "short" : "Name des ValueSets",
        "comment" : "**Bedeutung:** Maschinenlesbarer Name des ValueSets\n\n**Hinweise:** Der Constraint [vsd-0](https://www.hl7.org/fhir/R4/valueset.html#invs) ist hierbei zu beachten.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "ValueSet.status",
        "path" : "ValueSet.status",
        "short" : "Status",
        "comment" : "Zeigt den aktuellen Status der Ressource an.     \n  **WICHTIGER Hinweis für Implementierer:**    \n  * Alle server-seitigen Implementierungen MÜSSEN in der Lage sein, \n  die systemintern möglichen Statuswerte korrekt in FHIR abzubilden, mindestens jedoch 'active' und 'retired''.\n  * Alle client-seitigen Implementierungen MÜSSEN in der Lage sein, sämtliche Status-Codes zu interpretieren und dem Anwender in angemessener Form darstellen zu können, \n  beispielsweise durch Ausblenden/Durchstreichen von Ressourcen mit dem status `entered-in-error` und Ausgrauen von Ressourcen, die einen Plan- oder Entwurfs-Status haben.",
        "mustSupport" : true
      },
      {
        "id" : "ValueSet.useContext",
        "path" : "ValueSet.useContext",
        "short" : "Datenelement-Relevanz das ValueSet",
        "comment" : "**Bedeutung:** Angabe für welches Datenelement das ValueSet relevant ist\n\n**Hinweise:** Es muss mindestens ein useContext angegeben werden, in dem der Ressourcen-Typ kodiert wird, in dem das ValueSet in einem Element zur Verwendung kommt.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "ValueSet.useContext.code",
        "path" : "ValueSet.useContext.code",
        "comment" : "Der Code 'focus' MUSS angegeben werden, um zu kennzeichnen, dass die UsageContext-Angabe sich auf die durch das ValueSet zu kodierenden Konzepte bezieht.",
        "patternCoding" : {
          "system" : "http://terminology.hl7.org/CodeSystem/usage-context-type",
          "code" : "focus"
        }
      },
      {
        "id" : "ValueSet.useContext.value[x]",
        "path" : "ValueSet.useContext.value[x]",
        "comment" : "Angabe in welchem Ressourcen-Typ das ValueSet verwendet wird.",
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ],
        "binding" : {
          "strength" : "required",
          "description" : "One of the resource types defined as part of this version of FHIR.",
          "valueSet" : "http://hl7.org/fhir/ValueSet/resource-types"
        }
      },
      {
        "id" : "ValueSet.expansion",
        "path" : "ValueSet.expansion",
        "short" : "Expansion der Konzepte",
        "comment" : "**Bedeutung:** Angabe der Konzepte aus denen sich das ValueSet zusammensetzt.\n\n**Hinweise:** Mindestens MUSS ein Code und ein Anzeigetext spezifiziert werden.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "ValueSet.expansion.timestamp",
        "path" : "ValueSet.expansion.timestamp",
        "comment" : "Angabe zu welchem Zeitpunkt die Expansion generiert wurden ist.",
        "mustSupport" : true
      },
      {
        "id" : "ValueSet.expansion.contains",
        "path" : "ValueSet.expansion.contains",
        "comment" : "Enthält die Liste der Konzepte, die in der Expansion enthalten sind.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "ValueSet.expansion.contains.system",
        "path" : "ValueSet.expansion.contains.system",
        "comment" : "Gibt das Codingsystem an, aus dem das Konzept stammt.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "ValueSet.expansion.contains.version",
        "path" : "ValueSet.expansion.contains.version",
        "comment" : "Spezifiziert die Version des Codingsystems, die verwendet wurde.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "ValueSet.expansion.contains.code",
        "path" : "ValueSet.expansion.contains.code",
        "comment" : "Der spezifische Code des Konzepts im definierten Codingsystem.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "ValueSet.expansion.contains.display",
        "path" : "ValueSet.expansion.contains.display",
        "comment" : "Die menschlich lesbare Darstellung des Konzepts.",
        "min" : 1,
        "mustSupport" : true
      }
    ]
  }
}

```
