Profile: ISiKKontaktGesundheitseinrichtung
Parent: Encounter
Id: ISiKKontaktGesundheitseinrichtung
Description: "Dieses Profil ermöglicht die Herstellung eines Fallbezuges welcher in der Mehrheit der ISiK Szenarien im Krankenhaus essentiell ist."
* insert Meta
* obeys ISiK-enc-1 and ISiK-enc-2 and ISiK-enc-3 and ISiK-enc-4 and ISiK-enc-5 and ISiK-enc-6 and ISiK-enc-7 and ISiK-enc-8 and ISiK-enc-9 and ISiK-enc-10 and ISiK-enc-11
* id 1.. MS
* extension MS
* extension contains ExtensionAufnahmegrund named Aufnahmegrund 0..1 MS
* extension[Aufnahmegrund].extension[ErsteUndZweiteStelle] MS
* extension[Aufnahmegrund].extension[DritteStelle] MS
* extension[Aufnahmegrund].extension[VierteStelle] MS
* extension contains http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedStartDate named plannedStartDate 0..1 MS
* extension contains http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedEndDate named plannedEndDate 0..1 MS
* identifier 1.. MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* identifier contains Aufnahmenummer 0..1 MS
* identifier[Aufnahmenummer] ^patternIdentifier.type = $v2-0203#VN
  * type 1.. MS
    * coding 1.. MS
      * ^slicing.discriminator.type = #pattern
      * ^slicing.discriminator.path = "$this"
      * ^slicing.rules = #open
    * coding contains vn-type 1..1 MS
    * coding[vn-type] = $v2-0203#VN
      * system 1.. MS
      * code 1.. MS
  * system 1..
  * value 1..
* status MS
* status from EncounterStatusDe (required)
  * ^short = "planned | in-progress | onleave | finished | cancelled +"
  * ^definition = "planned | in-progress | onleave | finished | cancelled +."
  * ^binding.description = "Eingeschränkter Status vgl. FHIR R5"
* class MS
* class from EncounterClassDE (required)
* type MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* type contains
    Kontaktebene 1..1 MS and
    KontaktArt 0..1 MS
* type[Kontaktebene] from KontaktebeneDe (required)
  * ^patternCodeableConcept.coding.system = "http://fhir.de/CodeSystem/Kontaktebene"
  * ^binding.description = "Kontaktebene"
* type[KontaktArt] from KontaktartDe (required)
  * ^patternCodeableConcept.coding.system = "http://fhir.de/CodeSystem/kontaktart-de"
* serviceType 0..1 MS
  * coding 1.. MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains
    Fachabteilungsschluessel 1..1 MS and 
    ErweiterterFachabteilungsschluessel 0..1 MS
  * coding[Fachabteilungsschluessel] from $FachabteilungsschluesselVS (required)
    * ^patternCoding.system = $FachabteilungsschluesselCS
  * coding[ErweiterterFachabteilungsschluessel] from $FachabteilungsschluesselErweitertVS (required)
    * ^patternCoding.system = $FachabteilungsschluesselErweitertCS
* subject 1.. MS
  * reference 1.. MS
* period 0.. MS
  * start 0.. MS
  * end MS
* diagnosis MS
  * condition MS
    * reference 1.. MS
  * use 1.. MS 
    * coding 1.. MS
      * ^slicing.discriminator.type = #pattern
      * ^slicing.discriminator.path = "$this"
      * ^slicing.rules = #open
    * coding contains 
      Diagnosetyp 1..1 MS and 
      DiagnosesubTyp 0.. MS
    * coding[Diagnosetyp] from http://fhir.de/ValueSet/DiagnoseTyp (required)
    * coding[DiagnosesubTyp] from http://fhir.de/ValueSet/Diagnosesubtyp (extensible)
  * rank MS
* account 0.. MS
  * reference 1.. MS
* hospitalization ..1 MS
  * admitSource 0..1 MS
  * admitSource from AufnahmeanlassVS (extensible)
  * dischargeDisposition MS
    * extension contains ExtenstionEntlassungsgrund named Entlassungsgrund 0..1 MS
  * extension contains $WahlleistungExtension named Wahlleistung 0.. MS
* location MS
  * location MS
    * identifier 1.. MS
    * display 1.. MS
  * physicalType 1..1 MS
  * physicalType from ISiKLocationPhysicalType (extensible)
* serviceProvider MS
  * identifier 1.. MS
  * display 1.. MS
* partOf MS

// This extension can be safely removed as soon as a package for R5 backport extensions is published and referenced by this project
Extension: PlannedStartDate
Id: PlannedStartDate
* ^url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedStartDate"
* value[x] only dateTime

// This extension can be safely removed as soon as a package for R5 backport extensions is published and referenced by this project
Extension: PlannedEndDate
Id: PlannedEndDate
* ^url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedEndDate"
* value[x] only dateTime

