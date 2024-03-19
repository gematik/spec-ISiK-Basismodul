Profile: ISiKOrganisationFachabteilung
Parent: Organization
Id: ISiKOrganisationFachabteilung
Description: "Dieses Profil beschreibt die Organisationseinheit Fachabteilung innerhalb eines Krankenhauses."
* insert Meta
* id MS
* identifier 1..* MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* identifier contains 
  IKNR 0..1 MS and //TODO: zu prüfen, ob sinnvoll für Fachabteilung als Organisationseinheit eines Krankenhauses
  BSNR 0..1 MS and //TODO: zu prüfen, ob sinnvoll für Fachabteilung als Organisationseinheit eines Krankenhauses
  Abteilungsidentifikator 1..1 MS
/*
  KIMAdresse 0..1 MS and
  TIMAdresse 0..1 MS and
*/
* identifier[IKNR] only $identifier-iknr
* identifier[IKNR].type 0..1
  * ^comment = "Motivation: Entsprechend der Vorgabe der KBV Organisation 1.5.0. (https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Organization), muss ein System ein Institutionskennzeichen (IKNR) verarbeiten können, sofern diese Information verfügbar ist. "
* identifier[BSNR] only $identifier-bsnr
* identifier[BSNR].type 0..1
  * ^comment = "Motivation: Entsprechend der Bedarfsmeldung im Rahmen der Stakeholderbefragung zu einem Profil Organisation in der Arbeitsgruppe zum ISIK Basismodul Stufe 4 und der Vorgabe der KBV Organisation 1.5.0. (https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Organization), muss ein System eine Betriebsstättennummer (BSNR) verarbeiten können, sofern diese Information verfügbar ist."
* identifier[Abteilungsidentifikator].system 1.. MS
  * ^comment = "Motivation: Für IDs, die Krankhausintern spezifischen Fachabteilungen vergeben werden, ist diese Identifier zu nutzen - analog zu Slice Abteilungsidentifikator in https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/mii_pr_struktur_abteilung."
/*
* identifier[KIMAdresse] only $GEM_PR_KIM_AdressIdentifier
* identifier[KIMAdresse].type 0..1
* identifier[KIMAdresse].type = https://gematik.de/fhir/directory/CodeSystem/EndpointDirectoryConnectionType#kim-2.0 (exactly)
* identifier[TIMAdresse] only $GEM_PR_TIM_AdressIdentifier
* identifier[TIMAdresse].type 0..1
* identifier[TIMAdresse].type = https://gematik.de/fhir/directory/CodeSystem/EndpointDirectoryConnectionType#tim
*/
* active MS
  * ^comment = "Motivation: Ein System muss prüfen können, ob eine Fachabteilung als Organisation aktiv ist oder nicht, sofern diese Information verfügbar ist."
* type MS
  * ^comment = "Motivation: Ein System muss den Typ einer Organisation zum Abruf bereitstellen, sofern diese Information verfügbar ist. 
  Die Festlegung einer endlichen Menge von Organisations-Formen in verbindlicher weise, ist zum Zeitpunkt der Festlegung nicht möglich."
* type ^slicing.discriminator.type = #pattern
* type ^slicing.discriminator.path = "$this"
* type ^slicing.rules = #open
* type ^slicing.ordered = false
* type contains
  organisationstyp 1..1 MS and
  fachabteilungsschluessel 0..1 MS
* type[organisationstyp].coding = $organization_type#dept
  * ^comment = "Motivation: Eine Fachabteilung muss als solche hinsichtlich des Typs kodiert werden."
* type[fachabteilungsschluessel] from $FachabteilungsschluesselErweitertCS (required)
  * ^comment = "Motivation: Das ValueSet muss bindend sein, damit Systemübergreifend der Fachabteilungstyp einheitlich kodiert werden kann."
* type[fachabteilungsschluessel].coding.system 1.. MS
* type[fachabteilungsschluessel].coding.code 1.. MS
* name  MS
  * ^comment = "Motivation: Einer Organisation oder Organisationseinheit muss ein Name zugewiesen werden."
* alias MS
  * ^comment = "Hinweis: unter Umstaänden können hier Kürzel genutzt werden. Motivation: Ein System muss den Alias einer Organisation zum Abruf bereitstellen, sofern diese Information verfügbar ist."
* telecom MS
  * ^comment = "Motivation: Ein System muss Kontaktinformation einer Organisation zum Abruf bereitstellen, sofern diese Information verfügbar ist."
* address MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^comment = "In order to differentiate between post box addresses and physical addresses, street names and house numbers, and to add city district names, vendors can opt to support the extensions as suggested in the German Address Base Profile http://fhir.de/StructureDefinition/address-de-basis.\r\nSuch differentiations are however not required within the scope of this specification."
* address contains
    Strassenanschrift 0..* MS and
    Postfach 0..* MS
