Instance: DorisDuplikat
InstanceOf: ISiKPatient
Usage: #example
* identifier[VersichertenId-GKV].type = $identifier-type-de-basis#GKV
* identifier[VersichertenId-GKV].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[VersichertenId-GKV].value = "A123456789"
* identifier[Patientennummer].type = $v2-0203#MR
* identifier[Patientennummer].system = "https://fhir.krankenhaus.example/sid/PID"
* identifier[Patientennummer].value = "TestPID"
* active = false
* name[Name]
  * family = "Duplikat"
  * given = "Doris"
* gender = #female
* birthDate = "1964-08-12"
* address[+].type = #both
* address[=].line[+] = "Musterweg 2"
* address[=].line[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[=].line[=].extension[=].valueString = "Musterweg"
* address[=].line[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[=].line[=].extension[=].valueString = "2"
* address[=].city = "Musterhausen"
* address[=].postalCode = "98764"
* address[=].country = "DE"
* link
  * other = Reference(DorisOriginal)
  * type = #replaced-by


Instance: DorisOriginal
InstanceOf: ISiKPatient
Usage: #example
* identifier[VersichertenId-GKV].type = $identifier-type-de-basis#GKV
* identifier[VersichertenId-GKV].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[VersichertenId-GKV].value = "A123456789"
* identifier[Patientennummer].type = $v2-0203#MR
* identifier[Patientennummer].system = "https://fhir.krankenhaus.example/sid/PID"
* identifier[Patientennummer].value = "TestPID"
* active = true
* name[Name]
  * family = "Duplikat"
  * given = "Doris"
* gender = #female
* birthDate = "1964-08-12"
* address[+].type = #both
* address[=].line[+] = "Musterweg 2"
* address[=].line[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[=].line[=].extension[=].valueString = "Musterweg"
* address[=].line[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[=].line[=].extension[=].valueString = "2"
* address[=].city = "Musterhausen"
* address[=].postalCode = "98764"
* address[=].country = "DE"
* link
  * other = Reference(DorisDuplikat)
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