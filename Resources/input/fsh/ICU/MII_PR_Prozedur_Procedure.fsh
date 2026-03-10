Profile: MII_PR_Prozedur_Procedure
Parent: Procedure
Id: mii-pr-prozedur-procedure
Title: "MII PR Prozedur Procedure"
Description: "Dieses Profil beschreibt eine Prozedur in der Medizininformatik-Initiative."
* ^url = "https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure"
* insert Translation(^title, de-DE, Prozedur)
* insert Translation(^title, en-US, Procedure)
* insert Translation(^description, de-DE, Eine Prozedur\, die an oder für einen Patienten durchgeführt wird oder wurde.)
* insert Translation(^description, en-US, A procedure that is or was performed on or for a patient.)
* insert PR_CS_VS_Version
* insert Publisher
* insert LicenseCodeableCCBY40
* ^status = #active
* ^date = "2025-04-08"
* obeys proc-mii-1
* id MS
* meta MS
* meta.source MS
* meta.profile MS
* extension MS
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    ExtensionProzedurDokumentationsdatum named Dokumentationsdatum 0..1 MS and
    MII_EX_Prozedur_Durchfuehrungsabsicht named durchfuehrungsabsicht 0..1 MS
* extension[Dokumentationsdatum] ^short = "Dokumentationsdatum"
* insert Translation(extension[Dokumentationsdatum] ^short, de-DE, Dokumentationsdatum)
* insert Translation(extension[Dokumentationsdatum] ^short, en-US, Recorded date)
* extension[Dokumentationsdatum] ^definition = "Dokumentationsdatum der Prozedur, falls abweichend vom Durchführungsdatum"
* insert Translation(extension[Dokumentationsdatum] ^definition, de-DE, Dokumentationsdatum der Prozedur\, falls abweichend vom Durchführungsdatum)
* insert Translation(extension[Dokumentationsdatum] ^definition, en-US, The date the procedure was documented\, if different from the performed date)
* extension[durchfuehrungsabsicht] ^short = "Durchführungsabsicht"
* insert Translation(extension[durchfuehrungsabsicht] ^short, de-DE, Durchführungsabsicht)
* insert Translation(extension[durchfuehrungsabsicht] ^short, en-US, Intention)
* extension[durchfuehrungsabsicht] ^definition = "therapeutisch | palliativ | diagnostisch | präventiv | rehabilitativ | andere"
* insert Translation(extension[durchfuehrungsabsicht] ^definition, de-DE, therapeutisch | palliativ | diagnostisch | präventiv | rehabilitativ | andere)
* insert Translation(extension[durchfuehrungsabsicht] ^definition, en-US, therapeutic | palliative | diagnostic | preventive | rehabilitative | other)
* status MS
* status ^short = "Status"
* insert Translation(status ^short, de-DE, Status)
* insert Translation(status ^short, en-US, Status)
* status ^definition = "Vorbereitung | in Arbeit | nicht durchgeführt | pausiert | abgebrochen | abgeschlossen | Eingabe fehlerhaft | unbekannt"
* insert Translation(status ^definition, de-DE, Vorbereitung | in Arbeit | nicht durchgeführt | pausiert | abgebrochen | abgeschlossen | Eingabe fehlerhaft | unbekannt)
* insert Translation(status ^definition, en-US, preparation | in-progress | not-done | on-hold | stopped | completed | entered-in-error | unknown)
* category MS
* category ^short = "Kategorie"
* insert Translation(category ^short, de-DE, Kategorie)
* insert Translation(category ^short, en-US, Category)
* category ^definition = "Diagnostische Maßnahmen | Bildgebende Diagnostik | Operationen | Medikamente | Nichtoperative therapeutische Maßnahmen | Ergänzende Maßnahmen"
* insert Translation(category ^definition, de-DE, Diagnostische Maßnahmen | Bildgebende Diagnostik | Operationen | Medikamente | Nichtoperative therapeutische Maßnahmen | Ergänzende Maßnahmen)
* insert Translation(category ^definition, en-US, Diagnostic procedures | Imaging procedures | Operations | Medications | Non-operative therapeutic procedures | Other procedures)
* category.coding ^slicing.discriminator.type = #pattern
* category.coding ^slicing.discriminator.path = "$this"
* category.coding ^slicing.rules = #open
* category.coding contains sct 0..1 MS
* insert AddSnomedCodingTranslation(category.coding[sct])
* category.coding[sct] from MII_VS_Prozedur_OpsKategorien_SNOMEDCT (preferred)
* category.coding[sct] ^patternCoding.system = "http://snomed.info/sct"
* category.coding[sct].system 1.. MS
* category.coding[sct].code 1.. MS
* code 1.. MS
* code ^short = "Code"
* insert Translation(code ^short, de-DE, Code)
* insert Translation(code ^short, en-US, Code)
* code ^definition = "Code aus OPS - Operationen- und Prozedurenschlüssel, SNOMED CT oder andere."
* insert Translation(code ^definition, de-DE, Code aus OPS - Operationen- und Prozedurenschlüssel\, SNOMED CT oder andere.)
* insert Translation(code ^definition, en-US, Code from OPS - Operationen- und Prozedurenschlüssel\, SNOMED CT or other.)
* code obeys sct-ops-1
* code.coding 1.. MS
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains
    ops 0..1 MS and
    sct 0..1 MS
