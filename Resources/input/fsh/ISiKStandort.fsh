Profile: ISiKStandort
Parent: Location
Id: ISiKStandort
Description: "Dieses Profil dient der strukturierten Erfassung von Standortangaben eines Krankenhauses oder von Organisationseinheiten innerhalb eines Krankenhauses in ISiK-Szenarien."
* insert Meta
* identifier MS //Motivation: entspricht https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/sd_mii_struktur_location
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* identifier contains 
  standortnummer-dkg 0..1 MS
* identifier[standortnummer-dkg] only $identifier-standortnummer-dkg
  * ^patternIdentifier.system = $identifier-standortnummer-dkg-system
  * ^comment = "Motivation : Entsprechend der Festlegung der DKG laut Basisprofile-DE 1.5.0 (https://simplifier.net/packages/de.basisprofil.r4/) "
* name MS //Motivation: Kein Name zwingend notwendig (z.B. für ein Zimmer), wenn über .identifier identifizierbar; weicht daher ab von https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/sd_mii_struktur_location
* mode MS //Motivation: entspricht https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/sd_mii_struktur_location
  * ^patternCodeableConcept.coding = $LocationMode#instance
* type MS
  * ^comment = "Motivation: Ein System muss den Typ eines Standorts zum Abruf bereitstellen, sofern diese Information verfügbar ist."
* address MS
* address only AddressDeBasis
* physicalType 1..1 MS //Motivation: entspricht https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/sd_mii_struktur_location
  * ^comment = "Motivation: Ein System muss den physikalischen Typ eines Standorts zum Abruf bereitstellen."
* position MS 
  * ^comment = "Motivation: Ein System muss die Geodaten eines Standorts zum Abruf bereitstellen, sofern diese Information verfügbar ist."
* managingOrganization 1..1 MS //Motivation: entspricht https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/sd_mii_struktur_location
* partOf MS
  * ^comment = "Motivation: Ein System muss die organisationale Zugehörigkeit eines Standorts zum Abruf bereitstellen, sofern diese Information verfügbar ist."
* hoursOfOperation MS
  * ^comment = "Motivation: Ein System muss die Betriebszeiten eines Standorts zum Abruf bereitstellen, sofern diese Information verfügbar ist."

Profile: ISiKStandortRaum
Parent: ISiKStandort
Id: ISiKStandortRaum
Description: "Dieses Profil dient der strukturierten Erfassung von Räumen (als Standorten) eines Krankenhauses."
* physicalType = $LocationPhysicalType#ro "Room"
* operationalStatus MS  
* operationalStatus from http://terminology.hl7.org/CodeSystem/v2-0116 (required)
  * ^comment = "Motivation: Entsprechend der Bedarfsmeldung im Rahmen der AG zur Ausbaustufe 4 muss ein System den Belegungsstatus eines Raums zum Abruf bereitstellen, sofern diese Information verfügbar ist. Dies dient z.B. der Markierung als 'Isoliert'."

Profile: ISiKStandortBettenstellplatz
Parent: ISiKStandort
Id: ISiKStandortBettenstellplatz
Description: "Dieses Profil dient der strukturierten Erfassung von Bettenstellplätzen (als Standorten) eines Krankenhauses"
* physicalType = $LocationPhysicalType#bd "Bed" // Dies entspreicht der Definition des VS "This is not the physical bed/trolley that may be moved about, but the space it may occupy."
* operationalStatus MS
* operationalStatus from http://terminology.hl7.org/CodeSystem/v2-0116 (required)
  * ^comment = "Motivation: Entsprechend der Bedarfsmeldung im Rahmen der AG zur Ausbaustufe 4 muss ein System den Belegungsstatus eines Bettenstellplatz zum Abruf bereitstellen, sofern diese Information verfügbar ist. Dies dient z.B. der Markierung als 'Isoliert'. Im Sinne der Interoperabilität ist das ValueSet verpflichtend."


Instance: RaumStandortBeispiel
InstanceOf: ISiKStandort
Usage: #example
* physicalType = $LocationPhysicalType#ro "Room"
* managingOrganization = Reference(AbteilungAllgemeinchirurgieOrganisationBeispiel)

Instance: BettenstellplatzStandortBeispiel
InstanceOf: ISiKStandortBettenstellplatz
Usage: #example
* managingOrganization = Reference(AbteilungAllgemeinchirurgieOrganisationBeispiel)
* partOf = Reference(RaumStandortBeispiel)



