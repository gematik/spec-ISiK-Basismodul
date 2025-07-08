Profile: SD_MII_ICU_Koerpertemperatur_Oral
Parent: ISiKKoerperkerntemperatur
Id: sd-mii-icu-koerpertemperatur-unter-der-zunge
Title: "SD MII ICU Koerpertemperatur unter der Zunge"
* insert Meta
* insert CommonElements
* code
  * insert MII_SpecificIEEE-11073Slice
  * coding[snomed] 1..1
  * coding[snomed] = $sct#415945006 // "Estimated core body temperature measured in sublingual space"
  * coding[specific-loinc] 1..1
  * coding[specific-loinc] = $loinc#8331-1 // "Oral temperature"
  * coding[specific-IEEE-11073] 1..1
  * coding[specific-IEEE-11073] = $IEEE11073#188424
* bodySite = $sct#123851003

Instance: Koerpertemperatur-Oral
InstanceOf: SD_MII_ICU_Koerpertemperatur_Oral
Usage: #example
* status = #final
* code
  * coding[specific-loinc] = $loinc#8331-1 "Oral temperature"
  * coding[snomed] = $sct#415945006 "Estimated core body temperature measured in sublingual space"
  * coding[specific-IEEE-11073] = $IEEE11073#188424 "Oral temperature"
* subject = Reference(PatientinMusterfrau)
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 37 'Cel' "degree Celsius"
* bodySite = $sct#123851003 "Mouth region structure (body structure)"