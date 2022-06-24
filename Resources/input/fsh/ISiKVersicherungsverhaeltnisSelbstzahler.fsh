Profile: ISiKVersicherungsverhaeltnisSelbstzahler
Parent: http://fhir.de/StructureDefinition/coverage-de-sel
Id: ISiKVersicherungsverhaeltnisSelbstzahler
Description: "Dieses Profil ermöglicht Selbstzahler Szenarien in ISiK."
* insert Meta
* status ^mustSupport = false
* type 1..
* subscriber MS
  * display 1.. MS
* beneficiary MS
  * reference 1.. MS
* payor MS

Instance: CoveragePrivat
InstanceOf: ISiKVersicherungsverhaeltnisSelbstzahler
Usage: #example
* status = #active
* type = $versicherungsart-de-basis#SEL
* beneficiary = Reference(PatientinMusterfrau)
* payor = Reference(PatientinMusterfrau)