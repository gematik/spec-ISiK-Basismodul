Profile: ISiKLaboruntersuchungHb
Parent: ISiKLaboruntersuchung
Id: ISiKLaboruntersuchungHb
Description: "Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Hb eines Patienten in ISiK Szenarien."
* insert Meta
* insert CommonElements
* code.coding[loinc] from ObservationCodesHb
* insert LaboratorySnomedSliceRuleSet
* code.coding[snomed] = $sct#416125006
* valueQuantity from ObservationUnitsHb
* referenceRange MS
  * low from ObservationUnitsHb
  * high from ObservationUnitsHb

Instance: ExampleISiKLaboruntersuchungHb1
InstanceOf: ISiKLaboruntersuchungHb
Usage: #example
* status = #final
* subject.reference = "Patient/PatientinMusterfrau"
* category.coding[0] = $cs-observation-category#laboratory
* code.coding[loinc] = $loinc#718-7
* code.coding[snomed] = $sct#416125006 "Concentration of hemoglobin in erythrocyte"
* valueQuantity = 11.4 $cs-ucum#g/dL
* referenceRange
  * low = 12 $cs-ucum#g/dL
  * high = 16 $cs-ucum#g/dL
  * appliesTo = $sct#248152002 "female"
* insert EffectiveAndPerformer