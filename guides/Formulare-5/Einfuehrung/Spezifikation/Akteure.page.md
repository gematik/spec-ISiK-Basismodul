## {{page-title}}

### Formular-Launcher
Unter einem {{pagelink:FormularLauncher}} ist in diesem Modul ein Anwendungssystem zu verstehen, das folgende Interkation implementiert:
* Fremdaufruf in der Rolle "Server" *oder*
* SMART-APP-Launch in der Rolle "Server"

### FormularDaten-Quelle
Unter einer Formular-Datenquelle ist in diesem Modul eine Software zu verstehen, die folgende Interaktionen implementiert:
* FormularDatenVorbelegung in der Rolle "Datenbereitsteller"
* FormularDatenRückübermittlung in der Rolle "Empfänger"

### FormularDefinitions-Ersteller
Unter einem FormularDefinitions-Ersteller ist in diesem Modul eine Software oder eine Person zu verstehen, die folgende Interaktionen implementiert oder durchführt:
* FormularDefinition in der Rolle "Autor"

### FormularDefinitions-Verwalter
Unter einem FormularDefinitions-Verwalter ist in diesem Modul eine Software zu verstehen, die folgende Interaktionen unterstützt:
* FormularDefinitionsVerwaltung in der Rolle "FormularDefinitionBereitsteller"

### Formular-Renderer
Unter einem Formular-Renderer ist in diesem Modul eine Software zu verstehen, das folgende Interaktionen implementiert:
* Fremdaufruf in der Rolle "Client"
* SMART-App-Launch in der Rolle "Client"
* Stand-Alone-Launch
* FormularRendering
* FormularDatenVorbelegung in der Rolle "Datenermittler"
* FormularDatenValidierung
* FormularDatenExtraktion
* FormularDatenRückübermittlung in der Rolle "Sender"

### Formular-Renderer-Viewer <!-- @Simone, meinst du es wäre sinnvoll, auch einen "Lite" Renderer zu haben, der nur QuestionnaireResponse zur Anzeige bringen kann? -->
Unter einem Formular-Renderer-Viewer ist in diesem Modul eine Software zu verstehen, das folgende Interaktionen implementiert:
* Fremdaufruf in der Rolle "Client"
* SMART-App-Launch in der Rolle "Client"
* Stand-Alone-Launch
* FormularRendering

<!--bspw. PlantUML

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
</plantuml> -->

