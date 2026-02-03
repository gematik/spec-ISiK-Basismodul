# Übergreifende Festlegungen - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* **Übergreifende Festlegungen**

## Übergreifende Festlegungen

In diesem Kapitel werden die folgenden übergreifenden Festlegungen definiert, die generell für die weitere Spezifikation gelten.

### Kompatibilität zu SDC (Structured Data Capture)

Diese Spezifikation selektiert Funktionalitäten aus der FHIR-Kernspezifikation und dem SDC-Implementierungsleitfaden, die als Minimalanforderungen gelten, um intelligente, standardisierte Formulare im Deutschen Gesundheitswesen nutzbringend etablieren zu können.

Die Funktionalitäten werden in weiteren Ausbaustufen sukzessive ergänzt.

Die folgende Tabelle soll eine grobe Übersicht bieten, welche Funktionalitäten der SDC-Spezifikation derzeit von ISiK-Formularen abgedeckt werden und welche nicht.

| | | |
| :--- | :--- | :--- |
| Workflow | SDC Form FillerSDC Form ManagerSDC Response ManagerSDC Form Receiver | SDC Form DesignerSDC Form Archiver |
| Finding a Questionnaire | API Search | workflow based |
| Advanced Form Rendering | FHIR R4 Core | Core-ExtensionsSDC-Extensions |
| Form Behavior and Calculation | FHIR R4 Core | Core-ExtensionsSDC-Extensions |
| Modular Forms |   | X |
| Adaptive Forms |   | X |
| Form Population |   |   |
|  **Operations:** |   | X |
|  **Modes:** | Full population | Answer contextChoice selection |
|  **Design:** | Observation BasedExpression Based | StructureMap based |
| Form Data Extraction |   |   |
|  **Design:** | Observation Based | Definition BasedStructureMap based |

### Übergreifende Festlegungen

Es gelten die Festlegungen aus dem Modul [ISiK Basis Stufe 5](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Festlegungen).

