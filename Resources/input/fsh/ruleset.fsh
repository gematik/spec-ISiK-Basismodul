RuleSet: Meta
* ^version = "4.0.0"
* ^status = #active
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^date = "2024-08-30"

RuleSet: MetaInstance
* version = "4.0.0"
* status = #active
* experimental = false
* publisher = "gematik GmbH"
* date = "2024-08-30"

RuleSet: Meta-CapabilityStatement
* insert MetaInstance
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Basismodul"
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementBasisServer"

RuleSet: Expectation (expectation)
* extension.url = $capabilitystatement-expectation
* extension.valueCode = {expectation}

RuleSet: CommonSearchParameters
* searchParam[+]
  * insert Expectation (#SHALL)
  * name = "_id"
  * definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
  * type = #token
  * documentation = 
        "**Beispiel:**    
        `GET [base]/[Resourcetype]?_id=103270`    
        **Anwendungshinweis:**   
        Weitere Details siehe FHIR-Kernspezifikation, Abschnitt [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all).  
        Dieser Suchparameter ist für die Umsetzung des IHE PDQm Profils verpflichtend."
* searchParam[+]
  * insert Expectation (#SHALL)
  * name = "_tag"
  * definition = "http://hl7.org/fhir/SearchParameter/Resource-tag"
  * type = #token
  * documentation = 
        "**Beispiel:**    
        `GET [base]/[Resourcetype]?_tag=https://example.org/codes|needs-review`    
        **Anwendungshinweis:**   
        Weitere Details siehe FHIR-Kernspezifikation, Abschnitt [Parameters for all resources](https://hl7.org/fhir/R4/search.html#all) 
        sowie Abschnitt [Tags](https://www.hl7.org/fhir/R4/resource.html#simple-tags).  "
* searchParam[+]
  * insert Expectation (#SHALL)
  * name = "_count"
  * type = #number
  * documentation = 
        "**Beispiel:**    
        `GET [base]/[Resourcetype]?_count=100`    
        **Anwendungshinweis:**   
        Weitere Details siehe FHIR-Kernspezifikation, Abschnitt [Page Count](https://www.hl7.org/fhir/R4/search.html#count).  "
* searchParam[+]
  * insert Expectation (#MAY)
  * name = "_has"
  * type = #string
  * documentation = 
        "**Beispiel:**    
        `GET [base]/Patient?_has:Observation:patient:code=1234-5`    
        **Anwendungshinweis:**   
        Weitere Details siehe FHIR-Kernspezifikation, Abschnitt [Reverse Chaining](https://hl7.org/fhir/R4/search.html#has).  "