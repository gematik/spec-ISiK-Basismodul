// Ward example

Instance: ExampleITSStationAnaesthesie
InstanceOf: ISiKStandort
Usage: #example
Title: "ISiKStation Beispielinstanz aus Organ-Daten"
Description: "Beispielstation Anaesthesie"
* id = "isik-station-anaesthesie"
* identifier[standortnummer-dkg]
  * value = "ANEITS" 
* operationalStatus = $v2-0116#O "Occupied" 
* name = "Intensivstation Anaesthesie"
* mode = #instance
* type = $v3-RoleCode#ICU "Intensive care unit"
* address.line = "Krankenhausstraße 123"
* address.city = "Musterstadt"
* address.postalCode = "12345"
* physicalType = $LocationPhysicalType#wa "Ward"
* managingOrganization = Reference(KrankenhausOrganisationBeispiel)
* partOf = Reference(KrankenhausStandortBeispiel) 
