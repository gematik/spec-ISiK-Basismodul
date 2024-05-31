Profile: ISiKVersicherungsverhaeltnisSelbstzahler
Parent: http://fhir.de/StructureDefinition/coverage-de-sel
Id: ISiKVersicherungsverhaeltnisSelbstzahler
Description: "Dieses Profil ermöglicht Selbstzahler Szenarien in ISiK."
* insert Meta
* status MS
* type MS
* subscriber MS
  * display 1.. MS
  * reference MS
    * ^comment = "Motivation für MS: Da ein ISIK-Profil besteht, sollte dies ggf. referenziert werden."
* beneficiary only Reference(Patient)
* beneficiary MS
  * reference 1.. MS
* payor only Reference(Patient or RelatedPerson or Organization)
* payor MS

Instance: CoveragePrivat
InstanceOf: ISiKVersicherungsverhaeltnisSelbstzahler
Usage: #example
* status = #active
* type = $versicherungsart-de-basis#SEL
* beneficiary = Reference(PatientinMusterfrau)
* payor = Reference(PatientinMusterfrau)