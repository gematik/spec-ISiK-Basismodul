# PatientMergeSubscriptionExample - ISiK Subscription Implementierungsleitfaden v6.0.0

ISiK Subscription Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **PatientMergeSubscriptionExample**

## Subscription: PatientMergeSubscriptionExample

Profile: [ISiK Subscription](StructureDefinition-ISiKSubscription.md)

**status**: Requested

**reason**: Patient merge subscription

**criteria**: https://gematik.de/fhir/isik/SubscriptionTopic/patient-merge

### Channels

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| - | **Type** | **Endpoint** | **Payload** | **Header** |
| * | Rest Hook | [http://localhost:8081/fhir/Bundle](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&canonical=http://localhost:8081/fhir/Bundle) | FHIR JSON | Authorization: Bearer xxxxxxxxxx |



## Resource Content

```json
{
  "resourceType" : "Subscription",
  "id" : "PatientMergeSubscriptionExample",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKSubscription"]
  },
  "status" : "requested",
  "reason" : "Patient merge subscription",
  "criteria" : "https://gematik.de/fhir/isik/SubscriptionTopic/patient-merge",
  "channel" : {
    "type" : "rest-hook",
    "endpoint" : "http://localhost:8081/fhir/Bundle",
    "payload" : "application/fhir+json",
    "_payload" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-payload-content",
        "valueCode" : "id-only"
      }]
    },
    "header" : ["Authorization: Bearer xxxxxxxxxx"]
  }
}

```
