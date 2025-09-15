Profile: SD_MII_ICU_Koerpertemperatur_Harnblase
Parent: ISiKKoerperkerntemperatur
Id: sd-mii-icu-koerpertemperatur-harnblase
Title: "SD MII ICU Koerpertemperatur Harnblase"
Description: "Dieses Profil bietet eine spezialisierte Abbildung der geschätzten Körperkerntemperatur gemessen in der Harnblase im ICU-Umfeld."
* insert Meta
* insert CommonElements
* code
  * insert MII_SpecificIEEE-11073Slice
  * coding[snomed] 1..1 
  * coding[snomed] = $sct#698832009 // "Core body temperature measured at urinary bladder"
  * coding[specific-loinc] 1..1
  * coding[specific-loinc] = $loinc#8334-5 // "Body temperature - Urinary bladder"
  * coding[specific-IEEE-11073] ..0
    * ^patternCoding.system = $IEEE11073
* bodySite = $sct#89837001

Instance: Koerpertemperatur-Harnblase
InstanceOf: SD_MII_ICU_Koerpertemperatur_Harnblase
Usage: #example
* status = #final
* code
  * coding[specific-loinc] = $loinc#8334-5 "Body temperature - Urinary bladder"
  * coding[snomed] = $sct#698832009 "Core body temperature measured at urinary bladder"
* subject = Reference(PatientinMusterfrau)
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 37 'Cel' "degree Celsius"
* bodySite = $sct#89837001 "Urinary bladder structure (body structure)"