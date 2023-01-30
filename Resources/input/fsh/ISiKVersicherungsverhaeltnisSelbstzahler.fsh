Profile: ISiKVersicherungsverhaeltnisSelbstzahler
Parent: Coverage
Id: ISiKVersicherungsverhaeltnisSelbstzahler
Description: "Dieses Profil ermöglicht Selbstzahler Szenarien in ISiK."
* insert Meta
* status MS
* type 1.. MS
  * coding 1.. MS
    * system 1.. MS
    * system = "http://fhir.de/CodeSystem/versicherungsart-de-basis" (exactly)
    * code 1.. MS
    * code = #SEL (exactly)
* policyHolder ..0
* subscriber only Reference(Patient or RelatedPerson)
* subscriber MS
  * display 1.. MS
* subscriberId ..0
* beneficiary only Reference(Patient)
* beneficiary MS
  * reference 1.. MS
* payor only Reference(Patient or RelatedPerson)
* payor MS

Instance: coveragePrivat
InstanceOf: ISiKVersicherungsverhaeltnisSelbstzahler
Usage: #example
* status = #active
* type = $versicherungsart-de-basis#SEL
* beneficiary = Reference(patient)
* payor = Reference(patient)