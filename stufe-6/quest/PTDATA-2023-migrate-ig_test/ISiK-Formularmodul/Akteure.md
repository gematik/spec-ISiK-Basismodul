# Akteure - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* **Akteure**

## Akteure

### FormularLauncher

Unter einem Formular-Launcher ist in diesem Modul ein Anwendungssystem zu verstehen, das folgende Interaktion implementiert:

* [Fremdaufruf](FunktionenInteraktionen.md#launch-eines-formular-renderers) in der Rolle “Server” **oder**
* [SMART-APP-Launch](FunktionenInteraktionen.md#smart-app-launch) in der Rolle “Server”

### FormularDaten-Quelle

Unter einer Formular-Datenquelle ist in diesem Modul eine Software zu verstehen, die folgende Interaktionen implementiert:

* FormularDatenVorbelegung in der Rolle “Datenbereitsteller”
* FormularDatenRückübermittlung in der Rolle “Empfänger”

### FormularDefinitionsErsteller

Unter einem FormularDefinitions-Ersteller ist in diesem Modul eine Software oder eine Person zu verstehen, die folgende Interaktionen implementiert oder durchführt:

* FormularPublikation in der Rolle “Autor”

Die Methode, wie Autoren [FormularDefinition](Spezifikationen_Begriffsdefinitionen.md)en publizieren, ist in dieser Ausbaustufe nicht definiert. Es wird davon ausgegangen, dass [FormularDefinitionsVerwalter](#formulardefinitionsverwalter) zunächst eine manuell zusammengetragene und kuratierte Auswahl von [FormularDefinition](Spezifikationen_Begriffsdefinitionen.md)en verschiedener Autoren bereitstellen.

Funktionell ist der Akteur “FormularDefinitionsErsteller” out-of-scope für diese Ausbaustufe, jedoch richten sich die [Best-Practice](Spezifikationen_BestPractice.md)-Empfehlungen für die Erstellung von [FormularDefinition](Spezifikationen_Begriffsdefinitionen.md)en an alle Personen und SoftwareSysteme, die die Rolle eines Autors einnehmen.

Dies können sowohl Personen/Organisationen sein, die mittels FHIR Short Hand (FSH) ISiK-konforme Questionnaire-Ressourcen modellieren als auch Hersteller von Software-Lösungen, die eine UI-gestützte Erstellung ISiK-konformer Questionnaires anbieten möchten.

| | |
| :--- | :--- |
| ![](https://raw.githubusercontent.com/gematik/spec-ISiK-Terminplanung/c604c61a3887bd5532d2c7392eb20d8c79403028/Material/images/piktogramme/Betriebskoordination_Gruen_gematik.svg) | Der Umgang mit Sprachversionen ist ein wichtiger Punkt, der im Rahmen dieser Spezifikation für ISiK-konforme Formulare festgelegt sein sollte. In der ersten Version ist dies noch nicht passiert, hierzu erfolgt nachgelagert eine Diskussion in der Community auf[Zulip im Stream von ISiK](https://chat.fhir.org/#narrow/channel/287581-german.2Fisik). |

#### Versionierung

Bei der Erstellung und späteren Bearbeitung einer Formulardefinition ist es wichtig, dass jede Änderung eine entsprechende Versionserhöhung (Inkrement) zur Folge hat. Dabei wird zwischen technischen und inhaltlichen Änderungen unterschieden, um die Auswirkungen auf die Kompatibilität und Funktionalität des Formulars korrekt zu kommunizieren. Das folgende [SemVer-Verfahren](https://semver.org/lang/de/) SOLLTE als Grundlage für die Versionierung von Formulardefinitionen im Rahmen von ISiK-kompatiblen Formularen verwendet werden.

![](https://raw.githubusercontent.com/gematik/spec-ISiK-Basismodul/refs/heads/archive-stable-pics-etc/Material/piktogramme/Betriebskoordination_Gruen_gematik.svg)

**Diskussion/Ausnahme/Alternative - Hinweis für Stakeholder:**
 In bestimmten Anwendungsfällen, wie beispielsweise bei Formularen für das tägliche Mittags-Menü oder anderen regelmäßig wechselnden Inhalten, kann eine kalendarische oder tagesbasierte Versionierung sinnvoll sein. Hierbei könnte die Version anhand des Datums (z. B. `2024-06-14`) vergeben werden, um die Aktualität und Nachvollziehbarkeit der jeweiligen Formularversion sicherzustellen.
 Diese Form der Versionierung erscheint insbesondere dann angebracht, wenn Inhalte häufig und planmäßig angepasst werden und eine klassische semantische Versionierung (SemVer) nicht den Anforderungen genügt. Stakeholder sollten in solchen Fällen gemeinsam mit den Nutzenden und Entwickelnden die geeignete Versionierungsstrategie festlegen. Über Rückmeldungen zu den Versionsstrategien von Seiten der Implementierenden und Anwendern würden wir uns freuen.

![](https://raw.githubusercontent.com/gematik/spec-ISiK-Basismodul/refs/heads/archive-stable-pics-etc/Material/piktogramme/Betriebskoordination_Gruen_gematik.svg)

##### Inkrement der Major Nummer

Das Inkrement der Major-Nummer erfolgt, wenn eine Änderung vorgenommen wird, die nicht rückwärtskompatibel ist. Dies bedeutet, dass die Struktur oder die inhaltliche Interpretation des Formulars so geändert wurde, dass mit älteren Versionen erstellte QuestionnaireResponses nicht mehr korrekt verarbeitet oder dargestellt werden können. In diesem Fall ist eine Umstellung auf die neue Version erforderlich, da die Datenstruktur oder die Logik nicht mehr mit der bisherigen Version kompatibel ist.

Beispiel: Das Entfernen eines obligatorischen Feldes oder das Hinzufügen neuer, grundlegender Geschäftslogiken, die dazu führen, dass vorherige QuestionnaireResponses nicht mehr korrekt gerendert oder verarbeitet werden können.

##### Inkrement der Minor Nummer

Das Inkrement der Minor-Nummer erfolgt, wenn neue Funktionen oder Felder hinzugefügt werden, die rückwärtskompatibel sind. Das bedeutet, dass bestehende Instanzen des Formulars weiterhin korrekt funktionieren, auch wenn die neuen Funktionen hinzugefügt wurden. Solche Änderungen erweitern das Formular, ohne dass bestehende Daten oder Prozesse gestört werden. Im Falle des Renderns einer QuestionnaireResponse, welche mit einer älteren Version erstellt wurde, sollte eine Warnung erfolgen.

Beispiel: Das Hinzufügen eines optionalen Feldes oder das Einfügen neuer Validierungen, die keine bestehenden Eingabewerte beeinträchtigen.

##### Inkrement der Patch Nummer

Das Inkrement der Patch-Nummer erfolgt, wenn Fehlerbehebungen oder technische Verbesserungen vorgenommen werden, die die Funktionalität des Formulars betreffen, jedoch keine neuen Funktionen hinzufügen oder die bestehende Struktur verändern. Diese Änderungen beinhalten das Korrigieren von Validierungsfehlern, das Beheben von Darstellungsproblemen oder das Verbessern von Performance-Aspekten ohne Einfluss auf die Interpretation oder das Benutzererlebnis.

Beispiel: Das Beheben eines Fehlers bei der Datenvalidierung oder das Korrigieren von Tippfehlern im Fragentext.

### FormularDefinitionsVerwalter

Unter einem FormularDefinitions-Verwalter ist in diesem Modul eine Software zu verstehen, die folgende Interaktionen unterstützt:

* [FormularDefinitionsVerwaltung](FunktionenInteraktionen.md#interaktion-formulardefinitionsverwaltung) in der Rolle “FormularDefinitionBereitsteller”

Der Einfachheit halber wird der FormularDefinitionsVerwalter in der aktuellen Ausbaustufe als Bestandteil des FormularRenderers betrachtet. Entwickler von FormularRenderern sollten es jedoch vorsehen, in Zukunft auch auf externe Quellen (z.B. nationale Verzeichnisse oder am Endpunkt des Launchers verfügbare FormularDefinitionen) zugreifen zu können.

### FormularRenderer

Der Formular-Renderer ist die zentrale Komponente zur Anzeige, Be- und Verarbeitung von Formularen auf Basis von Questionnaires. Er übernimmt sowohl die logische als auch visuelle Umsetzung der FormularDefinition und interagiert mit anderen Akteuren, um eine ISiK-konforme Integration zu ermöglichen.

Unter einem Formular-Renderer ist in diesem Modul eine Software zu verstehen, das folgende Funktionen und Interaktionen implementiert:

* [Fremdaufruf](FunktionenInteraktionen.md#fremdaufruf) in der Rolle “Client”
* [SMART-App-Launch](FunktionenInteraktionen.md#smart-app-launch) in der Rolle “Client”
* [Stand-Alone-Launch](FunktionenInteraktionen.md#stand-alone-launch)
* [FormularRendering]() TODO
* [FormularDatenVorbelegung](FunktionenInteraktionen.md#interaktion-formulardatenvorbelegung) in der Rolle “Datenermittler”
* [FormularDatenValidierung](FunktionenInteraktionen.md#funktion-formulardatenvalidierung)
* [FormularDatenExtraktion](FunktionenInteraktionen.md#interaktion-formulardatenextraktion)
* [FormularDatenRückübermittlung](FunktionenInteraktionen.md#interaktion-formulardaten-r%C3%BCck%C3%BCbermittlung) in der Rolle “Sender”

#### Aufgaben des Formular-Renderers

Gemäß diesem Modul übernimmt der FormularRenderer insbesondere folgende Aufgaben:

* Darstellung der FormularDefinition auf Basis der darin enthaltenen Extensions und Strukturangaben
* Ermöglichung des Ausfüllens des Formulars
* Vorbelegung der Formulardaten durch Datenabruf aus der [FormularDatenQuelle](#formulardaten-quelle)
* Validierung der eingegebenen Daten auf Grundlage der Definition und enthaltener Constraints. Hierbei ist die Interaktion [FormularDatenValidierung](FunktionenInteraktionen.md#funktion-formulardatenvalidierung) relevant
* Extraktion strukturierter FHIR-Ressourcen aus validierten Eingaben
* Rückübermittlung der ausgefüllten Formulare und extrahierter Daten über die Interaktion [FormularDatenRückübermittlung](FunktionenInteraktionen.md#interaktion-formulardaten-r%C3%BCck%C3%BCbermittlung)

#### Zwischenspeicherung nicht abgeschlossener Formulare

Da das Ausfüllen komplexer Formulare in der Praxis nicht immer in einem Schritt erfolgt, SOLL der FormularRenderer in der Lage sein, FormularDaten (QuestionnaireResponses) temporär zwischenzuspeichern – auch wenn diese noch nicht vollständig oder gültig sind.

> **Wichtig:** Diese Zwischenspeicherung erfolgt in der aktuellen Ausbaustufe **lokal im FormularRenderer** selbst und **nicht über die Rückübermittlungs-Interaktion**. Die Rückübermittlung ist ausschließlich für vollständig ausgefüllte und validierte Formulare vorgesehen.

Dies bedeutet:

* Nicht-abgeschlossene oder ungültige Eingaben dürfen NICHT rückübermittelt werden
* Der FormularRenderer SOLL entsprechende Mechanismen zur Speicherung und Wiederaufnahme dieser Eingaben bereitstellen.
* Eine Interaktion mit anderen Akteuren kann ggf. zu einem späteren Zeitpunkt vorgesehen werden, ist aber nicht Teil dieser Stufe.

#### Erstellung eines Narrativs für menschenlesbare Darstellung

Im Rahmen der Rückübermittlung SOLL der Formular-Renderer zusätzlich zur strukturierten `QuestionnaireResponse` auch ein menschenlesbares **Narrative** erzeugen, das die Inhalte des ausgefüllten Formulars in übersichtlicher, interpretierbarer Form darstellt.

Dieses Narrative SOLL Bestandteil der Rückübermittlung sein – entweder:

* als Narrative innerhalb der `QuestionnaireResponse.text`, oder
* als Bestandteil des Document-Bundles wie im Modul ISiK-Dokumentenaustausch beschrieben

Das Narrative erfüllt folgende Zwecke:

* **Anzeigefähigkeit in Primärsystemen**, die keine Unterstützung für FHIR-Formulare oder deren Rendering besitzen
* **Vermeidung doppelter Implementierung**, da Systeme das Formular nicht erneut interpretieren müssen
* **Langzeitarchivierung und Nachvollziehbarkeit**, auch außerhalb FHIR-fähiger Umgebungen

> **Hinweis:** Die Erstellung eines Narrativs ist besonders dann wichtig, wenn Formulare komplexe Strukturen oder mehrseitige Inhalte enthalten. Ein gut strukturiertes, menschenlesbares Layout verbessert die Nutzbarkeit erheblich.

#### Anforderungen an das Narrative

Ein Narrative SOLL:

* alle beantworteten Fragen samt Antworten gut lesbar darstellen
* relevante, aber unbeantwortete Felder (z. B. “nicht beantwortet”) ggf. mit aufführen
* Gruppen- und Wiederholungsstrukturen (z. B. bei mehreren Einträgen) klar kenntlich machen
* in einem HTML- oder XHTML-kompatiblen Format vorliegen
* sich für die Anzeige innerhalb eines klinischen Informationssystems eignen

