Profile: ISiKVersicherungsverhaeltnisSelbstzahler
Parent: http://fhir.de/StructureDefinition/coverage-de-sel
Id: ISiKVersicherungsverhaeltnisSelbstzahler
Description: "Dieses Profil ermöglicht Selbstzahler Szenarien in ISiK."
* insert Meta
* status MS
* type 1.. MS
* subscriber only Reference(Patient or RelatedPerson)
* subscriber MS
  * display 1.. MS
* beneficiary only Reference(Patient)
* beneficiary MS
  * reference 1.. MS
* payor only Reference(Patient or RelatedPerson)
* payor MS

Instance: CoveragePrivat
InstanceOf: ISiKVersicherungsverhaeltnisSelbstzahler
Usage: #example
* status = #active
* type = $versicherungsart-de-basis#SEL
* beneficiary = Reference(PatientinMusterfrau)
* payor = Reference(PatientinMusterfrau)