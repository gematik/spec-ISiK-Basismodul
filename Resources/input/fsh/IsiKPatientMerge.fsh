
Profile: PatientMergeSubscription
Parent: BackportSubscription
Id: patient-merge-subscription
Title: "Patient Merge Subscription"
Description: "Patient Merge Subscription"
* status MS
* reason MS
* criteria = $patient-merge-topic
* channel MS
  * type MS
  * type from RestAndWSSubscriptionChannelType
  * endpoint MS
  * payload MS
  * payload from FhirMimeTypeVS
  * header MS
    * ^short = "Falls eine REST-Enpunkt einen Authorization-Header benötigt, kann dieser hier gesetzt werden"

Instance: PatientMergeSubscriptionExample
InstanceOf: PatientMergeSubscription
Usage: #example
* status = #requested
* reason = "Patient merge subscription"
* criteria = "https://gematik.de/fhir/isik/SubscriptionTopic/patient-merge"
* channel
  * type = #rest-hook
  * endpoint = "http://localhost:8081/fhir/Bundle"
  * payload = #application/fhir+json
    * extension[content].valueCode = #full-resource
  * header = "Authorization: Bearer xxxxxxxxxx"

ValueSet: RestAndWSSubscriptionChannelType
Id: RestAndWSSubscriptionChannelType
Title: "RestAndWSSubscriptionChannelType"
Description: "Subscription Channel Type for ISiK"
* SubscriptionChannelType#rest-hook
* SubscriptionChannelType#websocket

ValueSet: FhirMimeTypeVS
Id: FhirMimeTypeVS
Title: "FhirMimeTypeVS"
Description: "FHIR Mime Types"
* urn:ietf:bcp:13#application/fhir+json
* urn:ietf:bcp:13#application/fhir+xml

Instance: DorisQuelle
InstanceOf: ISiKPatient
Usage: #example
* identifier[VersichertenId].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[VersichertenId].value = "A123456789"
* identifier[Patientennummer].system = "https://fhir.krankenhaus.example/sid/PID"
* identifier[Patientennummer].value = "654321"
* active = false
* name[Name]
  * family = "Duplikat"
  * given = "Doris"
* gender = #female
* birthDate = "1964-08-12"

Instance: DorisZiel
InstanceOf: ISiKPatient
Usage: #example
* identifier[VersichertenId].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[VersichertenId].value = "A123456789"
* identifier[Patientennummer].system = "https://fhir.krankenhaus.example/sid/PID"
* identifier[Patientennummer].value = "123456"
* active = true
* name[Name]
  * family = "Duplikat"
  * given = "Doris"
* gender = #female
* birthDate = "1964-08-12"

Instance: DorisResultat
InstanceOf: ISiKPatient
Usage: #example
* identifier[VersichertenId].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[VersichertenId].value = "A123456789"
* identifier[Patientennummer].system = "https://fhir.krankenhaus.example/sid/PID"
* identifier[Patientennummer].value = "123456"
* active = true
* name[Name]
  * family = "Duplikat"
  * given = "Doris"
* gender = #female
* birthDate = "1964-08-12"
* link
  * other.identifier
    * system = "https://fhir.krankenhaus.example/sid/PID"
    * value = "654321"
  * type = #replaces

Instance: SubscriptionNotificationBundleExample
InstanceOf: Bundle
Usage: #example
* type = #history
* entry[+].fullUrl = "urn:uuid:9bb6fcbd-8391-4e35-bd4c-620a2db47af0"
* entry[=].resource = SubscriptionNotification
* entry[+].fullUrl = "http://example.com/fhir/Patient/DorisQuelle/_history/2"
* entry[=].resource = DorisQuelle
* entry[=].request.method = #PUT
* entry[=].request.url = "Patient/DorisQuelle"

Instance: SubscriptionNotification
InstanceOf: Parameters
Usage: #inline
* meta.profile = "http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-subscription-status-r4"
* parameter[+].name = "subscription"
* parameter[=].valueReference = Reference(Subscription/1)
* parameter[+].name = "topic"
* parameter[=].valueCanonical = "https://gematik.de/fhir/isik/SubscriptionTopic/patient-merge"
* parameter[+].name = "status"
* parameter[=].valueCode = #active
* parameter[+].name = "type"
* parameter[=].valueCode = #event-notification
* parameter[+].name = "events-since-subscription-start"
* parameter[=].valueString = "1"
* parameter[+].name = "notification-event"
* parameter[=].part[0].name = "event-number"
* parameter[=].part[=].valueString = "1"
* parameter[=].part[+].name = "timestamp"
* parameter[=].part[=].valueDate = "2024-02-22"
* parameter[=].part[+].name = "focus"
* parameter[=].part[=].valueReference = Reference(DorisQuelle)

