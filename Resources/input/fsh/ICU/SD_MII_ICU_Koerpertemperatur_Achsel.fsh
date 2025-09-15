Profile: SD_MII_ICU_Koerpertemperatur_Achsel
Parent: ISiKKoerperkerntemperatur
Id: sd-mii-icu-koerpertemperatur-achsel
Title: "SD MII ICU Koerpertemperatur Achsel"
Description: "Dieses Profil bietet eine spezialisierte Abbildung der geschätzten KörperKERNtemperatur gemessen in der Achsel im ICU-Umfeld."
* insert Meta
* insert CommonElements
* code 
  * insert MII_SpecificIEEE-11073Slice
  * coding[snomed] 1..1 
  * coding[snomed] = $sct#415882003 //"Estimated core body temperature measured in axillary region"
  * coding[specific-loinc] 1..1 
  * coding[specific-loinc] = $loinc#8328-7 // "Axillary temperature"
  * coding[specific-IEEE-11073] = $IEEE11073#188452
* bodySite = $sct#91470000

Instance: Koerpertemperatur-Achsel
InstanceOf: SD_MII_ICU_Koerpertemperatur_Achsel
Usage: #example
* status = #final
* code
  * coding[specific-loinc] = $loinc#8328-7 "Axillary temperature"
  * coding[snomed] = $sct#415882003 "Estimated core body temperature measured in axillary region"
  * coding[specific-IEEE-11073] = $IEEE11073#188452 "MDC_TEMP_AXILLA"
* subject = Reference(PatientinMusterfrau)
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 37 'Cel' "degree Celsius"
* bodySite = $sct#91470000 "Axillary region structure (body structure)"