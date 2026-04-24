Extension: ExtensionDosageAsNeededFor
Id: extension-Dosage.asNeededFor
Title: "Dosage As Needed For"
Description: "R5 Backport-Extension zur Angabe einer oder mehrerer Bedingungen, unter denen eine Bedarfsmedikation angewendet werden soll."
* insert Meta
* ^url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-Dosage.asNeededFor"
* ^experimental = false
* ^context[+].type = #element
* ^context[=].expression = "Dosage.asNeeded[x]"
* value[x] 1..1
* value[x] only CodeableConcept
