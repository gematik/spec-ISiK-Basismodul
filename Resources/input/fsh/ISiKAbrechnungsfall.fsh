Profile: ISiKAbrechnungsfall
Parent: Account
Id: ISiKAbrechnungsfall
Description: "Dieses Profil beschreibt die Gruppierung von medizinischen Leistungen in ISiK-Szenarien"
* insert Meta
* extension MS
* extension contains ExtensionAbrechnungsDiagnose named Abrechnungsdiagnose 0.. MS
* id 1.. MS
* identifier 1.. MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* identifier contains Aufnahmenummer 1..1 MS
* identifier[Aufnahmenummer] only IdentifierAufnahmenummer
  * ^patternIdentifier.type = $v2-0203#VN
  * type MS
  * system MS
  * value MS
* status MS
* type 1.. MS
* type from ISiKAccountType (required)
* subject 1.. MS
  * ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "resolve()"
  * ^slicing.rules = #open
* subject contains Patient 1..1 MS
* subject[Patient]
* subject[Patient] only Reference(Patient)
* coverage MS
  * extension 1..1 MS
  * extension contains ExtensionAbrechnungsart named Abrechnungsart 1..1 MS
  * coverage MS

// extension:billingDiagnosis und extension:billingProcedure einfügen. Abstimmung mit PA notwendig. Siehe https://chat.fhir.org/#narrow/stream/224725-german.2Fcommitters/topic/Gestaltung.20Profil.20Account.20.23255

Extension: ExtensionAbrechnungsart
Id: abrechnungs-art
Title:  "Abrechnungsart"
* insert Meta
* value[x] only Coding
* valueCoding from AbrechnungsartVS (required)

Extension: ExtensionAbrechnungsDiagnose
Id: abrechnungs-diagnose
Title:  "Abrechnungsdiagnose"
* insert Meta
* extension contains Use 0..* MS and
    Referenz 0..* MS
* extension[Use].value[x] only Coding
* extension[Use].valueCoding from ISiKDrgUse (required)
* extension[Referenz].value[x] only Reference(Condition or Procedure)

Instance: account
InstanceOf: ISiKAbrechnungsfall
Usage: #example
* identifier.type = $v2-0203#VN
* identifier.system = "https://test.krankenhaus.de/fhir/sid/fallnr"
* identifier.value = "0123456789"
* status = #active
* type = $v3-ActCode#AMB
* subject = Reference(Patient/test)
* coverage
  * extension.url = "https://gematik.de/fhir/ISiK/v2/StructureDefinition/abrechnungs-art"
  * extension.valueCoding = $Abrechnungsart#DRG "Diagnosebezogene Fallgruppen"
  * coverage = Reference(Coverage/test)