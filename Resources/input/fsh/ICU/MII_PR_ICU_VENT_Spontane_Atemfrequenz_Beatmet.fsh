Profile: MII_PR_ICU_Spontane_Atemfrequenz_Beatmet
Parent: MII_PR_ICU_Parameter_Von_Beatmung
Id: mii-pr-icu-vent-spontane-atemfrequenz-beatmet
Title: "MII PR ICU Spontane Atemfrequenz Beatmet"
* insert PR_CS_VS_Version
* insert Publisher
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/mii-pr-icu-spontane-atemfrequenz-beatmet"
* ^status = #active

* code.coding 2..
* code.coding[sct] 1..1
* code.coding[sct].code = #271625008
* code.coding[loinc] ..0
* code.coding[loinc] ^patternCoding.system = $loinc
* code.coding[IEEE-11073] 1..1
* code.coding[IEEE-11073] ^patternCoding.system = "urn:iso:std:iso:11073:10101"
* code.coding[IEEE-11073] ^patternCoding.code = #152498
* effective[x] 1..
* value[x] = $ucum#/min