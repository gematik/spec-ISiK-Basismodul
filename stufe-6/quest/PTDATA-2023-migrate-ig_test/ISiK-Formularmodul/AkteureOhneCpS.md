# Festlegungen Akteure ohne CapabilityStatement - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* **Festlegungen Akteure ohne CapabilityStatement**

## Festlegungen Akteure ohne CapabilityStatement

Auf der Seite [Akteure](Akteure.md) definiert finden sich Akteure im Kontext dieses Moduls, die nicht miuttels eines CapabilityStatement definiert sind. Diese Akteure sind entweder nicht technisch über Interaktionen mit einzelnen FHIR-Ressourcen abbildbar, oder beschreiben Komponenten, die ein Frontend betreffen. Um eine vergleichbare Vorgabe zur Implementierung zu geben, sind die Anforderungen im Folgenden aufgeführt.

### Anforderungen FormularLauncher

Im FormularLauncher Akteur gibt es drei beschriebene Varianten. Je nach umgesetzter Variante sind unterschiedliche Anforderungen gültig. Die Bestätigung des Launcher erfordert die Implementierung mindestens eines der Verfahren (SHALL).

#### Fremdaufruf

[Beschreibung des Akteur](Akteure.md#formularlauncher)

* Parameter Patientennummer 
* SHALL
 
* Parameter URL des FHIR-Endpunktes 
* SHALL
 
* Parameter Abrechnungsnummer 
* MAY
* Ist dieser Parameter nicht implementiert, sollte ein Auswahldialog vorhanden sein, um im Falle eines durch das Formular benötigten Encounter-Kontext, den passenden auszuwählen. Hierbei wird automatisch der aktuellste Encounter eines Abrechnungsfall-Kontextes (Account) genutzt. (SHOULD)
 
* Parameter Aufnahmenummer 
* MAY
* Ist dieser Parameter nicht implementiert, sollte ein Auswahldialog vorhanden sein, um im Falle eines durch das Formular benötigten Encounter-Kontext, den passenden auszuwählen. Hierbei kann aus allen Encounter-Ressourcen eines Abrechnungsfall-Kontextes gewählt werden.(SHOULD)
 
* Parameter Canonical 
* MAY
* Ist dieser Parameter nicht implementiert, sollte ein Auswahldialog vorgahanden sein, bei dem aus verfügbaren FormularDefinitionen ausgewählt werden kann. (SHOULD)
 

#### SMART-App-Launch

TODO

#### Stand-Alone-Launch

Siehe im Abschnitt [FormularRenderer]() TODO.

### Anforderungen FormularDefinitionsErsteller

[Beschreibung des Akteur](Akteure.md#formulardefinitionsersteller)

Die [Best Practice für FormularDefinitionen](Spezifikationen_BestPractice.md) sind zu beachten. (SHALL)

Ein System, welches die Funktionalität zur Erstellung von FormularDefinitionen bereitstellt, darf nur Funktionalitäten anbieten, die im Profil [FormularDefinition](StructureDefinition-ISiKFormularDefinition.md) mit Must-Support gekennzeichnet, oder auf der Seite [Extensions](extensions.md) nicht als Out-of-scope Extension gelistet sind. (SHALL)

Technisch muss das generierte Questionnaire valide zum Profil [FormularDefinition](StructureDefinition-ISiKFormularDefinition.md) sein. (SHALL)

### Anforderungen FormularRenderer

[Beschreibung des Akteur](Akteure.md#formularrenderer)

#### Rolle Fremdaufruf

Siehe im Abschnitt [Fremdaufruf](#fremdaufruf)

#### SMART-App-Launch

Siehe im Abschnitt [SMART-App-Launch](#smart-app-launch)

#### Stand-Alone-Launch

Wird ein FormularRenderer in der Stand-Alone-Variante implementiert, so muss dieser die Möglichkeit bieten, einen Patienten- und/oder Encounter-Kontext auszuwählen, bevor ein Formular ausgefüllt wird. (SHALL)

Wird ein FormularRenderer in der Stand-Alone-Variante implementiert, so muss dieser die Möglichkeit bieten, aus verfügbaren FormularDefinitionen auszuwählen, bevor ein Formular ausgefüllt wird. (SHALL)

Wird ein FormularRenderer in der Stand-Alone-Variante implementiert, so muss dieser die Möglichkeit bieten, zu Konfigurieren, an welchen FHIR-Endpunkt das ausgefüllte Formular versendet wird. (SHALL)

#### FormularRendering

Ein System, welches die Funktionalität zum Rendern von FormularDefinitionen bereitstellt, muss alle unterschiedlichen Funktionalitäten anbieten, die im Profil [FormularDefinition](StructureDefinition-ISiKFormularDefinition.md) mit Must-Support gekennzeichnet, oder auf der Seite [Extensions](extensions.md) nicht als Out-of-scope Extension gelistet sind. (SHALL)

#### FormularDatenVorbelegung

