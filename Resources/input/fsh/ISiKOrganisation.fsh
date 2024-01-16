Profile: ISiKOrganisation
Parent: Organization
Id: ISiKOrganisation
Description: "Dieses Profil beschreibt die Nutzung von Organisationseinheiten innerhalb eines Krankenhauses oder eines Krankenhauses als ganzem in ISiK-Szenarien."
* insert Meta
* id MS
* identifier 1..* MS
* active MS
  * ^comment = "Motivation: Ein System oder eine Person muss Prüfen können, ob eine Organisation aktiv ist oder nicht, sofern diese Information bereitgestellt wird."
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
