// Zu erfüllende Anforderung : - Die Beatmungsmodus Parameter-Ausprägungen MÜSSEN alle abgedeckt werden, aber es muss KEIN dedizierter Patientenfall konstruiert werden.
// #Validierung - Kodierung und code.text prüfen

Instance: ExampleOrganVentilationMode20200311
InstanceOf: ISiKProzedurBeatmung
Usage: #example
Title: "Beatmungsmodus DUO-PAP"
Description: "Beatmungsmodus DUO-PAP am 2020-03-11T20:17:06+01:00"
* status = #in-progress
* category.coding[SNOMED-CT] = $sct#40617009 "Artificial ventilation (regime/therapy)"
* code.coding[SNOMED-CT] = $sct#243142003 "Dual pressure spontaneous ventilation support(regime/therapy)"
* code.text = "DUO-PAP"
* subject = Reference(ExampleOrganPatientSternenfall)
* performedDateTime = "2020-03-11T20:17:06+01:00"

Instance: ExampleOrganVentilationModeASV
InstanceOf: ISiKProzedurBeatmung
Usage: #example
Title: "Beatmungsmodus ASV"
Description: "Beatmungsmodus ASV am 2020-03-11T20:17:06+01:00"
* status = #in-progress
* category.coding[SNOMED-CT] = $sct#40617009 "Artificial ventilation (regime/therapy)"
* code.coding[SNOMED-CT] = $sct#1186620002 "Minimum minute volume ventilation (regime/therapy)"
* code.text = "ASV"
* subject = Reference(ExampleOrganPatientSternenfall)
* performedDateTime = "2020-03-11T20:17:06+01:00"

Instance: ExampleOrganVentilationModeBiLev
InstanceOf: ISiKProzedurBeatmung
Usage: #example
Title: "Beatmungsmodus BiLev"
Description: "Beatmungsmodus BiLev am 2020-03-11T20:17:06+01:00"
* status = #in-progress
* category.coding[SNOMED-CT] = $sct#40617009 "Artificial ventilation (regime/therapy)"
* code.coding[SNOMED-CT] = $sct#1186618000 "Bilevel artificial ventilation (regime/therapy)"
* code.text = "BiLev"
* subject = Reference(ExampleOrganPatientSternenfall)
* performedDateTime = "2020-03-11T20:17:06+01:00"

Instance: ExampleOrganVentilationModenC
InstanceOf: ISiKProzedurBeatmung
Usage: #example
Title: "Beatmungsmodus nC"
Description: "Beatmungsmodus nC am 2020-03-11T20:17:06+01:00"
* status = #in-progress
* category.coding[SNOMED-CT] = $sct#40617009 "Artificial ventilation (regime/therapy)"
* code.coding[SNOMED-CT] = $sct#229312009 "Nasal ventilation therapy (regime/therapy)"
* code.text = "nC"
* subject = Reference(ExampleOrganPatientSternenfall)
* performedDateTime = "2020-03-11T20:17:06+01:00"

Instance: ExampleOrganVentilationModeNIV
InstanceOf: ISiKProzedurBeatmung
Usage: #example
Title: "Beatmungsmodus NIV"
Description: "Beatmungsmodus NIV am 2020-03-11T20:17:06+01:00"
* status = #in-progress
* category.coding[SNOMED-CT] = $sct#40617009 "Artificial ventilation (regime/therapy)"
* code.coding[SNOMED-CT] = $sct#428311008 "Non-invasive ventilation (regime/therapy)"
* code.text = "NIV"
* subject = Reference(ExampleOrganPatientSternenfall)
* performedDateTime = "2020-03-11T20:17:06+01:00"

Instance: ExampleOrganVentilationModePCMod
InstanceOf: ISiKProzedurBeatmung
Usage: #example
Title: "Beatmungsmodus PC-Mod"
Description: "Beatmungsmodus PC-Mod am 2020-03-11T20:17:06+01:00"
* status = #in-progress
* category.coding[SNOMED-CT] = $sct#40617009 "Artificial ventilation (regime/therapy)"
* code.coding[SNOMED-CT] = $sct#1149092001 "Positive pressure airway ventilation (regime/therapy)"
* code.text = "PC-Mod"
* subject = Reference(ExampleOrganPatientSternenfall)
* performedDateTime = "2020-03-11T20:17:06+01:00"

Instance: ExampleOrganVentilationModePSIMV
InstanceOf: ISiKProzedurBeatmung
Usage: #example
Title: "Beatmungsmodus P-SIMV+"
Description: "Beatmungsmodus P-SIMV+ am 2020-03-11T20:17:06+01:00"
* status = #in-progress
* category.coding[SNOMED-CT] = $sct#40617009 "Artificial ventilation (regime/therapy)"
* code.coding[SNOMED-CT] = $sct#1186622005 "Synchronized intermittent mandatory ventilation - pressure-control pressure-support inflation (regime/therapy)"
* code.text = "P-SIMV+"
* subject = Reference(ExampleOrganPatientSternenfall)
* performedDateTime = "2020-03-11T20:17:06+01:00"

Instance: ExampleOrganVentilationModeSPNMod
InstanceOf: ISiKProzedurBeatmung
Usage: #example
Title: "Beatmungsmodus SPNMod"
Description: "Beatmungsmodus SPNMod am 2020-03-11T20:17:06+01:00"
* status = #in-progress
* category.coding[SNOMED-CT] = $sct#40617009 "Artificial ventilation (regime/therapy)"
* code.coding[SNOMED-CT] = $sct#243141005 "Mechanically assisted spontaneous ventilation (regime/therapy)"
* code.text = "SPNMod"
* subject = Reference(ExampleOrganPatientSternenfall)
* performedDateTime = "2020-03-11T20:17:06+01:00"

Instance: ExampleOrganVentilationModeStMod
InstanceOf: ISiKProzedurBeatmung
Usage: #example
Title: "Beatmungsmodus St-Mod"
Description: "Beatmungsmodus St-Mod am 2020-03-11T20:17:06+01:00"
* status = #in-progress
* category.coding[SNOMED-CT] = $sct#40617009 "Artificial ventilation (regime/therapy)"
* code.coding[SNOMED-CT] = $sct#47545007 "Continuous positive airway pressure ventilation treatment (regime/therapy)"
* code.text = "St-Mod"
* subject = Reference(ExampleOrganPatientSternenfall)
* performedDateTime = "2020-03-11T20:17:06+01:00"