* address[Postfach] only AddressDeBasis
  * obeys address-cnt-2or3-char
  * ^patternAddress.type = #postal
  * type 1.. MS
  * line 1.. MS
    * extension[Strasse] 0..0 
    * extension[Hausnummer] 0..0 
    * extension[Adresszusatz] 0..0 
    * extension[Postfach] 0..1 MS
  * city 1.. MS
  * postalCode 1.. MS
  * country 1.. MS
* address[Strassenanschrift] only AddressDeBasis
  * obeys address-cnt-2or3-char
  * extension[Stadtteil] MS
  * ^patternAddress.type = #both
  * type 1.. MS
  * line 1.. MS
    * extension[Strasse] 0..1 MS
    * extension[Hausnummer] 0..1 MS
    * extension[Adresszusatz] 0..1 MS
    * extension[Postfach] 0..0
  * city 1.. MS
  * postalCode 1.. MS
  * country 1.. MS
* partOf MS
  * ^comment = "Motivation: System muss die Hierarchie einer Organisationseinheit innherhalb einer Organisation zum Abruf bereitstellen, sofern diese Information verfügbar ist."
* contact MS
  * ^comment = "Motivation: Ein System muss Kontaktinformation einer Organisation zum Abruf bereitstellen, sofern diese Information verfügbar ist."
* endpoint MS
  * ^comment = "Motivation: Ein System muss den technischen Endpunkt einer Organisation zum Abruf bereitstellen, sofern diese Information verfügbar ist."



Profile: ISiKOrganisation
Parent: Organization
Id: ISiKOrganisation
Description: "Dieses Profil beschreibt die Nutzung von Organisationseinheiten innerhalb eines Krankenhauses oder eines Krankenhauses als ganzem in ISiK-Szenarien."
* insert Meta
* id MS
* identifier 1..* MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* identifier contains 
  IKNR 0..1 MS and
  BSNR 0..1 MS and
  OrganisationseinheitenID 0..1 MS
/*
  KIMAdresse 0..1 MS and
  TIMAdresse 0..1 MS and
*/
* identifier[IKNR] only $identifier-iknr
* identifier[IKNR].type 0..1
  * ^comment = "Motivation: Entsprechend der Vorgabe der KBV Organisation 1.5.0. (https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Organization), muss ein System ein Institutionskennzeichen (IKNR) verarbeiten können, sofern diese Information verfügbar ist. "
* identifier[BSNR] only $identifier-bsnr
* identifier[BSNR].type 0..1
  * ^comment = "Motivation: Entsprechend der Bedarfsmeldung im Rahmen der Stakeholderbefragung zu einem Profil Organisation in der Arbeitsgruppe zum ISIK Basismodul Stufe 4 und der Vorgabe der KBV Organisation 1.5.0. (https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Organization), muss ein System eine Betriebsstättennummer (BSNR) verarbeiten können, sofern diese Information verfügbar ist."
* identifier[OrganisationseinheitenID].system 1.. MS
  * ^comment = "Motivation: Für IDs, die Krankhausintern spezifischen Organisationseinheiten wie Abteilungen oder Stationen vergeben werden, ist diese Identifier zu nutzen - analog zu Slice Abteilungsidentifikator in https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/mii_pr_struktur_abteilung. Da auch Stationen im Identifier-System inkludiert werden könnten, sollte hier das Identifier generisch Organisationseinheiten abbilden und nicht Abteilungen allein."
* identifier[OrganisationseinheitenID].value 1.. MS
/*
* identifier[KIMAdresse] only $GEM_PR_KIM_AdressIdentifier
* identifier[KIMAdresse].type 0..1
* identifier[KIMAdresse].type = https://gematik.de/fhir/directory/CodeSystem/EndpointDirectoryConnectionType#kim-2.0 (exactly)
* identifier[TIMAdresse] only $GEM_PR_TIM_AdressIdentifier
* identifier[TIMAdresse].type 0..1
* identifier[TIMAdresse].type = https://gematik.de/fhir/directory/CodeSystem/EndpointDirectoryConnectionType#tim
*/
* active MS
  * ^comment = "Motivation: Ein System muss prüfen können, ob eine Organisation aktiv ist oder nicht, sofern diese Information verfügbar ist."
* type MS
  * ^comment = "Motivation: Ein System muss den Typ einer Organisation zum Abruf bereitstellen, sofern diese Information verfügbar ist. 
  Die Festlegung einer endlichen Menge von Organisations-Formen in verbindlicher weise, ist zum Zeitpunkt der Festlegung nicht möglich."
