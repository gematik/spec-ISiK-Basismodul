Instance: ISiKCapabilityStatementFormularDefinitionsVerwalterRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Rolle
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementFormularDefinitionsVerwalterRolle"
* name = "ISiKCapabilityStatementFormularDefinitionsVerwalterRolle"
* title = "CapabilityStatement für Rolle &quot;FormularDefinitionsVerwalterRolle&quot;"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Formularmodul"
* purpose = "
CapabilityStatement für die Rolle &quot;ISiKCapabilityStatementFormularDefinitionsVerwalterRolle&quot;.
Diese Rolle stellt Interaktionen zur Abfrage von Formularen bereit."
* rest
  * mode = #server
  * resource[+]
    * type = #Questionnaire
    * insert Expectation(#SHALL)
    * supportedProfile[+] = Canonical(ISiKFormularDefinition)
      * insert Expectation(#SHALL)
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #read
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #search-type   

    * insert CommonSearchParameters
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "identifier"
      * definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-identifier"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Questionnaire?identifier=http://example.org/fhir/sid/questionnaire|form-001`    
        **Anwendungshinweis:**   
        Externe Identifizierungsnummer für das Formular. Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "name"
      * definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-name"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Questionnaire?name=IntakeFormular`    
        **Anwendungshinweis:**   
        Maschinenlesbarer Name des Formulars. Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "publisher"
      * definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-publisher"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Questionnaire?publisher=Gematik`    
        **Anwendungshinweis:**   
        Name des Herausgebers oder der Organisation. Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "status"
      * definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-status"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Questionnaire?status=active`  
        `GET [base]/Questionnaire?status=draft`    
        **Anwendungshinweis:**   
        Gültige Werte: draft | active | retired | unknown. Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "title"
      * definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-title"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Questionnaire?title=Aufnahmebogen`    
        **Anwendungshinweis:**   
        Benutzerfreundlicher Name des Formulars. Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#string).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "url"
      * definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-url"
      * type = #uri
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Questionnaire?url=https://gematik.de/fhir/isik/Questionnaire/ISiKFormularDefinition`    
        **Anwendungshinweis:**   
        Kanonische URI-Identifikation des Formulars. Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#uri).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "version"
      * definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-version"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Questionnaire?version=1.0.0`  
        `GET [base]/Questionnaire?version=2.0.0`    
        **Anwendungshinweis:**   
        Geschäftsversion des Formulars. Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "