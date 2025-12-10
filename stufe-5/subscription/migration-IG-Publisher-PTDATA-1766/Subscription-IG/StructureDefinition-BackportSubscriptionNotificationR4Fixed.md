# R4 Topic-Based Subscription Notification Bundle - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **R4 Topic-Based Subscription Notification Bundle**

## Resource Profile: R4 Topic-Based Subscription Notification Bundle 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/BackportSubscriptionNotificationR4Fixed | *Version*:0.0.1 |
| Active as of 2023-01-11 | *Computable Name*:BackportSubscriptionNotificationR4Fixed |

 
Profil auf der FHIR-R4-Resource Bundle, um R5-ähnliche, themenbasierte Subscription-Benachrichtigungen in FHIR R4 zu ermöglichen. 
Dieses Profil ist funktional identisch mit`http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-subscription-notification-r4`.
Die Version 1.1.0 des offiziellen Profils enthält jedoch technische Fehler. Daher wurde dieses Profil lokal als temporärer Workaround nachgebildet. Es wird durch das offizielle`backport-subscription-notification-r4`Profil ersetzt, sobald eine korrigierte Version veröffentlicht wurde. 

**Usages:**

* CapabilityStatements using this Profile: [CapabilityStatement für Rolle "Subscription"](CapabilityStatement-ISiKCapabilityStatementSubscriptionRolle.md) and [Akteur "ISiKCapabilityStatementSubscriptionServerAkteur" (Expanded)](CapabilityStatement-ISiKCapabilityStatementSubscriptionServerAkteur-expanded.md)
* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/example.test.ig|current/StructureDefinition/BackportSubscriptionNotificationR4Fixed)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-BackportSubscriptionNotificationR4Fixed.csv), [Excel](StructureDefinition-BackportSubscriptionNotificationR4Fixed.xlsx), [Schematron](StructureDefinition-BackportSubscriptionNotificationR4Fixed.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "BackportSubscriptionNotificationR4Fixed",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/BackportSubscriptionNotificationR4Fixed",
  "version" : "0.0.1",
  "name" : "BackportSubscriptionNotificationR4Fixed",
  "title" : "R4 Topic-Based Subscription Notification Bundle",
  "status" : "active",
  "experimental" : false,
  "date" : "2023-01-11T15:35:36+11:00",
  "contact" : [
    {
      "name" : "HL7 FHIR Infrastructure WG",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://hl7.org/Special/committees/fiwg"
        }
      ]
    },
    {
      "name" : "Gino Canessa",
      "telecom" : [
        {
          "system" : "email",
          "value" : "mailto:gino.canessa@microsoft.com"
        }
      ]
    },
    {
      "name" : "Eric Haas",
      "telecom" : [
        {
          "system" : "email",
          "value" : "mailto:ehaas@healthedatainc.com"
        }
      ]
    }
  ],
  "description" : "Profil auf der FHIR-R4-Resource Bundle, um R5-ähnliche, themenbasierte Subscription-Benachrichtigungen in FHIR R4 zu ermöglichen.\n\nDieses Profil ist funktional identisch mit `http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-subscription-notification-r4`.  \nDie Version 1.1.0 des offiziellen Profils enthält jedoch technische Fehler. Daher wurde dieses Profil lokal als temporärer Workaround nachgebildet.\nEs wird durch das offizielle `backport-subscription-notification-r4` Profil ersetzt, sobald eine korrigierte Version veröffentlicht wurde.",
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
            "key" : "backport-notification-bundle-r4-1",
            "severity" : "error",
            "human" : "A notification bundle MUST have a Parameters as the first entry",
            "expression" : "(entry.first().resource.is(Parameters))",
            "source" : "https://gematik.de/fhir/isik/StructureDefinition/BackportSubscriptionNotificationR4Fixed"
          }
        ]
      },
      {
        "id" : "Bundle.id",
        "path" : "Bundle.id",
        "short" : "serverseitige, interne ID des Datensatzes",
        "comment" : "**bedingtes Pflichtfeld/bedingtes MS:** Alle von einem Server bereitgestellten Ressourcen MÜSSEN über eine `id` verfügen.\r\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `id`verfügen. ",
        "mustSupport" : true
      },
      {
        "id" : "Bundle.meta.versionId",
        "path" : "Bundle.meta.versionId",
        "short" : "Eindeutiger Name der serverseitigen Version des Datensatzes",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über eine `versionID` verfügen.\r\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `versionID`verfügen. "
      },
      {
        "id" : "Bundle.meta.lastUpdated",
        "path" : "Bundle.meta.lastUpdated",
        "short" : "Zeitpunkt der letzten Änderung",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über ein `lastUpdate` verfügen.\r\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über ein `lastUpdate`verfügen. "
      },
      {
        "id" : "Bundle.type",
        "path" : "Bundle.type",
        "patternCode" : "history"
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
          "description" : "Slice based on resource",
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Bundle.entry:subscriptionStatus",
        "path" : "Bundle.entry",
        "sliceName" : "subscriptionStatus",
        "min" : 1,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "Bundle.entry:subscriptionStatus.resource",
        "path" : "Bundle.entry.resource",
        "min" : 1,
        "type" : [
          {
            "code" : "Parameters",
            "profile" : [
              "https://gematik.de/fhir/isik/StructureDefinition/BackportSubscriptionStatusR4Fixed"
            ]
          }
        ],
        "mustSupport" : true
      }
    ]
  }
}

```
