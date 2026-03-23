---
topic: Ziele
---

Dieses Modul soll die zahlreichen, teilweise sehr komplexen Funktionalitäten, die im SDC-Leitfaden beschreiben sind, auf ein überschaubares aber dennoch nutzenbringendes Minimum reduzieren, um einen leichten Einstieg in die Welt der FHIR-basierten Formulare zu ermöglichen. Die Integration von Tools, die die Nutzung von Formularen ermöglichen (sog. ["FormularRenderer"](Akteure.html#formularrenderer)) soll - soweit möglich - nur mit den bereits vorhandenen Funktionalitäten ISiK-konformer[^1] Anwendungssysteme ermöglicht werden.

Das ISIK-Formular-Modul ist ein Work-in-Progress und derzeit weder final noch verbindlich. Gemeinsam mit interessierten Herstellern soll ein Modul entwickelt werden, das folgende Ziele erfüllt und anschließend verbindlich festgelegt werden kann.
Die Publikation in Stufe 6 stellt einen ersten Entwurf des Moduls dar, der als Diskussionsgrundlage für die weitere Entwicklung und als Basis für erste, prototypische Implementierungen und Connectathons dienen soll.


### Best Practices für Formular-Autoren
* Für [FormularDefinitionsErsteller](Akteure.html#formulardefinitionsersteller) werden klare Vorgaben gemacht werden, was bei der Ausarbeitung standardisierter und austauschbarer [FormularDefinition](StructureDefinition-ISiKFormularDefinition.html)en zu beachten ist, um deren Interoperabilität bestmöglich zu unterstützen.
* Es werden überprüfbare Qualitätsstandards für ISIK-konforme[^1] [FormularDefinition](StructureDefinition-ISiKFormularDefinition.html)en erarbeitet werden.
* Es werden verlässliche Mindestfunktionalitäten festgelegt werden, die von jedem ISIK-konformen[^1] [FormularRenderer](Akteure.html#formularrenderer) implementiert sind und von den Autoren verwendet werden können, ohne befürchten zu müssen, dass die Funktionalität des Formuars in einzelnen Systemen eingeschränkt ist.

### Integration von [FormularRenderer](Akteure.html#formularrenderer)n in ISiK-konforme[^1] Anwendungssysteme
Dieses Modul wird verbindliche Festlegungen treffen, die es beliebigen ISiK-konformen[^1] Anwendungssystemen erlaubt, als [FormularLauncher](Akteure.html#formularlauncher) beliebige, ISiK-konforme[^1] [FormularRenderer](Akteure.html#formularrenderer) mittels standardisierter Verfahren zu integrieren und den Anwendern einen möglichst nahtlosen, redundanzfreien Workflow zu ermöglichen.

### Auffindbarkeit von Formularen
Dieses Modul wird verbindliche Festlegungen für Formular-Metadaten treffen, die die Auffindbarkeit, Selektion und Filterung von [FormularDefinition](StructureDefinition-ISiKFormularDefinition.html)en ermöglicht, um Anwendern relevante Formulare schnell zur Verfügung stellen zu können.

### Darstellung und Verhalten von Formularen
Dieses Modul wird verbindliche  Mindestanforderungen für die Darstellung und das dynamische Verhalten von [FormularDefinition](StructureDefinition-ISiKFormularDefinition.html)en in [FormularRenderer](Akteure.html#formularrenderer)n vorgeben. 
  
### Vorbelegung von Formularen
Diese Modul wird verbindliche Festlegungen für eine verlässliche Vorbelegung von [FormularDaten](StructureDefinition-ISiKFormularDaten.html) anhand entsprechender Annotationen in den Formular-Definitionen und durch Zugriff auf vorhandene Daten im aufrufenden, ISiK-konformen[^1] Anwendungssystem treffen.
  
### Validierung von FormularDaten
Dieses Modul wird verbindliche Vorgaben enthalten, wie [FormularRenderer](Akteure.html#formularrenderer) die erhobenen Daten gegen die [FormularDefinition](StructureDefinition-ISiKFormularDefinition.html) validieren  
 
### Extraktion von FormularDaten in FHIR-Ressourcen 
Dieses Modul wird verbindliche Festlegungen für eine verlässliche Extraktion von validen [FormularDaten](StructureDefinition-ISiKFormularDaten.html) in wiederverwendbare FHIR-Ressourcen anhand entsprechender Annotationen in den Formular-Definitionen treffen.
  
### Rückübermittlung von FormularDaten und Extraktions-Ergebnissen 
Dieses Modul wird verbindliche Festlegungen für eine verlässliche Rückübermittlung von validen [FormularDaten](StructureDefinition-ISiKFormularDaten.html) sowie FHIR-Ressourcen, die durch Extraktion entstanden sind, vom [FormularRenderer](Akteure.html#formularrenderer) an das aufrufende, ISIK-konforme[^1] Anwendungssystem treffen.

### Beispiel-Szenarien und -Formular-Definitionen
Diese Modul wird diverse Beispielszenarien für die Nutzung von FHIR-Questionnaires enthalten sowie Beispiel-Daten, die Entwickler bei der Implementierung ISiK-konformer[^1] [FormularRenderer](Akteure.html#formularrenderer) unterstützen sollen.

[^1]: Unter einem ISiK-konformen (klinischen) Anwendungssystem ist hier ein beliebiges Softwaresystem zu verstehen, das **mindestens** die folgenden Rollen implementiert: [ISiKStammdatenRolle](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc/CapabilityStatement-ISiKCapabilityStatementStammdatenRolle.html) oder [ISiKCompositionKonsumentenRolle](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc/CapabilityStatement-ISiKCapabilityStatementCompositionKonsumentenRolle.html)
