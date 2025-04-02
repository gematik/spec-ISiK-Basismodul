---
topic: FormularDefinitionsVerwaltung
---
## Interaktion: FormularDefinitionsVerwaltung
Die Interaktion FormularDefinitionsVerwaltung dient der Bereitstellung von FormularDefinitionen.
In der ersten Ausbaustufe dieses Moduls wird diese Funktionalität als integraler Bestandteil von FormularRenderern angenommen. Perspektivisch sollten {{pagelink:FormularRenderer}} jedoch in der Lage sein, auch auf externe Quellen, die als FormularDefintiionBereitsteller agieren zugreifen zu können, Beispielsweise nationale Formular-Verzeichnisse oder Formulardefintionen, die vom aufrufenden System (FormularLauncher) bereitgestellt werden.


<plantuml>
@startuml
FormularDefintionAnfrager -> FormularDefinitionBereitsteller : SEARCH Questionnaire
FormularDefinitionBereitsteller -> FormularDefintionAnfrager : SearchSet-Bundle (Questionnaires) 
FormularDefintionAnfrager -> FormularDefinitionBereitsteller : GET Questionnaire
FormularDefinitionBereitsteller -> FormularDefintionAnfrager : Questionnaires
@enduml
</plantuml>

