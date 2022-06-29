Profile: ISiKAngehoeriger
Parent: RelatedPerson
Id: ISiKAngehoeriger
Description: "Dieses Profil ermöglicht die Nutzung von Angehörigen in ISiK Szenarien."
* insert Meta
* obeys relatedp-de-1
* patient 1..1 MS
* patient only Reference(ISiKPatient)
  * reference 1..
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
    * extension[Strasse] 0..1
    * extension[Hausnummer] 0..1
    * extension[Adresszusatz] 0..1
    * extension[Postfach] 0..1
  * city 1.. MS
  * postalCode 1.. MS
    * obeys address-cnt-2or3-char
    * ^constraint[1].source = "https://gematik.de/fhir/isik/v1/Basismodul/StructureDefinition/ISiKAngehoeriger"
* address[Strassenanschrift] only AddressDeBasis
  * ^patternAddress.type = #both
  * type 1.. MS
  * line 1.. MS
    * extension[Strasse] 0..1
    * extension[Hausnummer] 0..1
    * extension[Adresszusatz] 0..1
    * extension[Postfach] 0..1
  * city 1.. MS
  * postalCode 1.. MS
  * country  1.. MS
    * obeys address-cnt-2or3-char
    * ^constraint[1].source = "https://gematik.de/fhir/isik/v1/Basismodul/StructureDefinition/ISiKAngehoeriger"

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

