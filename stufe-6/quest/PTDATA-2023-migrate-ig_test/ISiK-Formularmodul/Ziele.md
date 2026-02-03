# Ziele - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* **Ziele**

## Ziele

Dieses Modul soll die zahlreichen, teilweise sehr komplexen Funktionalitäten, die im SDC-Leitfaden beschreiben sind, auf ein überschaubares aber dennoch nutzenbringendes Minimum reduzieren, um einen leichten Einstieg in die Welt der FHIR-basierten Formulare zu ermöglichen. Die Integration von Tools, die die Nutzung von Formularen ermöglichen (sog. “”) soll - soweit möglich - nur mit den bereits vorhandenen Funktionalitäten ISiK-konformer[1](#fn:1) Anwendungssysteme ermöglicht werden.

Das ISIK-Formular-Modul ist ein Work-in-Progress und derzeit weder final noch verbindlich. Gemeinsam mit interessierten Herstellern soll ein Modul entwickelt werden, das folgende Ziele erfüllt und anschließend verbindlich festgelegt werden kann. Die Publikation in Stufe 5 stellt einen ersten Entwurf des Moduls dar, der als Diskussionsgrundlage für die weitere Entwicklung und als Basis für erste, prototypische Implementierungen und Connectathons dienen soll.

### Best Practices für Formular-Autoren

* Für werden klare Vorgaben gemacht werden, was bei der Ausarbeitung standardisierter und austauschbarer en zu beachten ist, um deren Interoperabilität bestmöglich zu unterstützen.
* Es werden überprüfbare Qualitätsstandards für ISIK-konforme[1](#fn:1) FormularDefinitionen erarbeitet werden.
* Es werden verlässliche Mindestfunktionalitäten festgelegt werden, die von jedem ISIK-konformen[1](#fn:1) implementiert sind und von den Autoren verwendet werden können, ohne befürchten zu müssen, dass die Funktionalität des Formuars in einzelnen Systemen eingeschränkt ist.

### Integration von n in ISiK-konforme1 Anwendungssysteme

Dieses Modul wird verbindliche Festlegungen treffen, die es beliebigen ISiK-konformen[1](#fn:1) Anwendungssystemen erlaubt, als beliebige, ISiK-konforme[1](#fn:1) mittels standardisierter Verfahren zu integrieren und den Anwendern einen möglichst nahtlosen, redundanzfreien Workflow zu ermöglichen.

### Auffindbarkeit von Formularen

Dieses Modul wird verbindliche Festlegungen für Formular-Metadaten treffen, die die Auffindbarkeit, Selektion und Filterung von en ermöglicht, um Anwendern relevante Formulare schnell zur Verfügung stellen zu können.

### Darstellung und Verhalten von Formularen

Dieses Modul wird verbindliche Mindestanforderungen für die Darstellung und das dynamische Verhalten von en in n vorgeben.

### Vorbelegung von Formularen

Diese Modul wird verbindliche Festlegungen für eine verlässliche Vorbelegung von anhand entsprechender Annotationen in den Formular-Definitionen und durch Zugriff auf vorhandene Daten im aufrufenden, ISiK-konformen[1](#fn:1) Anwendungssystem treffen.

### Validierung von FormularDaten

Dieses Modul wird verbindliche Vorgaben enthalten, wie die erhobenen Daten gegen die validieren

### Extraktion von FormularDaten in FHIR-Ressourcen

Dieses Modul wird verbindliche Festlegungen für eine verlässliche Extraktion von validen in wiederverwendbare FHIR-Ressourcen anhand entsprechender Annotationen in den Formular-Definitionen treffen.

### Rückübermittlung von FormularDaten und Extraktions-Ergebnissen

Dieses Modul wird verbindliche Festlegungen für eine verlässliche Rückübermittlung von validen sowie FHIR-Ressourcen, die durch Extraktion entstanden sind, vom an das aufrufende, ISIK-konforme[1](#fn:1) Anwendungssystem treffen.

### Beispiel-Szenarien und -Formular-Definitionen

Diese Modul wird diverse Beispielszenarien für die Nutzung von FHIR-Questionnaires enthalten sowie Beispiel-Daten, die Entwickler bei der Implementierung ISiK-konformer[1](#fn:1) unterstützen sollen.

* [ISiKStammdatenRolle](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Artefakte/CapabilityStatements#ISiKCapabilityStatementStammdatenRolle)
* [ISiKCompositionKonsumentenRolle](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Artefakte/CapabilityStatements?#ISiKCapabilityStatementCompositionKonsumentenRolle)

1. Unter einem ISiK-konformen (klinischen) Anwendungssystem ist hier ein beliebiges Softwaresystem zu verstehen, das **mindestens** die folgenden Rollen implementiert: [↩](#fnref:1) [↩2](#fnref:1:1) [↩3](#fnref:1:2) [↩4](#fnref:1:3) [↩5](#fnref:1:4) [↩6](#fnref:1:5) [↩7](#fnref:1:6) [↩8](#fnref:1:7) [↩9](#fnref:1:8)

