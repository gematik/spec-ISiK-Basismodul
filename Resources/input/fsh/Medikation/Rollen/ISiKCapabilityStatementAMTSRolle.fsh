Instance: ISiKCapabilityStatementAMTSRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Rolle
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementAMTSRolle"
* name = "ISiKCapabilityStatementAMTSRolle"
* title = "ISiK CapabilityStatement AMTS Rolle"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de"
* purpose = "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein ISiK-konformes System unterstützen muss um das Bestätigungsverfahren des Moduls 'Medikation', Bereich 'AMTS' zu bestehen.
  
**HISTORIE:**    

* `change` Die Verbindlichkeit des Suchparameters `subject` wurde von SHALL auf MAY reduziert, da der Suchparameter `patient` für ISiK-Zwecke ausreichend ist.   
* `change` Die Verbindlichkeit von Include und RevInclude wurde von SHALL auf MAY reduziert, außer bei den Parameter `patient` und `encounter`, da diese für ISiK-Zwecke ausreichend sind.  
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
    * type = #RiskAssessment
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKAMTSBewertung"
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
    * searchInclude[+] = "RiskAssessment:condition"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchInclude[+] = "RiskAssessment:encounter"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchInclude[+] = "RiskAssessment:patient"
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
        `GET [base]/RiskAssessment?_id=103270`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach '_id' finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Parameters for all resources'](https://hl7.org/fhir/R4/search.html#all).

        "
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "date"
      * definition = "http://hl7.org/fhir/SearchParameter/conformance-date"
      * type = #date
      * documentation = 
        "**Beispiel:**  
        `GET [base]/RiskAssessment?date=2022-03-21`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach Date-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Date'](https://hl7.org/fhir/R4/search.html#date).

        "
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "encounter"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-encounter"
      * type = #reference
      * documentation = 
        "**Beispiel:**  
        `GET [base]/RiskAssessment?encounter=Encounter/123`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach Reference-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Reference Search'](https://www.hl7.org/fhir/R4/search.html#reference).

        "
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "patient"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
      * type = #reference
      * documentation = 
        "**Beispiel:**  
        `GET [base]/RiskAssessment?patient=Patient/123`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach Reference-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Reference Search'](https://www.hl7.org/fhir/R4/search.html#reference).

        "
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "risk"
      * definition = "http://hl7.org/fhir/SearchParameter/RiskAssessment-risk"
      * type = #token
      * documentation = 
        "**Beispiel:**  
        `GET [base]/RiskAssessment?risk=http://terminology.hl7.org/CodeSystem/risk-probability|high`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Token Search'](https://hl7.org/fhir/R4/search.html#token).

        "
  * interaction[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * code = #transaction
    * documentation = "Transaktions-Bundle gemäß Profil https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationTransaction - Transaktions-Antwort-Bundle gemäß Profil https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationTransactionResponse"
  * resource[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * type = #AllergyIntolerance
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKAllergieUnvertraeglichkeit"
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
    * searchInclude[+] = "AllergyIntolerance:patient"
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
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "clinical-status"
      * definition = "http://hl7.org/fhir/SearchParameter/AllergyIntolerance-clinical-status"
      * type = #token
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "patient"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
      * type = #reference
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "onset"
      * definition = "http://hl7.org/fhir/SearchParameter/AllergyIntolerance-onset"
      * type = #date
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "date"
      * definition = "http://hl7.org/fhir/SearchParameter/conformance-date"
      * type = #date
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "_profile"
      * definition = "http://hl7.org/fhir/SearchParameter/Resource-profile"
      * type = #uri
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "category"
      * definition = "http://hl7.org/fhir/SearchParameter/AllergyIntolerance-category"
      * type = #token
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "type"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-type"
      * type = #token
  * resource[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * type = #Observation
    * supportedProfile[+] = "https://gematik.de/fhir/isik/StructureDefinition/ISiKKoerpergewicht"
    * supportedProfile[+] = "https://gematik.de/fhir/isik/StructureDefinition/ISiKKoerpergroesse"
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
    * searchInclude[+] = "Observation:encounter"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchInclude[+] = "Observation:patient"
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
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "code"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
      * type = #token
      * documentation = 
        "**Beispiel:**  
        `GET [base]/Medication?code=http://fhir.de/CodeSystem/bfarm/atc|V03AB23`

        **Anwendungshinweise**: Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Token Search'](https://hl7.org/fhir/R4/search.html#token)."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "condition.code"
      * definition = "http://hl7.org/fhir/SearchParameter/RiskAssessment-condition"
      * type = #token
      * documentation = 
        "**Beispiel:**  
        `GET [base]/RiskAssessment?condition.code=http://fhir.de/CodeSystem/bfarm/icd-10-gm|F71.0`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Token Search'](https://hl7.org/fhir/R4/search.html#token).

        Weitere Informationen zur Suche nach verketteten Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Chained Parameters'](https://hl7.org/fhir/R4/search.html#chaining).

        "
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "encounter.identifier"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-encounter"
      * type = #token
      * documentation = 
        "**Beispiele:**  
        `GET [base]/RiskAssessment?encounter.identifier=http://mein-krankenhaus.example/fhir/sid/fallnummern|7567867`

        `GET [base]/RiskAssessment?encounter.identifier=7567867`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach Reference-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Reference Search'](https://www.hl7.org/fhir/R4/search.html#reference).

        Weitere Informationen zur Suche nach verketteten Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Chained Parameters'](https://hl7.org/fhir/R4/search.html#chaining).

        "
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "patient.identifier"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
      * type = #token
      * documentation = 
        "**Beispiele:**  
        `GET [base]/RiskAssessment?patient.identifier=http://mein-krankenhaus.example/fhir/sid/patienten|1032702`

        `GET [base]/RiskAssessment?patient.identifier=1032702`

        **Anwendungshinweise:** Weitere Informationen zur Suche nach Token-type Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Token Search'](https://hl7.org/fhir/R4/search.html#token).

        Weitere Informationen zur Suche nach verketteten Parametern finden sich in der [FHIR-Basisspezifikation - Abschnitt 'Chained Parameters'](https://hl7.org/fhir/R4/search.html#chaining).

        "    
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "date"
      * definition = "http://hl7.org/fhir/SearchParameter/conformance-date"
      * type = #date
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "encounter"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-encounter"
      * type = #reference
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "patient"
      * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
      * type = #reference
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "status"
      * definition = "http://hl7.org/fhir/SearchParameter/Observation-status"
      * type = #token
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "value-concept"
      * definition = "http://hl7.org/fhir/SearchParameter/Observation-value-concept"
      * type = #token
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "value-quantity"
      * definition = "http://hl7.org/fhir/SearchParameter/Observation-value-quantity"
      * type = #quantity
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "_profile"
      * definition = "http://hl7.org/fhir/SearchParameter/Resource-profile"
      * type = #uri
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "category"
      * definition = "http://hl7.org/fhir/SearchParameter/Observation-category"
      * type = #token


