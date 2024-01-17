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
  BSNR 0..1 MS 
  KZVAbrechnungsnummer 0..1 MS

/*
  KIMAdresse 0..1 MS and
  TIMAdresse 0..1 MS and
*/

* identifier[IKNR] only $identifier-iknr
* identifier[IKNR].type 0..1
  * ^comment = "Motivation: Entsprechend der Vorgabe der KBV Organisation 1.5.0. (https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Organization), muss ein System ein Institutionskennzeichen (IKNR) verarbeiten können, sofern diese Information bereitgestellt wird. "

* identifier[BSNR] only $identifier-bsnr
* identifier[BSNR].type 0..1
  * ^comment = "Motivation: Entsprechend der Bedarfsmeldung im Rahmen der Stakeholderbefragung zu einem Profil Organisation in der Arbeitsgruppe zum ISIK Basismodul Stufe 4 und der Vorgabe der KBV Organisation 1.5.0. (https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Organization), muss ein System eine Betriebsstättennummer (BSNR) verarbeiten können, sofern diese Information bereitgestellt wird. "

/*
* identifier[KIMAdresse] only $GEM_PR_KIM_AdressIdentifier
* identifier[KIMAdresse].type 0..1
* identifier[KIMAdresse].type = https://gematik.de/fhir/directory/CodeSystem/EndpointDirectoryConnectionType#kim-2.0 (exactly)

* identifier[TIMAdresse] only $GEM_PR_TIM_AdressIdentifier
* identifier[TIMAdresse].type 0..1
* identifier[TIMAdresse].type = https://gematik.de/fhir/directory/CodeSystem/EndpointDirectoryConnectionType#tim
*/

* active MS
  * ^comment = "Motivation: Ein System oder eine Person muss prüfen können, ob eine Organisation aktiv ist oder nicht, sofern diese Information bereitgestellt wird."
* type MS
  * ^comment = "Motivation: Ein System oder eine Person muss den Typ einer Organisation abrufen können, sofern diese Information bereitgestellt wird. 
  Die Festlegung einer endlichen Menge von Organisations-Formen in verbindlicher weise, ist zum Zeitpunkt der Festlegung nicht möglich."
* name 1..1 MS
  * ^comment = "Motivation: Einer Organisation oder Organisationseinheit muss ein Name zugewiesen werden."
* alias MS
  * ^comment = "Motivation: Ein System oder eine Person muss den Alias einer Organisation abrufen können, sofern diese Information bereitgestellt wird."
* telecom MS
  * ^comment = "Motivation: Ein System oder eine Person muss Kontaktinformation einer Organisation abrufen können, sofern diese Information bereitgestellt wird."
* address MS
  * ^comment = "Motivation: Ein System oder eine Person muss Adressinformationen einer Organisation abrufen können, sofern diese Information bereitgestellt wird."
* partOf MS
  * ^comment = "Motivation: System oder eine Person muss die Hierarchie einer Organisationseinheit innherhalb einer Organisation abrufen können, sofern diese Information bereitgestellt wird."
* contact MS
  * ^comment = "Motivation: Ein System oder eine Person muss Kontaktinformation einer Organisation abrufen können, sofern diese Information bereitgestellt wird."
* endpoint MS
  * ^comment = "Motivation: Ein System oder eine Person muss den technischen Endpunt einer Organisation abrufen können, sofern diese Information bereitgestellt wird."
