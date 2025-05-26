---
topic: FormularDefinitionsErsteller
---
## {{page-title}}

Unter einem FormularDefinitions-Ersteller ist in diesem Modul eine Software oder eine Person zu verstehen, die folgende Interaktionen implementiert oder durchführt:
* FormularPublikation in der Rolle "Autor"

Die Methode, wie Autoren {{pagelink:FormularDefinition}}en publizieren, ist in dieser Ausbaustufe nicht definiert. Es wird davon ausgegangen, dass {{pagelink:FormularDefinitionsVerwalter}} zunächst eine manuell zusammengetragene und kuratierte Auswahl von {{pagelink:FormularDefinition}}en verschiedener Autoren bereitstellen.

Funktionell ist der Akteur "FormularDefinitionsErsteller" out-of-scope für diese Ausbaustufe, jedoch richten sich die {{pagelink:BestPractice}}-Empfehlungen für die Erstellung von {{pagelink:FormularDefinition}}en an alle Personen und SoftwareSysteme, die die Rolle eines Autors einnehmen.

Dies können sowohl Personen/Organisationen sein, die mittels FHIR Short Hand (FSH) ISiK-konforme Questionnaire-Ressourcen modellieren als auch  Hersteller von Software-Lösungen, die eine UI-gestützte Erstellung ISiK-konformer Questionnaires anbieten möchten.

### Versionierung

Bei der Erstellung und späteren Bearbeitung MUSS eine entsprechens Versionsincrement mit sich ziehen. Hierbei sollte zwischen technischen und inhaltlichen Änderungen unterschieden werden. Im Folgenden ist ein zu nutzenden SemVer Verfahren beschreiben, welches im Rahmen von ISiK Kompatiblen FormularDefinitionen als Grundlage dienen soll:

#### Inkrement der Major Nummer 

Das Inkrement der Major-Nummer erfolgt, wenn eine Änderung vorgenommen wird, die nicht rückwärtskompatibel ist. Dies bedeutet, dass die Struktur oder die inhaltliche Interpretation des Formulars so geändert wurde, dass mit älteren Versionen erstellte QuestionnaireResponses nicht mehr korrekt verarbeitet oder dargestellt werden können. In diesem Fall ist eine Umstellung auf die neue Version erforderlich, da die Datenstruktur oder die Logik nicht mehr mit der bisherigen Version kompatibel ist.

Beispiel: Das Entfernen eines obligatorischen Feldes oder das Hinzufügen neuer, grundlegender Geschäftslogiken, die dazu führen, dass vorherige QuestionnaireResponses nicht mehr korrekt gerendert oder verarbeitet werden können.

#### Inkrement der Minor Nummer

Das Inkrement der Minor-Nummer erfolgt, wenn neue Funktionen oder Felder hinzugefügt werden, die rückwärtskompatibel sind. Das bedeutet, dass bestehende Instanzen des Formulars weiterhin korrekt funktionieren, auch wenn die neuen Funktionen hinzugefügt wurden. Solche Änderungen erweitern das Formular, ohne dass bestehende Daten oder Prozesse gestört werden.
Im Falle des Renderns einer QuestionnaireResponse, welche mit einer älteren Version erstellt wurde, sollte eine Warnung erfolgen.

Beispiel: Das Hinzufügen eines optionalen Feldes oder das Einfügen neuer Validierungen, die keine bestehenden Eingabewerte beeinträchtigen.

#### Inkrement der Patch Nummer

Das Inkrement der Patch-Nummer erfolgt, wenn Fehlerbehebungen oder technische Verbesserungen vorgenommen werden, die die Funktionalität des Formulars betreffen, jedoch keine neuen Funktionen hinzufügen oder die bestehende Struktur verändern. Diese Änderungen beinhalten das Korrigieren von Validierungsfehlern, das Beheben von Darstellungsproblemen oder das Verbessern von Performance-Aspekten ohne Einfluss auf die Interpretation oder das Benutzererlebnis.

Beispiel: Das Beheben eines Fehlers bei der Datenvalidierung oder das Korrigieren von Tippfehlern im Fragentext.