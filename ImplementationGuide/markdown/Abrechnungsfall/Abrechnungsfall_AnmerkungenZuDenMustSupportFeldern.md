### Anmerkungen zu den Must-Support Feldern

### `Account.extension:Abrechnungsdiagnose`

**Bedeutung:** DRG- und hiervon abweichende Krankenhausdiagnosen sollten im Account zusammenfassend und abschließend angegeben werden. Relevante Prozeduren können ebenfalls aufgelistet werden.

### `Account.identifier`

**Bedeutung:** Der Account muss die Aufnahmenummer des dazugehörigen Encounters enthalten.

### `Account.status`

**Bedeutung:** Der Status MUSS insbesondere zur Differenzierung von abgeschlossenen und derzeitig noch aktiven Abrechnungsfällen angegeben werden. Alle in einem System möglichen Status-Werte müssen über FHIR korrekt repräsentiert werden können, mindestens jedoch die Status-Werte "active", "inactive". Deren korrekte Abbildung wird im Rahmen des Bestätigungsverfahrens überprüft.

**Hinweise:** Siehe Beschreibung in der [FHIR Kernspezifikation](http://hl7.org/fhir/account-definitions.html#Account.status)

### `Account.type`

**Bedeutung:** Alle Accounts MÜSSEN eindeutig kategorisiert werden können, sodass eine Filterung pro Typ möglich ist.

**Hinweise:** Verpflichtende Kodierung per [HL7 v3 Value Set ActEncounterCode](http://hl7.org/fhir/v3/ActEncounterCode/vs.html) als Äquivalent zu Encounter.class. 

### `Account.subject`

**Bedeutung:**  Ein Patientenbezug des Falls MUSS stets zum Zwecke der Nachvollziehbarkeit und Datenintegrität vorliegen.

### `Account.coverage`

**Bedeutung:** Pro Abrechnungskontext (z.B. Selbstzahler, DRG, PEPP) sollte ein eigener Account angelegt werden. Für jeden Account sollte ersichtlich sein über welche Coverage der Account beglichen werden soll.

---
