Extension: ISiKMpFormularExtension
Id: ISiKMpFormularExtension
Description: "Mit dieser Extension besteht die Möglichkeit anzugeben, dass das Formular innerhalb eines Medizinproduktes eingesetzt wird und eine Zweckbestimmung anzugeben ist. Die Interpretation der Zweckbestimmung und der daraus folgenden Konsequenzen für die eingesetzte Software liegt im Verantwortungsbereich des Software-Hersteller!"
Context: Questionnaire, QuestionnaireResponse
* insert Meta
* . ^isModifier = true
* . ^isModifierReason = "Ein Formularrenderer, der sich nicht mit dem Thema MDR und Medizinprodukte auseinandergesetzt hat, sollte hier auf das im FHIR-Standard festgelegte Verhalten bei [modifierExtension](http://hl7.org/fhir/extensibility.html#modifierExtension) zurückgreifen." 
* value[x] only string
* valueString ^short = "Zweckbestimmung"