Profile: SD_MII_ICU_Koerpertemperatur_Myokard
Parent: SD_MII_ICU_Koerpertemperatur_Generisch
Id: sd-mii-icu-koerpertemperatur-myokard
Title: "SD MII ICU Koerpertemperatur Myokard"
Description: "Dieses Profil dient der spezialisierten Abbildung der Körpertemperaturmessung im Myokard (Herzmuskel). Es dient nicht der Abbildung der KörperKERNtemperatur (siehe dafür Profile zu Körperkerntemperatur im generischen Modul Vitalparameter bzw. abgeleitete Profile im ICU-Bereich)."
* insert Meta
* insert CommonElements
* code
  * coding[sct] ..0
    * ^patternCoding.system = "http://snomed.info/sct"
  * coding[specific-loinc] 1..1
  * coding[specific-loinc] = $loinc#61009-7 // "Myocardial temperature"
  * coding[IEEE-11073] 1..1
  * coding[IEEE-11073] = $IEEE11073#188500
* bodySite = $sct#74281007

Instance: Koerpertemperatur-Myokard
InstanceOf: SD_MII_ICU_Koerpertemperatur_Myokard
Usage: #example
* status = #final
* code
  * coding[specific-loinc] = $loinc#61009-7 "Myocardial temperature"
  * coding[IEEE-11073] = $IEEE11073#188500 "Myocardial temperature"
* subject = Reference(PatientinMusterfrau)
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 37 'Cel' "degree Celsius"
* bodySite = $sct#74281007 "Myocardium structure (body structure)"