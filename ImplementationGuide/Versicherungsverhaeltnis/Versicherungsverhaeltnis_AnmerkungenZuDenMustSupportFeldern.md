### Anmerkungen zu den Must-Support Feldern

#### Das Profil ISiKVersicherungsverhaeltnisGesetzlich

### `Coverage.identifier:KrankenversichertenID`

**Bedeutung:** Der unveränderliche, 10-stellige Teil der Krankenversichertennummer zur Identifikation des Versicherten, die Krankenversicherten-ID.
**Hinweise:** Dieser identifier ist zur eindeutigen Identifikation des gesetzlich Versicherten nötig, in den von diesem Profil unterstützten Anwendungsszenarien, siehe [Beschreibung der Deutschen Basisprofile](https://simplifier.net/guide/basisprofil-de-r4/gesetzlicheKrankenversichertennummer10-stelligeKVIDe).

### `Coverage.status`

**Bedeutung:** Der Status einer Instanz des Profils ISiKVersicherungsverhaeltnisGesetzlich.

**Hinweise:** Das Element status macht deutlich, ob diese Instanz genutzt werden kann oder ob sie bspw. als ungültig oder falsch gekennzeichnet ist, siehe [FHIR Kernspezifikaton](http://hl7.org/fhir/coverage-definitions.html#Coverage.status).

### `Coverage.type`

**Bedeutung:** Das Element type kennzeichnet die Art der Versicherung.

**Hinweise:** Kennzeichnung als gesetzliche Versicherung, siehe [Beschreibung der deutschen Basisprofile](http://fhir.de/CodeSystem/versicherungsart-de-basis).

### `Coverage.beneficiary`

**Bedeutung:** Das Element beneficiary benennt die versicherte Person, auf die sich die Kostenübernahme durch die Versicherung bezieht.

**Hinweise:** Für ISiK MUSS beneficiary ein Patient nach dem Profil ISiKPatient sein.

### `Coverage.payor`

**Bedeutung:** Der Kostenträger des Versicherten.

**Hinweise:** Der Kostenträger der gesetzlichen Versicherung wird durch ein Institutskennzeichen in Coverage.payor.identifier identifiziert.

#### Das Profil ISiKVersicherungsverhaeltnisSelbstzahler

### `Coverage.subscriber`

**Bedeutung:** Der Inhaber der Versicherungspolice.

**Hinweise:** Kann entweder der Patient selbst oder ein Hauptversicherter nach dem Profil ISiKHauptversicherter sein.

### `Coverage.beneficiary`

Siehe entsprechenden Eintrag zum Profil ISiKVersicherungsverhaeltnisGesetzlich oben.

### `Coverage.payor`

**Bedeutung:** Der Rechnungsempfänger.

**Hinweise:** Der Rechnungsempfänger für Selbstzahler ist entweder der Patient selbst,  Hauptversicherte oder eine andere Partei.
