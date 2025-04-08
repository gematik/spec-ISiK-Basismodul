---
topic: Launch
---
## Launch eines Formular-Renderers

Der Aufruf eines Formular-Renderes kann mit verschiedenen Methoden erfolgen.

### Fremdaufruf
Die Methode des Fremdaufrufes versucht eine Brückentechnologie bereitzustellen, die es heutigen Anwendungssystemen, die noch nicht über eine SMART-Launch-Funktionalität verfügen, dennoch mit einfachsten Mitteln einen Formular-Renderer integrieren zu können. Der Fremdaufruf ist jedoch bewusst  nur rudimentär definiert, da mittelfristig die Umstellung auf den SMART-App-Launch dringendst empfohlen wird.

Beim Fremdaufruf muss sichergestellt sein, dass ein adäquater Sicherheitsmechanismus zum Einsatz kommt, damit der Aufruf nicht bestehende Berechtigungsstrukturen außer Kraft setzt.

Die vorgeschlagenen Übergabe-Parameter sind:

- [obligatorisch] Patientennummer (gängig PID; Identifier am [ISiKPatient](https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient))
    - Ist für die Herstellung eines passenden Launch-Context nach SDC unabdingbar
- [optional] Abrechnungsnummer (gängig Fallnummer; Identifier am [ISiKAbrechnungsfall](https://gematik.de/fhir/isik/StructureDefinition/ISiKAbrechnungsfall))
    - Mit der Abrechnungsnummer kann eingeschränkt werden, welche Encounter für die Extraktion von Daten ausgewählt werden können. Der richtige Encounter muss gemäß der Beschreibungen in [ISiK Basis Stufe 5: Herstellung von Patient- und Encounterkontext](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/UebergreifendeFestlegungen/Patient-Besuch-Kontext) manuell gewahlt werden
- [optional] Aufnahmenummer (Identifier am [ISiKKontaktGesundheitseinrichtung](https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung))
    - Mit der Aufnahmenummer kann der richtige Encounter bereits mit übergeben werden
- [optional] Canonical der {{pagelink:FormularDefinition}}
    - Mittels der Canonical einer {{pagelink:FormularDefinition}} kann der richtige Fragebogen schon vorausgewählt werden
- [obliagtorisch] URL des FHIR-Endpunktes, der für die Ermittlung von Daten zur Vorbelegung sowie die Rückübermittlung der {{pagelink:FormularDaten}}  verwendet werden soll.  


### SMART-App-Launch
Der standardisierte Aufruf einer beliebigen webbbasierten Applikation aus einem klinischen Primärsystem heraus wird im Modul ISiK-Connect beschrieben und sollte für den Aufruf eines Formular-Renderers mit Übergabe eines Benutzer-, Patienten- und Encounterkontextes präferiert zum Einsatz kommen.

### Stand-Alone-Launch
Beim Stand-Alone Launch startet der Benutzer den Formular-Renderer ohne Kontext.  Der Patienten- und Encounter-Kontext wird im Formular-Renderer gemäß der Beschreibungen in [ISiK Basis Stufe 5: Herstellung von Patient- und Encounterkontext](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Festlegungen/Patient-Besuch-Kontext.md) vom Anwender manuell getroffen.

Beim Stand-Alone-Launch muss sichergestellt sein, dass ein adäquater Sicherheitsmechanismus zum Einsatz kommt, damit bestehende Berechtigungsstrukturen nicht außer Kraft gesetzt werden.