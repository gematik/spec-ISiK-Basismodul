Profile: SD_MII_ICU_Koerpertemperatur_Speiseroehre
Parent: ISiKKoerperkerntemperatur
Id: sd-mii-icu-koerpertemperatur-speiseroehre
Title: "SD MII ICU Koerpertemperatur Speiseroehre"
Description: "Dieses Profil bietet eine spezialisierte Abbildung der geschätzten KörperKERNtemperatur gemessen in der Speiseröhre im ICU-Umfeld."
* insert Meta
* insert CommonElements
* code
  * insert MII_SpecificIEEE-11073Slice
  * coding[snomed] 1..1
  * coding[snomed] = $sct#431598003 //"Core body temperature measured in esophagus"
  * coding[specific-loinc] 1..1
  * coding[specific-loinc] = $loinc#60836-4 // "Esophageal temperature"
  * coding[specific-IEEE-11073] 1..1
  * coding[specific-IEEE-11073] = $IEEE11073#150372
* bodySite = $sct#32849002

Instance: Koerpertemperatur-Speiseroehre
InstanceOf: SD_MII_ICU_Koerpertemperatur_Speiseroehre
Usage: #example
* status = #final
* code
  * coding[specific-loinc] = $loinc#60836-4 "Esophageal temperature"
  * coding[snomed] = $sct#431598003 "Core body temperature measured in esophagus"
  * coding[specific-IEEE-11073] = $IEEE11073#150372 "MDC_TEMP_ESOPH"
* subject = Reference(PatientinMusterfrau)
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 37 'Cel' "degree Celsius"
* bodySite = $sct#32849002 "Esophageal structure (body structure)"