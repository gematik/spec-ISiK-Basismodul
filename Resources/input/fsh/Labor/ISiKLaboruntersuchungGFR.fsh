Profile: ISiKLaboruntersuchungGFR
Parent: ISiKLaboruntersuchung
Id: ISiKLaboruntersuchungGFR
Description: "Dieses Profil ermöglicht die Abbildung der Laboruntersuchung GFR eines Patienten in ISiK Szenarien."
* insert Meta
* insert CommonElements
* code.coding[loinc] from ObservationCodesGFR
* insert LaboratorySnomedSliceRuleSet
* code.coding[snomed] = $sct#80274001
* valueQuantity from ObservationUnitsGFR
* referenceRange MS
  * low from ObservationUnitsGFR
  * high from ObservationUnitsGFR

Instance: ExampleISiKLaboruntersuchungGFR1
InstanceOf: ISiKLaboruntersuchungGFR
Usage: #example
* status = #final
* subject.reference = "Patient/PatientinMusterfrau"
* category.coding[0] = $cs-observation-category#laboratory
* code.coding[loinc] = $loinc#98980-6
* code.coding[snomed] = $sct#80274001 "Glomerular filtration rate"
* valueQuantity = 100 $cs-ucum#mL/min/(1.73) "milliliter pro Minute pro Körperoberfläche von 1,73 m2"
* referenceRange
  * high = 72 $cs-ucum#mL/min/(1.73) "milliliter pro Minute pro Körperoberfläche von 1,73 m2"
  * high = 100 $cs-ucum#mL/min/(1.73) "milliliter pro Minute pro Körperoberfläche von 1,73 m2"
* insert EffectiveAndPerformer