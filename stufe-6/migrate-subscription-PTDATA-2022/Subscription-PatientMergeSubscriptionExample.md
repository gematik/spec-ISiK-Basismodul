# Example Subscription - PatientMergeSubscriptionExample - ISiK Subscription Implementierungsleitfaden v6.0.0-rc

ISiK Subscription Implementierungsleitfaden

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Subscription - PatientMergeSubscriptionExample**

## Example Subscription: Example Subscription - PatientMergeSubscriptionExample

Profile: [ISiK Subscription](StructureDefinition-ISiKSubscription.md)

**status**: Requested

**reason**: Patient merge subscription

**criteria**: https://gematik.de/fhir/isik/SubscriptionTopic/patient-merge

### Channels

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| - | **Type** | **Endpoint** | **Payload** | **Header** |
| * | Rest Hook | [http://localhost:8081/fhir/Bundle](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://localhost:8081/fhir/Bundle) | application/fhir+json | Authorization: Bearer xxxxxxxxxx |



## Resource Content

```json
{
  "resourceType" : "Subscription",
  "id" : "PatientMergeSubscriptionExample",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKSubscription"
    ]
  },
  "status" : "requested",
  "reason" : "Patient merge subscription",
  "criteria" : "https://gematik.de/fhir/isik/SubscriptionTopic/patient-merge",
  "channel" : {
    "type" : "rest-hook",
    "endpoint" : "http://localhost:8081/fhir/Bundle",
    "payload" : "application/fhir+json",
    "_payload" : {
      "extension" : [
        {
          "url" : "http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-payload-content",
          "valueCode" : "full-resource"
        }
      ]
    },
    "header" : ["Authorization: Bearer xxxxxxxxxx"]
  }
}

```
