### Anmerkungen zu Must-Support-Feldern

### `Patient.active`

**Bedeutung:** Indikator "Patientdatensatz ist in aktiver Benutzung"

**Hinweise:** Siehe Beschreibung in der [FHIR Kernspezifikation](http://hl7.org/fhir/patient-definitions.html#Patient.active)

### `Patient.identifier:versichertenId_GKV`

**Bedeutung:** Versicherten ID der gesetzlichen Krankenkasse

**Hinweise:** Siehe [Beschreibung der Deutschen Basisprofile](https://simplifier.net/guide/basisprofil-de-r4/Datentypen-Identifier#GesetzlicheKrankenversichertennummer10-stelligeKVID-Identifier)

### `Patient.identifier:pid`

**Bedeutung:** Organisationsinterner Patienten-Identifier

**Hinweise:** Siehe [Beschreibung der Deutschen Basisprofile](https://simplifier.net/guide/basisprofil-de-r4/Datentypen-Identifier#OrganisationsinternerPatienten-Identifier)

### `Patient.identifier:versicherungsnummer_pkv`

**Bedeutung:** Versicherten Nr., falls versichert bei einer privaten Krankenkasse

**Hinweise:** Siehe [Beschreibung der Deutschen Basisprofile](https://simplifier.net/guide/basisprofil-de-r4/Datentypen-Identifier#PrivateKrankenversichertennummer-Identifier)

### `Patient.name:name`

**Bedeutung:** Vollständiger Name

**Hinweise:** Siehe [Beschreibung der Deutschen Basisprofile](https://simplifier.net/guide/basisprofil-de-r4/Ressourcen-Patient-Name)

### `Patient.name:geburtsname` 

**Bedeutung:** Geburtsname des Patienten (nur Nachname)

**Hinweise:** Siehe [Beschreibung der Deutschen Basisprofile](https://simplifier.net/guide/basisprofil-de-r4/Ressourcen-Patient-Name)

### `Patient.address:Strassenanschrift`

**Bedeutung:** Straßen-Adresse

**Hinweise:** Siehe [Beschreibung der Deutschen Basisprofile](https://simplifier.net/guide/basisprofil-de-r4/Ressourcen-Patient#Ressourcen-Patient-Addresse)

### `Patient.address:Postfach`

**Bedeutung:** Postfach-Adresse

**Hinweise:** Siehe [Beschreibung der Deutschen Basisprofile](https://simplifier.net/guide/basisprofil-de-r4/Ressourcen-Patient#Ressourcen-Patient-Addresse)

### `Patient.gender`

**Bedeutung:** Administratives Geschlecht

**Hinweise:** Siehe [Beschreibung der Deutschen Basisprofile](https://simplifier.net/guide/basisprofil-de-r4/Ressourcen-Patient#Ressourcen-Patient-Geschlecht)

### `Patient.birthdate`

**Bedeutung:** Geburtsdatum

**Hinweise:** Siehe [Beschreibung der Deutschen Basisprofile](https://simplifier.net/guide/basisprofil-de-r4/Ressourcen-Patient#Ressourcen-Patient-Geburtsdatum)

### Stornierung von Patienten

Im Rahmen des ISiK Basismoduls SOLLTE die Stornierung eines Patienten entweder durch das Löschen der Patienten-Ressource oder der Verwendung des Feldes `Patient.active` abgebildet werden. Dies ist abhängig davon, wie die Stornierung im bestätigungsrelevanten System umgesetzt ist. Im letzteren Fall wird die Stornierung durch das Setzen von `Patient.active` auf `false` gekennzeichnet.