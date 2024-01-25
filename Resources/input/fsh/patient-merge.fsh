Instance: DorisQuelle
InstanceOf: ISiKPatient
Usage: #example
* identifier[VersichertenId-GKV].type = $identifier-type-de-basis#GKV
* identifier[VersichertenId-GKV].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[VersichertenId-GKV].value = "A123456789"
* identifier[Patientennummer].type = $v2-0203#MR
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
* identifier[VersichertenId-GKV].type = $identifier-type-de-basis#GKV
* identifier[VersichertenId-GKV].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[VersichertenId-GKV].value = "A123456789"
* identifier[Patientennummer].type = $v2-0203#MR
* identifier[Patientennummer].system = "https://fhir.krankenhaus.example/sid/PID"
* identifier[Patientennummer].value = "123456"
* active = true
* name[Name]
  * family = "Duplikat"
  * given = "Doris"
* gender = #female
* birthDate = "1964-08-12"

Instance: DorisObsolet
InstanceOf: ISiKPatient
Usage: #example
* identifier[VersichertenId-GKV].type = $identifier-type-de-basis#GKV
* identifier[VersichertenId-GKV].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[VersichertenId-GKV].value = "A123456789"
* identifier[Patientennummer].type = $v2-0203#MR
* identifier[Patientennummer].system = "https://fhir.krankenhaus.example/sid/PID"
* identifier[Patientennummer].value = "654321"
* active = false
* name[Name]
  * family = "Duplikat"
  * given = "Doris"
* gender = #female
* birthDate = "1964-08-12"
* link
  * other = Reference(DorisResultat)
  * type = #replaced-by


Instance: DorisResultat
InstanceOf: ISiKPatient
Usage: #example
* identifier[VersichertenId-GKV].type = $identifier-type-de-basis#GKV
* identifier[VersichertenId-GKV].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[VersichertenId-GKV].value = "A123456789"
* identifier[Patientennummer].type = $v2-0203#MR
* identifier[Patientennummer].system = "https://fhir.krankenhaus.example/sid/PID"
* identifier[Patientennummer].value = "123456"
* active = true
* name[Name]
  * family = "Duplikat"
  * given = "Doris"
* gender = #female
* birthDate = "1964-08-12"
* link
  * other = Reference(DorisObsolet)
  * type = #replaces

Profile: PatientMergeSubscription
Parent: BackportSubscription
Id: patient-merge-subscription
Title: "Patient Merge Subscription"
Description: "Patient Merge Subscription"
* status MS
* criteria = $patient-merge-topic
  * extension[filterCriteria] 0..0
* channel
  * type from RestAndWSSubscriptionChannel
  * payload = #application/fhir+json
    * extension[content].valueCode = #id-only

ValueSet: RestAndWSSubscriptionChannel
Id: RestAndWSSubscriptionChannel
Title: "RestAndWSSubscriptionChannel"
Description: "Subscription Channel for ISiK"
* SubscriptionChannelType#rest-hook
* SubscriptionChannelType#websocket