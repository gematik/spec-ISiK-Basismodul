Profile: ISiKLaboruntersuchungCRP
Parent: ISiKLaboruntersuchung
Id: ISiKLaboruntersuchungCRP
Description: "Dieses Profil ermöglicht die Abbildung der Laboruntersuchung CRP eines Patienten in ISiK Szenarien."
* insert Meta
* insert CommonElements
* code.coding[loinc] from ObservationCodesCRP 
* insert LaboratorySnomedSliceRuleSet
* code.coding[snomed] = $sct#55235003
* valueQuantity from ObservationUnitsCRP 
* referenceRange MS
  * low from ObservationUnitsCRP 
  * high from ObservationUnitsCRP

Instance: ExampleISiKLaboruntersuchungCRP1
InstanceOf: ISiKLaboruntersuchungCRP
Usage: #example
* status = #final
* subject.reference = "Patient/PatientinMusterfrau"
* category.coding[0] = $cs-observation-category#laboratory
* code.coding[loinc] = $loinc#1988-5 "C-reaktives Protein [Masse/Volumen] in Serum oder Plasma"
* code.coding[snomed] = $sct#55235003 "C-reactive protein measurement"
* valueQuantity = 7.4 $cs-ucum#mg/L
* referenceRange
  * high = 5 $cs-ucum#mg/L
* insert EffectiveAndPerformer