* type ^slicing.discriminator.type = #pattern
* type ^slicing.discriminator.path = "$this"
* type ^slicing.rules = #open
* type ^slicing.ordered = false
* type contains
  organisationstyp 0..1 MS and
  fachabteilungsschluessel 0..1 MS
* type[organisationstyp] from $organization_type (extensible)
* type[organisationstyp].coding.system 1.. MS
* type[organisationstyp].coding.code 1.. MS
* type[fachabteilungsschluessel] from $FachabteilungsschluesselErweitertCS (required)
* type[fachabteilungsschluessel].coding.system 1.. MS
* type[fachabteilungsschluessel].coding.code 1.. MS
* name  MS
  * ^comment = "Motivation: Ein System muss den Namen einer Organisation zum Abruf bereitstellen, sofern diese Information verfügbar ist.."
* alias MS
  * ^comment = "Hinweis: unter Umstaänden können hier Kürzel genutzt werden. Motivation: Ein System muss den Alias einer Organisation zum Abruf bereitstellen, sofern diese Information verfügbar ist."
* telecom MS
  * ^comment = "Motivation: Ein System muss Kontaktinformation einer Organisation zum Abruf bereitstellen, sofern diese Information verfügbar ist."
* address MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^comment = "In order to differentiate between post box addresses and physical addresses, street names and house numbers, and to add city district names, vendors can opt to support the extensions as suggested in the German Address Base Profile http://fhir.de/StructureDefinition/address-de-basis.\r\nSuch differentiations are however not required within the scope of this specification."
* address contains
    Strassenanschrift 0..* MS and
    Postfach 0..* MS
* address[Postfach] only AddressDeBasis
  * obeys address-cnt-2or3-char
  * ^patternAddress.type = #postal
  * type 1.. MS
  * line 1.. MS
    * extension[Strasse] 0..0 
    * extension[Hausnummer] 0..0 
    * extension[Adresszusatz] 0..0 
    * extension[Postfach] 0..1 MS
  * city 1.. MS
  * postalCode 1.. MS
  * country 1.. MS
* address[Strassenanschrift] only AddressDeBasis
  * obeys address-cnt-2or3-char
  * extension[Stadtteil] MS
  * ^patternAddress.type = #both
  * type 1.. MS
  * line 1.. MS
    * extension[Strasse] 0..1 MS
    * extension[Hausnummer] 0..1 MS
    * extension[Adresszusatz] 0..1 MS
    * extension[Postfach] 0..0
  * city 1.. MS
  * postalCode 1.. MS
  * country 1.. MS
* partOf MS
  * ^comment = "Motivation: System muss die Hierarchie einer Organisationseinheit innherhalb einer Organisation zum Abruf bereitstellen, sofern diese Information verfügbar ist."
* contact MS
  * ^comment = "Motivation: Ein System muss Kontaktinformation einer Organisation zum Abruf bereitstellen, sofern diese Information verfügbar ist."
* endpoint MS
  * ^comment = "Motivation: Ein System muss den technischen Endpunt einer Organisation zum Abruf bereitstellen, sofern diese Information verfügbar ist."


Instance: KrankenhausOrganisationBeispiel
InstanceOf: ISiKOrganisation
Usage: #example
* identifier[IKNR]
* identifier[IKNR].value = $identifier-iknr#260120196
* identifier[BSNR]
* identifier[BSNR].value = $identifier-iknr#345678975
* name = "Uniklinik Entenhausen"


Instance: AbteilungAllgemeinchirurgieOrganisationBeispiel
InstanceOf: ISiKOrganisationFachabteilung
Usage: #example
* identifier[Abteilungsidentifikator].system = "https://fhir.krankenhaus.example/sid/OrgaID"
* identifier[Abteilungsidentifikator].value = "123456"
* name = "Allgemeinchirurgie"
* type[organisationstyp].coding = $organization_type#dept
* type[fachabteilungsschluessel] = $FachabteilungsschluesselErweitertCS#1500	"Allgemeine Chirurgie"
* partOf = Reference(KrankenhausOrganisationBeispiel)

/*
Instance: StationAllgemeinchirurgieOrganisationBeispiel
InstanceOf: ISiKOrganisation
Usage: #example
* identifier[OrganisationseinheitenID].system = "https://fhir.krankenhaus.example/sid/OrgaID"
* identifier[OrganisationseinheitenID].value = "654321"
* name = "Station 1 Allgemeinchirurgie"
* type[organisationstyp] = $organization_type#dept //TODO eine Differenzierung zwischen Station und Abteilung ist mittel CS an dieser Stelle nicht möglich; ggf. mittels wa|"Ward" aus LocationPhysicalType?
* type[fachabteilungsschluessel] = $FachabteilungsschluesselErweitertCS#1500	"Allgemeine Chirurgie"
* partOf = Reference(AbteilungAllgemeinchirurgieOrganisationBeispiel)
*/