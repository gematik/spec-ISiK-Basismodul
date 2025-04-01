Extension: ISiKMDRRelevanzFormularExtension
Id: ISiKMDRRelevanzFormularExtension
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
* #none "keine relevant" "Questionnaire oder QuestionnaireResponse fallen laut Zweckbestimmung nicht unter die MDR"
* #rel "relevant (nicht näher spezifiziert)" "Questionnaire oder QuestionnaireResponse fallen laut Zweckbestimmung unter die MDR (genauere Spezifikationen können in weiteren Ausbaustufen folgen.)"

ValueSet: ISiKMDRRelevanzFormularVS
Id: ISiKMDRRelevanzFormularVS
* insert Meta
* include codes from system ISiKMDRRelevanzFormular