// ============================================================
// ValueSet: Pupille als bodySite (links/rechts)
// - Verwendung fuer Lateralisierung der Pupillenuntersuchung
// - Verwendet in Lichtreaktion und Symmetrie-Profilen
// - bodySite bezieht sich explizit auf die Pupille, nicht das Auge
// ============================================================

ValueSet: MII_VS_ICU_BodySite_Observation_Pupillenbefund
Id: mii-vs-icu-bodysite-observation-pupillenbefund
Title: "MII VS ICU BodySite Observation Pupillenbefund"
Description: """ Zulaessige Koerperstellen fuer lateralisierte Pupillenbefunde: linke oder rechte Pupille.

Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets/MII_VS_ICU_BodySite_Observation_Pupillenbefund.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 04.03.2026"""
* insert Meta

* include $sct#16089004 "Structure of pupil of left eye"
* include $sct#52378001 "Structure of pupil of right eye"
