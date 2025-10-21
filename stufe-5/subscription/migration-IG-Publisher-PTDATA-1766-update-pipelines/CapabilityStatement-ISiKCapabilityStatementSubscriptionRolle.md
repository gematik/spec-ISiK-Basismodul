# CapabilityStatement für Rolle "Subscription" - Test Implementation Guide v0.0.1

Implementation Guide

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **CapabilityStatement für Rolle &quot;Subscription&quot;**

## CapabilityStatement: CapabilityStatement für Rolle "Subscription" 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementSubscriptionRolle | *Version*:0.0.1 |
| Active as of 2025-06-26 | *Computable Name*:ISiKCapabilityStatementSubscriptionRolle |

 
Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert. 
Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. 

 
CapabilityStatement für die Rolle "ISiKCapabilityStatementSubscriptionRolle". Diese Rolle beschreibt die Fähigkeiten eines Systems zur Registrierung, Verwaltung und Verarbeitung von FHIR Subscriptions auf Basis themenbasierter Benachrichtigungen nach dem R5-Modell unter Verwendung der Subscriptions-Backport-Mechanismen in FHIR R4. 

## CapabilityStatement für Rolle &quot;Subscription&quot;

* Implementation Guide Version: 0.0.1 
* FHIR Version: 4.0.1 
* Supported Formats: `application/fhir+xml`, `application/fhir+json`
* Published on: 2025-06-26 

> **Note to Implementers: FHIR Capabilities**Any FHIR capability may be 'allowed' by the system unless explicitly marked as 'SHALL NOT'. A few items are marked as MAY in the Implementation Guide to highlight their potential relevance to the use case.

### SHALL Support the Following Implementation Guides

* https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Subscription

## FHIR RESTful Capabilities

### Mode: server

### Capabilities by Resource/Profile

#### Summary

The summary table lists the resources that are part of this configuration, and for each resource it lists:

