
// Patient example Sternenfall with encounter and parameters, based on Organ-Daten

// Patient instance

Instance: ExampleOrganPatientSternenfall
InstanceOf: ISiKPatient
Usage: #example
Title: "ISiKPatient Beispielinstanz aus Organ-Daten"
Description: "Beispielpatient mit PID 156722 und Name Aelin Sternenfall"

* id = "isik-patient-156722"
* active = true

* identifier[Patientennummer].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[Patientennummer].type.coding.code = #MR
* identifier[Patientennummer].system = "https://example-krankenhaus.de/fhir/sid/pid"
* identifier[Patientennummer].value = "156722"

* name[Name].use = #official
* name[Name].family = "Sternenfall"
* name[Name].given[0] = "Aelin"

* gender = #unknown
* birthDate.extension[Data-Absent-Reason].valueCode = #unknown

// Encounter example
Instance: ExampleOrganEncounterSternenfall
InstanceOf: ISiKKontaktGesundheitseinrichtung
Usage: #example
Title: "ISiKEncounter Beispielinstanz aus Organ-Daten"
Description: "Beispiel-Encounter für Patientin Aelin Sternenfall, PID 156722, auf der Intensivstation Anaesthesie"
* id = "isik-encounter-Sternenfall"
* identifier[Aufnahmenummer]
  * type = $v2-0203#VN
  * system = "https://test.krankenhaus.de/fhir/sid/aufnahmenummer"
  * value = "Sternenfall-20200310-001"
* status = #in-progress
* class = $v3-ActCode#IMP "Inpatient"
* subject = Reference(ExampleOrganPatientSternenfall)
* period.start = "2020-03-10T20:17:06+01:00"
* location[0].location = Reference(ExampleITSStationAnaesthesie)
* location[=].physicalType = $LocationPhysicalType#wa "Ward"
* account.identifier.value = "174357"
* account.identifier.system = "https://test.krankenhaus.de/fhir/sid/fallnummer"

//Parameter examples for Sternenfall

// zu Pupille siehe eigene Datei

Instance: ExampleOrganPupilLightReactionRight20200311
InstanceOf: MII_PR_ICU_Untersuchung_Pupillenlichtreaktion_Direkt
Usage: #example
Title: "Direkte Pupillenlichtreaktion rechts"
Description: "Pupillenreaktion rechts nicht messbar am 2020-03-11T20:17:06+01:00"
* status = #final
* code.coding = $sct#45832002 "Pupil afferent light reaction"
* category = $observation-category#exam "Exam"
* subject = Reference(ExampleOrganPatientSternenfall)
* effectiveDateTime = "2020-03-11T20:17:06+01:00"
* bodySite = $sct#52378001 "Structure of pupil of right eye"
* valueCodeableConcept.coding[PupillenlichtreaktionCode] = $mii-pupil-reaction-additional#not-measurable "nicht messbar"
* note.text = "Quelle: right pupil reaction = nicht messbar"

Instance: ExampleOrganRASS20200311
InstanceOf: MII_PR_ICU_Score_RASS
Usage: #example
Title: "RASS-Wert"
Description: "RASS -4 am 2020-03-11T20:17:06+01:00"
* status = #final
* code.coding = $sct#1345050000 "Richmond Agitation Sedation Scale score"
* category[exam] = $observation-category#exam "Exam"
* subject = Reference(ExampleOrganPatientSternenfall)
* effectiveDateTime = "2020-03-11T20:17:06+01:00"
* valueCodeableConcept.coding[Loinc] = $loinc#LA33966-5 "Deep sedation -4"

Instance: ExampleOrganSerumNatrium202003110104
InstanceOf: ISiKLaboruntersuchungSerumnatrium
Usage: #example
Title: "Serumnatrium 130 mmol/L"
Description: "Serumnatriumwert 130 mmol/L am 2020-03-11T01:04:00+01:00"
* status = #final
* subject = Reference(ExampleOrganPatientSternenfall)
* code.coding[loinc] = $loinc#2951-2
* valueQuantity = 130 $cs-ucum#mmol/L
* effectiveDateTime = "2020-03-11T01:04:00+01:00"
* performer = Reference(PractitionerWalterArzt)

Instance: ExampleOrganSerumNatrium202003110159
InstanceOf: ISiKLaboruntersuchungSerumnatrium
Usage: #example
Title: "Serumnatrium 133 mmol/L"
Description: "Serumnatriumwert 133 mmol/L am 2020-03-11T01:59:00+01:00"
* status = #final
* subject = Reference(ExampleOrganPatientSternenfall)
* code.coding[loinc] = $loinc#2951-2
* valueQuantity = 133 $cs-ucum#mmol/L
* effectiveDateTime = "2020-03-11T01:59:00+01:00"
* performer = Reference(PractitionerWalterArzt)

Instance: ExampleOrganSerumNatrium202003110306
InstanceOf: ISiKLaboruntersuchungSerumnatrium
Usage: #example
Title: "Serumnatrium 130 mmol/L"
Description: "Serumnatriumwert 130 mmol/L am 2020-03-11T03:06:00+01:00"
* status = #final
* subject = Reference(ExampleOrganPatientSternenfall)
* code.coding[loinc] = $loinc#2951-2
* valueQuantity = 130 $cs-ucum#mmol/L
* effectiveDateTime = "2020-03-11T03:06:00+01:00"
* performer = Reference(PractitionerWalterArzt)


// zu Prozeduren Beatmung siehe andere Datei