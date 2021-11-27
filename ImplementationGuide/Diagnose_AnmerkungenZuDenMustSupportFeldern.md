### Anmerkungen zu den Must-Support-Feldern

### `Condition.clinicalStatus`

**Bedeutung:**  
Kodierter klinischer Status der Diagnose. MUSS angegeben werden, da die Interpretation der Diagnose davon abhängt ob diese 'aktiv' ist oder einen anderen Status aufweist.

**Hinweise:**

[FHIRPath Constraints seitens der FHIR-Kernspezifikation](https://www.hl7.org/fhir/condition.html#invs) rund um Condition.clinicalStatus sind zu beachten.

### `Condition.code.coding`

**Bedeutung:**  Codierte Diagnose. Die Kodierung KANN nach den Vorgaben des BfArM per [ICD-10GM](https://www.dimdi.de/dynamic/de/klassifikationen/icd/) kodiert werden. Weiterhin sind folgende Kodiersysteme u.a. auf Basis von Empfehlungen des BfArM zulässig:
 - [SNOMED CT](http://www.snomed.org)
 - [Alpha-ID](https://www.dimdi.de/dynamic/de/klassifikationen/icd/alpha-id/)
 - [Orpha-Kennnummer](http://www.orpha.net/national/DE-DE/index/startseite/)

### `Condition.code.text`

**Bedeutung:** Freitextdiagnose

**Hinweise:**

Die Freitextdiagnose darf nur alleinstehend angegeben werden, solange keine kodierte Diagnose vorliegt.

### `Condition.code.coding:ICD-10-GM.extension:Seitenlokalisation`

**Hinweise:** Angaben zur ICD-Seitenlokalisation ("R", "L", "B") müssen vom Code abgetrennt und in der Extension angegeben werden.

### `Condition.code.coding:ICD-10-GM.extension:Mehrfachcodierungs-Kennzeichen`

**Hinweise:**  ICD-Mehfachcodierungs-Kennzeichen ("†", "\*", "!") müssen vom Code abgetrennt und in der Extension angegeben werden.

### `Condition.code.coding:ICD-10-GM.extension:Diagnosesicherheit`

**Hinweise:** Angaben zur ICD-Diagnosesicherheit ("A", "G", "V", "Z") müssen vom Code abgetrennt und in der Extension angegeben werden.

### `Condition.subject`

**Bedeutung:**  Ein Patientenbezug der Diagnose MUSS stets zum Zwecke der Nachvollziehbarkeit und Datenintegrität vorliegen.

### `Condition.encounter`

**Bedeutung:**  Fallbezug der Diagnose MUSS stets zum Zwecke der Nachvollziehbarkeit und Datenintegrität vorliegen.

**Hinweise:**

Eine Verlinkung der Referenz auf den dazugehörigen Kontakt SOLLTE auf die Ebene des Einrichtungskontaktes erfolgen, falls die Kontaktebene (Encounter.type) kodiert wird.
Bei der Auswahl des Kontaktes ist zu beachten, dass mehrere Encounter-Ressourcen mit identischen Aufnahmenummer-Identifiern existieren können (Abbildung Vor- und nachstationäre Kontakte).

### `Condition.recordedDate`

**Bedeutung:**  Das Dokumentationsdatum der Diagnose MUSS zu Qualitätssicherungszwecken angegeben werden. Dies ist das fachliche Dokumentationsdatum, nicht zu verwechseln mit der technischen Anlage des Datensatzes im Primärsystem. Diese beiden Daten können jedoch identisch sein.

**Hinweise:**

Das Recorded Date MUSS mindestens auf den Monat genau angegeben werden (vgl. FHIRPath Constraint rec-1)

### `Condition.note`

**Bedeutung:**  Weitere optionale Freitext-Notizen bezogen auf die Diagnose.

### `Condition.extension:ReferenzPrimaerdiagnose`

**Bedeutung:** Bei Mehrfachkodierten ICD-Diagnosen (z.B. Kreuz-Stern-Notation) muss die Sekundär- auf die Primärdiagnose verlinkt werden
