Profile: MII_PR_Prozedur_Procedure
Parent: Procedure
Id: mii-pr-prozedur-procedure
Title: "MII PR Prozedur Procedure"
Description: """Dieses Profil übernimmt die Vorgaben des Profils Prozedur der Medizininformatik-Initiative, um einzelne Profile für den Einsatz in ISiK zu spezifizieren, insbesondere die Beatmung aus dem MII Modul ICU.
Wesentliche Änderungen:
- Metadaten an ISiK angepasst
- Translation Entfernt
"""
* insert Meta
* insert CommonElements
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
* status MS
* status ^short = "Status"
* status ^definition = "Vorbereitung | in Arbeit | nicht durchgeführt | pausiert | abgebrochen | abgeschlossen | Eingabe fehlerhaft | unbekannt"
* category MS
* category ^short = "Kategorie"
* category ^definition = "Diagnostische Maßnahmen | Bildgebende Diagnostik | Operationen | Medikamente | Nichtoperative therapeutische Maßnahmen | Ergänzende Maßnahmen"
* category.coding ^slicing.discriminator.type = #pattern
* category.coding ^slicing.discriminator.path = "$this"
* category.coding ^slicing.rules = #open
* category.coding contains sct 0..1 MS
* category.coding[sct] from MII_VS_Prozedur_OpsKategorien_SNOMEDCT (preferred)
* category.coding[sct] ^patternCoding.system = "http://snomed.info/sct"
* category.coding[sct].system 1.. MS
* category.coding[sct].code 1.. MS
* code 1.. MS
* code ^short = "Code"
* code ^definition = "Code aus OPS - Operationen- und Prozedurenschlüssel, SNOMED CT oder andere."
* code obeys sct-ops-1
* code.coding 1.. MS
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains
    ops 0..1 MS and
    sct 0..1 MS
* code.coding[ops] only CodingOPS
* code.coding[ops] from mii-vs-prozedur-ops (required)
* code.coding[ops] ^patternCoding.system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[ops].extension[Seitenlokalisation] ^mustSupport = true
* code.coding[ops].system MS
* code.coding[ops].version MS
* code.coding[ops].code MS
* code.coding[sct] from MII_VS_Prozedur_Prozeduren_SNOMEDCT (required)
* code.coding[sct] ^patternCoding.system = "http://snomed.info/sct"
* code.coding[sct].system 1.. MS
* code.coding[sct].code 1.. MS
* subject 1..1 MS
//* subject only $MII-Reference
* performed[x] 1.. MS
* performed[x] ^short = "Durchführungsdatum"
* performed[x] ^definition = "Durchführungsdatum oder -zeitraum der Prozedur."
* performed[x] only dateTime or Period
* performedDateTime ^short = "Durchführungsdatum"
* performedDateTime ^definition = "Durchführungsdatum der Prozedur."
* performedPeriod ^short = "Durchführungszeitraum"
* performedPeriod ^definition = "Zeitraum, in dem die Prozedur durchgeführt wurde."
* bodySite MS
* bodySite ^short = "Körperstelle"
* bodySite ^definition = "Körperstelle der Prozedur mittels SNOMED CT inklusive Lateralität."
//* bodySite ^binding.strength = #extensible
* bodySite.coding MS
* bodySite.coding ^slicing.discriminator.type = #pattern
* bodySite.coding ^slicing.discriminator.path = "system"
* bodySite.coding ^slicing.rules = #open
* bodySite.coding contains 
    snomed-ct 0..1 MS 
// * bodySite.coding[snomed-ct] from mii-vs-diagnose-bodystructure-snomed (required) 
// should consider moving bodystructure VS to meta module
* bodySite.coding[snomed-ct].system 1.. MS
* bodySite.coding[snomed-ct].system = "http://snomed.info/sct"
* bodySite.coding[snomed-ct].version MS
* bodySite.coding[snomed-ct].code 1.. MS
* note MS
* note ^short = "Hinweis"
* note ^definition = "Zusätzliche Informationen zur Prozedur als Freitext."

Invariant: proc-mii-1
Description: "Falls die Prozedur per OPS kodiert wird, MUSS eine SNOMED-CT kodierte Category abgebildet werden"
Severity: #error
Expression: "code.coding.where(system = 'http://fhir.de/CodeSystem/bfarm/ops').exists() implies category.coding.where(system = 'http://snomed.info/sct').exists()"