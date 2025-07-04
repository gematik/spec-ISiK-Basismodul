Profile: ISiKLaboruntersuchungSerumkreatinin
Parent: ISiKLaboruntersuchung
Id: ISiKLaboruntersuchungSerumkreatinin
Description: "Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Serumkreatinin eines Patienten in ISiK Szenarien."
* insert Meta
* insert CommonElements
* code.coding[loinc] from ObservationCodesSerumkreatinin
* insert LaboratorySnomedSliceRuleSet
* code.coding[snomed] = $sct#70901006
* valueQuantity from ObservationUnitsSerumkreatinin
* referenceRange MS
  * low from ObservationUnitsSerumkreatinin
  * high from ObservationUnitsSerumkreatinin

Instance: ExampleISiKLaboruntersuchungSerumkreatinin1
InstanceOf: ISiKLaboruntersuchungSerumkreatinin
Usage: #example
* status = #final
* subject.reference = "Patient/PatientinMusterfrau"
* category.coding[0] = $cs-observation-category#laboratory
* code.coding[loinc] = $loinc#2160-0
* code.coding[snomed] = $sct#70901006 "Creatinine measurement"
* valueQuantity = 0.7 $cs-ucum#mg/dL
* referenceRange
  * low = 0.6 $cs-ucum#mg/dL
  * high = 1.2 $cs-ucum#mg/dL
  * appliesTo = $sct#248152002 "female"
* insert EffectiveAndPerformer