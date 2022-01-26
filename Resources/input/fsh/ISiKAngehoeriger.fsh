Profile: ISiKAngehoeriger
Parent: RelatedPerson
Id: ISiKAngehoeriger
Description: "Dieses Profil ermöglicht die Nutzung von Angehörigen in ISiK Szenarien."
* insert Meta
* obeys relatedp-de-1
* patient only Reference(ISiKPatient)
  * reference 1..
  * identifier ..0
  * display ..0
* name 1..1
* name only HumannameDeBasis
* gender.extension contains GenderOtherDE named Geschlecht-Administrativ 0..*
* gender.extension[Geschlecht-Administrativ] ^mustSupport = false
* address ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* address contains
    Strassenanschrift 0..* and
    Postfach 0..*
  * type 1.. MS
  * line 1..1 MS
  * city 1.. MS
  * postalCode 1.. MS
  * country 1.. MS
* address[Strassenanschrift] only AddressDeBasis
  * ^patternAddress.type = #physical
  * type = #physical (exactly)
* address[Postfach] only AddressDeBasis
  * ^patternAddress.type = #postal
  * type = #postal (exactly)

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