# UML - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* **UML**

## UML

@startuml box "ISiK konformes System" #LightBlue participant FormularLauncher participant FormularDatenQuelle end box box "FormularRenderer" #LightGreen participant FormularRenderer participant FormularDefinitionsVerwalter end box FormularLauncher -> FormularRenderer : Launch FormularRenderer <-> FormularDefinitionsVerwalter : FormularDefintionsVerwaltung FormularRenderer <-> FormularDatenQuelle : FormularDatenVorbelegung FormularRenderer -> FormularRenderer : FormularRendering FormularRenderer -> FormularRenderer : FormularDatenValidierung FormularRenderer -> FormularRenderer : FormularDatenExtraktion FormularRenderer -> FormularDatenQuelle : FormularDatenRückübermittlung @enduml

