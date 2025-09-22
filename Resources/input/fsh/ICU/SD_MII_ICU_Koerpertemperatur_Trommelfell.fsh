Profile: SD_MII_ICU_Koerpertemperatur_Trommelfell
Parent: ISiKKoerperkerntemperatur
Id: sd-mii-icu-koerpertemperatur-trommelfell
Title: "SD MII ICU Koerpertemperatur Trommelfell"
* insert Meta
* insert CommonElements
* code
  * insert MII_SpecificIEEE-11073Slice
  * coding[snomed] 1..1
  * coding[snomed] = $sct#415974002 // "Core body temperature measured at tympanic membrane"
  * coding[specific-loinc] 1..1
  * coding[specific-loinc] = $loinc#8333-7 // "Tympanic membrane temperature"
  * coding[specific-IEEE-11073] 1..1
  * coding[specific-IEEE-11073] = $IEEE11073#150392
* bodySite = $sct#42859004

Instance: Koerpertemperatur-Trommelfell
InstanceOf: SD_MII_ICU_Koerpertemperatur_Trommelfell
Usage: #example
* status = #final
* code
  * coding[specific-loinc] = $loinc#8333-7 "Tympanic membrane temperature"
  * coding[snomed] = $sct#415974002 "Core body temperature measured at tympanic membrane"
  * coding[specific-IEEE-11073] = $IEEE11073#150392 "MDC_TEMP_TYMP"
* subject = Reference(PatientinMusterfrau)
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 37 'Cel' "degree Celsius"
* bodySite = $sct#42859004 "Tympanic membrane structure (body structure)"