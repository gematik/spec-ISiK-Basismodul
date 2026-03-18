CodeSystem: ISiKSubscriptionTopic
Id: ISiKSubscriptionTopic
Title: "ISiK-SubscriptionTopic"
Description: "Liste der aller SubscriptionTopics, die in ISiK verwendet werden können. Neben den merge-SubscriptionTopics sind auch die SubscriptionTopics für Updates der Ressourcen enthalten, die in ISiK verwendet werden können."
* insert Meta
* #https://gematik.de/fhir/isik/SubscriptionTopic/patient-merge "patient-merge"
* #https://gematik.de/fhir/isik/SubscriptionTopic/encounter-merge "encounter-merge"
* #https://gematik.de/fhir/isik/SubscriptionTopic/account-merge "account-merge"
* #https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Account "Account"
* #https://gematik.de/fhir/isik/SubscriptionTopic/Resource/AllergyIntolerance "AllergyIntolerance"
* #https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Appointment "Appointment"
* #https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Binary "Binary"
* #https://gematik.de/fhir/isik/SubscriptionTopic/Resource/CodeSystem "CodeSystem"
* #https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Condition "Condition"
* #https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Coverage "Coverage"
* #https://gematik.de/fhir/isik/SubscriptionTopic/Resource/DocumentReference "DocumentReference"
* #https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Encounter "Encounter"
* #https://gematik.de/fhir/isik/SubscriptionTopic/Resource/HealthcareService "HealthcareService"
* #https://gematik.de/fhir/isik/SubscriptionTopic/Resource/List "List"
* #https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Medication "Medication"
* #https://gematik.de/fhir/isik/SubscriptionTopic/Resource/MedicationAdministration "MedicationAdministration"
* #https://gematik.de/fhir/isik/SubscriptionTopic/Resource/MedicationRequest "MedicationRequest"
* #https://gematik.de/fhir/isik/SubscriptionTopic/Resource/MedicationStatement "MedicationStatement"
* #https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Observation "Observation"
* #https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Patient "Patient"
* #https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Practitioner "Practitioner"
* #https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Procedure "Procedure"
* #https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Questionnaire "Questionnaire"
* #https://gematik.de/fhir/isik/SubscriptionTopic/Resource/QuestionnaireResponse "QuestionnaireResponse"
* #https://gematik.de/fhir/isik/SubscriptionTopic/Resource/RelatedPerson "RelatedPerson"
* #https://gematik.de/fhir/isik/SubscriptionTopic/Resource/RiskAssessment "RiskAssessment"
* #https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Schedule "Schedule"
* #https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Slot "Slot"
* #https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Subscription "Subscription"
* #https://gematik.de/fhir/isik/SubscriptionTopic/Resource/ValueSet "ValueSet"
* #https://gematik.de/fhir/isik/SubscriptionTopic/appointment-change "appointment-change"
* #https://gematik.de/fhir/isik/SubscriptionTopic/appointment-cancel "appointment-cancel"

ValueSet: ISiKSubscriptionTopicVS
Id: ISiKSubscriptionTopicVS
Title: "ISiKSubscriptionTopic ValueSet"
Description: "ValueSet, das alle Codes des ISiKSubscriptionTopic CodeSystems enthält"
* insert Meta
* include codes from system ISiKSubscriptionTopic
