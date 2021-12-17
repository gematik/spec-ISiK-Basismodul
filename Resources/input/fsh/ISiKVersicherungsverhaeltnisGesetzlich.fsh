Profile: ISiKVersicherungsverhaeltnisGesetzlich
Parent: http://fhir.de/StructureDefinition/coverage-de-gkv
Id: ISiKVersicherungsverhaeltnisGesetzlich
Description: "Dieses Profil ermöglicht die Darstellung eines gesetzlichen Versicherungsverhältnisses in ISiK Szenarien."
* insert Meta
* id 1..
* identifier MS
* identifier[KrankenversichertenID] 1..1 MS
  * system MS
  * value MS
* status MS
* type MS
  * coding 1.. MS
    * system 1.. MS
    * code 1.. MS
* subscriber only Reference(ISiKPatient or ISiKAngehoeriger)
* subscriber
  * display 1..
* beneficiary only Reference(ISiKPatient)
* beneficiary MS
  * reference 1.. MS
* payor only Reference(Organization)
* payor ..1 MS
  * identifier MS
    * system MS
    * value MS
  * display 1.. MS

Instance: coverageGesetzlich
InstanceOf: ISiKVersicherungsverhaeltnisGesetzlich
Usage: #example
* identifier.type = $identifier-type-de-basis#GKV
* identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* identifier.value = "A234567890"
* status = #active
* type = $versicherungsart-de-basis#GKV
* beneficiary = Reference(patient)
* payor.identifier.type = $v2-0203#XX
* payor.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* payor.identifier.value = "260326822"
* payor.display = "Eine Gesundheitskasse"