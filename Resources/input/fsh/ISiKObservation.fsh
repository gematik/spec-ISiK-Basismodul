Profile: ISiKSchwangerschaftsstatus
Parent: Observation
Id: ISiKSchwangerschaftsstatus
Title: "ISiK Schwangerschaftsstatus"
Description: "Schwangerschaftsstatus einer Patientin"
* insert Meta
* code MS
* code = $loinc#82810-3
* subject 1.. MS
* subject.reference 1.. MS
* effective[x] 1..1 MS
* valueCodeableConcept MS
* valueCodeableConcept from SchwangerschaftsstatusVS
* hasMember only Reference(ISiKSchwangerschaftErwarterterEntbindungstermin)
* hasMember MS
* hasMember ^short = "Erwartetes Geburtsdatum"
* hasMember ^definition = "Eine Referenz auf die ErwartetesGeburtsdatum Observation"
* hasMember.reference 1.. MS

Instance: ISiKSchwangerschaftsstatusBeispiel
InstanceOf: ISiKSchwangerschaftsstatus
Usage: #example
Title: "ISiKSchwangerschaftsstatusBeispiel"
* status = #final
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2024-01-01"
* valueCodeableConcept = $loinc#LA15173-0 "Pregnant"
* hasMember = Reference(ISiKSchwangerschaftErwarterterEntbindungsterminBeispiel)

Profile: ISiKSchwangerschaftErwarterterEntbindungstermin
Parent: Observation
Id: ISiKSchwangerschaftErwarterterEntbindungstermin
Title: "ISiK Schwangerschaft - erwarterter Entbindungstermin"
* insert Meta
* code MS
* code from SchwangerschaftEtMethodeVS
* subject 1.. MS
* subject.reference 1.. MS
* effective[x] 1..1 MS
* valueDateTime only dateTime
* valueDateTime MS

Instance: ISiKSchwangerschaftErwarterterEntbindungsterminBeispiel
InstanceOf: ISiKSchwangerschaftErwarterterEntbindungstermin
Usage: #example
Title: "ISiKSchwangerschaftErwarterterEntbindungsterminBeispiel"
* code = $loinc#11779-6 "Delivery date Estimated from last menstrual period"
* status = #final
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2024-01-01"
* valueDateTime = "2024-08-01"

Profile: ISiKAlkoholAbusus
Parent: Observation
Id: ISiKAlkoholAbusus
Title: "ISiK Alkohol Abusus"
* insert Meta
* code MS
* code = $sct#15167005
* subject 1.. MS
* subject.reference 1.. MS
* effective[x] 1..1 MS
* valueBoolean 1.. MS

Instance: ISiKAlkoholAbususBeispiel
InstanceOf: ISiKAlkoholAbusus
Usage: #example
Title: "ISiKAlkoholAbususBeispiel"
* code = $sct#15167005 "Schädlicher Gebrauch von Alkohol"
* status = #final
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2024-01-01"
* valueBoolean = false

Profile: ISiKRaucherStatus
Parent: Observation
Id: ISiKRaucherStatus
Title: "ISiK Raucherstatus"
* insert Meta
* code MS
* code = $sct#77176002
* subject 1.. MS
* subject.reference 1.. MS
* effective[x] 1..1 MS
* valueBoolean 1.. MS

Instance: ISiKRaucherStatusBeispiel
InstanceOf: ISiKRaucherStatus
Usage: #example
Title: "ISiKRaucherStatusBeispiel"
* code = $sct#77176002 "Smoker"
* status = #final
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2024-01-01"
* valueBoolean = true