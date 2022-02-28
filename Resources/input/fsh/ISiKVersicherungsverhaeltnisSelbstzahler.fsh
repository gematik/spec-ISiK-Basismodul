Profile: ISiKVersicherungsverhaeltnisSelbstzahler
Parent: http://fhir.de/StructureDefinition/coverage-de-sel
Id: ISiKVersicherungsverhaeltnisSelbstzahler
Description: "Dieses Profil ermöglicht Selbstzahler Szenarien in ISiK."
* insert Meta
* status ^mustSupport = false
* type 1..
* subscriber only Reference(ISiKPatient or ISiKAngehoeriger)
* subscriber MS
  * display 1.. MS
* beneficiary only Reference(ISiKPatient)
* beneficiary MS
  * reference 1.. MS
* payor only Reference(ISiKPatient or ISiKAngehoeriger)
* payor MS

Instance: CoveragePrivat
InstanceOf: ISiKVersicherungsverhaeltnisSelbstzahler
Usage: #example
* status = #active
* type = $versicherungsart-de-basis#SEL
* beneficiary = Reference(PatientinMusterfrau)
* payor = Reference(PatientinMusterfrau)