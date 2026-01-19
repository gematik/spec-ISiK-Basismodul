---
topic: FormularDefinitionsVerwaltung
---
## Interaktion: FormularDefinitionsVerwaltung
Die Interaktion FormularDefinitionsVerwaltung dient der Bereitstellung von FormularDefinitionen.
In der ersten Ausbaustufe dieses Moduls wird diese Funktionalität als integraler Bestandteil von FormularRenderern angenommen. Perspektivisch sollten {{pagelink:FormularRenderer}} jedoch in der Lage sein, auch auf externe Quellen, die als FormularDefinitionBereitsteller agieren, zugreifen zu können, beispielsweise auf nationale Formular-Verzeichnisse oder Formulardefintionen, die vom aufrufenden System (FormularLauncher) bereitgestellt werden.


<plantuml>
@startuml
FormularDefinitionAnfrager -> FormularDefinitionBereitsteller : SEARCH Questionnaire
FormularDefinitionBereitsteller -> FormularDefinitionAnfrager : SearchSet-Bundle (Questionnaires) 
FormularDefinitionAnfrager -> FormularDefinitionBereitsteller : GET Questionnaire
FormularDefinitionBereitsteller -> FormularDefinitionAnfrager : Questionnaires
@enduml
</plantuml>

