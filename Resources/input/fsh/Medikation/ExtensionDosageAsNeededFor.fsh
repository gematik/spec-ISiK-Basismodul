Extension: DosageAsNeededFor
Id: extension-Dosage.asNeededFor
Title: "Dosage AsNeededFor"
Description: "R5 Backport-Extension zur Angabe einer oder mehrerer Bedingungen, unter denen eine Bedarfsmedikation angewendet werden soll."
* insert Meta
* ^url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-Dosage.asNeededFor"
* ^status = #active
* ^context[0].type = #element
* ^context[=].expression = "Dosage"
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-wg].valueCode = #fhir
* extension 0..0
* value[x] only CodeableConcept
* valueCodeableConcept from http://hl7.org/fhir/ValueSet/medication-as-needed-reason (example)
