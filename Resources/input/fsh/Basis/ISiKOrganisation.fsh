Profile: ISiKOrganisationFachabteilung
Parent: ISiKOrganisation
Id: ISiKOrganisationFachabteilung
Description: "Dieses Profil beschreibt die Organisationseinheit Fachabteilung innerhalb eines Krankenhauses.

**Motivation**

Die Abbildung der Aufbauorganisation eines Krankenhauses dient der Festlegung von Zuständigkeiten und (Entscheidungs-)Verantwortungen von Organisationseinheiten (z.B. Fachkliniken, Fachabteilungen und -bereichen etc.) in strukturierter Form. 

In FHIR wird die Organisation (Organization) vom Standort (Location) eindeutig abgegrenzt.

Die Erfassung der Organisation in strukturierter Form ermöglicht u.a.:
- Zuweisungen von Diensten an bestimmte Bereiche der Aufbauorganisation im Rahmen des Terminmanagements
- Die Raum- und Betten-Belegung in strukturierter Form (interdisziplinär)

Auch die Erfassung des Krankenhauses als Ganzem ist relevant.
Entsprechend fokussieren die folgenden Profile zur Organisation auf das Krankenhaus als Ganzes und die Fachabteilung als Organisation.  

**Kompatibilität**

Für das Profil ISiKOrganisationFachabteilung wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen das ISIK Profil valide sind, auch valide sind gegen:
* [Profil TIOrganization der gematik](https://gematik.de/fhir/ti/StructureDefinition/ti-organization)  

Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden.

"
* insert Meta
* insert CommonElements
// * insert CompliesWith(http://hl7.eu/fhir/base/StructureDefinition/organization-eu)
// * insert CompliesWith(https://gematik.de/fhir/ti/StructureDefinition/ti-organization)
* identifier 
  * ^short = "Identifikatoren der Fachabteilung"
  * ^comment = "Mindestens ein Identifikator muss für die Fachabteilung angegeben werden."
* identifier contains 
  Abteilungsidentifikator 1..1 MS
/* TODO: zu prüfen, ob sinnvoll zur Abdeckung gennanter UCs in ISiK
  KIMAdresse 0..1 MS and
  TIMAdresse 0..1 MS and
*/
* identifier[Abteilungsidentifikator] MS
  * ^short = "Krankenhausinterner Abteilungsidentifikator"
  * system 1.. MS
  * value 1.. MS
  * ^patternIdentifier.type = $sct#225746001 // Ward
  * ^comment = "Motivation: Für IDs, die Krankhausintern spezifischen Fachabteilungen vergeben werden, ist diese Identifier zu nutzen - analog zu Slice Abteilungsidentifikator in https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/mii_pr_struktur_abteilung."
/* TODO s.o.
* identifier[KIMAdresse] only $GEM_PR_KIM_AdressIdentifier
* identifier[KIMAdresse].type 0..1
* identifier[KIMAdresse].type = https://gematik.de/fhir/directory/CodeSystem/EndpointDirectoryConnectionType#kim-2.0 (exactly)
* identifier[TIMAdresse] only $GEM_PR_TIM_AdressIdentifier
* identifier[TIMAdresse].type 0..1
* identifier[TIMAdresse].type = https://gematik.de/fhir/directory/CodeSystem/EndpointDirectoryConnectionType#tim
*/
* type contains
  Fachbereich 0..1 MS

* type[Fachbereich] from $IHEpracticeSettingVS (required)
  * ^short = "Angabe des IHE-PracticeSetting Code"
  * ^comment = "Motivation: Ein Fachbereich muss als solcher hinsichtlich des Typs kodiert werden."
* type[Fachbereich].coding.system 1.. MS
* type[Fachbereich].coding.code 1.. MS
* name 1..


Profile: ISiKOrganisation
Parent: Organization
Id: ISiKOrganisation
Description: "Dieses Profil beschreibt die Nutzung von Organisationseinheiten innerhalb eines Krankenhauses oder eines Krankenhauses als ganzem in ISiK-Szenarien."
* insert Meta
* identifier 1..* MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^short = "Identifier"
  * ^comment = "Motivation Kardinalität und Must Support: Jede Organisation muss über einen Business Identifier eindeutig identifiziert werden können."
* identifier contains 
  IKNR 0..1 MS and
  BSNR 0..1 MS and
  OrganisationseinheitenID 0..1 MS and
  TelematikID 0..1 MS
/*
  KIMAdresse 0..1 MS and
  TIMAdresse 0..1 MS and
*/
* identifier[IKNR] MS
* identifier[IKNR] only $identifier-iknr
  * ^short = "IKNR"
  * ^comment = "Motivation Must Support: Jede Organisation, die über eine IKNR verfügt, soll dadurch eindeutig identifiziert werden können."
  * ^patternIdentifier.system = $identifier-iknr-system 
  * ^comment = "Motivation: Entsprechend der Vorgabe der KBV Organisation 1.5.0. (https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Organization), muss ein System ein Institutionskennzeichen (IKNR) verarbeiten können, sofern diese Information verfügbar ist. "
* identifier[BSNR] MS 
* identifier[BSNR] only $identifier-bsnr
  * ^short = "BSNR"
  * ^comment = "Motivation Must Support: Jede Organisation, die über eine BSNR verfügt, soll dadurch eindeutig identifiziert werden können."
  * ^patternIdentifier.system = $identifier-bsnr-system 
  * ^comment = "Motivation: Entsprechend der Bedarfsmeldung im Rahmen der Stakeholderbefragung zu einem Profil Organisation in der Arbeitsgruppe zum ISIK Basismodul Stufe 4 und der Vorgabe der KBV Organisation 1.5.0. (https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Organization), muss ein System eine Betriebsstättennummer (BSNR) verarbeiten können, sofern diese Information verfügbar ist."
* identifier[OrganisationseinheitenID] MS
  * ^short = "OrganisationseinheitenID"
  * ^patternIdentifier.type = $sct#43741000 // Site of care
  * system 1.. MS
  * value 1.. MS
  * ^comment = "Hinweis: Für IDs, die krankenhaus-intern spezifischen Organisationseinheiten wie Abteilungen oder Stationen vergeben werden, ist diese Identifier zu nutzen - analog zu Slice Abteilungsidentifikator in https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/mii_pr_struktur_abteilung. Da auch Stationen im Identifier-System inkludiert werden könnten, sollte hier das Identifier generisch Organisationseinheiten abbilden und nicht Abteilungen allein.
  
  Motivation Must Support: Jede Organisation, die über eine Organisationseinheiten-ID verfügt, soll dadurch eindeutig identifiziert werden können."
* identifier[TelematikID] MS
* identifier[TelematikID] only $identifer-TelematikID
  * ^short = "Telematik-ID"
  * ^patternIdentifier.system = $identifer-TelematikID-system
  * ^comment = "Motivation Must Support: Jede Organisation, die über eine Telematik-ID verfügt, soll dadurch eindeutig identifiziert werden können."
/*
* identifier[KIMAdresse] only $GEM_PR_KIM_AdressIdentifier
* identifier[KIMAdresse].type 0..1
* identifier[KIMAdresse].type = https://gematik.de/fhir/directory/CodeSystem/EndpointDirectoryConnectionType#kim-2.0 (exactly)
* identifier[TIMAdresse] only $GEM_PR_TIM_AdressIdentifier
* identifier[TIMAdresse].type 0..1
* identifier[TIMAdresse].type = https://gematik.de/fhir/directory/CodeSystem/EndpointDirectoryConnectionType#tim
*/
* active MS
  * ^short = "Aktivitäts-Status der Organisation"
  * ^comment = "Motivation: Ein System muss prüfen können, ob eine Organisation aktiv ist oder nicht, sofern diese Information verfügbar ist."
* type MS
  * ^short = "Typ der Organisation"
  * ^comment = "Motivation: Ein System muss den Typ einer Organisation zum Abruf bereitstellen, sofern diese Information verfügbar ist. 
  Die Festlegung einer endlichen Menge von Organisations-Formen in verbindlicher weise, ist zum Zeitpunkt der Festlegung nicht möglich."
* type ^slicing.discriminator.type = #pattern
* type ^slicing.discriminator.path = "$this"
* type ^slicing.rules = #open
* type ^slicing.ordered = false
* type contains
  organisationstyp 0..1 MS and
  EinrichtungsArt 0..1 MS and
  ErweiterterFachabteilungsschluessel 0..1 MS
* type[organisationstyp] from $organization_typeVS (required)
  * ^short = "Allgemeiner Organisationstyp"
  * ^comment = "Definiert den allgemeinen Typ der Organisation."
* type[organisationstyp].coding.system 1.. MS
* type[organisationstyp].coding.code 1.. MS
* type[ErweiterterFachabteilungsschluessel] from $FachabteilungsschluesselErweitertVS (required)
  * ^short = "Erweiterter Fachabteilungsschlüssel"
  * ^comment = "Spezifiziert den erweiterten Fachabteilungsschlüssel für medizinische Einrichtungen."
* type[ErweiterterFachabteilungsschluessel].coding.system 1.. MS
* type[ErweiterterFachabteilungsschluessel].coding.code 1.. MS
* type[EinrichtungsArt] from $IHEXDSFacilityType (required)
  * ^short = "Art der Einrichtung (IHE XDS)"
  * ^comment = "Beschreibt die Art der Einrichtung nach IHE XDS Standards."
* type[EinrichtungsArt].coding.system 1.. MS
* type[EinrichtungsArt].coding.code 1.. MS
* name  MS
  * ^short = "Name der Organisation"
  * ^comment = "Motivation: Ein System muss den Namen einer Organisation zum Abruf bereitstellen, sofern diese Information verfügbar ist.."
* alias MS
  * ^short = "Alias der Organisation"
  * ^comment = "Hinweis: unter Umstaänden können hier Kürzel genutzt werden. Motivation: Ein System muss den Alias einer Organisation zum Abruf bereitstellen, sofern diese Information verfügbar ist."
* telecom MS
  * ^short = "Kontaktinformation"
  * ^comment = "Motivation: Ein System muss Kontaktinformation einer Organisation zum Abruf bereitstellen, sofern diese Information verfügbar ist."
* address MS
  * ^short = "Adresse der Organisation"
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^comment = "Um zwischen Postfachadressen und physischen Adressen, Straßennamen und Hausnummern zu unterscheiden und Städtenamenszusätze hinzuzufügen, können Anbieter die Erweiterungen unterstützen, die im Deutschen Adress-Basisprofil vorgeschlagen werden (http://fhir.de/StructureDefinition/address-de-basis). Solche Differenzierungen sind jedoch im Rahmen dieser Spezifikation nicht erforderlich."
* address contains
    Strassenanschrift 0..* MS and
    Postfach 0..* MS
* address[Postfach] only AddressDeBasis
  * ^short = "Postfachadresse"
  * ^comment = "Adresse, die nur für postalische Zustellung genutzt werden kann."
  * obeys address-cnt-2or3-char
  * extension[Stadtteil] MS
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
  * ^short = "Straßenanschrift"
  * ^comment = "Wohn- oder Aufenthaltsort des Patienten"
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
  * ^short = "Übergeordnete Organisation"
  * ^comment = "Motivation: System muss die Hierarchie einer Organisationseinheit innherhalb einer Organisation zum Abruf bereitstellen, sofern diese Information verfügbar ist."
* contact MS
  * ^short = "Kontaktperson oder -abteilung"
  * ^comment = "Motivation: Ein System muss Kontaktinformation einer Organisation zum Abruf bereitstellen, sofern diese Information verfügbar ist."
* endpoint MS
  * ^short = "Technischer Endpunkt"
  * ^comment = "Motivation: Ein System muss den technischen Endpunt einer Organisation zum Abruf bereitstellen, sofern diese Information verfügbar ist."





Instance: KrankenhausOrganisationBeispiel
InstanceOf: ISiKOrganisation
Usage: #example
* identifier[IKNR].value = "260120196"
* identifier[BSNR].value = "345678975"
* identifier[TelematikID].value = "1234567890"
* name = "Uniklinik Entenhausen"


Instance: AbteilungAllgemeinchirurgieOrganisationBeispiel
InstanceOf: ISiKOrganisationFachabteilung
Usage: #example
* identifier[Abteilungsidentifikator]
  * system = "https://fhir.krankenhaus.example/sid/OrgaID"
  * value = "123456"
* identifier[TelematikID].value = "1234567890"
* name = "Allgemeinchirurgie"
* type[organisationstyp] = $organization_type#dept
* type[ErweiterterFachabteilungsschluessel] = $FachabteilungsschluesselErweitertCS#1500	"Allgemeine Chirurgie"
* partOf = Reference(KrankenhausOrganisationBeispiel)