### Anmerkungen zu den Must-Support-Feldern

### `Practitioner.identifier:ANR`

**Bedeutung:** Lebenslange Arztnummer. Im Krankenhaus ist die Lebenslange Arztnummer der Ärzte bekannt und MUSS zur eindeutigen Identifikation eines Arztes bereitgestellt werden.

**Hinweise:** Siehe [Beschreibung der Deutschen Basisprofile](https://ig.fhir.de/basisprofile-de/1.2.0/LebenslangeArztnummerLANR-Identifier.html)

Während die Deutschen Basisprofile hier die Abkürzung LANR verwenden, ist im KBV-Kontext das Akronym ANR gebräuchlich. Die Bezeichnung des Slices hat jedoch keinerlei Auswirkungen auf die Kompatibilität.

### `Practitioner.name:name`

**Bedeutung:** Vollständiger Name. Der Name des Arztes MUSS in konkreten Anwendungen angezeigt werden können. Es MUSS nach dem Namen des Arztes gesucht werden können.

### `Practitioner.address:Strassenanschrift`

**Bedeutung:** Straßenanschrift. Ist die Adresse bekannt unter der ein Arzt erreichbar ist, MUSS sie bereitgestellt werden.

### `Practitioner.address:Postfach`

**Bedeutung:** Postfachanschrift. Ist die Postfachadresse bekannt unter der ein Arzt erreichbar ist, MUSS sie bereitgestellt werden.

### `Practitioner.gender`

**Bedeutung:** Administratives Geschlecht. Ist das Geschlecht des Arztes bekannt, MUSS es bereitgestellt werden.

### `Practitioner.birthDate`

**Bedeutung:** Geburtsdatum. Ist das Geburtsdatum des Arztes bekannt, MUSS es bereitgestellt werden.

### `Practitioner.qualification`

**Bedeutung:** Ärztliche Qualifikation(en). Es MÜSSEN die Qualifikationen des Arztes bereitgestellt werden, um nach Ärzten einer Qualifikation zu suchen oder sie bspw. in Dokumenten anzuzeigen.
