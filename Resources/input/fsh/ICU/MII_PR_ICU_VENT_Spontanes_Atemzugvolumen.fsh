Profile: MII_PR_ICU_Spontanes_Atemzugvolumen
Parent: MII_PR_ICU_Parameter_Von_Beatmung
Id: mii-pr-icu-vent-spontanes-atemzugvolumen
Title: "MII PR ICU Spontanes Atemzugvolumen"
Description: """Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/profiles/Beatmungswerte - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 16.03.2026"""

* insert Meta


* code.coding 2..
* code.coding[sct] 1..1
* code.coding[sct] ^patternCoding.system = $sct
* code.coding[sct] ^patternCoding.code = #250816009
* code.coding[loinc] 1..1
* code.coding[loinc] ^patternCoding.system = $loinc
* code.coding[loinc] ^patternCoding.code = #20116-0
* code.coding[IEEE-11073] ..0
* code.coding[IEEE-11073] ^patternCoding.system = "urn:iso:std:iso:11073:10101"
* effective[x] 1..
* valueQuantity = $ucum#mL