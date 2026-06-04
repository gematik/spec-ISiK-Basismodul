//Anforderung: Für die Pupillen-Reaktion MÜSSEN alle Parameter abgedeckt werden (aber es reicht für eine Seite - z.B. links oder rechts), aber es muss KEIN Patientenfall konstruiert werden. Beide Seiten zumindest ein mal abgedeckt.

// nicht messbar
Instance: ExampleOrganPupilLightReactionLeft20200311
InstanceOf: MII_PR_ICU_Untersuchung_Pupillenlichtreaktion_Direkt
Usage: #example
Title: "Direkte Pupillenlichtreaktion links"
Description: "Pupillenreaktion links nicht messbar am 2020-03-11T20:17:06+01:00"
* status = #final
* code.coding = $sct#45832002 "Pupil afferent light reaction"
* category = $observation-category#exam "Exam"
* subject = Reference(ExampleOrganPatientSternenfall)
* effectiveDateTime = "2020-03-11T20:17:06+01:00"
* bodySite = $sct#16089004 "Structure of pupil of left eye"
* dataAbsentReason = $data-absent-reason-cs#unknown "Unknown"
* note.text = "Quelle: left pupil reaction = nicht messbar"

// keine
Instance: ExampleOrganPupilLightReactionRightKeine20200311
InstanceOf: MII_PR_ICU_Untersuchung_Pupillenlichtreaktion_Direkt
Usage: #example
Title: "Direkte Pupillenlichtreaktion rechts – keine Reaktion"
Description: "Pupillenreaktion rechts nicht reaktiv am 2020-03-11T20:17:06+01:00"
* status = #final
* code.coding = $sct#45832002 "Pupil afferent light reaction"
* category = $observation-category#exam "Exam"
* subject = Reference(ExampleOrganPatientSternenfall)
* effectiveDateTime = "2020-03-11T20:17:06+01:00"
* bodySite = $sct#52378001 "Structure of pupil of right eye"
* valueCodeableConcept.coding[Loinc] = $loinc#LA25442-7 "Not reactive to light"
* note.text = "Quelle: right pupil reaction = keine"

// prompt
Instance: ExampleOrganPupilLightReactionLeftPrompt20200311
InstanceOf: MII_PR_ICU_Untersuchung_Pupillenlichtreaktion_Direkt
Usage: #example
Title: "Direkte Pupillenlichtreaktion links – prompt"
Description: "Pupillenreaktion links prompt am 2020-03-11T20:17:06+01:00"
* status = #final
* code.coding = $sct#45832002 "Pupil afferent light reaction"
* category = $observation-category#exam "Exam"
* subject = Reference(ExampleOrganPatientSternenfall)
* effectiveDateTime = "2020-03-11T20:17:06+01:00"
* bodySite = $sct#16089004 "Structure of pupil of left eye"
* valueCodeableConcept.coding[Loinc] = $loinc#LA25441-9 "Reactive to light"
* note.text = "Quelle: left pupil reaction = prompt"

// verzögert
Instance: ExampleOrganPupilLightReactionLeftVerzogert20200311
InstanceOf: MII_PR_ICU_Untersuchung_Pupillenlichtreaktion_Direkt
Usage: #example
Title: "Direkte Pupillenlichtreaktion links – verzögert"
Description: "Pupillenreaktion links verzögert am 2020-03-11T20:17:06+01:00"
* status = #final
* code.coding = $sct#45832002 "Pupil afferent light reaction"
* category = $observation-category#exam "Exam"
* subject = Reference(ExampleOrganPatientSternenfall)
* effectiveDateTime = "2020-03-11T20:17:06+01:00"
* bodySite = $sct#16089004 "Structure of pupil of left eye"
* valueCodeableConcept.coding[Loinc] = $loinc#LA24899-9 "Sluggishly reactive to light"
* note.text = "Quelle: left pupil reaction = verzögert"