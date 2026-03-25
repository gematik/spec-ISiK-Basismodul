ValueSet: MII_VS_ICU_Code_Observation_Pupillensymmetrie
Id: mii-vs-icu-code-observation-pupillensymmetrie
Title: "MII VS ICU Code Observation Pupillensymmetrie"
Description: """Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets/MII_VS_ICU_Code_Observation_Pupillenlichtreaktion.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 04.03.2026"""
* insert Meta

* include $sct#301943000 "Pupils equal (finding)" //entspricht isocor
* include $sct#13045009 "Anisocoria (disorder)"
