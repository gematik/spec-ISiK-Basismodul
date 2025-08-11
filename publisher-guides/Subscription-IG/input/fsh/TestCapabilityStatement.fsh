Instance: TestCapabilityStatement
InstanceOf: CapabilityStatement
Usage: #definition
Title: "Test FHIR Server Capability Statement"
Description: "A dummy capability statement for testing purposes"

* url = "http://example.org/fhir/test/CapabilityStatement/TestCapabilityStatement"
* version = "1.0.0"
* name = "TestCapabilityStatement"
* title = "Test FHIR Server Capability Statement"
* status = #active
* date = "2025-08-06"
* publisher = "Test Organization"
* description = "This is a test capability statement that describes the capabilities of a dummy FHIR server"
* kind = #instance
* software.name = "Test FHIR Server"
* software.version = "1.0.0"
* fhirVersion = #4.0.1
* format[0] = #json
* format[1] = #xml
* implementationGuide = "http://example.org/fhir/test/ImplementationGuide/example.test.ig"

* rest.mode = #server
* rest.documentation = "Test FHIR server supporting basic Patient operations"
* rest.security.cors = true
* rest.security.description = "Uses standard FHIR security"

// Patient resource support
* rest.resource[0].type = #Patient
* rest.resource[0].profile = "http://example.org/fhir/test/StructureDefinition/test-patient"
* rest.resource[0].documentation = "Patient resource with basic CRUD operations"

// Supported interactions for Patient
* rest.resource[0].interaction[0].code = #read
* rest.resource[0].interaction[0].documentation = "Read a Patient resource"
* rest.resource[0].interaction[1].code = #create
* rest.resource[0].interaction[1].documentation = "Create a Patient resource"
* rest.resource[0].interaction[2].code = #update
* rest.resource[0].interaction[2].documentation = "Update a Patient resource"
* rest.resource[0].interaction[3].code = #delete
* rest.resource[0].interaction[3].documentation = "Delete a Patient resource"
* rest.resource[0].interaction[4].code = #search-type
* rest.resource[0].interaction[4].documentation = "Search for Patient resources"

// Search parameters for Patient
* rest.resource[0].searchParam[0].name = "identifier"
* rest.resource[0].searchParam[0].type = #token
* rest.resource[0].searchParam[0].documentation = "Search by patient identifier"

* rest.resource[0].searchParam[1].name = "name"
* rest.resource[0].searchParam[1].type = #string
* rest.resource[0].searchParam[1].documentation = "Search by patient name"

* rest.resource[0].searchParam[2].name = "family"
* rest.resource[0].searchParam[2].type = #string
* rest.resource[0].searchParam[2].documentation = "Search by patient family name"

* rest.resource[0].searchParam[3].name = "given"
* rest.resource[0].searchParam[3].type = #string
* rest.resource[0].searchParam[3].documentation = "Search by patient given name"
