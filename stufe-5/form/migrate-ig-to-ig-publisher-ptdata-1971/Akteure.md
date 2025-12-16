# Akteure - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* **Akteure**

## Akteure

##

### Formular-Launcher

Unter einem ist in diesem Modul ein Anwendungssystem zu verstehen, das folgende Interkation implementiert:

* Fremdaufruf in der Rolle “Server” **oder**
* SMART-APP-Launch in der Rolle “Server”

### FormularDaten-Quelle

Unter einer Formular-Datenquelle ist in diesem Modul eine Software zu verstehen, die folgende Interaktionen implementiert:

* FormularDatenVorbelegung in der Rolle “Datenbereitsteller”
* FormularDatenRückübermittlung in der Rolle “Empfänger”

### FormularDefinitions-Ersteller

Unter einem FormularDefinitions-Ersteller ist in diesem Modul eine Software oder eine Person zu verstehen, die folgende Interaktionen implementiert oder durchführt:

* FormularDefinition in der Rolle “Autor”

### FormularDefinitions-Verwalter

Unter einem FormularDefinitions-Verwalter ist in diesem Modul eine Software zu verstehen, die folgende Interaktionen unterstützt:

* FormularDefinitionsVerwaltung in der Rolle “FormularDefinitionBereitsteller”

### Formular-Renderer

Unter einem Formular-Renderer ist in diesem Modul eine Software zu verstehen, das folgende Interaktionen implementiert:

* Fremdaufruf in der Rolle “Client”
* SMART-App-Launch in der Rolle “Client”
* Stand-Alone-Launch
* FormularRendering
* FormularDatenVorbelegung in der Rolle “Datenermittler”
* FormularDatenValidierung
* FormularDatenExtraktion
* FormularDatenRückübermittlung in der Rolle “Sender”

### Formular-Renderer-Viewer 

Unter einem Formular-Renderer-Viewer ist in diesem Modul eine Software zu verstehen, das folgende Interaktionen implementiert:

* Fremdaufruf in der Rolle “Client”
* SMART-App-Launch in der Rolle “Client”
* Stand-Alone-Launch
* FormularRendering

