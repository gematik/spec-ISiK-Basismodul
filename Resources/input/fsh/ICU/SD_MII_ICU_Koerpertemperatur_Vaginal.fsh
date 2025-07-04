Profile: SD_MII_ICU_Koerpertemperatur_Vaginal
Parent: ISiKKoerperkerntemperatur
Id: sd-mii-icu-koerpertemperatur-vaginal
Title: "SD MII ICU Koerpertemperatur vaginal"
* insert Meta
* insert CommonElements
* code
  * insert MII_SpecificIEEE-11073Slice
  * coding[snomed] 1..1
  * coding[snomed] = $sct#364246006 // "Core body temperature measured vaginally"
  * coding[specific-loinc] ..0
    * ^patternCoding.system = "http://loinc.org"
  * coding[specific-IEEE-11073] ..0
    * ^patternCoding.system = $IEEE11073
* bodySite = $sct#76784001

Instance: Koerpertemperatur-vaginal
InstanceOf: SD_MII_ICU_Koerpertemperatur_Vaginal
Usage: #example
* status = #final
* code
  * coding[snomed] = $sct#364246006 "Core body temperature measured vaginally"
* subject = Reference(PatientinMusterfrau)
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 37 'Cel' "degree Celsius"
* bodySite = $sct#76784001 "Vaginal structure (body structure)"