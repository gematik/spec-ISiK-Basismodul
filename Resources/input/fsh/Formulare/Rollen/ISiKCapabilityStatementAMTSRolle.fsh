Instance: ISiKCapabilityStatementFormularRendererClient
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementFormularRendererClient"
* name = "ISiKCapabilityStatementFormularRendererClient"
* title = "ISiK CapabilityStatement FormularRenderer Client"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de"
* purpose = "Das vorliegende CapabilityStatement beschreibt alle (verpflichtenden-TODO) Interaktionen die ein FormularRenderer als Client benötigt.
  
**HISTORIE:**    

"
* jurisdiction = urn:iso:std:iso:3166#DE "Germany"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #server
  * resource[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * type = #Questionnaire
    * supportedProfile = Canonical(ISiKFormularDefinition)
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #create
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #update
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #search-type
    * searchInclude[+] = "RiskAssessment:derivedFrom"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "_id"
      * definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
      * type = #token
      * documentation = 
        "**Beispiel:**  
        `GET [base]/Questionnaire?_id=103270`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach '_id' finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Parameters for all resources'](https://hl7.org/fhir/R4/search.html#all).

        "
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "identifier"
      * definition = "http://hl7.org/fhir/SearchParameter/CanonicalResource-identifier"
      * type = #token
      * documentation = 
        "**Beispiel:**  
        `GET [base]/Questionnaire?identifier=http://mein-krankenhaus.example/fhir/sid/questionnaire|103270`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Token Search'](https://hl7.org/fhir/R4/search.html#token)."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "name"
      * definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-name"
      * type = #string
      * documentation = 
        "**Beispiel:**  
        `GET [base]/Questionnaire?name=ExampleEntryValidationDecimal`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach String-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'String Search'](http://hl7.org/fhir/R4/search.html#string)."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "title"
      * definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-title"
      * type = #string
      * documentation = 
        "**Beispiel:**  
        `GET [base]/Questionnaire?title=Example%20EntryValidation%20Decimal`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach String-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'String Search'](http://hl7.org/fhir/R4/search.html#string)."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "status"
      * definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-status"
      * type = #token
      * documentation = 
        "**Beispiel:**  
        `GET [base]/Questionnaire?status=active`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Token Search'](https://hl7.org/fhir/R4/search.html#token)."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "version"
      * definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-version"
      * type = #token
      * documentation = 
        "**Beispiel:**  
        `GET [base]/Questionnaire?version=1.0.0`
        
        **Anwendungshinweise:** Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Token Search'](https://hl7.org/fhir/R4/search.html#token)."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "url"
      * definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-url"
      * type = #uri
      * documentation = 
        "**Beispiel:**  
        `GET [base]/Questionnaire?url=http://example.org/fhir/Questionnaire/example`
        
        **Anwendungshinweise:** Weitere Informationen zur Suche nach Uri-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Uri Search'](http://hl7.org/fhir/R4/search.html#uri)."
  * resource[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * type = #QuestionnaireResponse
    * supportedProfile = Canonical(ISiKFormularDaten)
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #create
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #update
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #search-type
    * searchInclude[+] = "QuestionnaireResponse:questionnaire"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchInclude[+] = "QuestionnaireResponse:subject"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchInclude[+] = "QuestionnaireResponse:encounter"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "_id"
      * definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
      * type = #token
      * documentation = 
        "**Beispiel:**  
        `GET [base]/Questionnaire?_id=103270`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach '_id' finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Parameters for all resources'](https://hl7.org/fhir/R4/search.html#all)."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "identifier"
      * definition = "http://hl7.org/fhir/SearchParameter/CanonicalResource-identifier"
      * type = #token
      * documentation = 
        "**Beispiel:**  
        `GET [base]/Questionnaire?identifier=http://mein-krankenhaus.example/fhir/sid/questionnaire|103270`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Token Search'](https://hl7.org/fhir/R4/search.html#token)."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "encounter"
      * definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-encounter"
      * type = #reference
      * documentation = 
        "**Beispiel:**  
        `GET [base]/QuestionnaireResponse?encounter=Encounter/123`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach Reference-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Reference Search'](http://hl7.org/fhir/R4/search.html#reference)."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "patient"
      * definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-patient"
      * type = #reference 
      * documentation = 
        "**Beispiel:**  
        `GET [base]/QuestionnaireResponse?patient=Patient/123`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach Reference-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Reference Search'](http://hl7.org/fhir/R4/search.html#reference)."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "questionnaire"
      * definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-questionnaire"
      * type = #reference
      * documentation = 
        "**Beispiel:**  
        `GET [base]/QuestionnaireResponse?questionnaire=Questionnaire/123`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach Reference-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Reference Search'](http://hl7.org/fhir/R4/search.html#reference)."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "status"
      * definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-status"
      * type = #token
      * documentation = 
        "**Beispiel:**  
        `GET [base]/QuestionnaireResponse?status=completed`
        
        **Anwendungshinweise:** Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Token Search'](https://hl7.org/fhir/R4/search.html#token)."