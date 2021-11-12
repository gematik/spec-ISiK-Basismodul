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
* entry MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "resource.type.coding.code"
  * ^slicing.rules = #open
* entry contains Composition 1..1 MS
* entry[Composition].resource only ISiKBerichtSubSysteme

Invariant: ISiK-docBundle-1
Description: "All referenced Resources must be contained in the Bundle"
Severity: #error
Expression: "Bundle.entry.descendants().reference.distinct().subsetOf(%context.entry.fullUrl)"