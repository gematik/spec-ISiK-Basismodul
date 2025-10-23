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


/*This ressource should not be continously generated, since assigning identical IDs is a problem.
ID was changed directly in JSON in order to be conformant to merge-behaviour as requested in FHIR R5 $merge.
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
*/ 