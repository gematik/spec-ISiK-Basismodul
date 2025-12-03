Extension: ISiKMDRRelevanzFormularExtension
Id: ISiKMDRRelevanzFormularExtension
Description: "Mit der Extension wird die Medizinprodukt-Relevanz angegeben. Ist die Extension nicht vorhanden, ist nichts in Richtung der MDR zu beachten. Sobald sie vorhanden ist, müssen ggf. Voraussetzung zur Befüllung oder Anzeige erfüllt sein. Im aktuellen Rahmen des Moduls sind diese aber nicht weiter spezifizert."
Context: Questionnaire, QuestionnaireResponse
* insert Meta
* . ^isModifier = true
* . ^isModifierReason = "Ist in dieser Extension nicht der Code 'none' gesetzt, muss die Anzeige rechtlich geprüft werden, weil der FormularDefinitionErsteller eine Relevanz im Rahmen der MDR identifiziert hat." 
* value[x] only Coding
* valueCoding 1..1
* valueCoding from ISiKMDRRelevanzFormularVS (extensible)

CodeSystem: ISiKMDRRelevanzFormular
Id: ISiKMDRRelevanzFormularCS
* insert Meta
* #rel "relevant (nicht näher spezifiziert)" "Questionnaire oder QuestionnaireResponse fallen laut Zweckbestimmung unter die MDR (genauere Spezifikationen können in weiteren Ausbaustufen folgen.)"

ValueSet: ISiKMDRRelevanzFormularVS
Id: ISiKMDRRelevanzFormularVS
* insert Meta
* include codes from system ISiKMDRRelevanzFormular