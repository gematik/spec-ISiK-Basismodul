---
topic: markdown-UebergreifendeFestlegungen-UebergreifendeFestlegungen
---

In diesem Kapitel werden die folgenden übergreifenden Festlegungen definiert, die generell für die weitere Spezifikation gelten.

### Kompatibilität zu SDC (Structured Data Capture) 

Diese Spezifikation selektiert Funktionalitäten aus der FHIR-Kernspezifikation und dem SDC-Implementierungsleitfaden, 
die als Minimalanforderungen gelten, um intelligente, standardisierte Formulare im Deutschen Gesundheitswesen 
nutzbringend etablieren zu können.

Die Funktionalitäten werden in weiteren Ausbaustufen sukzessive ergänzt.

Die folgende Tabelle soll eine grobe Übersicht bieten, welche Funktionalitäten der SDC-Spezifikation derzeit von ISiK-Formularen abgedeckt werden
und welche nicht.

|SDC-Kapitel|in scope|out of scope|
|-
|Workflow|SDC Form Filler<br>SDC Form Manager<br>SDC Response Manager<br>SDC Form Receiver<br>|SDC Form Designer<br>SDC Form Archiver|
|Finding a Questionnaire|API Search|workflow based|
|Advanced Form Rendering|FHIR R4 Core|Core-Extensions<br>SDC-Extensions|
|Form Behavior and Calculation|FHIR R4 Core|Core-Extensions<br>SDC-Extensions|
|Modular Forms||X|
|Adaptive Forms||X|
|Form Population|
|&emsp;*Operations:*||X|
|&emsp;*Modes:*|Full population|Answer context<br>Choice selection|
|&emsp;*Design:*| Observation Based<br> Expression Based|StructureMap based|
|Form Data Extraction|
|&emsp;*Design:*| Observation Based|Definition Based <br> StructureMap based|

### Übergreifende Festlegungen

Es gelten die Festlegungen aus dem Modul [ISiK Basis Stufe 5](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Festlegungen).
