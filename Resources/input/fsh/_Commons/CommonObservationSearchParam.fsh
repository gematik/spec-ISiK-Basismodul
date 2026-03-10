RuleSet: CommonObservationSearchParameters
* searchParam[+]
  * insert CapabilityStatementExpectationExt(SHALL)
  * name = "category"
  * definition = "http://hl7.org/fhir/SearchParameter/Observation-category"
  * type = #token
* searchParam[+]
  * insert CapabilityStatementExpectationExt(SHALL)
  * name = "status"
  * definition = "http://hl7.org/fhir/SearchParameter/Observation-status"
  * type = #token
* searchParam[+]
  * insert CapabilityStatementExpectationExt(SHALL)
  * name = "date"
  * definition = "http://hl7.org/fhir/SearchParameter/clinical-date"
  * type = #date
* searchParam[+]
  * insert CapabilityStatementExpectationExt(SHALL)
  * name = "code"
  * definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
  * type = #token
* searchParam[+]
  * insert CapabilityStatementExpectationExt(SHALL)
  * name = "patient"
  * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
  * type = #reference
* searchParam[+]
  * insert CapabilityStatementExpectationExt(MAY)
  * name = "subject"
  * definition = "http://hl7.org/fhir/SearchParameter/Observation-subject"
  * type = #reference
* searchParam[+]
  * insert CapabilityStatementExpectationExt(SHALL)
  * name = "encounter"
  * definition = "http://hl7.org/fhir/SearchParameter/clinical-encounter"
  * type = #reference
* searchParam[+]
  * insert CapabilityStatementExpectationExt(SHALL)
  * name = "code-value-quantity"
  * definition = "http://hl7.org/fhir/SearchParameter/Observation-code-value-quantity"
  * type = #composite
* searchParam[+]
  * insert CapabilityStatementExpectationExt(SHALL)
  * name = "combo-code"
  * definition = "http://hl7.org/fhir/SearchParameter/Observation-combo-code"
  * type = #token
* searchParam[+]
  * insert CapabilityStatementExpectationExt(SHALL)
  * name = "combo-code-value-quantity"
  * definition = "http://hl7.org/fhir/SearchParameter/Observation-combo-code-value-quantity"
  * type = #composite
* searchParam[+]
  * insert CapabilityStatementExpectationExt(SHALL)
  * name = "component-code"
  * definition = "http://hl7.org/fhir/SearchParameter/Observation-component-code"
  * type = #token