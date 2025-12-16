# Kompatibilität - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* **Kompatibilität**

## Kompatibilität

## Kompatibilität zu SDC (Structured Data Capture)

Diese Spezifikation selektiert Funktionalitäten aus der FHIR-Kernspezifikation und dem SDC-Implementierungsleitfaden, die als Minimalanforderungen gelten, um intelligente, standardisierte Formulare im Deutschen Gesundheitswesen nutzbringend etablieren zu können.

Die Funktionalitäten werden in weiteren Ausbaustufen sukzessive ergänzt.

Die folgende Tabelle soll eine grobe Übersicht bieten, welche Funktionalitäten der SDC-Spezifikation derzeit von ISiK-Formularen abgedeckt werden und welche nicht.

| | | |
| :--- | :--- | :--- |
| Workflow | SDC Form Filler</br>SDC Form Manager</br>SDC Response Manager</br>SDC Form Receiver</br> | SDC Form Designer</br>SDC Form Archiver |
| Finding a Questionnaire | API Search | workflow based |
| Advanced Form Rendering | FHIR R4 Core | Core-Extensions</br>SDC-Extensions |
| Form Behavior and Calculation | FHIR R4 Core | Core-Extensions</br>SDC-Extensions |
| Modular Forms |   | X |
| Adaptive Forms |   | X |
| Form Population |   |   |
|  **Operations:** |   | X |
|  **Modes:** | Full population | Answer context</br>Choice selection |
|  **Design:** | Observation Based</br> Expression Based | StructureMap based |
| Form Data Extraction |   |   |
|  **Design:** | Observation Based | Definition Based </br> StructureMap based |

