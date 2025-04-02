---
topic: Einfuehrung
---

<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Basismodul/main-isik-stufe-3/Material/images/Gematik_Logo_Flag.svg" alt="gematik logo" width="400"/>  


Version: 5.0.0-rc 
Datum: 26.02.2025
Status: Draft  
Realm: Deutschland  

Abgekündigte Versionen oder Zwischenveröffentlichungen der Implementierungsleitfäden finden Sie unter: https://gematik.github.io/spec-ISiK-Basismodul/index.html

# Interoperabler Datenaustausch durch Informationssysteme im Krankenhaus (ISiK)

Die gematik wurde vom Gesetzgeber beauftragt, im Benehmen mit der Deutschen Krankenhausgesellschaft (DKG) und den maßgeblichen Bundesverbänden der Industrie im Gesundheitswesen, verbindliche Standards für den Austausch von Gesundheitsdaten mit Informationssystemen im Krankenhaus zu erarbeiten. Dieser FHIR ImplementationGuide (IG) beschreibt die für diesen Zweck entwickelten FHIR Profile und das [REST](https://de.wikipedia.org/wiki/Representational_State_Transfer)-basierte Application Programming Interface (API). Die REST-API wird im Wesentlichen [vom FHIR Standard vorgegeben](https://www.hl7.org/fhir/R4/http.html). Dieser Leitfaden konkretisiert die ISiK-relevanten Funktionen der Standard-REST-API und trifft inhaltliche Festlegungen zu den ISiK-relevanten Ressourcen in Form von Ressourcen-Profilen.

Hersteller bestätigungsrelevanter Systeme sollen durch diesen IG in die Lage versetzt werden, eine konforme Implementierung zu erstellen und das Bestätigungsverfahren der gematik erfolgreich zu absolvieren.

Weitere Informationen siehe [§373 SGB V](https://www.gesetze-im-internet.de/sgb_5/__373.html).

Hinweis: Sowohl für die Implementierung der ISiK-Spezifikation als auch für den Betrieb eines Produktes, das die ISiK-Spezifikation implementiert, ist eine SNOMED-CT-Lizenz notwendig. Diese kann beim [National Release Center für SNOMED CT in Deutschland](https://www.bfarm.de/DE/Kodiersysteme/Terminologien/SNOMED-CT/_node.html) beantragt werden.

# Modul "ISiK Formulare"

## Motivation
Der überwiegende Teil der Datenerfassung im Gesundheitswesen geschieht formularbasiert. Bislang fehlt es jedoch an einem standardisierten Verfahren, um Fragebögen und Formulare zwischen Systemen austauschen und mit den bereits vorhandenen, standardisierten Daten in den Systemen der Anwender zu verknüpfen.
Die Folge sind lange Latenzen, bis die Formulare den Anwendern zur Verfügung stehen, hohe Kosten für die individuelle Implementierung und Konfiguration in den proprietären Formulareditoren der einzelnen Systeme,
und redundante Datenerfassung aufgrund der fehlenden Verknüpfungen zu den bereits vorhandenen Daten. 
Aufgrund uneinheitlicher Modellierung der Formulare, sind die erhobenen Daten häufig nicht wiederverwendbar.

Der FHIR-Standard bietet mit dem internationalen Implementierungsleitfaden "Structured Data Capture (SDC)" eine Lösung für schnelles Deployment von standardisierten Formularen im Versorgungskontext. 
Die Ermittung von relevanten Informationen über die FHIR-Restful-API ermöglicht die automatische Vorbefüllung der Formulare und verhindert eine redundante Datenerfassung.
Die Extraktion der {{pagelink:FormularDaten}} in dedizierte FHIR-Ressourcen ermöglicht die Wiederverwendung der erhobenen Daten und erleichtert deren Auffindbarkeit.
Die vielfältigen Möglichkeiten der Datenvalidierung im FHIR-Kontext stellen die Vergleichbarkeit und Qualität der erhobenen Daten sicher.

Mögliche Einsatzszenarien sind u.a.:

* Erfassung von Meldedatensätzen für Register
* Verwendung von durch Fachgesellschaften standardisierten Formularen oder Protokollen (OP-Dokumentation, Anamnesebögen...)
* Patientenbefragungen
* Protokolle für klin. Studien

## Ziele

Dieses Modul soll die zahlreiche, teilweise sehr komplexen Funktionalitäten, die im SDC-Leitfaden beschreiben sind, auf ein überschaubares aber dennoch nutzbringendes Minimum reduzieren, um einen leichten Einstig in die Welt der FHIR-basierten Formulare zu ermöglichen. Die Integration von Tools, die die Nutzung von Formularen ermöglichen (sog. "{{pagelink:FormularRenderer}}") soll - soweit möglich - nur mit den bereits vorhandenen Funktionalitäten ISiK-konformer[^1] Anwendungssysteme ermöglicht werden.

Das ISIK-Formular-Modul ist ein Work-in-Progress und derzeit weder final noch verbindlich. Gemeinsam mit interessierten Herstellern soll ein Modul entwickelt werden, das folgende Ziele erfüllt und anschließend verbindlich festgelegt werden kann.
Die Publikation in Stufe 5 stellt einen ersten Entwurf des Moduls dar, der als Diskussionsgrundlage für die weitere Entwicklung und als Basis für erste, prototypische Implementierungen und Connectathons dienen soll.


### Best Practices für Formular-Autoren
* Für {{pagelink:FormularDefinitionsErsteller}} werden klare Vorgaben gemacht werden, was bei der Ausarbeitung standardisierter und austauschbarer {{pagelink:FormularDefinition}}en zu beachten ist, um deren Interoperabilität bestmöglich zu unterstützen.
* Es werden überprüfbare Qualitätsstandards für ISIK-konforme[^1] FormularDefinitionen erarbeitet werden.
* Es werden verlässliche Mindestfunktionalitäten festgelegt werden, die von jedem ISIK-konformen[^1] {{pagelink:FormularRenderer}} implementiert sind und von den Autoren verwendet werden können, ohne befürchten zu müssen, dass die Funktionalität des Formuars in einelnen Systemen eingeschränkt ist.

### Integration von {{pagelink:FormularRenderer}}n in ISiK-konforme[^1] Anwendungssysteme
Dieses Modul wird verbindliche Festlegungen treffen, die es beleibigen. ISiK-konformen[^1] Anwendungssystemen erlaubt, als {{pagelink:FormularLauncher}} beliebige, ISiK-konforme[^1] {{pagelink:FormularRenderer}} mittels standardisierter Verfahren zu integrieren und den Anwendern einen möglichst nahtlosen, redundanzfreien Workflow zu ermöglichen.

### Auffindbarkeit von Formularen
Dieses Modul wird verbindliche Festlegungen für Formular-Metadaten treffen, die die Auffindbarkeit, Selektion und Filterung von {{pagelink:FormularDefinition}}en ermöglicht, um Anwendern relevante Formulare schnell zur Verfügung stellen zu können.

### Darstellung und Verhalten von Formularen
Dieses Modul wird verbindliche  Mindestanforderungen für die Darstellung und das dynamische Verhalten von {{pagelink:FormularDefinition}}en in {{pagelink:FormularRenderer}}n vorgeben. 
  
### Vorbelegung von Formularen
Diese Modul wird verbindliche Festlegungen für eine verlässliche Vorbelegung von {{pagelink:FormularDaten}} anhand entsprechender Annotationen in den Formular-Definitionen und durch Zugriff auf vorhandene Daten im aufrufenden, ISiK-konformen[^1] Anwendungssystem treffen.
  
### Validierung von FormularDaten
Dieses Modul wird verbindliche Vorgaben enthalten, die {{pagelink:FormularRenderer}} die erhobenen Daten gegen die {{pagelink:FormularDefinition}} validieren  
 
### Extraktion von FormularDaten in FHIR-Ressourcen 
Dieses Modul wird verbindliche Festlegungen für eine verlässliche Extraktion von validen {{pagelink:FormularDaten}} in wiederverwendbare FHIR-Ressourcen anhand entsprechender Annotationen in den Formular-Definitionen treffen.
  
### Rückübermittlung von FormularDaten und Extraktions-Ergebnissen 
Dieses Modul wird verbindliche Festlegungen für eine verlässliche Rückübermittlung von validen {{pagelink:FormularDaten}} sowie FHIR-Ressourcen, die durch Extraktion entstanden sind, vom {{pagelink:FormularRenderer}} an das aufrufende, ISIK-konforme[^1] Anwendungssystem treffen.

### Beispiel-Szenarien und -Formular-Definitionen
Diese Modul wird diverse Beispielszenarien für die Nutzung von FHIR-Questionnaires enthalten sowie Beispiel-Daten, die Entwickler bei der Implementierung ISiK-konformer[^1] {{pagelink:FormularRenderer}} unterstützen sollen.

[^1]: Unter einem ISiK-konformen (klinischen) Anwendungssystem ist hier ein beliebiges Softwaresystem zu verstehen, das **mindestens** die folgenden Rollen implementiert:
* [ISiKStammdatenRolle](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Artefakte/CapabilityStatements#ISiKCapabilityStatementStammdatenRolle)
* [ISiKCompositionKonsumentenRolle](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Artefakte/CapabilityStatements?#ISiKCapabilityStatementCompositionKonsumentenRolle)


  
## Weitere Links
<!-- z. B. Beschreibungen des UseCases, Datenmodell, ges. Vorgaben, fachliche Anforderungen, relevante Spezifikationen-->
* [FHIR Questionnaires](https://hl7.org/fhir/questionnaire.html)
* [Structured Data Capture Implementation Guide](https://build.fhir.org/ig/HL7/sdc/)

## Mitwirkung
Die Abstimmung und Diskussion zu diesem Modul findet im  [ISiK-Unterforum](https://chat.fhir.org/#streams/287581/german.2Fisik) des [internationalen FHIR-Chats](https://chat.fhir.org/) statt.
**Bei der Anlage neuer Diskussionsthemen mit Bezug zu diesem Modul bitte das Präfix `[FORM]` verwenden!**

# Hinweise

**Kontakt**

Bringen Sie Allgemeine Fragen und Anmerkungen gerne über unser Anfrageportal ein: [Anfragen ISiK + ISiP](https://service.gematik.de/servicedesk/customer/portal/16)

Falls Sie keinen Zugang zum Anfrageportal haben und dieses nutzen wollen, senden Sie uns bitte eine Nachricht an die Adresse isik [ at ] gematik.de mit dem Betreff "Portalzugang".

**Herausgeber**

gematik GmbH

[Impressum](https://www.gematik.de/impressum/)

**Gender-Hinweis**

Zugunsten des Leseflusses wird in dieser Publikation meist die
männliche Form verwendet. Wir bitten, dies nicht als Zeichen einer
geschlechtsspezifischen Wertung zu deuten. Diese Variante deckt auch alle
weiteren Geschlechter, neben männlich und weiblich, ab.














