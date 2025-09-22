Profile: SD_MII_ICU_Pulmonalvaskulaerer_Widerstandsindex
Parent: SD_MII_ICU_Monitoring_Und_Vitaldaten
Id: sd-mii-icu-pulmonalvaskulaerer-widerstandsindex
Title: "SD MII ICU Pulmonalvaskulaerer Widerstandsindex"
* insert Meta
* insert CommonElements
* code
  * coding[sct] 1..1
  * coding[sct] = $sct#276902009
  * coding[loinc] 1..1
  * coding[loinc] = $loinc#8834-4
  * coding[IEEE-11073] 1..1
  * coding[IEEE-11073] = $IEEE11073#152852
* valueQuantity
  * ^patternQuantity.system = "http://unitsofmeasure.org"
  * ^patternQuantity.unit = "dyne second per centimeter5 and square meter"
  * unit 1..
  * code = #dyn.s/cm5/m2

Instance: Pulmonalvaskulaerer-Widerstandsindex
InstanceOf: SD_MII_ICU_Pulmonalvaskulaerer_Widerstandsindex
Usage: #example
* status = #final
* code
  * coding[loinc] = $loinc#8834-4 "Pulmonary vascular Resistance index"
  * coding[sct] = $sct#276902009 "Pulmonary vascular Resistance index"
  * coding[IEEE-11073] = $IEEE11073#152852 "Pulmonary Vascular Resistance Index"
* subject = Reference(PatientinMusterfrau)
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 80 'dyn.s/cm5/m2' "dyne second per centimeter5 and square meter"