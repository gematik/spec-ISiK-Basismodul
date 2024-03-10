Profile: LebensZustand
Parent: Observation
Id: LebensZustand
Title: "LebensZustand"
Description: "Basisprofil für Lebenszustand Observation"
* insert Meta
* status MS
* code MS
* subject 1.. MS
  * reference 1.. MS
* effective[x] 1..1 MS
* effective[x] only dateTime or Period
* value[x] MS


Profile: ISiKSchwangerschaftsstatus
Parent: LebensZustand
Id: ISiKSchwangerschaftsstatus
Title: "ISiK Schwangerschaftsstatus"
Description: "Schwangerschaftsstatus einer Patientin"
* code = $loinc#82810-3
* valueCodeableConcept MS
* valueCodeableConcept from SchwangerschaftsstatusVS
* hasMember only Reference(ISiKSchwangerschaftErwarteterEntbindungstermin)
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
* hasMember = Reference(ISiKSchwangerschaftErwarteterEntbindungsterminBeispiel)

Profile: ISiKSchwangerschaftErwarteterEntbindungstermin
Parent: LebensZustand
Id: ISiKSchwangerschaftErwarteterEntbindungstermin
Title: "ISiK Schwangerschaft - Erwarteter Entbindungstermin"
* insert Meta
* code from SchwangerschaftEtMethodeVS
* value[x] only dateTime
* valueDateTime MS

Instance: ISiKSchwangerschaftErwarteterEntbindungsterminBeispiel
InstanceOf: ISiKSchwangerschaftErwarteterEntbindungstermin
Usage: #example
Title: "ISiKSchwangerschaftErwarteterEntbindungsterminBeispiel"
* code = $loinc#11779-6 "Delivery date Estimated from last menstrual period"
* status = #final
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2024-01-01"
* valueDateTime = "2024-08-01"

Profile: ISiKAlkoholAbusus
Parent: LebensZustand
Id: ISiKAlkoholAbusus
Title: "ISiK Alkohol Abusus"
* insert Meta
* category = ObservationCategoryCodes#social-history
* code = $sct#15167005
* value[x] only boolean
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
Parent: LebensZustand
Id: ISiKRaucherStatus
Title: "ISiK Raucherstatus"
* insert Meta
* category = ObservationCategoryCodes#social-history
* code = $sct#77176002
* value[x] only boolean
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

Profile: ISiKStillstatus
Parent: LebensZustand
Id: ISiKStillstatus
Title: "ISiKStillstatus"
Description: "Profil zur Abbildung ob gestillt/Muttermilch abgepumpt und gefüttert wird"
* insert Meta
* code = $sct#1260078007
* value[x] only boolean
* valueBoolean 1.. MS

Instance: ISiKStillstatusBeispiel
InstanceOf: ISiKStillstatus
Usage: #example
Title: "ISiKStillstatusBeispiel"
Description: "ISiKStillstatusBeispiel"
* code = $sct#1260078007 "Maternal breastfeeding"
* status = #final
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2024-01-01"
* valueBoolean = true