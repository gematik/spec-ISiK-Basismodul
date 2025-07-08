Profile: SD_MII_ICU_Systemischer_Vaskulaerer_Widerstandsindex
Parent: SD_MII_ICU_Monitoring_Und_Vitaldaten
Id: sd-mii-icu-systemischer-vaskulaerer-widerstandsindex
Title: "SD MII ICU Systemischer Vaskulaerer Widerstandsindex"
* insert Meta
* insert CommonElements
* code
  * coding[sct] 1..1
  * coding[sct] = $sct#276900001
  * coding[loinc] 1..1
  * coding[loinc] = $loinc#8837-7
  * coding[IEEE-11073] 1..1
  * coding[IEEE-11073] = $IEEE11073#149760
* valueQuantity
  * ^patternQuantity.unit = "dyne second per centimeter5 and square meter"
  * unit 1..
  * code = #dyn.s/cm5/m2
* bodySite 0..0
  * ^comment = "Der Wert ist keiner bodySite zuordenbar"

Instance: Systemischer-vaskulaerer-Widerstandsindex
InstanceOf: SD_MII_ICU_Systemischer_Vaskulaerer_Widerstandsindex
Usage: #example
* status = #final
* code
  * coding[loinc] = $loinc#8837-7 "Systemic vascular Resistance index"
  * coding[sct] = $sct#276900001 "Systemic vascular Resistance index"
  * coding[IEEE-11073] = $IEEE11073#149760 "Systemic vascular resistance indexed"
* subject = Reference(PatientinMusterfrau)
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 2000 'dyn.s/cm5/m2' "dyne second per centimeter5 and square meter"