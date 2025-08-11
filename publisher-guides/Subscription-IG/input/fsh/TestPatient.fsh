Profile: TestPatient
Parent: Patient
Id: test-patient
Title: "Test Patient Profile"
Description: "A simple test patient profile for validation purposes"

* name 1..* MS
* name ^short = "Patient name is required"
* identifier 1..* MS
* identifier ^short = "At least one identifier is required"
