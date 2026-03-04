Instance: ISiKCapabilityStatementGesundheitsstatusRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Rolle
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementGesundheitsstatusRolle"
* name = "ISiKCapabilityStatementGesundheitsstatusRolle"
* title = "CapabilityStatement für Rolle ISiKCapabilityStatementGesundheitsstatusRolle"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Basismodul"
* purpose = "
CapabilityStatement für die Rolle ISiKCapabilityStatementGesundheitsstatusRolle.
Diese Rolle beschreibt verpflichtende Interaktionen zum Abruf und der Verarbeitung von ISiKObservation-Ressourcen.
"

* rest
  * mode = #server
  * resource[+]
    * type = #Observation
    * insert Expectation(#SHALL)
    * supportedProfile[+] = Canonical(ISiKLebensZustand)
      * insert Expectation(#SHALL)
    * supportedProfile[+] = Canonical(ISiKSchwangerschaftsstatus)
      * insert Expectation(#SHALL)
    * supportedProfile[+] = Canonical(ISiKSchwangerschaftErwarteterEntbindungstermin)
      * insert Expectation(#SHALL)
    * supportedProfile[+] = Canonical(ISiKAlkoholAbusus)
      * insert Expectation(#SHALL)
    * supportedProfile[+] = Canonical(ISiKRaucherStatus)
      * insert Expectation(#SHALL)
    * supportedProfile[+] = Canonical(ISiKStillstatus)
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
      * name = "status"
      * definition = "http://hl7.org/fhir/SearchParameter/Observation-status"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Observation?status=http://hl7.org/fhir/observation-status|final`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "category"
      * definition = "http://hl7.org/fhir/SearchParameter/Observation-category"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Observation?category=http://terminology.hl7.org/CodeSystem/observation-category|social-history`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "code"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Observation?code=http://loinc.org|82810-3`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "patient"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Observation?patient=Patient/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#MAY)
      * name = "subject"
      * definition = "http://hl7.org/fhir/SearchParameter/Observation-subject"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Observation?subject=Patient/123`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "date"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-date"
      * type = #date
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Observation?date=ge2013-01-14&date=le2021-12-31`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#date).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "combo-code"
      * definition = "http://hl7.org/fhir/SearchParameter/Observation-combo-code"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Observation?combo-code=85354-9`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "combo-code-value-quantity"
      * definition = "http://hl7.org/fhir/SearchParameter/Observation-combo-code-value-quantity"
      * type = #composite
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Observation?combo-code-value-quantity=http://loinc.org|8480-6$120|http://unitsofmeasure.org|mm[Hg]`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#composite).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "component-code"
      * definition = "http://hl7.org/fhir/SearchParameter/Observation-component-code"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Observation?component-code=http://loinc.org|85354-9`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "encounter"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-encounter"
      * type = #reference
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Observation?encounter=Encounter/234`    
        **Anwendungshinweis:**   
        Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
    * searchInclude[+] = "Observation:encounter"
      * insert Expectation(#SHALL)
    * searchInclude[+] = "Observation:patient"
      * insert Expectation(#SHALL)
    * searchInclude[+] = "Observation:subject"
      * insert Expectation(#MAY)

  * resource[+]
    * type = #AllergyIntolerance
    * insert Expectation(#SHALL)
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKAllergieUnvertraeglichkeit"
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
      * name = "clinical-status"
      * definition = "http://hl7.org/fhir/SearchParameter/AllergyIntolerance-clinical-status"
      * type = #token
      * documentation = 
          "**Beispiel:**    
          `GET [base]/AllergyIntolerance?clinical-status=active`    
          **Anwendungshinweis:**   
          Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "patient"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
      * type = #reference
      * documentation = 
          "**Beispiel:**    
          `GET [base]/AllergyIntolerance?patient=Patient/123`    
          **Anwendungshinweis:**   
          Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  "
  //wird im IG nicht genannt
  /*   * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "asserter"
      * definition = "http://hl7.org/fhir/SearchParameter/AllergyIntolerance-asserter"
      * type = #reference
      * documentation = 
          "**Beispiel:**    
          `ToDo`    
          **Anwendungshinweis:**   
          Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  " */
  
  //wird im IG nicht genannt
  /*   * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "recorder"
      * definition = "http://hl7.org/fhir/SearchParameter/AllergyIntolerance-recorder"
      * type = #reference
      * documentation = 
          "**Beispiel:**    
          `ToDo`    
          **Anwendungshinweis:**   
          Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#reference).  " */
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "onset"
      * definition = "http://hl7.org/fhir/SearchParameter/AllergyIntolerance-onset"
      * type = #date
      * documentation = 
          "**Beispiel:**    
          `GET [base]/AllergyIntolerance?onset=2015-01-01T12:00:23+02:00`    
          **Anwendungshinweis:**   
          Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#date).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "date"
      * definition = "http://hl7.org/fhir/SearchParameter/conformance-date"
      * type = #date
      * documentation = 
          "**Beispiel:**    
          `GET [base]/AllergyIntolerance?date=2015-01-01T12:00:23+02:00`    
          **Anwendungshinweis:**   
          Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#date).  "
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "category"
      * definition = "http://hl7.org/fhir/SearchParameter/AllergyIntolerance-category"
      * type = #token
      * documentation = 
          "**Beispiel:**    
          `GET [base]/AllergyIntolerance?category=environment`    
          **Anwendungshinweis:**   
          Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
  //wird im IG nicht genannt
  /*   * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "criticality"
      * definition = "http://hl7.org/fhir/SearchParameter/AllergyIntolerance-criticality"
      * type = #token
      * documentation = 
          "**Beispiel:**    
          `GET [base]/Organization?type=dept`    
          **Anwendungshinweis:**   
          Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  " */
    * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "type"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-type"
      * type = #token
      * documentation = 
          "**Beispiel:**    
          `GET [base]/AllergyIntolerance?type=allergy`    
          **Anwendungshinweis:**   
          Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  "
  //wird im IG nicht genannt
  /*   * searchParam[+]
      * insert Expectation(#SHALL)
      * name = "verification-status"
      * definition = "http://hl7.org/fhir/SearchParameter/AllergyIntolerance-verification-status"
      * type = #token
      * documentation = 
          "**Beispiel:**    
          `GET [base]/Organization?type=dept`    
          **Anwendungshinweis:**   
          Weitere Details siehe [FHIR-Kernspezifikation](https://hl7.org/fhir/R4/search.html#token).  " */
    * searchInclude[+] = "AllergyIntolerance:patient"
      * insert Expectation(#SHALL)    
    * searchInclude[+] = "AllergyIntolerance:encounter"
      * insert Expectation(#SHALL)    
    * searchInclude[+] = "AllergyIntolerance:recorder"
      * insert Expectation(#MAY)    
    * searchInclude[+] = "AllergyIntolerance:asserter"
      * insert Expectation(#MAY) 
        
