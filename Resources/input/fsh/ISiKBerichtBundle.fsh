Profile: ISiKBerichtBundle
Parent: Bundle
Id: ISiKBerichtBundle
Title: "ISiKBerichtBundle"
Description: "A document style representation of the receipt (complete, self-contained, signed)"
* insert Meta
* obeys ISiK-docBundle-1
* type = #document (exactly)
* type MS
* timestamp 1.. MS
* identifier 1.. MS
* entry MS
  * fullUrl 1..1 MS
  * resource 1..1 MS
  * search 0..0
  * request 0..0
  * response 0..0
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "resource.type.coding.code"
  * ^slicing.rules = #open
* entry contains Composition 1..1 MS
* entry[Composition].resource only ISiKBerichtSubSysteme

Instance: ISiKBundle-Example
InstanceOf: ISiKBerichtBundle
Usage: #example
Title: "Bundle-Beispiel-Blutdruck"
Description: "Beispiel für ein Bundle mit Composition Blutdruck"
* identifier.value = "urn:oid:2.16.840.1.113883.6.96"
* timestamp = "2013-06-08T10:57:34+01:00"
* entry[0].resource = composition-blutdruck
* entry[=].fullUrl = "http://meinfhirserver.de/Composition/composition-blutdruck"
* entry[+].resource = PatientinMusterfrau
* entry[=].fullUrl = "http://meinfhirserver.de/Patient/PatientinMusterfrau"
* entry[+].resource = Fachabteilungskontakt
* entry[=].fullUrl = "http://meinfhirserver.de/Encounter/Fachabteilungskontakt"



Invariant: ISiK-docBundle-1
Description: "All referenced Resources must be contained in the Bundle"
Severity: #error
Expression: "Bundle.entry.descendants().reference.distinct().subsetOf(%context.entry.fullUrl)"