Instance: encounter
InstanceOf: ISiKKontaktGesundheitseinrichtung
Usage: #example
* extension.url = "http://fhir.de/StructureDefinition/Aufnahmegrund"
* extension.extension[0].url = "ErsteUndZweiteStelle"
* extension.extension[=].valueCoding = $AufnahmegrundErsteUndZweiteStelle#01 "Krankenhausbehandlung, vollstationär"
* extension.extension[+].url = "DritteStelle"
* extension.extension[=].valueCoding = $AufnahmegrundDritteStelle#0 "Anderes"
* extension.extension[+].url = "VierteStelle"
* extension.extension[=].valueCoding = $AufnahmegrundVierteStelle#1 "Normalfall"
* identifier.type = $v2-0203#VN
* identifier.system = "https://test.krankenhaus.de/fhir/sid/fallnr"
* identifier.value = "0123456789"
* status = #finished
* class = $v3-ActCode#IMP
* type[0] = $kontaktart-de#operation
* type[+] = $Kontaktebene#versorgungsstellenkontakt
* serviceType = $FachabteilungsschluesselCS#0100
* subject = Reference(Patient/test)
* period.start = "2021-02-12"
* period.end = "2021-02-13"
* diagnosis.condition = Reference(Condition/test)
* diagnosis.use = KontaktDiagnoseProzedur#treatment-diagnosis
* account = Reference(Account/test)
* hospitalization.admitSource = $Aufnahmeanlass#E
* hospitalization.dischargeDisposition.extension.url = "http://fhir.de/StructureDefinition/Entlassungsgrund"
* hospitalization.dischargeDisposition.extension.extension[0].url = "ErsteUndZweiteStelle"
* hospitalization.dischargeDisposition.extension.extension[=].valueCoding = $EntlassungsgrundErsteUndZweiteStelle#01 "Behandlung regulär beendet"
* hospitalization.dischargeDisposition.extension.extension[+].url = "DritteStelle"
* hospitalization.dischargeDisposition.extension.extension[=].valueCoding = $EntlassungsgrundDritteStelle#1 "arbeitsfähig entlassen"
* location.physicalType = $LocationPhysicalType#bd "Bed"
* location.location.identifier.system = "https://test.krankenhaus.de/fhir/sid/locationid"
* location.location.identifier.value = "123"
* location.location.display = "Bett 123"
* serviceProvider.identifier.system = "https://test.krankenhaus.de/fhir/sid/fachabteilungsid"
* serviceProvider.identifier.value = "XYZ"
* serviceProvider.display = "Fachabteilung XYZ"
* partOf = Reference(Encounter/example)

Invariant: ISiK-enc-1
Description: "Abgeschlossene, ambulante Kontakte sollten einen Start-Zeitpunkt angeben"
Severity: #error
Expression: "status = 'finished' and class = 'AMB' implies period.start.exists()"

Invariant: ISiK-enc-2
Description: "Abgeschlossene, stationäre Kontakte sollten einen Start- und End-Zeitpunkt angeben"
Severity: #error
Expression: "status = 'finished' and class = 'IMP' implies period.start.exists() and period.end.exists()"

Invariant: ISiK-enc-3
Description: "Geplante Kontakte sollten keinen Start- oder End-Zeitpunkt angeben"
Severity: #error
Expression: "status = 'planned' implies period.exists().not()"

Invariant: ISiK-enc-4
Description: "Geplante Kontakte sollten die Extensions für den geplanten Start- oder End-Zeitpunkt verwenden"
Severity: #warning
Expression: "status = 'planned' implies extension.where(url = 'http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.plannedStartDate').exists()"

Invariant: ISiK-enc-5
Description: "In-Durchführung befindliche Kontakte sollten einen Start-Zeitpunkt angeben"
Severity: #error
Expression: "status = 'in-progress' implies period.start.exists()"

Invariant: ISiK-enc-6
Description: "Kontakte mit Abwesenheitsstatus sollten einen Start-Zeitpunkt angeben"
Severity: #error
Expression: "status = 'onleave' implies period.start.exists()"

Invariant: ISiK-enc-7
Description: "Kontakte mit unbekannten Status sollten einen Start-Zeitpunkt angeben"
Severity: #warning
Expression: "status = 'unknown' implies period.start.exists()"

Invariant: ISiK-enc-8
Description: "Die Rolle der assoziierten Diagnose(n) darf nicht 'Billing' sein"
Severity: #error
Expression: "diagnosis.use.all(coding.code != 'billing')"

Invariant: ISiK-enc-9
Description: "Ein abgeschlossener Einrichtungskontakt muss eine Diagnose enthalten"
Severity: #error
Expression: "status = 'finished' and type.coding.where(code = 'einrichtungskontakt').exists() implies diagnosis.exists()"

Invariant: ISiK-enc-10
Description: "Ein Abteilungskontakt oder Versorgungsstellenkontakt muss auf den übergeordneten Kontakt verweisen"
Severity: #error
Expression: "type.coding.where(code = 'einrichtungskontakt').exists().not() implies partOf.exists()"

Invariant: ISiK-enc-11
Description: "Ein Einrichtungskontakt sollte einen serviceType mit Fachabteilungsschlüssel enthalten"
Severity: #error
Expression: "type.coding.where(code = 'einrichtungskontakt').exists() implies serviceType.exists()"
