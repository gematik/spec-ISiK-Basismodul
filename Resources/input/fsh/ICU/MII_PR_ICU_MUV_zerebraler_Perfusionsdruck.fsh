Profile: MII_PR_ICU_MUV_zerebraler_Perfusionsdruck
Parent: $sd-mii-icu-monitoring-und-vitaldaten
Id: mii-pr-icu-muv-zerebraler-perfusionsdruck
Title: "MII PR ICU MUV zerebraler Perfusionsdruck"
Description: "Dieses Profil dient der spezialisierten Abbildung des zerebralen Perfusionsdrucks (ICP) in der Akutmedizin.

Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/profiles/Monitoring%20und%20Vitaldaten/MII_PR_ICU_MUV_zerebraler_Perfusionsdruck.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 3.3.2026."
* insert Meta
* insert CommonElements

* code.coding[sct] = $sct#250846007
* code.coding[loinc] = $loinc#61017-0
* code.coding[IEEE-11073] = urn:iso:std:iso:11073:10101#153604
* value[x] = $ucum#mm[Hg] "millimeter Mercury column"
* value[x].unit 1..
* bodySite = $sct#263353005