* insert AddOpsCodingTranslation(code.coding[ops])
* code.coding[ops] only CodingOPS
* code.coding[ops] from mii-vs-prozedur-ops (required)
* code.coding[ops] ^patternCoding.system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[ops].extension[Seitenlokalisation] ^mustSupport = true
* code.coding[ops].system MS
* code.coding[ops].version MS
* code.coding[ops].code MS
* insert AddSnomedCodingTranslation(code.coding[sct])
* code.coding[sct] from MII_VS_Prozedur_Prozeduren_SNOMEDCT (required)
* code.coding[sct] ^patternCoding.system = "http://snomed.info/sct"
* code.coding[sct].system 1.. MS
* code.coding[sct].code 1.. MS
* subject 1..1 MS
//* subject only $MII-Reference
* performed[x] 1.. MS
* performed[x] ^short = "Durchführungsdatum"
* insert Translation(performed[x] ^short, de-DE, Durchführungsdatum)
* insert Translation(performed[x] ^short, en-US, Performed date)
* performed[x] ^definition = "Durchführungsdatum oder -zeitraum der Prozedur."
* insert Translation(performed[x] ^definition, de-DE, Durchführungsdatum oder -zeitraum der Prozedur.)
* insert Translation(performed[x] ^definition, en-US, The date or period of time the procedure was performed.)
* performed[x] only dateTime or Period
* performedDateTime ^short = "Durchführungsdatum"
* insert Translation(performedDateTime ^short, de-DE, Durchführungsdatum)
* insert Translation(performedDateTime ^short, en-US, Performed date)
* performedDateTime ^definition = "Durchführungsdatum der Prozedur."
* insert Translation(performedDateTime ^definition, de-DE, Durchführungsdatum der Prozedur.)
* insert Translation(performedDateTime ^definition, en-US, The date the procedure was performed.)
* performedPeriod ^short = "Durchführungszeitraum"
* insert Translation(performedPeriod ^short, de-DE, Durchführungszeitraum)
* insert Translation(performedPeriod ^short, en-US, Performed period)
* performedPeriod ^definition = "Zeitraum, in dem die Prozedur durchgeführt wurde."
* insert Translation(performedPeriod ^definition, de-DE, Zeitraum\, in dem die Prozedur durchgeführt wurde.)
* insert Translation(performedPeriod ^definition, en-US, The period of time the procedure was performed.)
* bodySite MS
* bodySite ^short = "Körperstelle"
* insert Translation(bodySite ^short, de-DE, Körperstelle)
* insert Translation(bodySite ^short, en-US, Body site)
* bodySite ^definition = "Körperstelle der Prozedur mittels SNOMED CT inklusive Lateralität."
* insert Translation(bodySite ^definition, de-DE, Körperstelle der Prozedur mittels SNOMED CT inklusive Lateralität.)
* insert Translation(bodySite ^definition, en-US, The body site of the procedure using SNOMED CT including laterality.)
//* bodySite ^binding.strength = #extensible
* bodySite.coding MS
* bodySite.coding ^slicing.discriminator.type = #pattern
* bodySite.coding ^slicing.discriminator.path = "system"
* bodySite.coding ^slicing.rules = #open
* bodySite.coding contains 
    snomed-ct 0..1 MS 
* insert AddSnomedCodingTranslation(bodySite.coding[snomed-ct])
// * bodySite.coding[snomed-ct] from mii-vs-diagnose-bodystructure-snomed (required) 
// should consider moving bodystructure VS to meta module
* bodySite.coding[snomed-ct].system 1.. MS
* bodySite.coding[snomed-ct].system = "http://snomed.info/sct"
* bodySite.coding[snomed-ct].version MS
* bodySite.coding[snomed-ct].code 1.. MS
* note MS
* note ^short = "Hinweis"
* insert Translation(note ^short, de-DE, Hinweis)
* insert Translation(note ^short, en-US, Note)
* note ^definition = "Zusätzliche Informationen zur Prozedur als Freitext."
* insert Translation(note ^definition, de-DE, Zusätzliche Informationen zur Prozedur als Freitext.)
* insert Translation(note ^definition, en-US, Additional information about the procedure as free text.)