Profile: SD_MII_ICU_Koerperkerntemperatur_Stirn
Parent: ISiKKoerperkerntemperatur
Id: sd-mii-icu-koerperkerntemperatur-stirn
Title: "SD MII ICU Koerperkerntemperatur Stirn"
Description: "Dieses Profil bietet eine spezialisierte Abbildung der geschätzten KörperKERNtemperatur gemessen an der Stirn in der Akutmedizin."
* insert Meta
* insert CommonElements
* code
  * insert MII_SpecificIEEE-11073Slice
  * coding[snomed] 1..1
  * coding[snomed] = $sct#1366425007 // "Estimated core body temperature measured on forehead"
  * coding[specific-loinc] ..0
    * ^patternCoding.system = "http://loinc.org"
  * coding[specific-IEEE-11073] ..0
    * ^patternCoding.system = $IEEE11073
* bodySite = $sct#52795006 //"Forehead structure"

Instance: Koerperkerntemperatur-stirn
InstanceOf: SD_MII_ICU_Koerperkerntemperatur_Stirn
Usage: #example
* status = #final
* code
  * coding[snomed] = $sct#1366425007 "Estimated core body temperature measured on forehead"
* subject = Reference(PatientinMusterfrau)
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 39.4 'Cel' "degree Celsius"
* bodySite = $sct#52795006 "Forehead structure"