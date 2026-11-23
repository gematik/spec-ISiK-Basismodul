Extension: ExtensionISiKSelbstmedikation
Id: ExtensionISiKSelbstmedikation
Title: "ISiK Selbstmedikation"
Description: "Mit dieser Erweiterung kann kenntlich gemacht werden, ob ein Arzneimittel als Selbstmedikation (d. h. ohne ärztliche Verordnung) eingenommen wird. Sie trägt zur vollständigen Erfassung der aktuellen Medikation und zur Erhöhung der Therapiesicherheit bei."
* insert Meta
* ^experimental = false
* ^context[+].type = #element
* ^context[=].expression = "MedicationStatement"
* value[x] 1..
* value[x] only boolean
