# SubscriptionNotificationType - ISiK Subscription Implementierungsleitfaden v6.0.0-rc

ISiK Subscription Implementierungsleitfaden

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **SubscriptionNotificationType**

## CodeSystem: SubscriptionNotificationType 

| | | |
| :--- | :--- | :--- |
| *Official URL*:http://hl7.org/fhir/subscription-notification-type | *Version*:6.0.0-rc | |
| * Standards status: *[Trial-use](http://hl7.org/fhir/R4/versions.html#std-process) | [Maturity Level](http://hl7.org/fhir/versions.html#maturity): 0 | *Computable Name*:SubscriptionNotificationTypeCS |
| *Other Identifiers:*OID:2.16.840.1.113883.4.642.1.1524 | | |

 
The type of notification represented by the status message. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [SubscriptionNotificationTypeVS](ValueSet-subscription-notification-type.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "subscription-notification-type",
  "meta" : {
    "lastUpdated" : "2022-05-28T13:47:40.239+11:00",
    "profile" : [
      "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"
    ]
  },
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg",
      "valueCode" : "fhir"
    },
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status",
      "valueCode" : "trial-use"
    },
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm",
      "valueInteger" : 0
    }
  ],
  "url" : "http://hl7.org/fhir/subscription-notification-type",
  "identifier" : [
    {
      "system" : "urn:ietf:rfc:3986",
      "value" : "urn:oid:2.16.840.1.113883.4.642.1.1524"
    }
  ],
  "version" : "6.0.0-rc",
  "name" : "SubscriptionNotificationTypeCS",
  "title" : "SubscriptionNotificationType",
  "status" : "active",
  "experimental" : false,
  "date" : "2021-01-05T10:01:24+11:00",
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
  "description" : "The type of notification represented by the status message.",
  "caseSensitive" : true,
  "valueSet" : "http://hl7.org/fhir/ValueSet/subscription-notification-type",
  "content" : "complete",
  "count" : 5,
  "concept" : [
    {
      "code" : "handshake",
      "display" : "Handshake",
      "definition" : "The status was generated as part of the setup or verification of a communications channel."
    },
    {
      "code" : "heartbeat",
      "display" : "Heartbeat",
      "definition" : "The status was generated to perform a heartbeat notification to the subscriber."
    },
    {
      "code" : "event-notification",
      "display" : "Event Notification",
      "definition" : "The status was generated for an event to the subscriber."
    },
    {
      "code" : "query-status",
      "display" : "Query Status",
      "definition" : "The status was generated in response to a status query/request."
    },
    {
      "code" : "query-event",
      "display" : "Query Event",
      "definition" : "The status was generated in response to an event query/request."
    }
  ]
}

```
