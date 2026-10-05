# SubscriptionNotificationType - ISiK Terminplanung Implementierungsleitfaden v6.0.0

ISiK Terminplanung Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SubscriptionNotificationType**

## ValueSet: SubscriptionNotificationType 

| | | |
| :--- | :--- | :--- |
| *Official URL*:http://hl7.org/fhir/ValueSet/subscription-notification-type | *Version*:6.0.0 | |
| * Standards status: *[Trial-use](http://hl7.org/fhir/R4/versions.html#std-process) | [Maturity Level](http://hl7.org/fhir/versions.html#maturity): 0 | *Computable Name*:SubscriptionNotificationTypeVS |
| *Other Identifiers:*OID:2.16.840.1.113883.4.642.3.1523 | | |

 
The type of notification represented by the status message. 

 **References** 

* [R4 Backported R5 SubscriptionStatus](http://hl7.org/fhir/uv/subscriptions-backport/STU1.1/StructureDefinition-backport-subscription-status-r4.html)
* [R4 Backported R5 SubscriptionStatus](StructureDefinition-BackportSubscriptionStatusR4Fixed.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "subscription-notification-type",
  "meta" : {
    "lastUpdated" : "2022-05-28T13:47:40.239+11:00",
    "profile" : ["http://hl7.org/fhir/StructureDefinition/shareablevalueset"]
  },
  "extension" : [{
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
  }],
  "url" : "http://hl7.org/fhir/ValueSet/subscription-notification-type",
  "identifier" : [{
    "system" : "urn:ietf:rfc:3986",
    "value" : "urn:oid:2.16.840.1.113883.4.642.3.1523"
  }],
  "version" : "6.0.0",
  "name" : "SubscriptionNotificationTypeVS",
  "title" : "SubscriptionNotificationType",
  "status" : "active",
  "experimental" : false,
  "date" : "2020-12-28T16:55:11+11:00",
  "publisher" : "gematik GmbH",
  "contact" : [{
    "name" : "gematik GmbH",
    "telecom" : [{
      "system" : "url",
      "value" : "https://gematik.de"
    }]
  }],
  "description" : "The type of notification represented by the status message.",
  "immutable" : true,
  "compose" : {
    "include" : [{
      "system" : "http://hl7.org/fhir/subscription-notification-type",
      "version" : "6.0.0"
    }]
  }
}

```
