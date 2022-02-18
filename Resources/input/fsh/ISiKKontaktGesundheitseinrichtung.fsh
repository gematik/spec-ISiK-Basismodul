Profile: ISiKKontaktGesundheitseinrichtung
Parent: Encounter
Id: ISiKKontaktGesundheitseinrichtung
Description: "Dieses Profil ermöglicht die Herstellung eines Fallbezuges welcher in der Mehrheit der ISiK Szenarien im Krankenhaus essentiell ist."
* ^status = #active
* obeys ISiK-enc-1
* id 1.. MS
* extension ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[0].path = "url"
  * ^slicing.rules = #open
* extension contains $Aufnahmegrund named Aufnahmegrund 0..1 MS
  * ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[0].path = "url"
  * ^slicing.rules = #open
* extension[Aufnahmegrund].extension[ErsteUndZweiteStelle] ^sliceName = "ErsteUndZweiteStelle"
  * ^mustSupport = true
* extension[Aufnahmegrund].extension[DritteStelle] ^sliceName = "DritteStelle"
  * ^mustSupport = true
* extension[Aufnahmegrund].extension[VierteStelle] ^sliceName = "VierteStelle"
  * ^mustSupport = true
* identifier 1.. MS
  * ^slicing.discriminator[0].type = #pattern
  * ^slicing.discriminator[0].path = "$this"
  * ^slicing.rules = #open
* identifier contains Aufnahmenummer ..1 MS
* identifier[Aufnahmenummer] ^patternIdentifier.type = $v2-0203#VN
  * type MS
    * coding MS
      * ^slicing.discriminator[0].type = #pattern
      * ^slicing.discriminator[0].path = "$this"
      * ^slicing.rules = #open
    * coding contains vn-type 1..1 MS
    * coding[vn-type] = $v2-0203#VN
    * coding[vn-type].system 1.. MS
    * coding[vn-type].code 1.. MS
  * system 1..
  * value 1..
* status MS
* status from $EncounterStatusDe (required)
  * ^short = "planned | in-progress | onleave | finished | cancelled +"
  * ^definition = "planned | in-progress | onleave | finished | cancelled +."
  * ^binding.description = "Eingeschränkter Status vgl. FHIR R5"
* class MS
* class from $EncounterClassDE (required)
* type MS
  * ^slicing.discriminator[0].type = #pattern
  * ^slicing.discriminator[0].path = "$this"
  * ^slicing.rules = #open
* type contains
    Kontaktebene ..1 MS and
    KontaktArt ..1 MS
* type[Kontaktebene] from $kontaktebene-de (required)
  * ^patternCodeableConcept.coding[0].system = "http://fhir.de/CodeSystem/Kontaktebene"
  * ^binding.description = "Kontaktebene"
* type[KontaktArt] from $kontaktart-de (required)
* type[KontaktArt] ^patternCodeableConcept.coding[0].system = "http://fhir.de/CodeSystem/kontaktart-de"
* serviceType 1.. MS
  * coding 1.. MS
    * ^slicing.discriminator[0].type = #pattern
    * ^slicing.discriminator[0].path = "$this"
    * ^slicing.rules = #open
  * coding contains Fachabteilungsschluessel ..1 MS
  * coding[Fachabteilungsschluessel] from $Fachabteilungsschluessel (required)
  * coding[Fachabteilungsschluessel] ^patternCoding.system = "http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel"
* subject 1.. MS
  * reference 1.. MS
* period 1.. MS
  * start 1.. MS
  * end MS
* diagnosis MS
  * condition MS
    * reference 1..
  * use 1.. MS
    * ^binding.strength = #extensible
  * rank MS
* hospitalization MS
  * admitSource 1.. MS
  * admitSource from $Aufnahmeanlass (preferred)
  * dischargeDisposition MS
    * extension contains $Entlassungsgrund named Entlassungsgrund ..1 MS
* location MS
  * location MS
    * display 1.. MS
* serviceProvider MS
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
* type[0] = $kontaktart-de-codesystem#operation
* type[+] = $Kontaktebene#versorgungsstellenkontakt
* serviceType = $Fachabteilungsschluessel-codesystem#0100
* subject = Reference(Patient/test)
* period.start = "2021-02-12"
* period.end = "2021-02-13"
* diagnosis.condition = Reference(Condition/test)
* diagnosis.use = $diagnosis-role#CC "Hauptdiagnose"
* hospitalization.admitSource = $Aufnahmeanlass-codesystem#E
* hospitalization.dischargeDisposition.extension.url = "http://fhir.de/StructureDefinition/Entlassungsgrund"
* hospitalization.dischargeDisposition.extension.extension[0].url = "ErsteUndZweiteStelle"
* hospitalization.dischargeDisposition.extension.extension[=].valueCoding = $EntlassungsgrundErsteUndZweiteStelle#01 "Behandlung regulär beendet"
* hospitalization.dischargeDisposition.extension.extension[+].url = "DritteStelle"
* hospitalization.dischargeDisposition.extension.extension[=].valueCoding = $EntlassungsgrundDritteStelle#1 "arbeitsfähig entlassen"
* location.location.display = "Krankenhaus XYZ"
* serviceProvider.display = "Fachabteilung XYZ"
