Profile: ISIKProzedurBeatmung
Parent: ISIKProzedur
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
* category.coding[sct] from MII_VS_ICU_Category_Procedure_Beatmung_SNOMED (required)
* category.coding[sct].display MS
* code.coding[sct] from MII_VS_ICU_Code_Procedure_Beatmung_SNOMED (required)
* code.coding[sct] ^patternCoding.system = $sct
* code.coding[sct].display MS
