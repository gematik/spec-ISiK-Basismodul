Profile: SD_MII_ICU_Koerpertemperatur_Brustwirbelsaeule
Parent: SD_MII_ICU_Koerpertemperatur_Generisch
Id: sd-mii-icu-koerpertemperatur-brustwirbelsaeule
Title: "SD MII ICU Koerpertemperatur Brustwirbelsaeule"
* insert Meta
* insert CommonElements
* code
  * coding[sct] 1..1
  * coding[sct] = $sct#364424001
  * coding[specific-loinc] ..0
  * coding[IEEE-11073] ..0
    * ^patternCoding.system = $IEEE11073
* bodySite = $sct#122495006

Instance: Koerpertemperatur-Brustwirbelsaeule
InstanceOf: SD_MII_ICU_Koerpertemperatur_Brustwirbelsaeule
Usage: #example
* status = #final
* code
  * coding[sct] = $sct#364424001 "Temperature of thoracic spine"
* subject = Reference(PatientinMusterfrau)
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 37 'Cel' "degree Celsius"
* bodySite = $sct#122495006 "Structure of thoracic vertebral column (body structure)"