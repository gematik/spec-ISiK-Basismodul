Profile: ISiKLaboruntersuchungTSH
Parent: ISiKLaboruntersuchung
Id: ISiKLaboruntersuchungTSH
Description: "Dieses Profil ermöglicht die Abbildung der Laboruntersuchung TSH eines Patienten in ISiK Szenarien."
* insert Meta
* insert CommonElements
* code.coding[loinc] from ObservationCodesTSH
* insert LaboratorySnomedSliceRuleSet
* code.coding[snomed] = $sct#61167004
* valueQuantity from ObservationUnitsTSH
* referenceRange MS
  * low from ObservationUnitsTSH
  * high from ObservationUnitsTSH

Instance: ExampleISiKLaboruntersuchungTSH1
InstanceOf: ISiKLaboruntersuchungTSH
Usage: #example
* status = #final
* subject.reference = "Patient/PatientinMusterfrau"
* category.coding[0] = $cs-observation-category#laboratory
* code.coding[loinc] = $loinc#3015-5
* code.coding[snomed] = $sct#61167004 "Thyroid stimulating hormone measurement"
* valueQuantity = 3.4 $cs-ucum#u[IU]/mL
* referenceRange
  * low = 0.27 $cs-ucum#u[IU]/mL
  * high = 4.2 $cs-ucum#u[IU]/mL
* insert EffectiveAndPerformer