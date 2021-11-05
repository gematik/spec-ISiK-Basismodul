Profile: ISiKVersicherungsverhaeltnisSelbstzahler
Parent: Coverage
Id: ISiKVersicherungsverhaeltnisSelbstzahler
Description: "Dieses Profil ermöglicht Selbstzahler Szenarien in ISiK."
* ^version = "0.1"
* ^status = #active
* ^experimental = true
* ^date = "2020-10-15"
* ^publisher = "gematik GmbH"
* status ^mustSupport = false
* type 1..
  * coding 1..
    * system 1..
    * system = "http://fhir.de/CodeSystem/versicherungsart-de-basis" (exactly)
    * code 1..
    * code = #SEL (exactly)
* policyHolder ..0
* subscriber only Reference(ISiKPatient or ISiKAngehoeriger)
* subscriber MS
  * display 1.. MS
* subscriberId ..0
* beneficiary only Reference(ISiKPatient)
* beneficiary MS
  * reference 1.. MS
* payor only Reference(ISiKPatient or ISiKAngehoeriger)
* payor MS
* order ..0
* network ..0

Instance: coveragePrivat
InstanceOf: ISiKVersicherungsverhaeltnisSelbstzahler
Usage: #example
* status = #active
* type = $versicherungsart-de-basis#SEL
* beneficiary = Reference(patient)
* payor = Reference(patient)