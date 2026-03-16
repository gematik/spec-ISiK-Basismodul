Profile: MII_PR_ICU_Unterstuezungsdruck_Beatmung
Parent: MII_PR_ICU_Parameter_Von_Beatmung
Id: mii-pr-icu-vent-unterstuezungsdruck-beatmung
Title: "MII PR ICU Unterstuezungsdruck Beatmung"
* insert PR_CS_VS_Version
* insert Publisher
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/mii-pr-icu-unterstuetzungsdruck-beatmung"
* ^status = #active

* code.coding[sct] ..0
* code.coding[sct] ^patternCoding.system = $sct
* code.coding[loinc] 1..1
* code.coding[loinc] ^patternCoding.system = $loinc
* code.coding[loinc] ^patternCoding.code = #20079-0
* code.coding[IEEE-11073] ..0
* code.coding[IEEE-11073] ^patternCoding.system = "urn:iso:std:iso:11073:10101"
* effective[x] 1..
* valueQuantity = $ucum#cm[H2O]