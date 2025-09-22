Profile: SD_MII_ICU_Koerpertemperatur_Leiste
Parent: ISiKKoerperkerntemperatur
Id: sd-mii-icu-koerpertemperatur-leiste
Title: "SD MII ICU Koerpertemperatur Leiste"
* insert Meta
* insert CommonElements
* code
  * insert MII_SpecificIEEE-11073Slice
  * coding[snomed] 1..1
  * coding[snomed] = $sct#415929009 // "Estimated core body temperature measured in inguinal region"
  * coding[specific-loinc] 1..1
  * coding[specific-loinc] = $loinc#104063-3 // "Body temperature - Groin"
  * coding[specific-IEEE-11073] ..0
    * ^patternCoding.system = $IEEE11073
* bodySite = $sct#26893007

Instance: Koerpertemperatur-Leiste
InstanceOf: SD_MII_ICU_Koerpertemperatur_Leiste
Usage: #example
* status = #final
* code
  * coding[snomed] = $sct#415929009 "Estimated core body temperature measured in inguinal region"
  * coding[specific-loinc] = $loinc#104063-3 "Body temperature - Groin"
* subject = Reference(PatientinMusterfrau)
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 37 'Cel' "degree Celsius"
* bodySite = $sct#26893007 "Inguinal region structure (body structure)"