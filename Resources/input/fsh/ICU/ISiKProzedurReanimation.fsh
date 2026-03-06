Profile: ISiKProzedurReanimation
Parent: ISiKProzedur
Id: ISiKProzedurReanimation
Title: "ISiK Prozedur Reanimation"
Description: """Dieses Profil dient der Abbildung von Reanimationsmaßnahmen - insbesondere in der Akutmedizin.
"""
* insert Meta
* insert CommonElements

* category = $sct#373110003 "Emergency procedure (procedure)"
* code.coding[SNOMED-CT] from ProzedurenReanimationCodesSCT (required)
* code.coding[SNOMED-CT] ^patternCoding.system = $sct
* code.coding[OPS] from ProzedurenReanimationCodesOPS (required)
* code.coding[OPS] ^patternCoding.system = $ops

Instance: ReanimationBeispiel
InstanceOf: ISiKProzedurReanimation
Usage: #example
* extension.url = "http://fhir.de/StructureDefinition/ProzedurDokumentationsdatum"
* extension.valueDateTime = "2026-04-23"
* status = #completed
* code.coding[0] = $sct#89666000 "Kardiopulmonale Reanimation"
* code.coding[=].version = "http://snomed.info/sct/11000274103/2025-11-15"
* code.coding[+] = $ops#8-771 "Kardiale oder kardiopulmonale Reanimation"
* code.coding[=].version = "2026"
* code.text = "Herz-Lungen-Wiederbelebung"
* subject = Reference(PatientinMusterfrau)
* performedDateTime = "2026-04-23"
* note.text = "Reanimationsmaßnahme mit erfolgreichem Ausgang"