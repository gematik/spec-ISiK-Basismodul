Profile: MII_PR_ICU_Devicemetric_Eingestellte_Gemessene_Parameter_Beatmung
Parent: DeviceMetric
Id: mii-pr-icu-vent-dm-eingestellte-gemessene-parameter-beatmung
Title: "MII PR ICU DeviceMetric Eingestellte Gemessene Parameter Beatmung"
Description: """
Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/profiles/Beatmungswerte - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 16.03.2026"""

* insert Meta

* type MS
* type from mii-vs-icu-category-procedure-beatmung-snomed (required)
* type.coding MS
* type.coding ^patternCoding.system = "http://snomed.info/sct"
* type.coding.system 1.. MS
* type.coding.code 1.. MS
* source only Reference(MII_PR_ICU_Device)
* source MS
* category MS