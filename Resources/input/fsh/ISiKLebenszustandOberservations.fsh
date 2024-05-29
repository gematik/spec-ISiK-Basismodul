Profile: ISiKLebensZustand
Parent: Observation
Id: ISiKLebensZustand
Title: "ISiKLebensZustand"
Description: "Basisprofil für ISiKLebensZustand Observation"
* insert Meta
* status MS
* category MS
* code MS
  * coding 1.. MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "system"
    * ^slicing.rules = #open
  * coding contains
      snomed-ct 0..* MS and
      loinc 0..* MS
  * coding[snomed-ct] only ISiKSnomedCTCoding
  * coding[loinc] only ISiKLoincCoding
* subject 1.. MS
  * reference 1.. MS
* effective[x] 1..1 MS
* effective[x] only dateTime or Period
* value[x] MS
* encounter MS


Profile: ISiKSchwangerschaftsstatus
Parent: ISiKLebensZustand
Id: ISiKSchwangerschaftsstatus
Title: "ISiK Schwangerschaftsstatus"
Description: "Schwangerschaftsstatus einer Patientin"
* code = $loinc#82810-3
* valueCodeableConcept MS
* valueCodeableConcept from SchwangerschaftsstatusVS
* hasMember only Reference(ISiKSchwangerschaftErwarteterEntbindungstermin)
* hasMember 0..1 MS
* hasMember ^short = "Erwartetes Geburtsdatum"
* hasMember ^definition = "Eine Referenz auf die ErwartetesGeburtsdatum Observation"
* hasMember.reference 1.. MS

Instance: ISiKSchwangerschaftsstatusBeispiel
InstanceOf: ISiKSchwangerschaftsstatus
Usage: #example
Title: "ISiKSchwangerschaftsstatusBeispiel"
* code = $loinc#82810-3 "Pregnancy status"
  * coding.version = "2.77"
* status = #final
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2024-01-01"
* valueCodeableConcept = $loinc#LA15173-0 "Pregnant"
  * coding.version = "2.77"
* hasMember = Reference(ISiKSchwangerschaftErwarteterEntbindungsterminBeispiel)
* encounter = Reference(Fachabteilungskontakt)

Profile: ISiKSchwangerschaftErwarteterEntbindungstermin
Parent: ISiKLebensZustand
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
* code.coding[loinc] = $loinc#11779-6 "Delivery date Estimated from last menstrual period"
  * version = "2.77"
* status = #final
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2024-01-01"
* valueDateTime = "2024-08-01"
* encounter = Reference(Fachabteilungskontakt)

Profile: ISiKAlkoholAbusus
Parent: ISiKLebensZustand
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
  * coding.version = "http://snomed.info/sct/11000274103/version/20231115"
* status = #final
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2024-01-01"
* valueBoolean = false
* encounter = Reference(Fachabteilungskontakt)

Profile: ISiKRaucherStatus
Parent: ISiKLebensZustand
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
  * coding.version = "http://snomed.info/sct/11000274103/version/20231115"
* status = #final
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2024-01-01"
* valueBoolean = true
* encounter = Reference(Fachabteilungskontakt)

Profile: ISiKStillstatus
Parent: ISiKLebensZustand
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
  * coding.version = "http://snomed.info/sct/11000274103/version/20231115"
* status = #final
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2024-01-01"
* valueBoolean = true
* encounter = Reference(Fachabteilungskontakt)