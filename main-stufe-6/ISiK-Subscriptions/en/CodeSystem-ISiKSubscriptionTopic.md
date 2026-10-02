# ISiK-SubscriptionTopic - ISiK Subscription Implementierungsleitfaden v6.0.0

ISiK Subscription Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiK-SubscriptionTopic**

## CodeSystem: ISiK-SubscriptionTopic 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/CodeSystem/ISiKSubscriptionTopic | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKSubscriptionTopic |

 
Liste der aller SubscriptionTopics, die in ISiK verwendet werden können. Neben den merge-SubscriptionTopics sind auch die SubscriptionTopics für Updates der Ressourcen enthalten, die in ISiK verwendet werden können. 

This Code system is referenced in the definition of the following value sets:

* [ISiKSubscriptionTopic ValueSet](ValueSet-ISiKSubscriptionTopicVS.md)

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "ISiKSubscriptionTopic",
  "language" : "de-DE",
  "url" : "https://gematik.de/fhir/isik/CodeSystem/ISiKSubscriptionTopic",
  "version" : "6.0.0",
  "name" : "ISiKSubscriptionTopic",
  "title" : "ISiK-SubscriptionTopic",
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
  "description" : "Liste der aller SubscriptionTopics, die in ISiK verwendet werden können. Neben den merge-SubscriptionTopics sind auch die SubscriptionTopics für Updates der Ressourcen enthalten, die in ISiK verwendet werden können.",
  "content" : "complete",
  "count" : 39,
  "concept" : [{
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/patient-merge",
    "display" : "patient-merge",
    "definition" : "Wird ausgelöst, wenn zwei Patient-Ressourcen zusammengeführt werden (Patient merge)."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/encounter-merge",
    "display" : "encounter-merge",
    "definition" : "Wird ausgelöst, wenn zwei Encounter-Ressourcen zusammengeführt werden (Encounter merge)."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/account-merge",
    "display" : "account-merge",
    "definition" : "Wird ausgelöst, wenn zwei Account-Ressourcen zusammengeführt werden (Account merge)."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Account",
    "display" : "Account",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an Account-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/AllergyIntolerance",
    "display" : "AllergyIntolerance",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an AllergyIntolerance-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Appointment",
    "display" : "Appointment",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an Appointment-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Binary",
    "display" : "Binary",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an Binary-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/CodeSystem",
    "display" : "CodeSystem",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an CodeSystem-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Composition",
    "display" : "Composition",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an Composition-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Condition",
    "display" : "Condition",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an Condition-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Coverage",
    "display" : "Coverage",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an Coverage-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Device",
    "display" : "Device",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an Device-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/DeviceMetric",
    "display" : "DeviceMetric",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an DeviceMetric-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/DiagnosticReport",
    "display" : "DiagnosticReport",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an DiagnosticReport-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/DocumentReference",
    "display" : "DocumentReference",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an DocumentReference-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Encounter",
    "display" : "Encounter",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an Encounter-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/HealthcareService",
    "display" : "HealthcareService",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an HealthcareService-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/List",
    "display" : "List",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an List-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Location",
    "display" : "Location",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an Location-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Medication",
    "display" : "Medication",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an Medication-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/MedicationAdministration",
    "display" : "MedicationAdministration",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an MedicationAdministration-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/MedicationRequest",
    "display" : "MedicationRequest",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an MedicationRequest-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/MedicationStatement",
    "display" : "MedicationStatement",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an MedicationStatement-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Observation",
    "display" : "Observation",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an Observation-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Organization",
    "display" : "Organization",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an Organization-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Patient",
    "display" : "Patient",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an Patient-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Practitioner",
    "display" : "Practitioner",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an Practitioner-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Procedure",
    "display" : "Procedure",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an Procedure-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Questionnaire",
    "display" : "Questionnaire",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an Questionnaire-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/QuestionnaireResponse",
    "display" : "QuestionnaireResponse",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an QuestionnaireResponse-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/RelatedPerson",
    "display" : "RelatedPerson",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an RelatedPerson-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/RiskAssessment",
    "display" : "RiskAssessment",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an RiskAssessment-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Schedule",
    "display" : "Schedule",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an Schedule-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Slot",
    "display" : "Slot",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an Slot-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Subscription",
    "display" : "Subscription",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an Subscription-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/Resource/ValueSet",
    "display" : "ValueSet",
    "definition" : "Signalisiert alle relevanten Änderungen (Create, Update, Delete) an ValueSet-Ressourcen."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/appointment-update",
    "display" : "appointment-update",
    "definition" : "Wird ausgelöst, wenn ein Termin (Appointment) geändert wird, z.B. durch eine Zeitverschiebung oder Statusänderung."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/appointment-cancel",
    "display" : "appointment-cancel",
    "definition" : "Wird ausgelöst, wenn ein Termin (Appointment) abgesagt wird (Appointment.status=cancelled)."
  },
  {
    "code" : "https://gematik.de/fhir/isik/SubscriptionTopic/generic",
    "display" : "generic",
    "definition" : "Generisches Topic ohne festgelegte Trigger-Semantik. Ermöglicht die Abonnierung beliebiger Ressourcenänderungen über frei definierbare Filterkriterien (Subscription.criteria.extension:filterCriteria im Format FHIR-Suchausdruck). Hintergrund: In FHIR R4 können SubscriptionTopics nicht über die REST-Schnittstelle angelegt werden — dieses Topic dient als Erweiterungspunkt für systemspezifische Anforderungen, die durch vordefinierte ISiK-Topics nicht abgedeckt werden."
  }]
}

```
