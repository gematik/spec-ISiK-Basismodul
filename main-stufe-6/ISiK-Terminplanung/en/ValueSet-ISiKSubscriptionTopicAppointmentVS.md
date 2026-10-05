# ISiKSubscriptionTopicAppointmentVS - ISiK Terminplanung Implementierungsleitfaden v6.0.0

ISiK Terminplanung Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKSubscriptionTopicAppointmentVS**

## ValueSet: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ISiKSubscriptionTopicAppointmentVS | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKSubscriptionTopicAppointmentVS |

 
Enthaelt die Codes der Subscription Topics, die für die Absage- bzw. Änderung von Terminen relevant sind. 

 **References** 

* [ISiK Subscription Termine](StructureDefinition-ISiKSubscriptionTermin.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ISiKSubscriptionTopicAppointmentVS",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ISiKSubscriptionTopicAppointmentVS",
  "version" : "6.0.0",
  "name" : "ISiKSubscriptionTopicAppointmentVS",
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
  "description" : "Enthaelt die Codes der Subscription Topics, die für die Absage- bzw. Änderung von Terminen relevant sind.",
  "compose" : {
    "include" : [{
      "system" : "https://gematik.de/fhir/isik/CodeSystem/ISiKSubscriptionTopic",
      "concept" : [{
        "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/appointment-update",
        "display" : "appointment-update"
      },
      {
        "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/appointment-cancel",
        "display" : "appointment-cancel"
      }]
    }]
  }
}

```
