### Anmerkungen zu Must-Support-Feldern

### `CodeSystem.url`

**Bedeutung:** Eindeutige Url zur Identifizierung des CodeSystems. Absolute Url sind zu bevorzugen.

**Hinweise:** OIDs SOLLTEN als weitere Identifier des CodeSystems verwendet werden. In jedem Fall SOLLTE ein Canonical Url vergeben werden.

### `CodeSystem.version`

**Bedeutung:** Version des CodeSystems

**Hinweise:** Jede Änderung des CodeSystems MUSS eine Änderung in der Version des CodeSystems und gebundenen ValueSets nach sich ziehen. Die Versionierung SOLLTE auf Basis von [Semantic Versioning](https://semver.org) basieren.

### `CodeSystem.name`

**Bedeutung:** Maschinenlesbarer Name des CodeSystems

**Hinweise:** Der Constraint [cps-0](https://www.hl7.org/fhir/codesystem.html#invs) ist hierbei zu beachten.

### `CodeSystem.status`

**Bedeutung:** Indikation, ob das CodeSystem in aktiver Verwendung ist.

**Hinweise:** Alle in einem System möglichen Status-Werte MÜSSEN über FHIR korrekt repräsentiert werden. KÖNNEN mindestens jedoch die Status-Werte "active" und "retired". Deren korrekte Abbildung wird im Rahmen des Bestätigungsverfahrens überprüft.

### `CodeSystem.content`

**Bedeutung:** Angabe, ob es sich um eine vollständige Repräsentation des CodeSystems oder nur um einen Auszug handelt.

**Hinweise:** Alle in einem System möglichen Status-Werte müssen über FHIR korrekt repräsentiert werden können, mindestens jedoch die Status-Werte "fragment" und "complete". Deren korrekte Abbildung wird im Rahmen des Bestätigungsverfahrens überprüft.

### `CodeSystem.concept`

**Bedeutung:** Angabe der Konzepte, aus denen sich das CodeSystem zusammensetzt.

**Hinweise:** Es MUSS mindestens ein Code und ein Anzeigetext spezifiziert werden.

---