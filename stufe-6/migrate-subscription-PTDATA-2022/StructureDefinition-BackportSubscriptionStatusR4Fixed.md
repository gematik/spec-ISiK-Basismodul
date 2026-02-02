# R4 Backported R5 SubscriptionStatus - ISiK Subscription Implementierungsleitfaden v6.0.0-rc

ISiK Subscription Implementierungsleitfaden

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **R4 Backported R5 SubscriptionStatus**

## Resource Profile: R4 Backported R5 SubscriptionStatus 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/BackportSubscriptionStatusR4Fixed | *Version*:6.0.0-rc |
| Active as of 2023-01-11 | *Computable Name*:BackportSubscriptionStatusR4Fixed |

 
Profil auf der FHIR-R4-Resource Parameters zur Unterstützung themenbasierter Subscription-Benachrichtigungen in R4. 
Dieses Profil ist funktional identisch mit `http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-subscription-status-r4`.
 Die Version 1.1.0 des offiziellen Profils weist jedoch technische Fehler auf. Daher wurde es hier als Workaround erneut implementiert. Diese lokale Definition wird durch das offizielle `backport-subscription-status-r4` Profil ersetzt, sobald eine korrigierte Version veröffentlicht wurde. 

**Usages:**

* Use this Profile: [R4 Topic-Based Subscription Notification Bundle](StructureDefinition-BackportSubscriptionNotificationR4Fixed.md)
* CapabilityStatements using this Profile: [CapabilityStatement für Rolle "Subscription"](CapabilityStatement-ISiKCapabilityStatementSubscriptionRolle.md) and [Akteur "ISiKCapabilityStatementSubscriptionServerAkteur" (Expanded)](CapabilityStatement-ISiKCapabilityStatementSubscriptionServerAkteur-expanded.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/subscription|current/StructureDefinition/BackportSubscriptionStatusR4Fixed)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-BackportSubscriptionStatusR4Fixed.csv), [Excel](StructureDefinition-BackportSubscriptionStatusR4Fixed.xlsx), [Schematron](StructureDefinition-BackportSubscriptionStatusR4Fixed.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "BackportSubscriptionStatusR4Fixed",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/BackportSubscriptionStatusR4Fixed",
  "version" : "6.0.0-rc",
  "name" : "BackportSubscriptionStatusR4Fixed",
  "title" : "R4 Backported R5 SubscriptionStatus",
  "status" : "active",
  "experimental" : false,
  "date" : "2023-01-11T15:34:32+11:00",
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
  "description" : "Profil auf der FHIR-R4-Resource Parameters zur Unterstützung themenbasierter Subscription-Benachrichtigungen in R4.\n\nDieses Profil ist funktional identisch mit `http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-subscription-status-r4`.  \nDie Version 1.1.0 des offiziellen Profils weist jedoch technische Fehler auf. Daher wurde es hier als Workaround erneut implementiert.\nDiese lokale Definition wird durch das offizielle `backport-subscription-status-r4` Profil ersetzt, sobald eine korrigierte Version veröffentlicht wurde.",
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
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Parameters",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Parameters",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Parameters",
        "path" : "Parameters",
        "short" : "Parameter containing subscription status information"
      },
      {
        "id" : "Parameters.id",
        "path" : "Parameters.id",
        "short" : "serverseitige, interne ID des Datensatzes",
        "comment" : "**bedingtes Pflichtfeld/bedingtes MS:** Alle von einem Server bereitgestellten Ressourcen MÜSSEN über eine `id` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `id`verfügen. ",
        "mustSupport" : true
      },
      {
        "id" : "Parameters.meta.versionId",
        "path" : "Parameters.meta.versionId",
        "short" : "Eindeutiger Name der serverseitigen Version des Datensatzes",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über eine `versionID` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `versionID`verfügen. "
      },
      {
        "id" : "Parameters.meta.lastUpdated",
        "path" : "Parameters.meta.lastUpdated",
        "short" : "Zeitpunkt der letzten Änderung",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über ein `lastUpdate` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über ein `lastUpdate`verfügen. "
      },
      {
        "id" : "Parameters.parameter",
        "path" : "Parameters.parameter",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "name"
            }
          ],
          "description" : "Slice on parameter name",
          "ordered" : false,
          "rules" : "open"
        },
        "short" : "Slices containing subscription status information",
        "min" : 3
      },
      {
        "id" : "Parameters.parameter:subscription",
        "path" : "Parameters.parameter",
        "sliceName" : "subscription",
        "short" : "Parameter containing the reference to a subscription",
        "min" : 1,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "Parameters.parameter:subscription.name",
        "path" : "Parameters.parameter.name",
        "short" : "Slice discriminator: the reference to a subscription",
        "fixedString" : "subscription"
      },
      {
        "id" : "Parameters.parameter:subscription.value[x]",
        "path" : "Parameters.parameter.value[x]",
        "short" : "Reference to the Subscription responsible for this notification",
        "definition" : "The reference to the Subscription which generated this notification.",
        "min" : 1,
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Subscription"]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Parameters.parameter:topic",
        "path" : "Parameters.parameter",
        "sliceName" : "topic",
        "short" : "Parameter containing the canonical reference to a subscription topic",
        "min" : 0,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "Parameters.parameter:topic.name",
        "path" : "Parameters.parameter.name",
        "short" : "Slice discriminator: the canonical reference to a subscription topic",
        "fixedString" : "topic"
      },
      {
        "id" : "Parameters.parameter:topic.value[x]",
        "path" : "Parameters.parameter.value[x]",
        "short" : "Canonical reference to the SubscriptionTopic this notification relates to",
        "definition" : "Canonical reference to the SubscriptionTopic for the Subscription which generated this notification.",
        "comment" : "This value SHOULD NOT be present when using `empty` payloads, MAY be present when using id-only payloads, and SHOULD be present when using `full-resource` payloads.",
        "type" : [
          {
            "code" : "canonical"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Parameters.parameter:status",
        "path" : "Parameters.parameter",
        "sliceName" : "status",
        "short" : "Parameter containing the subscription status",
        "min" : 1,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "Parameters.parameter:status.name",
        "path" : "Parameters.parameter.name",
        "short" : "Slice discriminator: the subscription status",
        "fixedString" : "status"
      },
      {
        "id" : "Parameters.parameter:status.value[x]",
        "path" : "Parameters.parameter.value[x]",
        "short" : "Status of the subscription when this notification was generated",
        "definition" : "The status of the subscription, which marks the server state for managing the subscription.",
        "min" : 1,
        "type" : [
          {
            "code" : "code"
          }
        ],
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://hl7.org/fhir/ValueSet/subscription-status"
        }
      },
      {
        "id" : "Parameters.parameter:type",
        "path" : "Parameters.parameter",
        "sliceName" : "type",
        "short" : "Parameter containing the type of event for this notification",
        "min" : 1,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "Parameters.parameter:type.name",
        "path" : "Parameters.parameter.name",
        "short" : "Slice discriminator: the type of event for this notification",
        "fixedString" : "type"
      },
      {
        "id" : "Parameters.parameter:type.value[x]",
        "path" : "Parameters.parameter.value[x]",
        "short" : "The type of event being conveyed with this notificaiton.",
        "min" : 1,
        "type" : [
          {
            "code" : "code"
          }
        ],
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://hl7.org/fhir/ValueSet/subscription-notification-type"
        }
      },
      {
        "id" : "Parameters.parameter:eventsSinceSubscriptionStart",
        "path" : "Parameters.parameter",
        "sliceName" : "eventsSinceSubscriptionStart",
        "short" : "Parameter containing the number of events since this subscription started",
        "min" : 0,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "Parameters.parameter:eventsSinceSubscriptionStart.name",
        "path" : "Parameters.parameter.name",
        "short" : "Slice discriminator: the number of events since this subscription started",
        "fixedString" : "events-since-subscription-start"
      },
      {
        "id" : "Parameters.parameter:eventsSinceSubscriptionStart.value[x]",
        "path" : "Parameters.parameter.value[x]",
        "short" : "Events since the Subscription was created",
        "definition" : "The total number of actual events which have been generated since the Subscription was created (inclusive of this notification) - regardless of how many have been successfully communicated. This number is NOT incremented for handshake and heartbeat notifications.",
        "type" : [
          {
            "code" : "string"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Parameters.parameter:notificationEvent",
        "path" : "Parameters.parameter",
        "sliceName" : "notificationEvent",
        "short" : "Parameter containing the event notification details",
        "min" : 0,
        "max" : "*",
        "mustSupport" : true
      },
      {
        "id" : "Parameters.parameter:notificationEvent.name",
        "path" : "Parameters.parameter.name",
        "short" : "Parameter containing notification event details",
        "fixedString" : "notification-event"
      },
      {
        "id" : "Parameters.parameter:notificationEvent.part",
        "path" : "Parameters.parameter.part",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "name"
            }
          ],
          "description" : "Slice on notification event parameter name",
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Parameters.parameter:notificationEvent.part:eventNumber",
        "path" : "Parameters.parameter.part",
        "sliceName" : "eventNumber",
        "short" : "Parameter containing the event number",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Parameters.parameter:notificationEvent.part:eventNumber.name",
        "path" : "Parameters.parameter.part.name",
        "short" : "Slice discriminator: the event number",
        "fixedString" : "event-number"
      },
      {
        "id" : "Parameters.parameter:notificationEvent.part:eventNumber.value[x]",
        "path" : "Parameters.parameter.part.value[x]",
        "short" : "Event number",
        "definition" : "The sequential number of this event in this subscription context.",
        "min" : 1,
        "type" : [
          {
            "code" : "string"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Parameters.parameter:notificationEvent.part:eventTimestamp",
        "path" : "Parameters.parameter.part",
        "sliceName" : "eventTimestamp",
        "short" : "Parameter containing the event timestamp",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Parameters.parameter:notificationEvent.part:eventTimestamp.name",
        "path" : "Parameters.parameter.part.name",
        "short" : "Slice discriminator: the event timestamp",
        "fixedString" : "timestamp"
      },
      {
        "id" : "Parameters.parameter:notificationEvent.part:eventTimestamp.value[x]",
        "path" : "Parameters.parameter.part.value[x]",
        "short" : "The instant this event occurred",
        "definition" : "The actual time this event occured on the server.",
        "type" : [
          {
            "code" : "instant"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Parameters.parameter:notificationEvent.part:eventFocus",
        "path" : "Parameters.parameter.part",
        "sliceName" : "eventFocus",
        "short" : "Parameter containing the event focus",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Parameters.parameter:notificationEvent.part:eventFocus.name",
        "path" : "Parameters.parameter.part.name",
        "short" : "Slice discriminator: the event focus",
        "fixedString" : "focus"
      },
      {
        "id" : "Parameters.parameter:notificationEvent.part:eventFocus.value[x]",
        "path" : "Parameters.parameter.part.value[x]",
        "short" : "The focus of this event",
        "definition" : "The focus of this event. While this will usually be a reference to the focus resource of the event, it MAY contain a reference to a non-FHIR object.",
        "type" : [
          {
            "code" : "Reference"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Parameters.parameter:notificationEvent.part:eventAdditionalContext",
        "path" : "Parameters.parameter.part",
        "sliceName" : "eventAdditionalContext",
        "short" : "Parameter containing additional context for this event",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Parameters.parameter:notificationEvent.part:eventAdditionalContext.name",
        "path" : "Parameters.parameter.part.name",
        "short" : "Slice discriminator: additional context for this event",
        "fixedString" : "additional-context"
      },
      {
        "id" : "Parameters.parameter:notificationEvent.part:eventAdditionalContext.value[x]",
        "path" : "Parameters.parameter.part.value[x]",
        "short" : "Additional context for this event",
        "definition" : "Additional context information for this event. Generally, this will contain references to additional resources included with the event (e.g., the Patient relevant to an Encounter), however it MAY refer to non-FHIR objects.",
        "type" : [
          {
            "code" : "Reference"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Parameters.parameter:error",
        "path" : "Parameters.parameter",
        "sliceName" : "error",
        "short" : "Parameter containing errors on the subscription",
        "min" : 0,
        "max" : "*",
        "mustSupport" : true
      },
      {
        "id" : "Parameters.parameter:error.name",
        "path" : "Parameters.parameter.name",
        "short" : "Slice discriminator: errors on the subscription",
        "fixedString" : "error"
      },
      {
        "id" : "Parameters.parameter:error.value[x]",
        "path" : "Parameters.parameter.value[x]",
        "short" : "An error on the subscription",
        "definition" : "A record of errors that occurred when the server processed a notification.",
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ],
        "mustSupport" : true
      }
    ]
  }
}

```
