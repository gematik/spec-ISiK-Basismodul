
| **Work in Progress** | **Unvollständige Inhalte** |
|-|-|
|<img src="Betriebskoordination_Gruen_gematik.svg" width="40"/> | Diese Seite ist unvollständig. Die Beispielszenarien werden aus Anregungen und UseCases der Nutzer dieser Spezifikation, sowie der Bedarfe aus anderen ISiK-Modulen heraus entwickelt. Vorschläge und Hinweise zur Weiterentwicklung können im  [ISiK-Unterforum](https://chat.fhir.org/#streams/287581/german.2Fisik) des [internationalen FHIR-Chats](https://chat.fhir.org/) gegeben werden. **Bei der Anlage neuer Diskussionsthemen mit Bezug zu diesem Modul bitte das Präfix `[FORM]` verwenden!** |

Kandidaten:

* PROMS(Patient Reported Outcome Measures) der Medizininformatik-Initiative [MII - Erweiterungsmodul PRO](https://simplifier.net/guide/modul-pro-v2026)


### Szenario: Meldung an ein medizinisches Register mit dem ISiK-Formular-Modul

**Kontext:**
Krankenhäuser sind verpflichtet, diverse Sachverhalte (z.B. meldepflichtige Erkrankungen) an medizinische Register zu melden (meldepflichtiger Sachverhalt).

#### Möglicher Ablauf mit ISiK-Formular-Modul

1. **Auslöser im KIS**
   * Bei medizinischen Dokumentation im Primärsystem (z. B. meldepflichtige Erkrankung, meldepflichtiges Implantat) erkennt das KIS automatisch den meldepflichtigen Sachverhalt.

2. **Start des Formulars**
   * Über das ISiK-Connect-/Formular-Modul wird ein **webbasierter Formular-Renderer** direkt aus dem Primärsystem gestartet – inkl. Patienten- und Fallkontext.

3. **Vorbelegung der Daten**
   * Das Formular wird automatisch mit melderelevanten, vorhandenen FHIR-Daten befüllt, z.B. :
     * Patientendaten
     * Diagnosen
     * Behandlungsinformationen
   * Grundlage sind standardisierte FHIR-Ressourcen der ISiK-Module.
   * Nur die meldepflichtigen Elemente dieser Ressourcen werden in das Formular übernommen. Für die Register sind keine aus Datenschutzgründen restriktierten Profile mehr erforderlich und FHIR-Ressourcentypen müssen in den Primärsystemen nicht mehr mehrfach umgesetzt werden, um die unterschiedlichen Datenschutzvorgaben zu erfüllen.

4. **Ergänzung durch medizinisches Personal**
   * Ärzt:innen ergänzen registerrelevante Angaben.
   * Alle Eingaben können sofort anhand der im Questionnaire definierten Regeln geprüft werden

5. **Strukturierte Speicherung**
   * Die ausgefüllten Daten werden als strukturierter Datensatz (FHIR QuestionnaireResponse) zurück ins System geschrieben.

6. **Weiterleitung an Register**
   * Der Datensatz wird automatisiert an das externe medizinische Register übermittelt

####  Vorteile gegenüber herkömmlichen Schnittstellen

* Einheitliche Datenmodelle und APIs (REST/FHIR) statt individueller Schnittstellen
* Reduziert Integrationsaufwand zwischen KIS und Registern
* Formular wird direkt im klinischen Workflow gestartet (mit bereits etabliertem Patientenkontext)
* Kein Medienbruch (z. B. kein externes Webportal nötig)
* Nutzung vorhandener klinischer Daten (Diagnosen, Demografie etc.)
* Reduktion manueller Eingaben
* Erfüllung datenschutzrechtlicher Vorgaben (registerspezifisches "weglassen" von vorhandenen Informationen) ohne zusätzlichen Implementierungsaufwand
* Nutzung von etablierten FHIR-Profilen und Terminologien (z. B. SNOMED CT)
* Daten sind maschinenlesbar und validierbar
* Gleiche Mechanik für verschiedene Registermeldungen 
* Formular-Definitionen können zentral gepflegt und verteilt werden 

#### Kurzfazit

FHIR-Questionnaires (insbesondere in Verbindung mit **Structured Data Capture (SDC)**) haben das Potential, Registermeldungen von einem **isolierten, oft manuellen Prozess** hin zu einem **integrierten, standardisierten und automatisierten Workflow** zu transformieren.
Mit dem ISiK Formular-Modul wird die technische und Infrastrukturelle Grundlage geschaffen, um Registerprozesse auf dieser Basis umsetzen zu können.

### Szenario: Abfrage von Informationen bei der Terminbuchung

**Kontext:**
Bei der Buchung eines Termins über ein Patientenportal möchte das Krankenhaus vom Patienten zusätzliche, terminrelevante Informationen erheben – z. B. aktuelle Beschwerden, Vorerkrankungen, Medikationen oder Versicherungsangaben. Diese Angaben sollen strukturiert erfasst und zusammen mit der Terminbuchung an das Termin-Repository übermittelt werden.

#### Möglicher Ablauf mit ISiK-Formular-Modul

1. **Slot-Auswahl durch den Patienten**
   * Der Patient wählt im Patientenportal einen freien Termin aus. Das Portal kennt die Terminart (z. B. Fachrichtung, Dienstleistungstyp) anhand der Kalender- und Slot-Abfrage.

2. **Ermittlung des passenden Fragebogens**
   * Das Portal ermittelt anhand der Terminart das zugehörige `Questionnaire` aus dem Formular-Repository (z. B. Fragebogen zu aktuellen Beschwerden für allgemeinmedizinische Termine).

3. **Anzeige des Formulars im Portal**
   * Der **Formular-Renderer** stellt dem Patienten das Formular innerhalb des Portals dar. Vorhandene Patientendaten (z. B. Name, Geburtsdatum) können automatisch vorbelegt werden.

4. **Ausfüllen durch den Patienten**
   * Der Patient beantwortet die Fragen. Eingaben können anhand der im `Questionnaire` definierten Validierungsregeln sofort geprüft werden.

5. **Übermittlung zusammen mit der Terminbuchung**
   * Die ausgefüllten Antworten werden als `QuestionnaireResponse`-Ressource zusammen mit der `$book`-Operation über den Parameter `patientSubmittedInformation` an das Termin-Repository übermittelt.
   * Das Element `QuestionnaireResponse.questionnaire` SOLL befüllt sein, damit unterschiedlich strukturierte Antworten unterschieden und perspektivisch automatisiert verarbeitet werden können.
   * Das Element `QuestionnaireResponse.text` MUSS befüllt sein, damit die Inhalte durch das empfangende System unmittelbar dargestellt werden können.

6. **Verarbeitung im Termin-Repository**
   * Das Termin-Repository speichert die `QuestionnaireResponse` und stellt sie dem klinischen Personal vor dem Termin zur Verfügung. Eine automatisierte Weiterverarbeitung ist perspektivisch möglich.

#### Vorteile gegenüber herkömmlichen Schnittstellen

* Einheitlicher, standardisierter Mechanismus für verschiedene Terminarten ohne Anpassungen an der Spezifikation
* Patientenangaben sind strukturiert, maschinenlesbar und validierbar (FHIR `QuestionnaireResponse`)
* Kein Medienbruch: Erfassung und Übermittlung erfolgen innerhalb des Portals im gleichen Buchungsvorgang
* Fragebögen können je nach Terminart oder Fachrichtung flexibel angepasst werden
* Vorbelegung mit vorhandenen Patientendaten reduziert manuelle Eingaben
* Fragebogen-Definitionen können zentral gepflegt und verteilt werden, aber auch im ersten Schritt lokal im Portal vorgehalten werden
* Nutzung etablierter FHIR-Profile und Terminologien (z. B. SNOMED CT, LOINC)
* Gleiche Mechanik für unterschiedliche Anwendungsfälle der Terminvorbereitung

#### Kurzfazit

Die Kombination aus dem ISiK-Terminmodul (`$book`-Operation) und dem ISiK Formular-Modul (`QuestionnaireResponse`) ermöglicht es, die Terminbuchung und die Erhebung zusätzlicher Patientenangaben in einem einzigen, standardisierten Schritt zusammenzuführen. Patientenportale können so ohne individuelle Schnittstellenentwicklung terminartspezifische Fragebögen einsetzen und die Ergebnisse strukturiert ans Krankenhaus übermitteln.

### Szenario: TI-Messenger (TI-M)

Das ISiK Formularmodul bietet neben der Integration in Krankenhausinfrastrukturen auch die Möglichkeit, Formulare über den TI-Messenger (TI-M) bereitzustellen. Das folgende Diagramm zeigt eine beispielhafte Nutzung der im Modul beschriebenen Funktionen und Interaktionen im Kontext des TI-Messengers.

<div style="width: 700px;">
{% include akteure_tim.svg %}
</div>

Im Diagramm nicht abgebildet ist der Akteur des FormularLaunchers, welcher in diesem Kontext als Standalone anzunehmen ist und durch das interne Protokoll des TI-M getriggert wird. Wichtig ist, dass trotzdem der Patient-Kontext vorhanden ist, der in den [FormularDaten](StructureDefinition-ISiKFormularDaten.html) genutzt werden kann.

Die FormularDatenVorbelegung und -Extraktion sind in diesem Use Case nicht im FormularRenderer verortet, sondern werden durch den "TI-M Pro Client" durchgeführt bei potenzieller Integration in die Leistungserbringer-Infrastruktur.
