Profile: ISiKValueSet
Parent: ValueSet
Id: ISiKValueSet
Description: "Dieses Profil beschreibt die maschinenlesbare Auswahl von Codes für die Kodierung spezifischer FHIR-Elemente in ISiK-Szenarien"
* insert Meta
* id 1.. MS
* url 1.. MS
* version 1.. MS
* name 1.. MS
* status MS
* useContext 1.. MS
* useContext.code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext.value[x] only CodeableConcept
* useContext.value[x] from ResourceType (required)
* useContext.value[x] ^binding.description = "One of the resource types defined as part of this version of FHIR."
* expansion 1.. MS
* expansion.timestamp MS
* expansion.contains 1.. MS
* expansion.contains.system 1.. MS
* expansion.contains.version 1.. MS
* expansion.contains.code 1.. MS
* expansion.contains.display 1.. MS