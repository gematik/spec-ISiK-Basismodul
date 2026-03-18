Instance: ISiKCapabilityStatementMedikationVerordnungWRITERolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Rolle
* name = "ISiKCapabilityStatementMedikationVerordnungWRITERolle"
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementMedikationVerordnungWRITERolle"
* title = "ISiK CapabilityStatement Medikationsverordnung WRITE Rolle"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de"
* purpose = "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen zum Erstellen (CREATE) und Ändern (UPDATE) einer Medikationsverordnung, die ein ISiK-konformes System unterstützen muss, um das Bestätigungsverfahren des Moduls 'Medikation', Bereich 'Medikationsverordnung' zu bestehen.
  
**HISTORIE:**    

* `change` - `2024-06-19`: Erstellung des CapabilityStatements auf Basis der vorliegenden CREATE- und UPDATE-Interaktionen für Medikationsverordnungen.  
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
    * type = #MedicationRequest
    * supportedProfile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsVerordnung"
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

