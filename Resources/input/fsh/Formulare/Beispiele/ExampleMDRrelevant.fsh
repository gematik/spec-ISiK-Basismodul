Instance: ExampleMdrRelevant
InstanceOf: ISiKFormularDefinition
* insert QuestionnaireExamplesMetadata(ExampleMdrRelevant)
* title = "Formular aus einem Medizinprodukt"
* description = "### Beispiel-Questionnaire, welches eine MDR-Relevanz ausweist
* Angabe der MDR-Relevanz mittels [ISiKMDRRelevanzFormular](https://simplifier.net/isik-stufe-5/isikmdrrelevanzformularextension)-Extension
Disclaimer: Dies ist ein simples fantasie Beispiel und hat keine medizinische Aussagekraft. Das erwartete Verhalten von Systemen, die mit diesem Questionnaire testen wäre, dass das Formular mit einer Fehlermeldung *nicht* rendert!"
* modifierExtension[MDR-Relevant].valueCoding = ISiKMDRRelevanzFormular#rel
* item[+]
  * type = #group
  * linkId = "1"
  * text = "Fragen mit Entscheidungspfad, der MDR-relevant ist"
  * item[+]
    * type = #integer
    * linkId = "1.1"
    * text = "Wie hoch ist dein systolischer Blutdruck (oberer Wert)?"
  * item[+]
    * type = #display
    * linkId = "1.1-Krank"
    * text = "Du sollst zum Arzt!"
    * enableWhen
      * question = "1.1"
      * operator = #>=
      * answerInteger = 90
  * item[+]
    * type = #display
    * linkId = "1.1-Gesund"
    * text = "Du sollst nicht zum Arzt!"
    * enableWhen
      * question = "1.1"
      * operator = #<
      * answerInteger = 90