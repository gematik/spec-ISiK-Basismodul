### Anmerkungen zu den Must-Support Feldern

### `Procedure.extension:recordedDate`

**Bedeutung:**
Das Dokumentationsdatum der Prozedur MUSS zu Qualitätssicherungszwecken angegeben werden. Dies ist das fachliche Dokumentationsdatum, nicht zu verwechseln mit der technischen Anlage des Datensatzes im Primärsystem. Diese beiden Daten können jedoch identisch sein.

### `Procedure.status`

**Bedeutung:**
Kodierter klinischer Status der Prozedur. MUSS angegeben werden, da die Interpretation der Prozedur davon abhängt, ob diese 'completed' ist oder einen anderen Status aufweist. Alle in einem System möglichen Status-Werte müssen über FHIR korrekt repräsentiert werden können, mindestens jedoch die Status-Werte "completed" und "unknown". Deren korrekte Abbildung wird im Rahmen des Bestätigungsverfahrens überprüft.

### `Procedure.category`

**Bedeutung:**
Zur groben Kategorisierung MUSS eine Kodierung auf Basis der OPS-Klassencodes erfolgen. Eine ConceptMap für das Mapping von OPS-Kodes -> Kategorie findet sich in den [Deutschen Basisprofilen - Implementierungsleitfaden Abschnitt Terminologien](https://ig.fhir.de/basisprofile-de/stable/Terminologie-ConceptMaps.html). Die Angabe der Kategeorie MUSS nur für OPS-kodierte Prozeduren erfolgen.

### `Procedure.code.coding`

**Bedeutung:** Codierte Prozedur. Entweder kodiert per [OPS](https://www.bfarm.de/DE/Kodiersysteme/Klassifikationen/OPS-ICHI/OPS/_node.html) oder [SNOMED CT](https://www.snomed.org). Bei der Kodierung per SNOMED CT ist das ValueSet [ProzedurenCodesSCT](https://simplifier.net/ISiK/ProzedurenCodesSCT) zu beachten.

### `Procedure.code.text`

**Bedeutung:** Freitext-Beschreibung der Prozedur

### `Procedure.performed`

**Bedeutung:** Zur zeitlichen Einordnung der Prozedur KANN das Durchführungsdatum der Prozedur dokumentiert werden. Mindestens MUSS der Beginn der Prozedur dokumentiert werden, das Ende KANN implementiert werden.

### `Procedure.subject`

**Bedeutung:** Ein Patientenbezug der Prozedur MUSS stets zum Zwecke der Nachvollziehbarkeit und Datenintegrität vorliegen.

### `Procedure.note`

**Bedeutung:** Weitere optionale Freitext-Notizen bezogen auf die durchgeführte Prozedur.

---
