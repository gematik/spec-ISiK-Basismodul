Extension: ExtensionISiKMedicationStatementReplaces
Id: ExtensionISiKMedicationStatementReplaces
Title: "ISiK MedicationStatementReplaces"
Description: "Mit dieser Erweiterung kann festgelegt werden, welche vorherige Medikation durch die aktuelle Verordnung ersetzt wird. Sie erleichtert die Nachverfolgung von Therapieänderungen, sorgt für Transparenz im Medikationsprozess."
* insert Meta
* ^experimental = false
* ^context[+].type = #element
* ^context[=].expression = "MedicationStatement"
* value[x] 1..
* value[x] only Reference(MedicationStatement)
* valueReference
  * reference 1..
