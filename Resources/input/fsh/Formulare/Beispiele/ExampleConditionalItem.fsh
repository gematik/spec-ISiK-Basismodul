Instance: ExampleConditionalItem
InstanceOf: ISiKFormularDefinition

* insert QuestionnaireExamplesMetadata(ExampleConditionalItem)
//Etablieren des Patientenkontextes aus SMART-Launch
* title = "Bedingte Fragestellungen"
* description = "### Beispiel-Questionnaire mit bedingten Fragestellungen/Items  
Die zweite Frage &quot;Was ist denn los?&quot; soll nur gestellt werden, 
wenn die erste Frage &quot;Wie geht's&quot; mit &quot;muss.&quot; beantwortet wurde."


//Teil 2: Bedingte Fragestellungen
* item[+]
  * type = #group
  * linkId = "2"
  * text = "Fragen mit EnableWhen-Bedingung"
  * item[+]
    * type = #choice
    * linkId = "2.1"
    * text = "Wie geht's?"
    * answerOption[+].valueCoding.display = "gut."
    * answerOption[+].valueCoding.display = "geht."
    * answerOption[+].valueCoding.display = "muss."
  * item[+]
    * type = #choice
    * linkId = "2.2"
    * text = "Was ist denn los?"
    * answerOption[+]
      * valueCoding.display = "Nix."
    * answerOption[+]
      * valueCoding.display = "Frag nicht!"
    * enableWhen
      * question = "2.1"
      * operator = #=
      * answerCoding.display = "muss."
   




 

