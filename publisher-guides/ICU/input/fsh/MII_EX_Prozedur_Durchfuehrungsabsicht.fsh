Extension: MII_EX_Prozedur_Durchfuehrungsabsicht
Id: mii-ex-prozedur-durchfuehrungsabsicht
Title: "MII EX Prozedur Durchführungsabsicht"
Description: """Intention der Prozedur
Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII Basis Modul entnommen - https://github.com/medizininformatik-initiative/kerndatensatz-basis/blob/main/input/fsh/extensions/MII_EX_Prozedur_Durchfuehrungsabsicht.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 31.3.2026.
"""
* insert Meta
* ^context.type = #element
* ^context.expression = "Procedure"
* value[x] 1.. MS
* value[x] only Coding
* value[x] from MII_VS_Prozedur_Durchfuehrungsabsicht_SNOMEDCT (required)
* value[x].system 1.. MS
* value[x].system = "http://snomed.info/sct" (exactly)
* value[x].code 1.. MS