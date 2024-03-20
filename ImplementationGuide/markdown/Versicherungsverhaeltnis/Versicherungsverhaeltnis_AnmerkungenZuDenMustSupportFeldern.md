### Anmerkungen zu den Must-Support Feldern

#### Das Profil ISiKVersicherungsverhaeltnisGesetzlich

### `Coverage.identifier`

**Hinweise:** Grundsätzlich ist zu beachten, dass das Versicherungsverhältnis für die gesetzliche Versicherung durch die 30-stellige KVNR identifiziert wird. Die 10-stellige KVNR (gemeint ist der unveränderbare 10-stellige Teil zur Identifikation des Versicherten laut ITSG: https://www.itsg.de/produkte/vst-krankenversichertennummer) ist hingegen ein Identifier für das Datenobjekt Patient. Siehe {{pagelink:ImplementationGuide/markdown/Patient_Profil.md, text:Datenobjekt - Patient}}. Es wird in ISiK davon ausgegangen, dass die 30-stellige KVNR nicht in bestätigungrelevanten Systemen geführt wird, sodass diese nicht als zuverlässiger Identifier für das Versicherungsverhältnis verwendbar ist. Bei einer Suche nach einem Versicherungsverhältnis SOLLTE dieses per Chaining auf das Datenobjekt Patient ermittelt werden.

### `Coverage.status`

**Bedeutung:** Der Status einer Instanz des Profils ISiKVersicherungsverhaeltnisGesetzlich.

**Hinweise:** Das Element status macht deutlich, ob diese Instanz genutzt werden kann oder ob sie bspw. als ungültig oder falsch gekennzeichnet ist, siehe [FHIR Kernspezifikaton](https://hl7.org/fhir/R4/coverage-definitions.html#Coverage.status).

### `Coverage.type`

**Bedeutung:** Das Element type kennzeichnet die Art der Versicherung.

**Hinweise:** Kennzeichnung als gesetzliche Versicherung, siehe [Beschreibung der deutschen Basisprofile](https://fhir.de/CodeSystem/versicherungsart-de-basis).

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

**Hinweise:** Der Rechnungsempfänger für Selbstzahler ist entweder der Patient selbst, Hauptversicherte oder eine andere Partei.

---
