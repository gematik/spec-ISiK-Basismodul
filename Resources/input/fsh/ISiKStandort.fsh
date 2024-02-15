Profile: ISiKStandort
Parent: Location
Id: ISiKStandort
Description: "Dieses Profil dient der strukturierten Erfassung von Standortangaben eines Krankenhauses oder von Organisationseinheiten innerhalb eines Krankenhauses in ISiK-Szenarien."
* insert Meta
* identifier MS //Motivation: entspricht https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/sd_mii_struktur_location
* name MS //Motivation: Kein Name zwingend notwendig (z.B. für ein Zimmer), wenn über .identifier identifizierbar; weicht daher ab von https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/sd_mii_struktur_location
* mode MS //Motivation: entspricht https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/sd_mii_struktur_location
  * ^patternCodeableConcept.coding = $LocationMode#instance
* type MS 
  * ^comment = "Motivation: Ein System muss den Typ eines Standorts zum Abruf bereitstellen, sofern diese Information verfügbar ist."
* address MS // TODO anpassen auf deutsche Adresse
* physicalType 1..1 MS //Motivation: entspricht https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/sd_mii_struktur_location
  * ^comment = "test"
* position MS 
  * ^comment = "Motivation: Ein System muss die Geodaten eines Standorts zum Abruf bereitstellen, sofern diese Information verfügbar ist."
* managingOrganization 1..1 MS //Motivation: entspricht https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/sd_mii_struktur_location
* partOf MS
  * ^comment = "Motivation: Ein System muss die organisationale Zugehörigkeit eines Standorts zum Abruf bereitstellen, sofern diese Information verfügbar ist."
* hoursOfOperation MS
// * ^comment = "Motivation: Ein System muss die Betriebszeiten eines Standorts zum Abruf bereitstellen, sofern diese Information verfügbar ist."

Profile: ISiKStandortRaum
Parent: ISiKStandort
Id: ISiKStandortRaum
Description: "Dieses Profil dient der strukturierten Erfassung von Räumen (als Standorten) eines Krankenhauses"
* physicalType = $LocationPhysicalType#ro "Room"
* operationalStatus MS  //TODO: hier ggf. ein dezidiertes VS notwendig für Raumbelegung
  * ^comment = "Motivation: Entsprechend der Bedarfsmeldung im Rahmen der AG zur Ausbaustufe 4 muss ein System den Belegungsstatus eines Raums zum Abruf bereitstellen, sofern diese Information verfügbar ist."

Profile: ISiKStandortBett
Parent: ISiKStandort
Id: ISiKStandortBett
Description: "Dieses Profil dient der strukturierten Erfassung von Betten (als Standorten) eines Krankenhauses"
* physicalType = $LocationPhysicalType#bd "Bed"
* operationalStatus MS
* operationalStatus from http://terminology.hl7.org/CodeSystem/v2-0116 (required)
  * ^comment = "Motivation: Entsprechend der Bedarfsmeldung im Rahmen der AG zur Ausbaustufe 4 muss ein System den Belegungsstatus eines Bettes zum Abruf bereitstellen, sofern diese Information verfügbar ist. Im Sinne der Interoperabilität ist das ValueSet verpflichtend."


Instance: RaumStandortBeispiel
InstanceOf: ISiKStandort
Usage: #example
* physicalType = $LocationPhysicalType#ro "Room"
* managingOrganization = Reference(AbteilungAllgemeinchirurgieOrganisationBeispiel)

Instance: BettStandortBeispiel
InstanceOf: ISiKStandortBett
Usage: #example
* managingOrganization = Reference(AbteilungAllgemeinchirurgieOrganisationBeispiel)
* partOf = Reference(RaumStandortBeispiel)



