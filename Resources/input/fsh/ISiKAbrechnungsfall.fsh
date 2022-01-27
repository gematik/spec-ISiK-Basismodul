Profile: ISiKAbrechnungsfall
Parent: Account
Id: ISiKAbrechnungsfall
Description: "Dieses Profil beschreibt die Gruppierung von medizinischen Leistungen in ISiK-Szenarien"
* insert Meta
* extension contains ExtensionAbrechnungsDiagnose named Abrechnungsdiagnose 0..1 MS
* id 1.. MS
* identifier 1.. MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* identifier contains Aufnahmenummer 0..1 MS
* identifier[Aufnahmenummer] only IdentifierAufnahmenummer
  * ^patternIdentifier.type = $v2-0203#VN
  * type MS
  * system MS
  * value MS
* status MS
* type 1.. MS
* type from ISiKAccountType (preferred)
* subject 1.. MS
  * ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "resolve()"
  * ^slicing.rules = #open
* subject contains Patient 1..1 MS
* subject[Patient]
* subject[Patient] only Reference(Patient)
* coverage MS
  * extension contains ExtensionAbrechnungsart named Abrechnungsart 0..1 MS

// extension:billingDiagnosis und extension:billingProcedure einfügen. Abstimmung mit PA notwendig. Siehe https://chat.fhir.org/#narrow/stream/224725-german.2Fcommitters/topic/Gestaltung.20Profil.20Account.20.23255

Extension: ExtensionAbrechnungsart
Id: abrechnungs-art
Title:  "Abrechnungsart"
* insert Meta
* value[x] only code
* valueCode from AbrechnungsartVS (required)

Extension: ExtensionAbrechnungsDiagnose
Id: abrechnungs-diagnose
Title:  "Abrechnungsdiagnose"
* insert Meta
* extension contains Condition 0..* MS and
    Procedure 0..* MS
* extension[Condition].value[x] only Reference(Condition)
* extension[Condition].value[x].extension contains ExtensionDRGUse named DRGUse 0..1 MS
* extension[Procedure].value[x] only Reference(Procedure)
* extension[Procedure].value[x].extension contains ExtensionDRGUse named DRGUse 0..1 MS

Extension: ExtensionDRGUse
Id: drg-use
* insert Meta
* value[x] only code
* valueCode from ISiKAccountDRG (required)