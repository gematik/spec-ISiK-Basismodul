Profile: ISiKLaboruntersuchungSerumnatrium
Parent: ISiKLaboruntersuchung
Id: ISiKLaboruntersuchungSerumnatrium
Description: "Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Serumnatrium eines Patienten in ISiK Szenarien. Das Profil wird unter anderem im Use Case zur Unterstützung von Transplantationsbeauftragten durch DETECT (siehe https://www.detect-iha.de) eingesetzt, insbesondere im Rahmen von Messungen mittels Point-of-Care-Testing."
* insert Meta
* insert CommonElements
* code.coding[loinc] from ObservationCodesSerumnatrium
* insert LaboratorySnomedSliceRuleSet
* code.coding[snomed] = $sct#25197003
* valueQuantity from ObservationUnitsSerumnatrium
* referenceRange MS
  * low from ObservationUnitsSerumnatrium
  * high from ObservationUnitsSerumnatrium

Instance: ExampleISiKLaboruntersuchungSerumnatrium1
InstanceOf: ISiKLaboruntersuchungSerumnatrium
Usage: #example
* status = #final
* subject = Reference(PatientinMusterfrau)
* category.coding[0] = $cs-observation-category#laboratory
* code.coding[loinc] = $loinc#2951-2
* code.coding[snomed] = $sct#25197003 "Sodium measurement"
* valueQuantity = 140 $cs-ucum#mmol/L
* referenceRange
  * low = 135 $cs-ucum#mmol/L
  * high = 145 $cs-ucum#mmol/L
  * appliesTo = $sct#248152002 "female"
* insert EffectiveAndPerformer
