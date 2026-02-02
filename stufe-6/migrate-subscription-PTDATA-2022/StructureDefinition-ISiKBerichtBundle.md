# ISiKBerichtBundle - ISiK Subscription Implementierungsleitfaden v6.0.0-rc

ISiK Subscription Implementierungsleitfaden

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiKBerichtBundle**

## Resource Profile: ISiKBerichtBundle 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKBerichtBundle | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKBerichtBundle |

 
Das Document-Bundle dient dem Transport von Berichten zwischen Subsystemen im Krankenhaus. Das Bundle entspricht den Anforderungen an ein [FHIR Document Bundle](https://hl7.org/fhir/R4/documents.html) : Alle referenzierten Ressourcen müssen als Einträge im Bundle enthalten sein. Das Bundle unterstützt die Übermittlung einer menschenlesbaren Dokumentation (Narrative) und erlaubt zudem die Übernahme wichtiger Ressourcen (z. B. Diagnosen und Prozeduren), die einem Patienten und Fall (Patient, Encounter) zugeordnet sind. 

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/subscription|current/StructureDefinition/ISiKBerichtBundle)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKBerichtBundle.csv), [Excel](StructureDefinition-ISiKBerichtBundle.xlsx), [Schematron](StructureDefinition-ISiKBerichtBundle.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKBerichtBundle",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKBerichtBundle",
  "version" : "6.0.0-rc",
  "name" : "ISiKBerichtBundle",
  "title" : "ISiKBerichtBundle",
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
  "description" : "Das Document-Bundle dient dem Transport von Berichten zwischen Subsystemen im Krankenhaus. \nDas Bundle entspricht den Anforderungen an ein [FHIR Document Bundle](https://hl7.org/fhir/R4/documents.html) : Alle referenzierten Ressourcen müssen als Einträge im Bundle enthalten sein. \nDas Bundle unterstützt die Übermittlung einer menschenlesbaren Dokumentation (Narrative) und erlaubt zudem die Übernahme wichtiger Ressourcen (z. B. Diagnosen und Prozeduren), die einem Patienten und Fall (Patient, Encounter) zugeordnet sind.\n",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 v2 Mapping"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "cda",
      "uri" : "http://hl7.org/v3/cda",
      "name" : "CDA (R2)"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Bundle",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Bundle",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Bundle",
        "path" : "Bundle",
        "constraint" : [
          {
            "key" : "ISiK-docBundle-1",
            "severity" : "error",
            "human" : "All referenced Resources must be contained in the Bundle",
            "expression" : "Bundle.entry.descendants().reference.distinct().subsetOf(%context.entry.fullUrl)",
            "source" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKBerichtBundle"
          }
        ]
      },
      {
        "id" : "Bundle.id",
        "path" : "Bundle.id",
        "short" : "serverseitige, interne ID des Datensatzes",
        "comment" : "**bedingtes Pflichtfeld/bedingtes MS:** Alle von einem Server bereitgestellten Ressourcen MÜSSEN über eine `id` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `id`verfügen. ",
        "mustSupport" : true
      },
      {
        "id" : "Bundle.meta.versionId",
        "path" : "Bundle.meta.versionId",
        "short" : "Eindeutiger Name der serverseitigen Version des Datensatzes",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über eine `versionID` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `versionID`verfügen. "
      },
      {
        "id" : "Bundle.meta.lastUpdated",
        "path" : "Bundle.meta.lastUpdated",
        "short" : "Zeitpunkt der letzten Änderung",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über ein `lastUpdate` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über ein `lastUpdate`verfügen. "
      },
      {
        "id" : "Bundle.identifier",
        "path" : "Bundle.identifier",
        "short" : "Identifier des Berichtsbundles",
        "comment" : "**Motivation MS:** Zur Identifikation des Berichtbundles muss ein Identifier vom Subsystem mit angegeben werden.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Bundle.type",
        "path" : "Bundle.type",
        "short" : "Typ des Bundles",
        "comment" : "**Begründung MS:** Damit das Bundle ein Document-Bundle nach FHIR-Core Spec ist, muss der type auf `document` gesetzt werden.",
        "fixedCode" : "document",
        "mustSupport" : true
      },
      {
        "id" : "Bundle.timestamp",
        "path" : "Bundle.timestamp",
        "short" : "Datum des Bundles",
        "comment" : "**Begründung Pflichtfeld:** Ein Datum muss für die korrekte Verarbeitung durch das Zielsystem vorhanden sein.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Bundle.entry",
        "path" : "Bundle.entry",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "type",
              "path" : "resource"
            }
          ],
          "rules" : "open"
        },
        "short" : "Eintrag pro Ressource",
        "comment" : "**Begründung MS:** Alle im Rahmen des Berichtes relevanten Informationen müssen hier referenziert werden.",
        "min" : 2,
        "mustSupport" : true
      },
      {
        "id" : "Bundle.entry.fullUrl",
        "path" : "Bundle.entry.fullUrl",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Bundle.entry.resource",
        "path" : "Bundle.entry.resource",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Bundle.entry.search",
        "path" : "Bundle.entry.search",
        "max" : "0"
      },
      {
        "id" : "Bundle.entry.request",
        "path" : "Bundle.entry.request",
        "max" : "0"
      },
      {
        "id" : "Bundle.entry.response",
        "path" : "Bundle.entry.response",
        "max" : "0"
      },
      {
        "id" : "Bundle.entry:Composition",
        "path" : "Bundle.entry",
        "sliceName" : "Composition",
        "short" : "Slice zur Hinterlegung einer Composition-Instanz",
        "comment" : "Dieses Slice wird explizit aufgeführt, um zu verdeutlichen, dass immer eine Composition-Instanz im Bundle enthalten ist.\n  Die FHIR-Core Specification besagt für [Document-Bundles](https://www.hl7.org/fhir/R4/documents.html) bereits, dass die erste Ressource im Bundle eine Composition sein muss. Alle daraus referenzierten Ressourcen müssen ebenfalls Teil des Bundle sein.",
        "min" : 1,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "Bundle.entry:Composition.resource",
        "path" : "Bundle.entry.resource",
        "type" : [
          {
            "code" : "Composition",
            "profile" : [
              "https://gematik.de/fhir/isik/StructureDefinition/ISiKBerichtSubSysteme"
            ]
          }
        ]
      },
      {
        "id" : "Bundle.entry:Patient",
        "path" : "Bundle.entry",
        "sliceName" : "Patient",
        "short" : "Slice zur Hinterlegung einer Patienten-Instanz",
        "comment" : "Dieses Slice wir explizit aufgeführt, um zu verdeutlichen, dass immer eine Patienten-Instanz im Bundle enthalten ist.\n  Die FHIR-Core Specification besagt für [Document-Bundles](https://www.hl7.org/fhir/R4/documents.html) bereits,\n  dass einige von der Composition referenzierte Ressourcen immer auch im Bundle enthalten sein müssen. Hierzu gehört im ISiK Kontext auch die Patient-Instanz.",
        "min" : 1,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "Bundle.entry:Patient.resource",
        "path" : "Bundle.entry.resource",
        "type" : [
          {
            "code" : "Patient"
          }
        ]
      },
      {
        "id" : "Bundle.entry:Encounter",
        "path" : "Bundle.entry",
        "sliceName" : "Encounter",
        "short" : "Slice zur Hinterlegung einer Encounter-Instanz",
        "comment" : "Dieses Slice ist optional, aber wenn es vorhanden ist, muss es genau eine Encounter-Instanz sein. Die FHIR-Core Specification besagt für [Document-Bundles](https://www.hl7.org/fhir/R4/documents.html) bereits,\n  dass einige von der Composition referenzierte Ressourcen immer auch im Bundle enthalten sein müssen. Hierzu gehört im ISiK Kontext auch die Encounter-Instanz.",
        "min" : 0,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "Bundle.entry:Encounter.resource",
        "path" : "Bundle.entry.resource",
        "type" : [
          {
            "code" : "Encounter"
          }
        ]
      }
    ]
  }
}

```
