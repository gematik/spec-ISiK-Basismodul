Profile: SD_MII_ICU_Koerpertemperatur_Gelenk
Parent: SD_MII_ICU_Koerpertemperatur_Generisch
Id: sd-mii-icu-koerpertemperatur-gelenk
Title: "SD MII ICU Koerpertemperatur Gelenk"
Description: "Dieses Profil dient der spezialisierten Abbildung der Körpertemperaturmessung am Gelenk im ICU-Umfeld. Es dient nicht der Abbildung der KörperKERNtemperatur (siehe dafür Profile zu Körperkerntemperatur im generischen Modul Vitalparameter bzw. abgeleitete Profile im ICU-Bereich)."
* insert Meta
* insert CommonElements
* code
  * coding[sct] 1..1
  * coding[sct] = $sct#250124002
  * coding[specific-loinc] ..0
  * coding[IEEE-11073] ..0
    * ^patternCoding.system = $IEEE11073
* bodySite = $sct#39352004

Instance: Koerpertemperatur-Gelenk
InstanceOf: SD_MII_ICU_Koerpertemperatur_Gelenk
Usage: #example
* status = #final
* code
  * coding[sct] = $sct#250124002 "Temperature of joint"
* subject = Reference(PatientinMusterfrau)
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 37 'Cel' "degree Celsius"
* bodySite = $sct#39352004 "Joint structure (body structure)"