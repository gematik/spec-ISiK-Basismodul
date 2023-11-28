### Anmerkungen zu Must-Support-Feldern

### `ValueSet.url`

**Bedeutung:** Eindeutige Url zur Identifizierung des ValueSets. Absolute Urls sind zu bevorzugen.

**Hinweise:** OIDs SOLLTEN als weitere Identifier des CodeSystems verwendet werden. In jedem Fall SOLLTE eine Canonical Url vergeben werden.

### `ValueSet.version`

**Bedeutung:** Version des ValueSets

**Hinweise:** Jede Änderung des dazugehörigen CodeSystems MUSS eine Änderung in der Version des CodeSystems und ValueSets nach sich ziehen.

### `ValueSet.name`

**Bedeutung:** Maschinenlesbarer Name des ValueSets

**Hinweise:** Der Constraint [vsd-0](https://www.hl7.org/fhir/R4/valueset.html#invs) ist hierbei zu beachten.

### `ValueSet.status`

**Bedeutung:** Indikation, ob das ValueSet in aktiver Verwendung ist.

**Hinweise:** Alle in einem System möglichen Status-Werte müssen über FHIR korrekt repräsentiert werden können, mindestens jedoch die Status-Werte "active" und "retired". Deren korrekte Abbildung wird im Rahmen des Bestätigungsverfahrens überprüft.

### `ValueSet.useContext`

**Bedeutung:** Angabe für welches Datenelement das ValueSet relevant ist

**Hinweise:** Es muss mindestens ein useContext angegeben werden, in dem der Ressourcen-Typ kodiert wird, in dem das ValueSet in einem Element zur Verwendung kommt.

### `ValueSet.expansion`

**Bedeutung:** Angabe der Konzepte aus denen sich das ValueSet zusammensetzt.

**Hinweise:** Mindestens MUSS ein Code und ein Anzeigetext spezifiziert werden.

---