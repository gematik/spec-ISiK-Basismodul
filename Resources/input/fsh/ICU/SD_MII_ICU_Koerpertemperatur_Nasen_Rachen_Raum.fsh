Profile: SD_MII_ICU_Koerpertemperatur_Nasen_Rachen_Raum
Parent: SD_MII_ICU_Koerpertemperatur_Generisch
Id: sd-mii-icu-koerpertemperatur-nasen-rachen-raum
Title: "SD MII ICU Koerpertemperatur Nasen-Rachen-Raum"
* insert Meta
* insert CommonElements
* code
  * coding[sct] 1..1
  * coding[sct] = $sct#698831002
  * coding[specific-loinc] 1..1 // "Nasopharyngeal temperature"
  * coding[specific-loinc] = $loinc#60838-0
  * coding[IEEE-11073] 1..1
  * coding[IEEE-11073] = $IEEE11073#150380
* bodySite = $sct#71836000

Instance: Koerpertemperatur-Nasen-Rachen-Raum
InstanceOf: SD_MII_ICU_Koerpertemperatur_Nasen_Rachen_Raum
Usage: #example
* status = #final
* code
  * coding[sct] = $sct#698831002 "Core body temperature measured in nasopharynx"
  * coding[IEEE-11073] = $IEEE11073#150380 "MDC_TEMP_NASOPH"
  * coding[specific-loinc] = $loinc#60838-0 "Nasopharyngeal temperature"
* subject = Reference(PatientinMusterfrau)
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 37 'Cel' "degree Celsius"
* bodySite = $sct#71836000 "Nasopharyngeal structure (body structure)"