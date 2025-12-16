# Formular Definitions Ersteller - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* **Formular Definitions Ersteller**

## Formular Definitions Ersteller

##

Unter einem FormularDefinitions-Ersteller ist in diesem Modul eine Software oder eine Person zu verstehen, die folgende Interaktionen implementiert oder durchführt:

* FormularPublikation in der Rolle “Autor”

Die Methode, wie Autoren en publizieren, ist in dieser Ausbaustufe nicht definiert. Es wird davon ausgegangen, dass zunächst eine manuell zusammengetragene und kuratierte Auswahl von en verschiedener Autoren bereitstellen.

Funktionell ist der Akteur “FormularDefinitionsErsteller” out-of-scope für diese Ausbaustufe, jedoch richten sich die -Empfehlungen für die Erstellung von en an alle Personen und SoftwareSysteme, die die Rolle eines Autors einnehmen.

Dies können sowohl Personen/Organisationen sein, die mittels FHIR Short Hand (FSH) ISiK-konforme Questionnaire-Ressourcen modellieren als auch Hersteller von Software-Lösungen, die eine UI-gestützte Erstellung ISiK-konformer Questionnaires anbieten möchten.

| | |
| :--- | :--- |
| ![](https://raw.githubusercontent.com/gematik/spec-ISiK-Terminplanung/c604c61a3887bd5532d2c7392eb20d8c79403028/Material/images/piktogramme/Betriebskoordination_Gruen_gematik.svg) | Der Umgang mit Sprachversionen ist ein wichtiger Punkt, der im Rahmen dieser Spezifikation für ISiK-konforme Formulare festgelegt sein sollte. In der ersten Version ist dies noch nicht passiert, hierzu erfolgt nachgelagert eine Diskussion in der Community auf[Zulip im Stream von ISiK](https://chat.fhir.org/#narrow/channel/287581-german.2Fisik). |

### Versionierung

Bei der Erstellung und späteren Bearbeitung einer Formulardefinition ist es wichtig, dass jede Änderung eine entsprechende Versionserhöhung (Inkrement) zur Folge hat. Dabei wird zwischen technischen und inhaltlichen Änderungen unterschieden, um die Auswirkungen auf die Kompatibilität und Funktionalität des Formulars korrekt zu kommunizieren. Das folgende [SemVer-Verfahren](https://semver.org/lang/de/) SOLLTE als Grundlage für die Versionierung von Formulardefinitionen im Rahmen von ISiK-kompatiblen Formularen verwendet werden.

![](https://raw.githubusercontent.com/gematik/spec-ISiK-Basismodul/refs/heads/archive-stable-pics-etc/Material/piktogramme/Betriebskoordination_Gruen_gematik.svg)

**Diskussion/Ausnahme/Alternative - Hinweis für Stakeholder:**
 In bestimmten Anwendungsfällen, wie beispielsweise bei Formularen für das tägliche Mittags-Menü oder anderen regelmäßig wechselnden Inhalten, kann eine kalendarische oder tagesbasierte Versionierung sinnvoll sein. Hierbei könnte die Version anhand des Datums (z. B. `2024-06-14`) vergeben werden, um die Aktualität und Nachvollziehbarkeit der jeweiligen Formularversion sicherzustellen.
 Diese Form der Versionierung erscheint insbesondere dann angebracht, wenn Inhalte häufig und planmäßig angepasst werden und eine klassische semantische Versionierung (SemVer) nicht den Anforderungen genügt. Stakeholder sollten in solchen Fällen gemeinsam mit den Nutzenden und Entwickelnden die geeignete Versionierungsstrategie festlegen. Über Rückmeldungen zu den Versionsstrategien von Seiten der Implementierenden und Anwendern würden wir uns freuen.

![](https://raw.githubusercontent.com/gematik/spec-ISiK-Basismodul/refs/heads/archive-stable-pics-etc/Material/piktogramme/Betriebskoordination_Gruen_gematik.svg)

#### Inkrement der Major Nummer

Das Inkrement der Major-Nummer erfolgt, wenn eine Änderung vorgenommen wird, die nicht rückwärtskompatibel ist. Dies bedeutet, dass die Struktur oder die inhaltliche Interpretation des Formulars so geändert wurde, dass mit älteren Versionen erstellte QuestionnaireResponses nicht mehr korrekt verarbeitet oder dargestellt werden können. In diesem Fall ist eine Umstellung auf die neue Version erforderlich, da die Datenstruktur oder die Logik nicht mehr mit der bisherigen Version kompatibel ist.

Beispiel: Das Entfernen eines obligatorischen Feldes oder das Hinzufügen neuer, grundlegender Geschäftslogiken, die dazu führen, dass vorherige QuestionnaireResponses nicht mehr korrekt gerendert oder verarbeitet werden können.

#### Inkrement der Minor Nummer

Das Inkrement der Minor-Nummer erfolgt, wenn neue Funktionen oder Felder hinzugefügt werden, die rückwärtskompatibel sind. Das bedeutet, dass bestehende Instanzen des Formulars weiterhin korrekt funktionieren, auch wenn die neuen Funktionen hinzugefügt wurden. Solche Änderungen erweitern das Formular, ohne dass bestehende Daten oder Prozesse gestört werden. Im Falle des Renderns einer QuestionnaireResponse, welche mit einer älteren Version erstellt wurde, sollte eine Warnung erfolgen.

Beispiel: Das Hinzufügen eines optionalen Feldes oder das Einfügen neuer Validierungen, die keine bestehenden Eingabewerte beeinträchtigen.

#### Inkrement der Patch Nummer

Das Inkrement der Patch-Nummer erfolgt, wenn Fehlerbehebungen oder technische Verbesserungen vorgenommen werden, die die Funktionalität des Formulars betreffen, jedoch keine neuen Funktionen hinzufügen oder die bestehende Struktur verändern. Diese Änderungen beinhalten das Korrigieren von Validierungsfehlern, das Beheben von Darstellungsproblemen oder das Verbessern von Performance-Aspekten ohne Einfluss auf die Interpretation oder das Benutzererlebnis.

Beispiel: Das Beheben eines Fehlers bei der Datenvalidierung oder das Korrigieren von Tippfehlern im Fragentext.

