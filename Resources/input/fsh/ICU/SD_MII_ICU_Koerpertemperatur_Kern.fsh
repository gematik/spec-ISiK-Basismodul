Profile: SD_MII_ICU_Koerpertemperatur_Kern
Parent: ISiKKoerperkerntemperatur
Id: sd-mii-icu-koerpertemperatur-kern
Title: "SD MII ICU Koerpertemperatur Kern"
Description: "Dieses Profil bietet eine generische Abbildung der geschätzten KörperKERNtemperatur in der Akutmedizin."
* insert Meta
* insert CommonElements
* code
  * insert MII_SpecificIEEE-11073Slice
  * coding[snomed] 1..1
  * coding[snomed] = $sct#276885007 //"Core body temperature"
  * coding[IEEE11073] 1..
  * coding[specific-loinc] ..0
  * coding[specific-IEEE-11073] ..0


Instance: Koerpertemperatur-Kern
InstanceOf: SD_MII_ICU_Koerpertemperatur_Kern
Usage: #example
* status = #final
* code
  * coding[coretemp-loinc] = $loinc#8329-5 "Body temperature - Core"
  * coding[snomed] = $sct#276885007 "Core body temperature"
  * coding[coretemp-IEEE11073] = $IEEE11073#150368 "Body temperature - Core"
  * coding[loinc] = $loinc#8310-5 "Body temperature"
* subject = Reference(PatientinMusterfrau)
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 37 'Cel' "degree Celsius"