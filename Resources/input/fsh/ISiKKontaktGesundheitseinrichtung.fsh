Profile: ISiKKontaktGesundheitseinrichtung
Parent: Encounter
Id: ISiKKontaktGesundheitseinrichtung
Description: "Dieses Profil ermöglicht die Herstellung eines Fallbezuges welcher in der Mehrheit der ISiK Szenarien im Krankenhaus essentiell ist."
* insert Meta
* obeys ISiK-enc-1
* . ^constraint[5].source = "http://gematik.de/fhir/ISiK/StructureDefinition/ISiKKontaktGesundheitseinrichtung"
* id 1.. MS
* extension contains ExtensionAufnahmegrund named Aufnahmegrund 0..1 MS
* extension[Aufnahmegrund].extension[ErsteUndZweiteStelle] MS
* extension[Aufnahmegrund].extension[DritteStelle] MS
* extension[Aufnahmegrund].extension[VierteStelle] MS
* identifier 1.. MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* identifier contains Aufnahmenummer 0..1 MS
* identifier[Aufnahmenummer] ^patternIdentifier.type = $v2-0203#VN
  * type MS
    * coding MS
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
* serviceType 1.. MS
  * coding 1.. MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains Fachabteilungsschluessel 0..1 MS
  * coding[Fachabteilungsschluessel] from FachabteilungsschluesselVS (required)
    * ^patternCoding.system = "http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel"
* subject 1.. MS
  * reference 1.. MS
* period 1.. MS
  * start 1.. MS
  * end MS
* diagnosis MS
  * condition MS
    * reference 1.. MS
  * use 1.. MS
    * ^binding.strength = #extensible
  * rank MS
* account 1.. MS
  * reference 1.. MS
* hospitalization 1.. MS
  * admitSource 1.. MS
  * admitSource from AufnahmeanlassVS (preferred)
  * dischargeDisposition MS
    * extension contains ExtenstionEntlassungsgrund named Entlassungsgrund 0..1 MS
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
* serviceType = $Fachabteilungsschluessel#0100
* subject = Reference(Patient/test)
* period.start = "2021-02-12"
* period.end = "2021-02-13"
* diagnosis.condition = Reference(Condition/test)
* diagnosis.use = $diagnosis-role#CC "Hauptdiagnose"
* account = Reference(Account/test)
* hospitalization.admitSource = $Aufnahmeanlass#E
* hospitalization.dischargeDisposition.extension.url = "http://fhir.de/StructureDefinition/Entlassungsgrund"
* hospitalization.dischargeDisposition.extension.extension[0].url = "ErsteUndZweiteStelle"
* hospitalization.dischargeDisposition.extension.extension[=].valueCoding = $EntlassungsgrundErsteUndZweiteStelle#01 "Behandlung regulär beendet"
* hospitalization.dischargeDisposition.extension.extension[+].url = "DritteStelle"
* hospitalization.dischargeDisposition.extension.extension[=].valueCoding = $EntlassungsgrundDritteStelle#1 "arbeitsfähig entlassen"
* location.physicalType = $LocationPhysicalType#bd "Bed"
* location.location.display = "Bett 123"
* serviceProvider.display = "Fachabteilung XYZ"

Invariant: ISiK-enc-1
Description: "Abgeschlossene Kontakte sollten einen End-Zeitpunkt angeben"
Severity: #warning
Expression: "status = 'finished' implies period.end.exists()"