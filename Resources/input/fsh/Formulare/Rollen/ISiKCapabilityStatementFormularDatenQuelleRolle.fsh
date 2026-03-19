Instance: ISiKCapabilityStatementFormularDatenQuelleRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Rolle
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementFormularDatenQuelleRolle"
* name = "ISiKCapabilityStatementFormularDatenQuelleRolle"
* title = "CapabilityStatement für Rolle `FormularDatenQuelleRolle`"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Formularmodul"
* purpose = "
CapabilityStatement für die Rolle `ISiKCapabilityStatementFormularDatenQuelleRolle`.
Diese Rolle stellt Interaktionen zur Abfrage von FormularenDaten bereit. Hierbei liegt der Fokus auf der Bereitstellung von ausgefüllten Formularen und nicht aus den Extrahierten Ressourcen. Diese sind in Rollen der anderen Module bereitgestellt."
* rest
  * mode = #server
  * resource[+]
    * type = #QuestionnaireResponse
    * insert Expectation(#SHALL)
    * supportedProfile[+] = Canonical(ISiKFormularDaten)
      * insert Expectation(#SHALL)
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #read
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #search-type   

    * insert CommonSearchParameters 
    * insert OptionalTagSearchParameter
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "identifier"
      * definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-identifier"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/QuestionnaireResponse?identifier=http://example.org/fhir/sid/response|qr-001`    
        **Anwendungshinweis:**   
        Eindeutige Identifizierungsnummer für die Formularantwort. Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "questionnaire"
      * definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-questionnaire"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/QuestionnaireResponse?questionnaire=Questionnaire/ISiKFormularDefinition`    
        **Anwendungshinweis:**   
        Verweis auf die zugrunde liegende Formulardefinition. Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "status"
      * definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-status"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/QuestionnaireResponse?status=completed`  
        `GET [base]/QuestionnaireResponse?status=in-progress`    
        **Anwendungshinweis:**   
        Gültige Werte: in-progress | completed | amended | entered-in-error | stopped. Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "patient"
      * definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-patient"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/QuestionnaireResponse?patient=Patient/12345`    
        **Anwendungshinweis:**   
        Der Patient, für den das Formular ausgefüllt wurde. Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "authored"
      * definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-authored"
      * type = #date
      * documentation = 
        "**Beispiel:**    
        `GET [base]/QuestionnaireResponse?authored=2024-01-15`  
        `GET [base]/QuestionnaireResponse?authored=ge2024-01-01&authored=le2024-12-31`    
        **Anwendungshinweis:**   
        Zeitstempel wann die Formularantwort zuletzt bearbeitet wurde. Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#date).  "