Instance: ExampleOrganPatient
InstanceOf: ISiKPatient
Usage: #example
Title: "ISiKPatient Beispielinstanz aus Organ-Daten"
Description: "Beispielpatient mit PID 181869 und Name Elowen Zeltberg"

* id = "isik-patient-181869"
* active = true

* identifier[Patientennummer].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[Patientennummer].type.coding.code = #MR
* identifier[Patientennummer].system = "https://example-krankenhaus.de/fhir/sid/pid"
* identifier[Patientennummer].value = "181869"

* name[Name].use = #official
* name[Name].family = "Zeltberg"
* name[Name].given[0] = "Elowen"

* gender = #unknown
* birthDate.extension[Data-Absent-Reason].valueCode = #unknown
