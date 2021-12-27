Profile: ISiKAbrechnungsfall
Parent: Account
Id: ISiKAbrechnungsfall
Description: "Dieses Profil beschreibt die Gruppierung von medizinischen Leistungen in ISiK-Szenarien"
* insert Meta
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
* type from AbrechnungsartVS (preferred)
* subject 1.. MS
  * ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "resolve()"
  * ^slicing.rules = #open
* subject contains Patient 1..1 MS
* subject[Patient]
* subject[Patient] only Reference(Patient)
// extension:billingDiagnosis und extension:billingProcedure einfügen. Abstimmung mit PA notwendig. Siehe https://chat.fhir.org/#narrow/stream/224725-german.2Fcommitters/topic/Gestaltung.20Profil.20Account.20.23255
