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
      loinc 1..* MS
    * ^comment = "Motivation: Jede Lebenszustanduntersuchung MUSS einen LOINC Code enthalten, SnomedCT ist optional"
  * coding[snomed-ct] only ISiKSnomedCTCoding
  * coding[loinc] only ISiKLoincCoding
* subject 1.. MS
  * reference 1.. MS
* effective[x] 1..1 MS
* effective[x] only dateTime or Period
* value[x] 1.. MS
  * ^comment = "Motivation: Ein Lebenszustand benötigt immer einen Wert"
* encounter MS


Profile: ISiKSchwangerschaftsstatus
Parent: ISiKLebensZustand
Id: ISiKSchwangerschaftsstatus
Title: "ISiK Schwangerschaftsstatus"
Description: "Schwangerschaftsstatus einer Patientin"
* code = $loinc#82810-3
* valueCodeableConcept 1.. MS
  * ^comment = "Motivation: Harmonisierung mit KBV (KBV_PR_Base_RelatedPerson)"
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
* valueDateTime 1.. MS
  * ^comment = "Motivation: Eine Observation MUSS immer einen Wert enthalten"

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
* code.coding[snomed-ct] = $sct#15167005
* code.coding[loinc] = $loinc#74043-1
* value[x] only CodeableConcept
* valueCodeableConcept 1.. MS
* valueCodeableConcept from YesNoUnknownNotAsked

Instance: ISiKAlkoholAbususBeispiel
InstanceOf: ISiKAlkoholAbusus
Usage: #example
Title: "ISiKAlkoholAbususBeispiel"
* code.coding[snomed-ct] = $sct#15167005 "Schädlicher Gebrauch von Alkohol"
  * version = "http://snomed.info/sct/11000274103/version/20231115"
* code.coding[loinc] = $loinc#74043-1 "Alcohol use disorder"
  * version = "2.77"  
* status = #final
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2024-01-01"
* valueCodeableConcept = ExpandedYesNoIndicator#Y "Yes"
* encounter = Reference(Fachabteilungskontakt)

Profile: ISiKRaucherStatus
Parent: ISiKLebensZustand
Id: ISiKRaucherStatus
Title: "ISiK Raucherstatus"
* insert Meta
* category = ObservationCategoryCodes#social-history
* code.coding[snomed-ct] = $sct#77176002
* code.coding[loinc] = $loinc#72166-2
* value[x] only CodeableConcept
* valueCodeableConcept 1.. MS
* valueCodeableConcept from CurrentSmokingStatusUvIps
  

Instance: ISiKRaucherStatusBeispiel
InstanceOf: ISiKRaucherStatus
Usage: #example
Title: "ISiKRaucherStatusBeispiel"
* code.coding[snomed-ct] = $sct#77176002 "Smoker"
  * version = "http://snomed.info/sct/11000274103/version/20231115"
* code.coding[loinc] = $loinc#72166-2 "Tobacco smoking status"
  * version = "2.77"
* status = #final
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2024-01-01"
* valueCodeableConcept = LOINC#LA15920-4 "Former smoker"
  * coding.version = "2.77"
* encounter = Reference(Fachabteilungskontakt)

Profile: ISiKStillstatus
Parent: ISiKLebensZustand
Id: ISiKStillstatus
Title: "ISiKStillstatus"
Description: "Profil zur Abbildung ob gestillt/Muttermilch abgepumpt und gefüttert wird"
* insert Meta
* code.coding[snomed-ct] = $sct#413712001
* code.coding[loinc] = $loinc#63895-7
* value[x] only CodeableConcept
* valueCodeableConcept 1.. MS
* valueCodeableConcept from StillstatusVS

Instance: ISiKStillstatusBeispiel
InstanceOf: ISiKStillstatus
Usage: #example
Title: "ISiKStillstatusBeispiel"
Description: "ISiKStillstatusBeispiel"
* code.coding[snomed-ct] = $sct#413712001 "Breastfeeding (mother)"
  * version = "http://snomed.info/sct/11000274103/version/20231115"
* code.coding[loinc] = $loinc#63895-7 "Breastfeeding status"
  * version = "2.77" 
* status = #final
* subject = Reference(PatientinMusterfrau)
* effectiveDateTime = "2024-01-01"
* valueCodeableConcept = $loinc#LA29252-6 "Currently breastfeeding"
* encounter = Reference(Fachabteilungskontakt)