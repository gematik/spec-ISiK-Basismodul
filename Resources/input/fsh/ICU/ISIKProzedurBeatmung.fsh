Profile: ISiKProzedurBeatmung
Parent: ISiKProzedur
Id: isik-prozedur-beatmung
Title: "isik-prozedur-beatmung"
Description: """Dieses Profil dient der Abbildung von Beatmungsmaßnahmen in der Akutmedizin.

Die verwendeten ValueSets in diesem Profil wurden dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/profiles/Beatmungswerte/MII_PR_ICU_Beatmung.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. 
Als Parent wurde der letzte Stand des Prozedur-Profils der MII gewählt. 
Stand 4.3.2026.
"""
* insert Meta
* insert CommonElements

* category 1..
* category.coding[SNOMED-CT] from MII_VS_ICU_Category_Procedure_Beatmung_SNOMED (required)
* category.coding[SNOMED-CT].display MS
* category.coding[SNOMED-CT] ^patternCoding.system = $sct
* code.coding[SNOMED-CT] from MII_VS_ICU_Code_Procedure_Beatmung_SNOMED (required)
* code.coding[SNOMED-CT] ^patternCoding.system = $sct
* code.coding[SNOMED-CT].display MS
