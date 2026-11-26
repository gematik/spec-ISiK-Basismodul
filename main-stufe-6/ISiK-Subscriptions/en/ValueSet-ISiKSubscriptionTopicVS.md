# ISiKSubscriptionTopic ValueSet - ISiK Subscription Implementierungsleitfaden v6.0.0

ISiK Subscription Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiKSubscriptionTopic ValueSet**

## ValueSet: ISiKSubscriptionTopic ValueSet 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ISiKSubscriptionTopicVS | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKSubscriptionTopicVS |

 
ValueSet, das alle Codes des ISiKSubscriptionTopic CodeSystems enthält 

 **References** 

* [ISiK Subscription](StructureDefinition-ISiKSubscription.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ISiKSubscriptionTopicVS",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ISiKSubscriptionTopicVS",
  "version" : "6.0.0",
  "name" : "ISiKSubscriptionTopicVS",
  "title" : "ISiKSubscriptionTopic ValueSet",
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
  "description" : "ValueSet, das alle Codes des ISiKSubscriptionTopic CodeSystems enthält",
  "compose" : {
    "include" : [{
      "system" : "https://gematik.de/fhir/isik/CodeSystem/ISiKSubscriptionTopic"
    }]
  }
}

```
