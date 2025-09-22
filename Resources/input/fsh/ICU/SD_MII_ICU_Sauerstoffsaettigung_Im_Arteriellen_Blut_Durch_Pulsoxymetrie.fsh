Profile: SD_MII_ICU_Sauerstoffsaettigung_Im_Arteriellen_Blut_Durch_Pulsoxymetrie
Parent: SD_MII_ICU_Monitoring_Und_Vitaldaten
Id: sd-mii-icu-o2saettigung-im-arteriellen-blut-durch-pulsoxymetrie
Title: "SD MII ICU Sauerstoffsaettigung Im Arteriellen Blut Durch Pulsoxymetrie"
* insert Meta
* insert CommonElements
* code
  * coding[sct] 1..1
  * coding[sct] = $sct#442476006
  * coding[loinc] 1..1
  * coding[loinc] = $loinc#59408-5
  * coding[IEEE-11073] 1..1
  * coding[IEEE-11073] = $IEEE11073#150324
  * coding contains loinc-fhir-core 1..1 MS
  * coding[loinc-fhir-core] = $loinc#2708-6
    * ^short = "Magic Loinc Value Sauerstoffsättigung"
    * ^comment = "**Begründung Pflichtfeld:** Die Angabe des magic Loinc Wertes für die Sauerstoffsättigung ist laut FHIR-Core-Spezifikation verpflichtend."
    * system 1.. MS
    * code 1.. MS
* valueQuantity = $unitsofmeasure#% "percent"
  * unit 1..
* bodySite = $sct#11527006
  * coding MS
    * system 1.. MS
    * code 1.. MS

Instance: Sauerstoffsaettigung-im-Arteriellen-Blut-durch-Pulsoxymetrie
InstanceOf: SD_MII_ICU_Sauerstoffsaettigung_Im_Arteriellen_Blut_Durch_Pulsoxymetrie
Usage: #example
* status = #final
* code
  * coding[sct] = $sct#442476006 "Arterial oxygen saturation"
  * coding[loinc] = $loinc#59408-5 "Oxygen saturation in Arterial blood by Pulse oximetry"
  * coding[IEEE-11073] = $IEEE11073#150324 "MDC_SAT_O2_ART"
* subject = Reference(PatientinMusterfrau)
* effectivePeriod
  * start = "2019-12-23T09:30:10+01:00"
  * end = "2019-12-23T10:30:10+01:00"
* valueQuantity = 98 '%' "percent"
* bodySite = $sct#11527006 "Arterial system structure (body structure)"