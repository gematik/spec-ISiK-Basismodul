# Ziele - ISiK Formularmodul Implementation Guide v6.0.0

ISiK Formularmodul Implementation Guide

Version 6.0.0 - ballot 

* [**Table of Contents**](toc.md)
* **Ziele**

## Ziele

Dieses Modul soll die zahlreichen, teilweise sehr komplexen Funktionalitäten, die im SDC-Leitfaden beschrieben sind, auf ein überschaubares aber dennoch nutzenbringendes Minimum reduzieren, um einen leichten Einstieg in die Welt der FHIR-basierten Formulare zu ermöglichen. Die Integration von Tools, die die Nutzung von Formularen ermöglichen (sog. ["FormularRenderer"](Akteure.md#formularrenderer)) soll - soweit möglich - nur mit den bereits vorhandenen Funktionalitäten ISiK-konformer[1](#fn:1) Anwendungssysteme ermöglicht werden.

Das ISIK-Formular-Modul ist ein Work-in-Progress und derzeit weder final noch verbindlich. Gemeinsam mit interessierten Herstellern soll ein Modul entwickelt werden, das folgende Ziele erfüllt und anschließend verbindlich festgelegt werden kann. Die Publikation in Stufe 6 stellt einen ersten Entwurf des Moduls dar, der als Diskussionsgrundlage für die weitere Entwicklung und als Basis für erste, prototypische Implementierungen und Connectathons dienen soll.

### Best Practices für Formular-Autoren

* Für [FormularDefinitionsErsteller](Akteure.md#formulardefinitionsersteller) werden klare Vorgaben gemacht werden, was bei der Ausarbeitung standardisierter und austauschbarer [FormularDefinition](StructureDefinition-ISiKFormularDefinition.md)en zu beachten ist, um deren Interoperabilität bestmöglich zu unterstützen.
* Es werden überprüfbare Qualitätsstandards für ISIK-konforme[1](#fn:1) [FormularDefinition](StructureDefinition-ISiKFormularDefinition.md)en erarbeitet werden.
* Es werden verlässliche Mindestfunktionalitäten festgelegt werden, die von jedem ISIK-konformen[1](#fn:1) [FormularRenderer](Akteure.md#formularrenderer) implementiert sind und von den Autoren verwendet werden können, ohne befürchten zu müssen, dass die Funktionalität des Formulars in einzelnen Systemen eingeschränkt ist.

### Integration von FormularRenderern in ISiK-konforme1 Anwendungssysteme

Dieses Modul wird verbindliche Festlegungen treffen, die es beliebigen ISiK-konformen[1](#fn:1) Anwendungssystemen erlaubt, als [FormularLauncher](Akteure.md#formularlauncher) beliebige, ISiK-konforme[1](#fn:1) [FormularRenderer](Akteure.md#formularrenderer) mittels standardisierter Verfahren zu integrieren und den Anwendern einen möglichst nahtlosen, redundanzfreien Workflow zu ermöglichen.

### Auffindbarkeit von Formularen

Dieses Modul wird verbindliche Festlegungen für Formular-Metadaten treffen, die die Auffindbarkeit, Selektion und Filterung von [FormularDefinition](StructureDefinition-ISiKFormularDefinition.md)en ermöglicht, um Anwendern relevante Formulare schnell zur Verfügung stellen zu können.

### Darstellung und Verhalten von Formularen

Dieses Modul wird verbindliche Mindestanforderungen für die Darstellung und das dynamische Verhalten von [FormularDefinition](StructureDefinition-ISiKFormularDefinition.md)en in [FormularRenderer](Akteure.md#formularrenderer)n vorgeben.

### Vorbelegung von Formularen

Dieses Modul wird verbindliche Festlegungen für eine verlässliche Vorbelegung von [FormularDaten](StructureDefinition-ISiKFormularDaten.md) anhand entsprechender Annotationen in den Formular-Definitionen und durch Zugriff auf vorhandene Daten im aufrufenden, ISiK-konformen[1](#fn:1) Anwendungssystem treffen.

### Validierung von FormularDaten

Dieses Modul wird verbindliche Vorgaben enthalten, wie [FormularRenderer](Akteure.md#formularrenderer) die erhobenen Daten gegen die [FormularDefinition](StructureDefinition-ISiKFormularDefinition.md) validieren.

### Extraktion von FormularDaten in FHIR-Ressourcen

Dieses Modul wird verbindliche Festlegungen für eine verlässliche Extraktion von validen [FormularDaten](StructureDefinition-ISiKFormularDaten.md) in wiederverwendbare FHIR-Ressourcen anhand entsprechender Annotationen in den Formular-Definitionen treffen.

### Rückübermittlung von FormularDaten und Extraktions-Ergebnissen

Dieses Modul wird verbindliche Festlegungen für eine verlässliche Rückübermittlung von validen [FormularDaten](StructureDefinition-ISiKFormularDaten.md) sowie FHIR-Ressourcen, die durch Extraktion entstanden sind, vom [FormularRenderer](Akteure.md#formularrenderer) an das aufrufende, ISIK-konforme[1](#fn:1) Anwendungssystem treffen.

### Beispiel-Szenarien und -Formular-Definitionen

Diese Modul wird diverse Beispielszenarien für die Nutzung von FHIR-Questionnaires enthalten sowie Beispiel-Daten, die Entwickler bei der Implementierung ISiK-konformer[1](#fn:1) [FormularRenderer](Akteure.md#formularrenderer) unterstützen sollen.

1. Unter einem ISiK-konformen (klinischen) Anwendungssystem ist hier ein beliebiges Softwaresystem zu verstehen, das **mindestens** die folgenden Rollen implementiert: [ISiKStammdatenRolle](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc1/CapabilityStatement-ISiKCapabilityStatementStammdatenRolle.html) oder [ISiKCompositionKonsumentenRolle](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc1/CapabilityStatement-ISiKCapabilityStatementCompositionKonsumentenRolle.html) [↩](#fnref:1) [↩2](#fnref:1:1) [↩3](#fnref:1:2) [↩4](#fnref:1:3) [↩5](#fnref:1:4) [↩6](#fnref:1:5) [↩7](#fnref:1:6) [↩8](#fnref:1:7) [↩9](#fnref:1:8)

