---
topic: UML
---
<plantuml>
@startuml

box "ISiK konformes System" #LightBlue
participant FormularLauncher
participant FormularDatenQuelle
end box

box "FormularRenderer" #LightGreen
participant FormularRenderer
participant FormularDefinitionsVerwalter
end box

FormularLauncher -> FormularRenderer : Launch 
FormularRenderer <-> FormularDefinitionsVerwalter : FormularDefintionsVerwaltung 
FormularRenderer <-> FormularDatenQuelle :  FormularDatenVorbelegung 
FormularRenderer -> FormularRenderer : FormularRendering
FormularRenderer -> FormularRenderer : FormularDatenValidierung
FormularRenderer -> FormularRenderer : FormularDatenExtraktion
FormularRenderer -> FormularDatenQuelle : FormularDatenRückübermittlung 
@enduml
</plantuml>