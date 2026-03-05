Profile: MII_PR_ICU_Beatmung
Parent: https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure
Id: mii-pr-icu-vent-beatmung
Title: "MII PR ICU Beatmung"
Description: """Dieses Profil dient der Abbildung von Beatmungsmaßnahmen in der Akutmedizin.

Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/profiles/Beatmungswerte/MII_PR_ICU_Beatmung.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 4.3.2026.
"""
* insert Meta
* insert CommonElements

* partOf only Reference(Procedure or Observation)
* category 1..
* category.coding[sct] from MII_VS_ICU_Category_Procedure_Beatmung_SNOMED (required)
* category.coding[sct].display MS
* code.coding[sct] from MII_VS_ICU_Code_Procedure_Beatmung_SNOMED (required)
* code.coding[sct] ^patternCoding.system = $sct
* code.coding[sct].display MS
* subject only Reference(Patient)
* encounter only Reference(Encounter)
* encounter MS
* performed[x] only Period
* recorder only Reference(Patient or RelatedPerson or Practitioner or PractitionerRole)
* recorder MS