Instance: example-test-patient
InstanceOf: TestPatient
Usage: #example
Title: "Example Test Patient"
Description: "An example patient instance for testing"

* identifier[0].system = "http://example.org/patient-ids"
* identifier[0].value = "TEST-001"
* name[0].family = "TestFamily"
* name[0].given[0] = "TestGiven"
* gender = #unknown
