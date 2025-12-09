Profile: ISiKLaboruntersuchungTroponin
Parent: ISiKLaboruntersuchung
Id: ISiKLaboruntersuchungTroponin
Description: "Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Troponin eines Patienten in ISiK Szenarien."
* insert Meta
* insert CommonElements
* code.coding[loinc] from ObservationCodesTroponin
* insert LaboratorySnomedSliceRuleSet
* code.coding[snomed] = $sct#105000003
* valueQuantity from ObservationUnitsTroponin
* referenceRange MS
  * low from ObservationUnitsTroponin
  * high from ObservationUnitsTroponin

Instance: ExampleISiKLaboruntersuchungTroponin1
InstanceOf: ISiKLaboruntersuchungTroponin
Usage: #example
* status = #final
* subject = Reference(PatientinMusterfrau)
* category.coding[0] = $cs-observation-category#laboratory
* code.coding[loinc] = $loinc#42757-5
* code.coding[snomed] = $sct#105000003 "Troponin measurement"
* valueQuantity = 0.1 $cs-ucum#ug/L
* referenceRange
  * high = 0.4 $cs-ucum#ug/L
* insert EffectiveAndPerformer