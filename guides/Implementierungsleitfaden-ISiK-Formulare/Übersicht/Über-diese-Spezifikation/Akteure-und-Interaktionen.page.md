## {{page-title}}

* ISiK-Basismodul-konformes Primärsystem ("KIS")
  gruppiert die SDC-Rollen "SDC Form Archiver", "SDC Form Receiver", optional: "SDC Form Manager",
* Questionnaire-Renderer ("QuestionnaireRenderer")
  gruppiert die SDC-Rollen "SDC Form Filler", optional: "SDC Form Manager"</br>
  verwendet die Funktionen:
  * Questionnaire Prepopulation Service ("PrepopulationService")
  * Questionnaire Extraction Service ("ExtractionService")


<!--bspw. PlantUML-->

<plantuml>
@startuml
actor Anwender
Anwender -> KIS : wähle Patientenkontext
KIS -> QuestionnaireRenderer : zeige Formular an
QuestionnaireRenderer -> PrepopulationService : befülle Formular
PrepopulationService <-> KIS : lade relevante Ressourcen
PrepopulationService -> QuestionnaireRenderer : übermittle vorbefülltes Formular
Anwender -> QuestionnaireRenderer : ergänze Formular
QuestionnaireRenderer -> ExtractionService : extrahiere Ressourcen
ExtractionService -> QuestionnaireRenderer : übermittle Ressourcen
QuestionnaireRenderer -> KIS : übermittle ausgefülltes Formular und extrahierte Ressourcen
@enduml
</plantuml>

