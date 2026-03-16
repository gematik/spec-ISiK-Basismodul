Profile: MII_PR_ICU_Devicemetric_Eingestellte_Gemessene_Parameter_Beatmung
Parent: DeviceMetric
Id: mii-pr-icu-vent-dm-eingestellte-gemessene-parameter-beatmung
Title: "MII PR ICU DeviceMetric Eingestellte Gemessene Parameter Beatmung"
* insert PR_CS_VS_Version
* insert Publisher
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-icu/StructureDefinition/mii-pr-icu-devicemetric-eingestellte-gemessene-parameter-beatmung"
* ^status = #active

* type MS
* type from mii-vs-icu-category-procedure-beatmung-snomed (required)
* type.coding MS
* type.coding ^patternCoding.system = "http://snomed.info/sct"
* type.coding.system 1.. MS
* type.coding.code 1.. MS
* source only Reference(MII_PR_ICU_Device)
* source MS
* category MS