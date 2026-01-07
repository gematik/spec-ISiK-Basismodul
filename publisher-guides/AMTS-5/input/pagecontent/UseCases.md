# Use Cases und Versorgungsprozesse

Im Positionspapier [Digital gestützte Medikationsprozesse](https://www.ina.gematik.de/fileadmin/Arbeitskreisdokumente/Ergebnisdokumente/Analyse_der_Medikationsprozesse/Positionspapier_Analyse_der_Medikationsprozesse.pdf) aus dem Arbeitskreis *Analyse der Medikationsprozesse* des Interop Councils sind unter anderem Anwendungsfälle und Versorgungsprozesse für den stationären Sektor aufgeführt. Dieser ist für einen detaillierten Einstieg und Auseinandersetzung mit dem Thema geeignet und bildet die fachliche Grundlage (Motivation) des vorliegenden IG AMTS.


## User Stories und Use Cases

Im folgenden wird eine grob-granulare Übersicht über die User Stories bzw. Use Cases und die zugehörigen technischen Anforderungen gegeben.
User Stories sollen dazu dienen die Bereiche der Bedarfsanalyse grob abzudecken, daraufhin zu präzisieren und die Problemdefinition zu schärfen. Sie fokussieren sich auf den Nutzer und was dieser mit einer Funktionalität erreichen möchte. Use Cases sind eher technisch orientiert und fokussieren verschiedene Einsatzszenarien und deren Anwendungsfälle.

## User Stories - Business

Die User Stories beschreiben die grundlegenden Kontexte, in denen der Bedarf nach einem AMTS-Check und einem entsprechenden Informationsaustausch entsteht.

- **User Story 01** - AMTS Prüfung bei Verordnung, Änderung der Verordnung und Abgabe
   - Ein Heilberufler (insb. Ärzte, Apotheker) möchte AMTS-relevante Informationen abrufen, um eine sichere Verordnung, Änderung einer Verordnung (z.B. Substitution) oder Abgabe einer Medikation zu gewährleisten.
   - **Requirement**: Im Rahmen der Medikationsverordnung, -Änderung oder -Ausgabe MUSS der Nutzer auf AMTS hin prüfen können.
- **User Story 02** - AMTS Prüfung bei neuer Informationslage
   - Ein Heilberufler (insb. Ärzte, Apotheker) möchte AMTS-relevante Informationen abrufen, um eine sichere Abgabe einer Medikation zu gewährleisten.
   - **Requirement**: Im Rahmen neu bekanntgewordener Informationen MUSS der Nutzer auf AMTS hin prüfen können.
- **User Story 03** - Stationäre Aufnahme mit Medikationsumstellung (Medication Reconciliation)
   - Bei der stationären Aufnahme eines Patienten soll die bestehende (häusliche oder ambulante) Medikation mit in das geänderte Versorgungsumfeld übersetzt und angepasst werden, um eine gleichwertige und sichere stationäre Verordnung zu gewährleisten.
   - **Requirement**: Im Rahmen der Patientenaufnahme MUSS der Nutzer auf AMTS hin prüfen können.
- **User Story 04** - Entlassung mit Medikationsumstellung (Medication Reconciliation)
   - Bei der Entlassung eines Patienten aus der stationären Versorgung soll die initiale Medikation mit in das sich ändernde Umfeld übersetzt und angepasst werden, um eine gleichwertige und sichere Weiterführung der Medikation zu gewährleisten.
   - **Requirement**: Im Rahmen der Entlassung MUSS der Nutzer auf AMTS hin prüfen können.

Der zentrale Auslöser einer AMTS-Prüfung und damit auch für die Nutzung der Schnittstellen ist eine vorher unbekannte Informationslage. Die Informationen können initial neu sein, durch den Patienten später in den Prozess hinzugegeben werden, oder sich im Zuge einer Behandlung ergeben.

## Exemplarische Abläufe

**Beispiel-Sequenz Geplanter operativer Eingriff mit stationärem Aufenthalt**  
Ein geriatrischer Patient unterzieht sich einer geplanten Hüftersatzoperation:
* Der Patient kommt am Tag vor dem Eingriff wie vereinbart zur stationären Aufnahme.
* Das Krankenhauspersonal erfasst den relevanten Krankheits- bzw. Versorgungsverlauf.
* Das Krankenhauspersonal erhebt relevante klinische Daten: Anamnese, Untersuchung, Vitalparameter, Allergien, Laborbefunde, Blutbild u.ä.
* Das Krankenhauspersonal erhebt seinen umfassenden Medikationsstatus: Anamnese, Medikationsplan, Einweisung & Begleitdokumentation u.ä.
* Das Krankenhauspersonal erarbeitet einen Vorschlag zur Umstellung auf Krankenhaus Medikation
* Mit Hilfe der Schnittstellen werden alle **AMTS relevanten Informationen konsolidiert** und ein AMTS-Check durchgeführt.
* Der Patient bekommt eine Hüftprothese und wird beobachtet.
* Klinische Daten werden nach dem Eingriff aktualisiert bzw. neu erhoben.
* Zur Entzündungsvermeidung ist eine weitere Verordnung notwendig.
* Im Rahmen des Entlassprozesses erarbeitet das Krankenhauspersonal einen Vorschlag zur Umstellung auf häusliche Gesamtmedikation.
* Mit Hilfe der Schnittstellen werden alle **AMTS relevanten Informationen konsolidiert** und ein AMTS-Check durchgeführt.
* Im Entlassgespräch werden Veränderungen kommuniziert und erklärt.
* Der Patient wird mit einem neuen Medikationsplan entlassen.




## Weitere implizite Annahmen und weitere Informationen

*Annahmen:*
* Ein beteiligtes und ISiK-AMTS-bestätigtes System verfügt über die grundlegende Funktion zur Durchführung eines AMTS-Checks. Wie ein AMTS-Check durchzuführen ist wird in diesem IG nicht beschrieben.
* Ein beteiligtes und ISiK-AMTS-bestätigtes System erkennt selber, ob ein (erneuter) AMTS-Check notwendig wird, z.B. nach einer Arzneimittelsubstitution. Fachliche Systemführung, fachliche Trigger oder Listener-Observer-Pattern zur Festlegung der Reihenfolge der AMTS-Teilschritte werden in diesem IG nicht beschrieben.

*Anmerkungen:*
* AMTS-Checks sollten protokolliert werden, um Verantwortlichkeit und Rückverfolgbarkeit zu gewährleisten. Dies gilt sowohl für den positiven Fall der Verträglichkeit als auch für den Fall, in dem eine akzeptierte oder eine nicht akzeptable Risikobewertung erstellt wird.
* AMTS-Checks könnten protokolliert werden, um redundante Prüfungen und Mehrarbeit zu vermeiden.


Weitere Anwendungsfälle und Versorgungsprozesse für den stationären Sektor sind im Positionspapier [Digital gestützte Medikationsprozesse](https://www.ina.gematik.de/fileadmin/Arbeitskreisdokumente/Ergebnisdokumente/Analyse_der_Medikationsprozesse/Positionspapier_Analyse_der_Medikationsprozesse.pdf) aus dem Arbeitskreis *Analyse der Medikationsprozesse* des Interop Councils zu finden. 

## Grafische Zusammenfassung

Im Folgenden wird ein grafischer Überblick über möglichst in diesem Implementierungsleitfaden (AMTS) abgedeckten Anwendungsfälle gegeben.
Da es sich um eine Zusammenfassung handelt, werden nur folgende Use Case und dafür hinreichende Funktionen dargestellt:
* Allgemeine und intuitiv verständliche Use Cases.
  * Kombinationen und weitere Details sind möglich.
  * Übergreifende Use Cases und ihre Sub Use Cases können in einem separaten Diagram auf den entsprechenden Seiten gefunden werden.
* Allgemeine und intuitiv Adverse Use Cases. Diese gilt es zu vermeiden.
* In den Funktionen werde triviale Suchen einer Ressource anhand ihrer eigenen Properties nicht dargestellt, z.B. Suche einer Ressource anhand der ID, Name, Code usw.

<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Medikation/main-stufe-4/Material/images/diagrams/amts_usecases.svg" alt="AMTS Use Cases" width="90%"/>


**Anwendungsfälle AMTS**

### Interaktionen im Rahmen AMTS

Im Folgenden sind exemplarisch die Interaktionen für einen AMTS Pull und -Push im Sinne eines Businessprozesses modelliert.

<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Medikation/main-stufe-4/Material/images/diagrams/AMTS_pull.svg" class="center" alt="AMTS Pull" width="90%"/>

**AMTS Pull**


<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Medikation/main-stufe-4/Material/images/diagrams/AMTS_push.svg" class="center" alt="AMTS Push" width="90%"/>

**AMTS Push**


## FHIR-Profile des Anwendungsfalls AMTS

Dieser Übergreifende Use Case umfasst mehrere Profile aus verschiedenen Modulen. Die Einzelbeschreibungen sind im Folgenden verlinkt:
- Die [AMTS Bewertung der Medikation](https://simplifier.net/guide/isik-medikation-stufe-5/Einfuehrung/Artefakte/Datenobjekt_AMTSBewertung) zur Persistierung des Ergebnisses eines AMTS-Checks.
- Die [Allergien und Unverträglichkeiten der Basis](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Artefakte/Datenobjekte_AllergieUnvertraeglichkeit) zur Synchronisation der patientenbezogenen Intoleranzfaktoren.
- Verschiedene [Untersuchungsergebnisse des Labors](https://simplifier.net/guide/isik-labor-stufe-5/Einfuehrung/Artefakte/Datenobjekt_Laboruntersuchung) zur Erfassung fallbezogener Einflussfaktoren.
- Verschiedene [Lebenszustände der Basis](https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Artefakte/Datenobjekte_Lebenszustand) zur Erfassung aktueller (zeitbezogener) Zustände oder Konditionen, insbesondere:
  - Schwangerschaft,
  - Alkoholabusus,
  - Raucherstatus.
- Verschiedene aktuelle [Merkmale der Vitalparameter](https://simplifier.net/guide/isik-vitalparameter-stufe-5/Einfuehrung/Artefakte) zur Erfassung von Einflussfaktoren, welche die physische Kondition des Patienten betreffen, insbesondere.
  - Körpergewicht,
  - Körpergröße.