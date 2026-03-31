ValueSet: MII_VS_Prozedur_Prozeduren_SNOMEDCT
Id: mii-vs-prozedur-prozeduren-snomedct
Title: "MII VS Prozedur Prozeduren [SNOMED CT]"
Description: """Enthaelt alle SNOMED CT Procedure Codes 
Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII Basis Moduls entnommen - https://github.com/medizininformatik-initiative/kerndatensatz-basis/blob/ec3fd5f187888d4fb5523f13a09f8917414f7bae/input/fsh/valuesets/MII_VS_Prozedur_Prozeduren_SNOMEDCT.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 31.03.2026"""
* insert Meta
* include codes from system $sct where concept descendent-of #71388002