Profile: ISiKAbrechnungsfall
Parent: Account
Id: ISiKAbrechnungsfall
Description: "Dieses Profil beschreibt die Gruppierung von medizinischen Leistungen in ISiK-Szenarien"
* insert Meta
* extension MS
* extension contains http://fhir.de/StructureDefinition/ExtensionAbrechnungsDiagnoseProzedur named AbrechnungsDiagnoseProzedur 0..1 MS
* id 1.. MS
* identifier 1.. MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* identifier contains Aufnahmenummer 1..1 MS
* identifier[Aufnahmenummer] only IdentifierAbrechnungsnummer
  * ^patternIdentifier.type = $v2-0203#AN
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
* subject contains PatientISiK 1..1 MS
* subject[PatientISiK] only Reference(Patient)
* coverage MS
  * extension 1..1 MS
  * extension contains http://fhir.de/StructureDefinition/ExtensionAbrechnungsart named Abrechnungsart 1..1 MS
  * coverage MS

/* Folgende Profil-Definition entspricht dem Basisprofil-DE Profil 'Identifier-Profil für die Abbildung einer Abrechnungsnummer ("Fallnummer")' (https://simplifier.net/Basisprofil-DE-R4/IdentifierAbrechnungsnummer , bzw.: https://github.com/hl7germany/basisprofil-de-r4/blob/master/resources/input/fsh/profiles/IdentifierAbrechnungsnummer.fsh)
die nocht nicht als Package released ist.
TODO Bei einem Release des Basisprofile-De-Packages muss dieses Profil ersetzt werden.*/
Profile: IdentifierAbrechnungsnummer
Parent: Identifier
Id: identifier-abrechnungsnummer
Title: "Identifier-Profil für die Abbildung einer Abrechnungsnummer (\"Fallnummer\") "
Description: "Identifier-Profil für die Abbildung einer organisationsspezifischen Abrechnungsnummer (\"Fallnummer\")"
* type 1..
* type = $v2-0203#AN
* type from IdentifierTypeDeBasis (extensible)
* system 1..
* value 1..

Instance: AbrechnungsfallAmbulant
InstanceOf: ISiKAbrechnungsfall
Usage: #example
* identifier.type = $v2-0203#AN
* identifier.system = "https://test.krankenhaus.de/fhir/sid/besuchsnummer"
* identifier.value = "0123456789"
* status = #active
* type = $v3-ActCode#AMB
* subject = Reference(PatientinMusterfrau)
* coverage
  * extension.url = "http://fhir.de/StructureDefinition/ExtensionAbrechnungsart"
  * extension.valueCoding = $Abrechnungsart#DRG "Diagnosebezogene Fallgruppen"
  * coverage = Reference(CoverageGesetzlich)
