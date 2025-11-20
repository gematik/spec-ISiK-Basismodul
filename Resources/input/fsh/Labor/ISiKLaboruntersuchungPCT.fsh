Profile: ISiKLaboruntersuchungPCT
Parent: ISiKLaboruntersuchung
Id: ISiKLaboruntersuchungPCT
Description: "Dieses Profil ermöglicht die Abbildung der Laboruntersuchung PCT eines Patienten in ISiK Szenarien."
* insert Meta
* insert CommonElements
* code.coding[loinc] from ObservationCodesPCT (required)
* insert LaboratorySnomedSliceRuleSet
* code.coding[snomed] = $sct#418752001
* valueQuantity from ObservationUnitsPCT (required)
* referenceRange MS
  * low from ObservationUnitsPCT (required)
  * high from ObservationUnitsPCT (required)

Instance: ExampleISiKLaboruntersuchungPCT1
InstanceOf: ISiKLaboruntersuchungPCT
Usage: #example
* status = #final
* subject = Reference(PatientinMusterfrau)
* category.coding[0] = $cs-observation-category#laboratory
* code.coding[loinc] = $loinc#33959-8
* code.coding[snomed] = $sct#418752001 "Procalcitonin" 
* valueQuantity = 0.2 $cs-ucum#ng/mL
* referenceRange
  * high = 0.5 $cs-ucum#ng/mL
* insert EffectiveAndPerformer