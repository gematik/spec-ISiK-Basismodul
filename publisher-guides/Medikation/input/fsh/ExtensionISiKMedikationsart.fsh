Extension: ExtensionISiKMedikationsart
Id: ExtensionISiKMedikationsart
Title: "ISiK Medikationsart"
Description: "Diese Erweiterung ermöglicht die genaue Angabe der Art der Medikation, beispielsweise ob es sich um eine Dauermedikation, Bedarfsmedikation oder eine situative Medikation handelt. Dies trägt zur besseren Strukturierung von Medikationsplänen und zur eindeutigen Kommunikation über die Medikation bei."
* insert Meta
* ^experimental = false
* ^context[+].type = #element
* ^context[=].expression = "MedicationStatement"
* ^context[+].type = #element
* ^context[=].expression = "MedicationRequest"
* value[x] 1..
* value[x] only Coding
* valueCoding from ISiKMedikationsartVS
  * system 1..
  * code 1..
