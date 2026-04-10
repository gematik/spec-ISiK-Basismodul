
## {{page-title}}

| **Work in Progress** | **Unvollständige Inhalte** |
|-|-|
|<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Terminplanung/c604c61a3887bd5532d2c7392eb20d8c79403028/Material/images/piktogramme/Betriebskoordination_Gruen_gematik.svg" width="40"/> | Diese Seite ist unvollständig. Die Beispielszenarien werden aus Anregungen und UseCases der Nutzer dieser Spezifikation, sowie der Bedarfe aus anderen ISiK-Modulen heraus entwickelt. Vorschläge und Hinweise zur Weiterentwicklung können im  [ISiK-Unterforum](https://chat.fhir.org/#streams/287581/german.2Fisik) des [internationalen FHIR-Chats](https://chat.fhir.org/) gegeben werden. **Bei der Anlage neuer Diskussionsthemen mit Bezug zu diesem Modul bitte das Präfix `[FORM]` verwenden!** |

Kandidaten:

* Ausfüllen eines Fragebogens bei der Terminbuchung eines Patienten in einem Patientenportal
* PROMS(Patient Reported Outcome Measures) der Medizininformatik-Initiative

### Szenario: Meldung an ein medizinisches Register mit dem ISiK-Formular-Modul

**Kontext:**
Krankenhäuser sind verpflichtet, diverse Sachverhalte (z.B. meldepflichtige Erkrankungen) an medizinische Register zu melden (meldepflichtiger Sachverhalt).

#### Möglicher Ablauf mit ISiK-Formular-Modul

1. **Auslöser im KIS**
   * Bei medizinischen Dokumentation im Primärsystem (z. B. meldepflichtige Erkrankung, meldepflichtiges Implantat) erkennt das KIS automatisch den meldepflichtigen Sachverhalt.

2. **Start des Formulars**
   * Über das ISiK-Connect-/Formular-Modul wird ein **webbasierter Formular-Renderer** direkt aus dem Primärsystem gestartet – inkl. Patienten- und Fallkontext.

3. **Vorbelegung der Daten**
   * Das Formular wird automatisch mit melderelevanten, vorhandenen FHIR-Daten befüllt, z.B:
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


