Profile: ISiKLaboruntersuchungThrombozyten
Parent: ISiKLaboruntersuchung
Id: ISiKLaboruntersuchungThrombozyten
Description: "Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Thrombozyten eines Patienten in ISiK Szenarien."
* insert Meta
* insert CommonElements
* code.coding[loinc] from ObservationCodesThrombozyten
* insert LaboratorySnomedSliceRuleSet
* code.coding[snomed] = $sct#365632008
* valueQuantity from ObservationUnitsThrombozyten
* referenceRange MS
  * low from ObservationUnitsThrombozyten
  * high from ObservationUnitsThrombozyten

Instance: ExampleISiKLaboruntersuchungThrombozyten1
InstanceOf: ISiKLaboruntersuchungThrombozyten
Usage: #example
* status = #final
* subject = Reference(PatientinMusterfrau)
* category.coding[0] = $cs-observation-category#laboratory
* code.coding[loinc] = $loinc#26515-7
* code.coding[snomed] = $sct#365632008 "Platelet count - finding"
* valueQuantity = 178 $cs-ucum#10*3/uL
* referenceRange
  * low = 150 $cs-ucum#10*3/uL
  * high = 400 $cs-ucum#10*3/uL
* insert EffectiveAndPerformer