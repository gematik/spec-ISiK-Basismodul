### Anmerkungen zu den Must-Support-Feldern

### `Observation.category`
**Bedeutung:** Kategorie-Code der die Untersuchung kategorisiert.

### `Observation.code`
**Bedeutung:** Code der die Untersuchung repräsentiert und kodiert.

### `Observation.subject`
**Bedeutung:** Ein Patientenbezug der Observation MUSS stets zum Zwecke der Nachvollziehbarkeit und Datenintegrität vorliegen. 

### `Observation.effective[x]`
**Bedeutung:** Klinisch relevanter Zeitpunkt/Zeitspanne für die Observation.

### `Observation.value[x] (valueDateTime, valueBoolean)`
**Bedeutung:** Erfasster Wert der Observation. Es müssen Datum und boolesche Werte supportet werden. 

### `Observation.hasMember`
**Bedeutung:** Weitere Observation die mit dieser Observation gemeinsam zu betrachten ist. 

### `Observation.encounter`
**Bedeutung:** Der Fallbezug einer Observation MUSS stets zum Zwecke der Nachvollziehbarkeit und Datenintegrität vorliegen.

**Hinweise:**

Eine Verlinkung der Referenz auf den dazugehörigen Kontakt SOLL auf die Ebene des Abteilungskontaktes (entsprechend ISiKKontaktGesundheitseinrichtung) erfolgen.
Bei der Auswahl des Kontaktes ist zu beachten, dass mehrere Encounter-Ressourcen mit identischen Aufnahmenummer-Identifiern existieren können (Abbildung Vor- und nachstationäre Kontakte).

---
