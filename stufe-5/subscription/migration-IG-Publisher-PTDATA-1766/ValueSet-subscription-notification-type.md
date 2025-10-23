# SubscriptionNotificationType - Test Implementation Guide v0.0.1

Implementation Guide

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **SubscriptionNotificationType**

## ValueSet: SubscriptionNotificationType 

| | | |
| :--- | :--- | :--- |
| *Official URL*:http://hl7.org/fhir/ValueSet/subscription-notification-type | *Version*:0.0.1 | |
| *Standards status:*[Trial-use](http://hl7.org/fhir/R4/versions.html#std-process) | [Maturity Level](http://hl7.org/fhir/versions.html#maturity): 0 | *Computable Name*:SubscriptionNotificationTypeVS |
| *Other Identifiers:*OID:2.16.840.1.113883.4.642.3.1523 | | |

 
The type of notification represented by the status message. 

 **References** 

* [R4 Backported R5 SubscriptionStatus](http://hl7.org/fhir/uv/subscriptions-backport/STU1.1/StructureDefinition-backport-subscription-status-r4.html)
* [R4 Backported R5 SubscriptionStatus](StructureDefinition-BackportSubscriptionStatusR4Fixed.md)

### Logical Definition (CLD)

Last updated: 2022-05-28 13:47:40+1100

Profile: [Shareable ValueSet](http://hl7.org/fhir/R4/shareablevalueset.html)

* Include all codes defined in [`http://hl7.org/fhir/subscription-notification-type`](CodeSystem-subscription-notification-type.md)version 📦0.0.1

 

### Expansion

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "subscription-notification-type",
  "meta" : {
    "lastUpdated" : "2022-05-28T13:47:40.239+11:00",
    "profile" : ["http://hl7.org/fhir/StructureDefinition/shareablevalueset"]
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
  "url" : "http://hl7.org/fhir/ValueSet/subscription-notification-type",
  "identifier" : [
    {
      "system" : "urn:ietf:rfc:3986",
      "value" : "urn:oid:2.16.840.1.113883.4.642.3.1523"
    }
  ],
  "version" : "0.0.1",
  "name" : "SubscriptionNotificationTypeVS",
  "title" : "SubscriptionNotificationType",
  "status" : "active",
  "experimental" : false,
  "date" : "2020-12-28T16:55:11+11:00",
  "contact" : [
    {
      "telecom" : [
        {
          "system" : "url",
          "value" : "http://hl7.org/fhir"
        },
        {
          "system" : "email",
          "value" : "fhir@lists.hl7.org"
        }
      ]
    }
  ],
  "description" : "The type of notification represented by the status message.",
  "immutable" : true,
  "compose" : {
    "include" : [
      {
        "system" : "http://hl7.org/fhir/subscription-notification-type"
      }
    ]
  }
}

```
