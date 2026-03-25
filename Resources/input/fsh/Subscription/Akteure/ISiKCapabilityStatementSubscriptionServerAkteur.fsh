Instance: ISiKCapabilityStatementSubscriptionServerAkteur
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Akteur
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementSubscriptionServerAkteur"
* name = "ISiK-CapabilityStatementSubscriptionServerAkteur"
* title = "Akteur &quot;ISiKCapabilityStatementSubscriptionServerAkteur&quot;"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Subscription"
* purpose = """   
  CapabilityStatement für den Akteur &quot;ISiKCapabilityStatementBasisServerAkteur&quot;.
  """
* rest.mode = #server
// Merge-Topics
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/patient-merge")
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/encounter-merge")
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/account-merge")
// Ressourcen-Topics
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Account")
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/Resource/AllergyIntolerance")
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Appointment")
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Binary")
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/Resource/CodeSystem")
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Condition")
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Coverage")
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/Resource/DocumentReference")
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Encounter")
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/Resource/HealthcareService")
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/Resource/List")
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Medication")
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/Resource/MedicationAdministration")
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/Resource/MedicationRequest")
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/Resource/MedicationStatement")
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Observation")
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Patient")
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Practitioner")
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Procedure")
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Questionnaire")
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/Resource/QuestionnaireResponse")
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/Resource/RelatedPerson")
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/Resource/RiskAssessment")
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Schedule")
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Slot")
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/Resource/Subscription")
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/Resource/ValueSet")
// Termin-Topics
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/appointment-update")
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/appointment-cancel")
// Generisches Topic
* insert AddSubscriptionTopicCanonical("https://gematik.de/fhir/isik/SubscriptionTopic/generic")
* imports[+] = Canonical(ISiKCapabilityStatementSubscriptionRolle)
  * insert ExpectationImports(#SHALL)