// ============================================================
// ValueSet: Pupillary response to light (LOINC LL3762-3, Top 3)
// - Zulaessige Antworten:
//   * Reactive to light
//   * Sluggishly reactive to light
//   * Not reactive to light
// - System: http://loinc.org (LA-Antwortcodes)
// ============================================================

ValueSet: MII_VS_ICU_Code_Observation_Pupillenlichtreaktion
Id: mii-vs-icu-code-observation-pupillenlichtreaktion
Title: "MII VS ICU Code Observation Pupillenlichtreaktion"
Description: """Subset der LOINC AnswerList LL3762-3 fuer die Pupillen-Lichtreaktion: reaktiv, traege reaktiv, nicht reaktiv.

Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets/MII_VS_ICU_Code_Observation_Pupillenlichtreaktion.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 04.03.2026"""
* insert Meta

* include $loinc#LA25441-9 "Reactive to light"
* include $loinc#LA24899-9 "Sluggishly reactive to light"
* include $loinc#LA25442-7 "Not reactive to light"
