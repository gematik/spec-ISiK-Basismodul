Instance: ISiKCapabilityStatementLaborMinimalRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Rolle
* name = "ISiKCapabilityStatementLaborMinimalRolle"
* title = "ISiK CapabilityStatement Labor Minimal Rolle"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de"
* purpose = "Das vorliegende CapabilityStatement beschreibt Interaktionen für ein System, das Labordaten exponiert.

**HISTORIE**

*Historie*: mit der Version 4.0.2 des IG ICU-Normalstation-Workflow wurde das vorliegende CapabilityStatement im Sinne einer eigenständigen Rolle extrahiert (die Funktionalität bleibt dabei unverändert).



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
    * supportedProfile[+] = Canonical(ISiKLaboruntersuchungSerumkreatinin)
      * insert CapabilityStatementExpectationExt(SHALL)
    * supportedProfile[+] = Canonical(ISiKLaboruntersuchungPCT)
      * insert CapabilityStatementExpectationExt(SHALL)
    * supportedProfile[+] = Canonical(ISiKLaboruntersuchungCRP)
      * insert CapabilityStatementExpectationExt(SHALL)
    * supportedProfile[+] = Canonical(ISiKLaboruntersuchungHb)
      * insert CapabilityStatementExpectationExt(SHALL)
    * supportedProfile[+] = Canonical(ISiKLaboruntersuchungTroponin)
      * insert CapabilityStatementExpectationExt(SHALL)
    * supportedProfile[+] = Canonical(ISiKLaboruntersuchungGFR)
      * insert CapabilityStatementExpectationExt(SHALL)
    * supportedProfile[+] = Canonical(ISiKLaboruntersuchungThrombozyten)
      * insert CapabilityStatementExpectationExt(SHALL)
    * supportedProfile[+] = Canonical(ISiKLaboruntersuchungTSH)
      * insert CapabilityStatementExpectationExt(SHALL)
    * supportedProfile[+] = Canonical(ISiKLaboruntersuchungSerumnatrium)
      * insert CapabilityStatementExpectationExt(MAY)
    * interaction[+]
      * insert CapabilityStatementExpectationExt(SHALL)
      * code = #read
    * interaction[+]
      * insert CapabilityStatementExpectationExt(SHALL)
      * code = #search-type
    * insert CommonSearchParameters
    * insert CommonObservationSearchParameters