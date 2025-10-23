# ISiK-SubscriptionTopic - Test Implementation Guide v0.0.1

Implementation Guide

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiK-SubscriptionTopic**

## CodeSystem: ISiK-SubscriptionTopic 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/CodeSystem/ISiKSubscriptionTopic | *Version*:0.0.1 |
| Active as of 2025-06-26 | *Computable Name*:ISiKSubscriptionTopic |

 
Liste der aller SubscriptionTopics, die in ISiK verwendet werden können. Neben den merge-SubscriptionTopics sind auch die SubscriptionTopics für Updates der Ressourcen enthalten, die in ISiK verwendet werden können. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [ISiKSubscriptionTopicVS](ValueSet-ISiKSubscriptionTopicVS.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "ISiKSubscriptionTopic",
  "url" : "https://gematik.de/fhir/isik/CodeSystem/ISiKSubscriptionTopic",
  "version" : "0.0.1",
  "name" : "ISiKSubscriptionTopic",
  "title" : "ISiK-SubscriptionTopic",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-06-26",
  "description" : "Liste der aller SubscriptionTopics, die in ISiK verwendet werden können. Neben den merge-SubscriptionTopics sind auch die SubscriptionTopics für Updates der Ressourcen enthalten, die in ISiK verwendet werden können.",
  "content" : "complete",
  "count" : 30,
  "concept" : [
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/patient-merge",
      "display" : "patient-merge"
    },
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/encounter-merge",
      "display" : "encounter-merge"
    },
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/account-merge",
      "display" : "account-merge"
    },
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Account",
      "display" : "Account"
    },
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/AllergyIntolerance",
      "display" : "AllergyIntolerance"
    },
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Appointment",
      "display" : "Appointment"
    },
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Binary",
      "display" : "Binary"
    },
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/CodeSystem",
      "display" : "CodeSystem"
    },
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Condition",
      "display" : "Condition"
    },
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Coverage",
      "display" : "Coverage"
    },
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/DocumentReference",
      "display" : "DocumentReference"
    },
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Encounter",
      "display" : "Encounter"
    },
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/HealthcareService",
      "display" : "HealthcareService"
    },
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/List",
      "display" : "List"
    },
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Medication",
      "display" : "Medication"
    },
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/MedicationAdministration",
      "display" : "MedicationAdministration"
    },
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/MedicationRequest",
      "display" : "MedicationRequest"
    },
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/MedicationStatement",
      "display" : "MedicationStatement"
    },
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Observation",
      "display" : "Observation"
    },
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Patient",
      "display" : "Patient"
    },
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Practitioner",
      "display" : "Practitioner"
    },
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Procedure",
      "display" : "Procedure"
    },
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Questionnaire",
      "display" : "Questionnaire"
    },
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/QuestionnaireResponse",
      "display" : "QuestionnaireResponse"
    },
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/RelatedPerson",
      "display" : "RelatedPerson"
    },
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/RiskAssessment",
      "display" : "RiskAssessment"
    },
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Schedule",
      "display" : "Schedule"
    },
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Slot",
      "display" : "Slot"
    },
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Subscription",
      "display" : "Subscription"
    },
    {
      "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/ValueSet",
      "display" : "ValueSet"
    }
  ]
}

```
