Profile: SD_MII_ICU_Koerpertemperatur_Blut
Parent: ISiKKoerperkerntemperatur
Id: sd-mii-icu-koerpertemperatur-blut
Title: "SD MII ICU Koerpertemperatur Blut"
Description: "Dieses Profil bietet eine spezialisierte Abbildung der geschätzten Körperkerntemperatur gemessen im Blut in der Akutmedizin."
* insert Meta
* insert CommonElements
* code
  * insert MII_SpecificIEEE-11073Slice
  * coding[snomed] 1..1
  * coding[snomed] = $sct#1222808002 //"Core body temperature measured in blood"
  * coding[specific-loinc] 1..1
  * coding[specific-loinc] = $loinc#60834-9 // "Blood temperature"
  * coding[specific-IEEE-11073] 1..1
  * coding[specific-IEEE-11073] = $IEEE11073#188436


Instance: Koerpertemperatur-Blut
InstanceOf: SD_MII_ICU_Koerpertemperatur_Blut
Usage: #example
* status = #final
* code
  * coding[specific-loinc] = $loinc#60834-9 "Blood temperature"
  * coding[snomed] = $sct#1222808002 "Core body temperature measured in blood"
  * coding[specific-IEEE-11073] = $IEEE11073#188436 "Blood temperature"
* subject = Reference(PatientinMusterfrau)
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 37 'Cel' "degree Celsius"