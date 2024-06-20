Profile: ISiKDiagnose
Parent: Condition
Id: ISiKDiagnose
Description: "Dieses Profil ermöglicht die Nutzung von Diagnosen in ISiK Szenarien."
* insert Meta
* obeys isik-con1
* extension MS
* extension ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "url"
  * ^slicing.rules = #open
* extension contains $condition-related named related 0..1 MS
* clinicalStatus MS
* code 1.. MS
  * obeys icd-text-1
  * coding MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains
      ICD-10-GM 0..1 MS and
      Alpha-ID 0..1 MS and
      SNOMED-CT 0..1 MS and
      Orphanet 0..1 MS
  * coding[ICD-10-GM] only ISiKICD10GMCoding
    * ^patternCoding.system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
    * extension[Mehrfachcodierungs-Kennzeichen] MS
    * extension[Seitenlokalisation] MS
    * extension[Diagnosesicherheit] MS
  * coding[Alpha-ID] only CodingAlphaID
    * ^patternCoding.system = "http://fhir.de/CodeSystem/alpha-id"
    * system 1.. MS
    * code 1.. MS
  * coding[SNOMED-CT] only ISiKSnomedCTCoding
  * coding[SNOMED-CT] from $diagnosesSCT (required)
    * ^patternCoding.system = $sct
  * coding[Orphanet] ^patternCoding.system = "http://www.orpha.net"
    * system 1.. MS
    * code 1..
* subject MS
  * reference 1.. MS
* encounter MS
* onset[x] only dateTime or Period
* onsetPeriod 
  * start.extension contains ExtensionLebensphase named Lebensphase-Start 0..1
  * end.extension contains ExtensionLebensphase named Lebensphase-Ende 0..1
* abatement[x] MS
  * ^comment = "Motivation: Harmonisierung mit KBV (KBV_PR_Base_Condition_Diagnosis)"
* abatementAge  
  * extension contains ExtensionLebensphase named Lebensphase-Ende 0..1
* recordedDate 1.. MS
* note MS
* bodySite MS
  * ^comment = "Motivation: Harmonisierung mit KBV (KBV_PR_Base_Condition_Diagnosis)"
* bodySite.coding MS
* bodySite.coding ^slicing.discriminator.type = #pattern
* bodySite.coding ^slicing.discriminator.path = "system"
* bodySite.coding ^slicing.rules = #open
* bodySite.coding contains
    snomed-ct 0..1 MS
* bodySite.coding[snomed-ct] only ISiKSnomedCTCoding

Instance: Example-condition-ausrufezeichen-primaer
InstanceOf: ISiKDiagnose
Usage: #example
* clinicalStatus = $condition-clinical#active
* code.coding.version = "2019"
* code.coding = $icd-10-gm#F16.1 "Psychische Verhaltensstörung durch Halluzinogene (Akute Intoxikation)"
* subject = Reference(PatientinMusterfrau)
* encounter = Reference(Fachabteilungskontakt)
* recordedDate = "2021-05-24"
* note.text = "Beispiel für eine Anmerkung"

Instance: Example-condition-ausrufezeichen-sekundaer
InstanceOf: ISiKDiagnose
Usage: #example
* extension.url = "http://hl7.org/fhir/StructureDefinition/condition-related"
* extension.valueReference = Reference(Example-condition-ausrufezeichen-primaer)
* clinicalStatus = $condition-clinical#recurrence
* code.coding.extension.url = "http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen"
* code.coding.extension.valueCoding = $icd-10-gm-mehrfachcodierungs-kennzeichen-cs#!
* code.coding.version = "2019"
* code.coding = $icd-10-gm#U69.32 "Intravenöser Konsum sonstiger psychotroper Substanzen"
* subject = Reference(PatientinMusterfrau)
* encounter = Reference(Fachabteilungskontakt)
* recordedDate = "2021-05-24"
* note.text = "Beispiel für eine Anmerkung"

Instance: Example-condition-kreuz-stern-primaer
InstanceOf: ISiKDiagnose
Usage: #example
* clinicalStatus = $condition-clinical#recurrence
* code.coding.extension.url = "http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen"
* code.coding.extension.valueCoding.version = "2021"
* code.coding.extension.valueCoding = $icd-10-gm-mehrfachcodierungs-kennzeichen-cs#†
* code.coding.version = "2019"
* code.coding = $icd-10-gm#E10.30 "Diabetes mellitus"
* subject = Reference(PatientinMusterfrau)
* encounter = Reference(Fachabteilungskontakt)
* recordedDate = "2021-05-24"
* note.text = "Beispiel für eine Anmerkung"

Instance: Example-condition-kreuz-stern-sekundaer
InstanceOf: ISiKDiagnose
Usage: #example
* extension.url = "http://hl7.org/fhir/StructureDefinition/condition-related"
* extension.valueReference = Reference(Example-condition-kreuz-stern-primaer)
* clinicalStatus = $condition-clinical#active
* code.coding.extension.url = $icd-10-gm-mehrfachcodierungs-kennzeichen-sd
* code.coding.extension.valueCoding = $icd-10-gm-mehrfachcodierungs-kennzeichen-cs#*
* code.coding.version = "2019"
* code.coding = $icd-10-gm#H36.0 "Retinopathia diabetica"
* subject = Reference(PatientinMusterfrau)
* encounter = Reference(Fachabteilungskontakt)
* recordedDate = "2021-05-24"
* note.text = "Beispiel für eine Anmerkung"
* bodySite.coding[snomed-ct] = $sct#1290031003 "Structure of left eye proper"
  * version = "http://snomed.info/sct/11000274103/version/20231115"

Instance: MittelgradigeIntelligenzminderung
InstanceOf: ISiKDiagnose
Usage: #example
* clinicalStatus = $condition-clinical#active
* code.coding.version = "2020"
* code.coding = $icd-10-gm#F71 "Mittelgradige Intelligenzminderung"
* subject = Reference(PatientinMusterfrau)
* encounter = Reference(Fachabteilungskontakt)
* onsetDateTime = "2019-09-02"
* recordedDate = "2021-01-01"

Instance: BehandlungsDiagnoseFreitext
InstanceOf: ISiKDiagnose
Usage: #example
* clinicalStatus = $condition-clinical#active
* code.text = "Behandlungsdiagnose"
* subject = Reference(PatientinMusterfrau)
* onsetDateTime = "2019-09-02"
* recordedDate = "2021-01-01"

Invariant: isik-con1
Description: "Falls eine kodierte Diagnose vorliegt muss angegeben werden durch welchen Kontakt diese Dokumentation erfolgte."
Severity: #error
Expression: "code.coding.exists() implies encounter.exists()"

Invariant: icd-text-1
Description: "Entweder MUSS eine kodierte Diagnose vorliegen oder eine textuelle Beschreibung. Stattdessen nur Extensions hinzuzufügen (vgl. https://www.hl7.org/fhir/element.html - ele-1), ist explizit nicht erlaubt."
Severity: #error
Expression: "coding.exists().not() implies text.exists()"