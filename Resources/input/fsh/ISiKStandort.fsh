Profile: ISiKStandort
Parent: Location
Id: ISiKStandort
Description: "Dieses Profil dient der strukturierten Erfassung von Standortangaben eines Krankenhauses oder von Organisationseinheiten innerhalb eines Krankenhauses in ISiK-Szenarien."
* insert Meta
* identifier MS //Motivation entspricht https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/sd_mii_struktur_location
* name MS //Motivation: Kein Name zwingend notwendig (z.B. für ein Zimmer), wenn über .identifier definierbar. weicht daher ab von https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/sd_mii_struktur_location
* mode MS //Motivation entspricht https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/sd_mii_struktur_location
  * ^patternCodeableConcept.coding = $LocationMode#instance
* address MS // TODO anpassen auf deutsche Adresse
* physicalType 1..1 MS //Motivation entspricht https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/sd_mii_struktur_location
* managingOrganization 1..1 MS //Motivation entspricht https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/sd_mii_struktur_location
* partOf 1..1 MS

