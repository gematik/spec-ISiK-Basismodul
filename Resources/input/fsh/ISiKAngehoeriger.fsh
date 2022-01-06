Profile: ISiKAngehoeriger
Parent: RelatedPerson
Id: ISiKAngehoeriger
Description: "Dieses Profil ermöglicht die Nutzung von Angehörigen in ISiK Szenarien."
* insert Meta
* obeys relatedp-de-1
* patient 1..1 MS
* patient only Reference(ISiKPatient)
  * reference 1..
  * identifier ..0
  * display ..0
* name 1..1 MS
* name only HumannameDeBasis
* gender.extension contains GenderOtherDE named Geschlecht-Administrativ 0..*
* gender.extension[Geschlecht-Administrativ] ^mustSupport = false
* address MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^comment = "In order to differentiate between post box addresses and physical addresses, street names and house numbers, and to add city district names, vendors can opt to support the extensions as suggested in the German Address Base Profile http://fhir.de/StructureDefinition/address-de-basis.\r\nSuch differentiations are however not required within the scope of this specification."
* address contains
    Strassenanschrift 0..* MS and
    Postfach 0..* MS
* address[Postfach] only AddressDeBasis
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
    * obeys address-cnt-2or3-char
    * ^constraint[1].source = "http://gematik.de/fhir/ISiK/StructureDefinition/ISiKAngehoeriger"
* address[Strassenanschrift] only AddressDeBasis
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
    * obeys address-cnt-2or3-char
    * ^constraint[1].source = "http://gematik.de/fhir/ISiK/StructureDefinition/ISiKAngehoeriger"

Instance: relatedPerson
InstanceOf: ISiKAngehoeriger
Usage: #example
* patient = Reference(patient)
* name.family = "Mustermann"
* name.given = "Maxine"
* address.type = #physical
* address.line = "Milchstr. 42"
* address.city = "Beispielstadt"
* address.postalCode = "78143"
* address.country = "DE"

Invariant: relatedp-de-1
Description: "Falls die Geschlechtsangabe 'other' gewählt wird, muss die amtliche Differenzierung per Extension angegeben werden"
Severity: #error
Expression: "gender.exists() and gender='other' implies gender.extension('http://fhir.de/StructureDefinition/gender-amtlich-de').exists()"