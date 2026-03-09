Instance: ISiKCapabilityStatementOrganspendeerkennungSourceRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Rolle
* name = "ISiKCapabilityStatementOrganspendeerkennungSourceRolle"
* title = "ISiK CapabilityStatement Organspendeerkennung Source Rolle"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de"
* purpose = "Das vorliegende CapabilityStatement beschreibt verpflichtende Interaktionen, die ein ISiK-konformes System oder eine Systemkomponenten in der Rolle 'Organspendeerkennung Source Minimal' zur Unterstützung des Organspendeerkennungs-Workflows implementieren muss.

Die Interaktionen umfassen die Bereitstellung von Vitalparametern, die für eine IHA-Diagnostik wesentlich sind.
  
**HISTORIE:**    

*Historie*: mit der Version 6.0.0-rc des IG Organspendeerkennung wurde das vorliegende CapabilityStatement im Sinne einer eigenständigen Rolle erstellt.

"
* jurisdiction = urn:iso:std:iso:3166#DE "Germany"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #server
  * resource[+]
    * type = #Observation
    * insert CapabilityStatementExpectationExt(SHALL)

    // MII-ICU backport profiles for pdms
    * insert SupportedProfileCapExpectationExt(ISiKGCS, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Score_RASS, SHALL)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Untersuchung_Pupillenlichtreaktion_Direkt, SHALL)

    // Optionale Parameter
    // MII
    * insert SupportedProfileCapExpectationExt(SD_MII_ICU_Intrakranieller_Druck_Icp, MAY)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_MUV_zerebraler_Perfusionsdruck, MAY)
    * insert SupportedProfileCapExpectationExt(MII_PR_ICU_Beatmung, MAY)
    // ISiK
    * insert SupportedProfileCapExpectationExt(ISiKProzedurReanimation, MAY)
    
    * interaction[+]
      * insert CapabilityStatementExpectationExt(SHALL)
      * code = #read
    * interaction[+]
      * insert CapabilityStatementExpectationExt(SHALL)
      * code = #search-type
    * insert CommonSearchParameters 
    * insert OptionalTagSearchParameter
    * insert CommonObservationSearchParameters