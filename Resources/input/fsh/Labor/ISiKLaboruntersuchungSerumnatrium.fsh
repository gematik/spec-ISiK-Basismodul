Profile: ISiKLaboruntersuchungSerumnatrium
Parent: ISiKLaboruntersuchung
Id: ISiKLaboruntersuchungSerumnatrium
Description: "Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Serumnatrium eines Patienten in ISiK Szenarien. Das Profil wird u. A. im Use Case zur Unterstützung von Transplantationsbeauftragten bei der Organspendeerkennung eingesetzt; besonders in diesem Kontext muss es auch Werte abbilden, die im Rahmen von Messungen mittels Point-of-Care-Testing erhoben wurden. Das Profil ist auch geeignet, um Serumnatrium Werte abzubilden, die mittels Laboruntersuchung erhoben wurden.

Eine eindeutige Kennzeichnung für die Differenzierung hinsichtlich der Erhebungsmethode ist derzeit über dieses Profil nicht vorgesehen. Es kann jedoch das Element .method verwendet werden. Die Differenzierung aufgrund der Methode kann unter Umständen sinnvoll sein, wenn im Falle einer Laboruntersuchung ein Arzt die Werte zuerst sichten und bestätigen müsste, bevor sie im PDMS als 'final' für den Patienten hinterlegt werden. "
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
