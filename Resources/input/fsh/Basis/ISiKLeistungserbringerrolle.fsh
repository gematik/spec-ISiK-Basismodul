Profile: ISiKLeistungserbringerrolle
Parent: PractitionerRole
Id: ISiKLeistungserbringerrolle
Description: "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen 
über die Rolle eines Leistungserbringers im Rahmen des Bestätigungsverfahrens der gematik.  
### Motivation
Die Rolle von Leistungserbringern innerhalb einer Organisation (z.B. Fachabteilung, Praxis, Krankenhaus) ist eine wichtige Information in Bezug auf die Leistungen, die
durch diese Person erbracht werden.

In FHIR wird die Rolle eines Leistungserbringers mit der PractitionerRole-Ressource repräsentiert.  

**HISTORIE:**
- Dieses Profil wird vor dem Hintergrund von FHIR-Profilierungen im Kontext des EHDS in Stufe 6 initial eingebracht.
"
* insert Meta
* insert CommonElements
// * insert compliesWithProfile(PractitionerRoleEu)
* active 1.. MS
  * ^short = "Aktiv/Inaktiv Status"
  * ^comment = "Motivation MS: Ein System muss prüfen können, ob die Rolle eines Leistungserbringers aktiv oder inaktiv ist."
* practitioner MS
  * ^short = "Leistungserbringer"
  * ^comment = "Motivation MS: Ein System muss die Informationen über den Leistungserbringer, der die Rolle innehat, bereitstellen können."
* organization MS
  * ^short = "Organisation"
  * ^comment = "Motivation MS: Ein System muss die Informationen über die Organisation, der der Leistungserbringer angehört, bereitstellen können."
* code MS
  * ^short = "Rolle des Leistungserbringers"
  * ^comment = "Motivation MS: Ein System muss die Informationen über die Rolle des Leistungserbringers bereitstellen können, um die Art der erbrachten Leistungen zu verstehen."
  * coding MS
  * coding from $KBV_VS_Base_Role_CareVS (extensible)
  * coding only ISiKCoding
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

Instance: LeistungserbringerrolleAllgemeinchirurgieBeispiel
InstanceOf: ISiKLeistungserbringerrolle
Usage: #example
* active = true
* practitioner = Reference(PractitionerWalterArzt)
* organization = Reference(AbteilungAllgemeinchirurgieOrganisationBeispiel)
* code.text = "Facharzt/Fachaerztin"
* specialty[0].coding[IHEPracticeSetting] = $IHEAerztlicheFachrichtungen#ALLG "Allgemeinmedizin"
* specialty[1].coding[Fachabteilungsschluessel] = $FachabteilungsschluesselErweitertCS#1500 "Allgemeine Chirurgie"

Instance: LeistungserbringerrolleInnereMedizinBeispiel
InstanceOf: ISiKLeistungserbringerrolle
Usage: #example
* active = false
* practitioner = Reference(PractitionerWalterArzt)
* organization = Reference(KrankenhausOrganisationBeispiel)
* code.text = "Assistenzarzt/Assistenzaerztin"
* specialty[0].coding[IHEPracticeSetting] = $IHEAerztlicheFachrichtungen#INTM "Innere Medizin"
* specialty[1].coding[Fachabteilungsschluessel] = $FachabteilungsschluesselErweitertCS#3600 "Intensivmedizin"

  