### Anmerkungen zu den Must-Support Feldern

### `Encounter.status`

**Bedeutung:** Der Status MUSS insbesondere zur Differenzierung von abgeschlossenen und derzeitig noch aktiven Kontakten angegeben werden. Alle in einem System möglichen Status-Werte müssen über FHIR korrekt repräsentiert werden. Es KÖNNEN jedoch mindestens die Status-Werte "in-progress", "finished" und "cancelled" unterstützt werden. Deren korrekte Abbildung wird im Rahmen des Bestätigungsverfahrens überprüft.

**Hinweise:** Siehe Beschreibung in der [FHIR Kernspezifikation](http://hl7.org/fhir/encounter-definitions.html#Encounter.status)

### `Encounter.class`

**Bedeutung:** Alle Encounter MÜSSEN eindeutig kategorisiert werden können, sodass eine Filterung pro Typ möglich ist.

**Hinweise:** Verpflichtende Kodierung per [HL7 v3 Value Set ActEncounterCode](http://hl7.org/fhir/v3/ActEncounterCode/vs.html), um eine internationale Kompatibilität aufrecht zu erhalten.

### `Encounter.type`

**Bedeutung:** Angabe vom Typ des Kontaktes. Alle Möglichkeiten eines Einrichtungskontaktes nach SGB V sind vorhanden.

### `Encounter.subject`

**Bedeutung:** Ein Patientenbezug des Falls MUSS stets zum Zwecke der Nachvollziehbarkeit und Datenintegrität vorliegen.

### `Encounter.period`

**Bedeutung:** Der Rahmen des Kontaktes MUSS zur zeitlichen Einordnung angeben werden.

**Hinweise:** Es ist der FHIRPath Constraint ISiK-enc-1 zu beachten. Siehe [JSON Repräsentation FHIR Profil ISiK Encounter](https://simplifier.net/ISiK/ISiKEncounter/~json).

### `Encounter.location`

**Bedeutung:** Falls Details zum Ort, an dem der Kontakt stattfindet, vorliegen, KÖNNEN diese in einer beliebigen Detailtiefe angegeben werden.

### `Encounter.serviceProvider`

**Bedeutung:** Falls Details zur verantwortlichen Organisationeinheit vorliegen, KÖNNEN diese in einer beliebigen Detailtiefe angegeben werden. 

---
