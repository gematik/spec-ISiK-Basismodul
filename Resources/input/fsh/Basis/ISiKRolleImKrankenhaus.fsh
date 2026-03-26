Profile: ISiKRolleImKrankenhaus
Parent: PractitionerRole
Id: ISiKRolleImKrankenhaus
Description: "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen 
über die Rolle eines Leistungserbringers im Rahmen des Bestätigungsverfahrens der gematik.  
### Motivation
Die Rolle von Leistungserbringern innerhalb einer Organisation (z.B. Fachabteilung, Praxis, Krankenhaus) ist eine wichtige Information in Bezug auf die Leistungen, die
durch diese Person erbracht werden.

In FHIR wird die Rolle eines Leistungserbringers mit der PractitionerRole-Ressource repräsentiert und wir
ausgehend vom PractitionerRole Profil aus dem EHDS in ISiK aufgenommen. 

**HISTORIE:**
- Dieses Profil wird vor dem Hintergrund von FHIR-Profilierungen im Kontext des EHDS in Stufe 6 initial eingebracht.
"
* insert Meta
* insert CommonElements
// * insert compliesWithProfile(PractitionerRoleEu)
* active MS
  * ^short = "Aktiv/Inaktiv Status"
  * ^comment = "Motivation MS: Ein System muss prüfen können, ob die Rolle eines Leistungserbringers aktiv oder inaktiv ist.
  **Einschränkung der übergreifenden MS-Definition**:
Verfügt ein bestätigungsrelevantes System nicht über die Datenstruktur zur Hinterlegung des Aktivitätsstatus einer 
PractitionerRole-Ressource, so MUSS dieses System die Information NICHT abbilden. Das System SOLL jedoch den Aktivitätsstatus hart kodieren
 in der PractitionerRole-Instanz (PractitionerRole.active auf 'true'), 
sodass Clients nicht missverständlich mit einer inaktiven PractitionerRole-Ressource interagieren.
  "
* practitioner MS
  * ^short = "Leistungserbringer"
  * ^comment = "Motivation MS: Ein System muss die Informationen über den Leistungserbringer, der die Rolle innehat, bereitstellen können."
* organization MS
  * ^short = "Organisation"
  * ^comment = "Motivation MS: Ein System muss die Informationen über die Organisation, der der Leistungserbringer angehört, bereitstellen können."
* code MS
  * ^short = "Rolle des Leistungserbringers"
  * ^comment = "Motivation MS: Die Rolle in der ein Leistungserbringer innerhalb einer ausübt, muss exponiert und verarbeitet werden können."
  * coding MS
  * coding
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
    * ^slicing.ordered = false
  * coding contains
    KBVRoleCare 0..1 MS
  * coding[KBVRoleCare] from $KBV_VS_Base_Role_Care (required)  
  * coding[KBVRoleCare] only ISiKCoding
* specialty MS
  * ^short = "Fachgebiet des Leistungserbringers"
  * ^comment = "Motivation MS: Ein System muss die Informationen über das Fachgebiet des Leistungserbringers bereitstellen können, um die Art der erbrachten Leistungen besser zu verstehen."
  * coding 
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
    * ^slicing.ordered = false
  * coding contains
    IHEPracticeSetting 0..* MS and
    Fachabteilungsschluessel 0..* MS
  * coding[IHEPracticeSetting] from $IHEpracticeSettingVS (required)
  * coding[IHEPracticeSetting] only ISiKCoding
  * coding[Fachabteilungsschluessel] from $FachabteilungsschluesselErweitertVS (required)
  * coding[Fachabteilungsschluessel] only ISiKCoding

Instance: RolleImKrankenhausAllgemeinchirurgieBeispiel
InstanceOf: ISiKRolleImKrankenhaus
Usage: #example
* active = true
* practitioner = Reference(PractitionerWalterArzt)
* organization = Reference(AbteilungAllgemeinchirurgieOrganisationBeispiel)
* code.coding[KBVRoleCare] = $KBV_CS_Base_Role_Care#FA "Fachärzt:in"
* specialty.coding[IHEPracticeSetting] = $IHEAerztlicheFachrichtungen#ALLG "Allgemeinmedizin"
* specialty.coding[Fachabteilungsschluessel] = $FachabteilungsschluesselErweitertCS#1500 "Allgemeine Chirurgie"

Instance: RolleImKrankenhausInnereMedizinBeispiel
InstanceOf: ISiKRolleImKrankenhaus
Usage: #example
* active = false
* practitioner = Reference(PractitionerWalterArzt)
* organization = Reference(KrankenhausOrganisationBeispiel)
* code.coding[KBVRoleCare] = $KBV_CS_Base_Role_Care#AA "Assistenzärzt:in"
* specialty.coding[IHEPracticeSetting] = $IHEAerztlicheFachrichtungen#INTM "Intensivmedizin"
* specialty.coding[Fachabteilungsschluessel] = $FachabteilungsschluesselErweitertCS#3600 "Intensivmedizin"

  