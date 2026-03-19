Instance: ISiKCapabilityStatementMedikationVerabreichungWRITERolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Rolle
* name = "ISiKCapabilityStatementMedikationVerabreichungWRITERolle"
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementMedikationVerabreichungWRITERolle"
* title = "ISiK CapabilityStatement Medikationsverabreichung WRITE Rolle"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de"
* purpose = "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden modifizierenden Interaktionen die ein ISiK-konformes System unterstützen muss um das Bestätigungsverfahren des Moduls 'Medikation', Bereich 'Medikationsverabreichung' zu bestehen.
  
**HISTORIE:**    

* `change` Initialisierung als eigene Rolle: Alle modifizierenden Interaktionen (z.B. `update`, `create`, `transaction`) wurden entfernt aus der Rolle ISiKCapabilityStatementMedikationVerabreichungRolle und ausgelagert in diese dedizierte Rolle, um eine klarere Trennung der Verantwortlichkeiten zu ermöglichen.
"
* jurisdiction = urn:iso:std:iso:3166#DE "Germany"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #server
  * resource[0]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * type = #MedicationAdministration
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsVerabreichung"
    * interaction[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #create
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #update
    * interaction[+]  
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #transaction
      * documentation = "Transaktions-Bundle gemäß Profil https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationTransaction - Transaktions-Antwort-Bundle gemäß Profil https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationTransactionResponse"