* The relevant profiles (if any)
* The interactions supported by each resource (**R**ead, **S**earch, **U**pdate, and **C**reate, are always shown, while **VR**ead, **P**atch, **D**elete, **H**istory on **I**nstance, or **H**istory on **T**ype are only present if at least one of the resources has support for them.
* The required, recommended, and some optional search parameters (if any).
* The linked resources enabled for `_include`
* The other resources enabled for `_revinclude`
* The operations on the resource (if any)

| | | | | | | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| [Subscription](#Subscription1-1) | Supported Profiles  [ISiK Subscription](StructureDefinition-ISiKSubscription.md) | **Y** | **Y** | **Y** | **Y** | **Y** | _id, _tag, _count, _has, criteria, status, url |  |  | `$status`,`$events` |
| [Parameters](#Parameters1-2) | Supported Profiles  [R4 Backported R5 SubscriptionStatus](StructureDefinition-BackportSubscriptionStatusR4Fixed.md) |  |  |  |  |  |  |  |  |  |
| [Bundle](#Bundle1-3) | Supported Profiles  [R4 Topic-Based Subscription Notification Bundle](StructureDefinition-BackportSubscriptionNotificationR4Fixed.md) |  |  |  |  |  |  |  |  |  |

-------

#### Resource Conformance: SHALL Subscription

Core FHIR Resource

[Subscription](http://hl7.org/fhir/R4/subscription.html)

Reference Policy

Interaction summary

* **SHALL** support `read`, `create`, `update`, `delete`, `search-type`.

Supported Profiles
[ISiK Subscription](StructureDefinition-ISiKSubscription.md)

Search Parameters


 

Extended Operations


#### Resource Conformance: SHALL Parameters

Core FHIR Resource

[Parameters](http://hl7.org/fhir/R4/parameters.html)

Reference Policy

Interaction summary

Supported Profiles
[R4 Backported R5 SubscriptionStatus](StructureDefinition-BackportSubscriptionStatusR4Fixed.md)

#### Resource Conformance: SHALL Bundle

Core FHIR Resource

[Bundle](http://hl7.org/fhir/R4/bundle.html)

Reference Policy

Interaction summary

Supported Profiles
[R4 Topic-Based Subscription Notification Bundle](StructureDefinition-BackportSubscriptionNotificationR4Fixed.md)



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "ISiKCapabilityStatementSubscriptionRolle",
  "url" : "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementSubscriptionRolle",
  "version" : "0.0.1",
  "name" : "ISiKCapabilityStatementSubscriptionRolle",
  "title" : "CapabilityStatement für Rolle &quot;Subscription&quot;",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-06-26",
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
  "description" : "Dieses CapabilityStatement beschreibt alle Interaktionen, \r\n  die ein System unterstützen MUSS, welches diese Rolle implementiert.   \r\n  \r\nDie CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). \r\nZur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, \r\nwird die [CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) mit den möglichen Werten `SHALL` (=MUSS) und `MAY` (=KANN) verwendet.",
  "purpose" : "\nCapabilityStatement für die Rolle &quot;ISiKCapabilityStatementSubscriptionRolle&quot;.\nDiese Rolle beschreibt die Fähigkeiten eines Systems zur Registrierung, Verwaltung und Verarbeitung von FHIR Subscriptions auf Basis themenbasierter Benachrichtigungen nach dem R5-Modell unter Verwendung der Subscriptions-Backport-Mechanismen in FHIR R4.\n",
  "kind" : "requirements",
  "fhirVersion" : "4.0.1",
  "format" : ["application/fhir+xml", "application/fhir+json"],
  "implementationGuide" : [
    "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Subscription"
  ],
  "rest" : [
    {
      "mode" : "server",
      "resource" : [
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
              "valueCode" : "SHALL"
            }
          ],
          "type" : "Subscription",
          "supportedProfile" : [
            "https://gematik.de/fhir/isik/StructureDefinition/ISiKSubscription"
          ],
          "interaction" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "code" : "read"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "code" : "create"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "code" : "update"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "code" : "delete"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "code" : "search-type"
            }
          ],
          "searchParam" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "_id",
              "definition" : "http://hl7.org/fhir/SearchParameter/Resource-id",
              "type" : "token",
              "documentation" : "**Beispiel:**\n        `GET [base]/[Resourcetype]?_id=103270`\n        **Anwendungshinweis:**\n        Der Parameter `_id` wird selten alleinstehend verwendet, da sich zum Abruf einer Ressource\n        anhand der `id`  die `READ`-Interaktion besser anbietet. Der Parameter kann jedoch verwendet werden,\n        um den Abruf einer Ressource bspw. mit einem `_include` weiterer Ressourcen zu verbinden,\n        z.B. zum Abruf eines Encounters in Verbindung mit dem zugehörigen Patienten:\n        `GET [base]/Encounter?_id=103270&_include=Encounter:patient`\n        Weitere Details siehe FHIR-Kernspezifikation, Abschnitt [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all).\n        Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend."
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "_tag",
              "definition" : "http://hl7.org/fhir/SearchParameter/Resource-tag",
              "type" : "token",
              "documentation" : "**Beispiel:**\n        `GET [base]/[Resourcetype]?_tag=https://example.org/codes|needs-review`\n        **Anwendungshinweis:**\n        Weitere Details siehe FHIR-Kernspezifikation, Abschnitt [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all)\n        sowie Abschnitt [Tags](https://www.hl7.org/fhir/R4/resource.html#simple-tags).  "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "_count",
              "type" : "number",
              "documentation" : "**Beispiel:**\n        `GET [base]/[Resourcetype]?_count=100`\n        **Anwendungshinweis:**\n        Weitere Details siehe FHIR-Kernspezifikation, Abschnitt [Page Count](https://www.hl7.org/fhir/R4/search.html#count).  "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ],
              "name" : "_has",
              "type" : "string",
              "documentation" : "**Beispiel:** Suche nach allen Patienten, die eine Observation  mit dem Code '1234-5' haben\n        `GET [base]/Patient?_has:Observation:patient:code=1234-5`\n        **Beispiel:** Suche nach allen Encountern, bei denen die Diagnose 'A12.3' gestellt wurde\n        `GET [base]/Encounter?_has:Condition:encounter:code=A12.3`\n        **Anwendungshinweis:**\n        Weitere Details siehe FHIR-Kernspezifikation, Abschnitt [Reverse Chaining](https://hl7.org/fhir/R4/search.html#has).  "
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "criteria",
              "definition" : "http://hl7.org/fhir/SearchParameter/Subscription-criteria",
              "type" : "string",
              "documentation" : "**Beispiel:**    \n        `GET [base]/Subscription?criteria=https://gematik.de/fhir/isik/SubscriptionTopic/patient-merge`    \n        **Anwendungshinweis:**    \n        Dient dazu eine Subscription zu finden, die auf ein bestimmtes SubscriptionTopic verweist.        \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string)."
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "status",
              "definition" : "http://hl7.org/fhir/SearchParameter/Subscription-status",
              "type" : "token",
              "documentation" : "**Beispiel:**    \n        `GET [base]/Subscription?status=requested`    \n        **Anwendungshinweis:**   \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token)."
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "url",
              "definition" : "http://hl7.org/fhir/SearchParameter/Subscription-url",
              "type" : "uri",
              "documentation" : "**Beispiel:**    \n        `GET [base]/Subscription?url=http://example.org/fhir/`    \n        **Anwendungshinweis:**    \n        Dient dazu eine Subscription zu finden, die auf einen REST-Endpoint verweist welcher die Subscription Notifications empfangen soll.    \n        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#uri)."
            }
          ],
          "operation" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "status",
              "definition" : "http://hl7.org/fhir/uv/subscriptions-backport/OperationDefinition/backport-subscription-status",
              "documentation" : "**Beispiel:**    \n        `GET [base]/Subscription/[id]/$status`    \n        **Anwendungshinweis:**    \n        Dient dazu den Status einer Subscription zu ermitteln.    \n        Weitere Details siehe [Subscriptions R5 Backport IG](https://hl7.org/fhir/uv/subscriptions-backport/OperationDefinition/backport-subscription-status)."
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "events",
              "definition" : "http://hl7.org/fhir/uv/subscriptions-backport/OperationDefinition/backport-subscription-events",
              "documentation" : "**Beispiel:**    \n        `GET [base]/Subscription/[id]/$events`    \n        **Anwendungshinweis:**    \n        Diese Operation wird verwendet, um nach SubscriptionNotifications zu suchen und diese zurückzugeben, die zuvor durch eine topic basierte Subscription in FHIR R4 ausgelöst wurden.   \n        Weitere Details siehe [Subscriptions R5 Backport IG](https://hl7.org/fhir/uv/subscriptions-backport/OperationDefinition/backport-subscription-events)."
            }
          ]
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
              "valueCode" : "SHALL"
            }
          ],
          "type" : "Parameters",
          "supportedProfile" : [
            "https://gematik.de/fhir/isik/StructureDefinition/BackportSubscriptionStatusR4Fixed"
          ]
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
              "valueCode" : "SHALL"
            }
          ],
          "type" : "Bundle",
          "supportedProfile" : [
            "https://gematik.de/fhir/isik/StructureDefinition/BackportSubscriptionNotificationR4Fixed"
          ]
        }
      ]
    }
  ]
}

```
