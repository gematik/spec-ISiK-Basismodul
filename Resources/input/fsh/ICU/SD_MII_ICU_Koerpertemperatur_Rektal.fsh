Profile: SD_MII_ICU_Koerpertemperatur_Rektal
Parent: ISiKKoerperkerntemperatur
Id: sd-mii-icu-koerpertemperatur-rektal
Title: "SD MII ICU Koerpertemperatur rektal"
* insert Meta
* insert CommonElements
* code
  * insert MII_SpecificIEEE-11073Slice
  * coding[snomed] 1..1
  * coding[snomed] = $sct#307047009 //"Core body temperature measured in rectum"
  * coding[specific-loinc] 1..1
  * coding[specific-loinc] = $loinc#8332-9 // "Rectal temperature"
  * coding[specific-IEEE-11073] 1..1
  * coding[specific-IEEE-11073] = $IEEE11073#188420
* bodySite = $sct#34402009

Instance: Koerpertemperatur-rektal
InstanceOf: SD_MII_ICU_Koerpertemperatur_Rektal
Usage: #example
* status = #final
* code
  * coding[specific-loinc] = $loinc#8332-9 "Rectal temperature"
  * coding[snomed] = $sct#307047009 "Core body temperature measured in rectum"
  * coding[specific-IEEE-11073] = $IEEE11073#188420 "Rectal temperature"
* subject = Reference(PatientinMusterfrau)
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 37 'Cel' "degree Celsius"
* bodySite = $sct#34402009 "Rectum structure (body structure)"