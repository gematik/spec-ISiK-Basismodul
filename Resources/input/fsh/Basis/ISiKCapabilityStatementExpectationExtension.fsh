Extension: ExtensionISiKCapabilityStatementImportsExpectation
Id: ExtensionISiKCapabilityStatementImportsExpectation
Title: "ISiK CapabilityStatement Imports Expectation"
Description: "Defines the level of expectation associated with a given system capability. See the capabilitystatement-prohibited modifier extension to set expectations to *not* support a feature."
* insert Meta
* ^context[+].type = #element
* ^context[=].expression = "CapabilityStatement.imports"
* . ^short = "SHALL | SHOULD | MAY |SHOULD-NOT"
* . ^definition = "Defines the level of expectation associated with a given system capability."
* . ^comment = "If \"SHALL NOT\" is desired, use the \"prohibited\" modifier extension.  This extension should only be used with CapabilityStatements documenting requirements, not those documenting actual system capabilities."
* value[x] 1..
* value[x] only code
* value[x] from http://terminology.hl7.org/ValueSet/conformance-expectation (required)
* value[x] ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* value[x] ^binding.extension.valueString = "ConformanceExpectation"
* value[x] ^binding.description = "Indicates the degree of adherence to a specified behavior or capability expected for a system to be deemed conformant with a specification."