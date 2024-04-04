### Anmerkungen zu den Must-Support-Feldern

### `Composition.id`

**Bedeutung:** Subsystem-interne Datensatz-ID

### `Composition.profile`

**Bedeutung:** Erklärung zur Konformität zum ISiK-Profil

### `Composition.text`

**Bedeutung:** menschenlesbare Repräsentation des Dokumentenkopfes (Metadaten)

**Hinweise:** Die Mindestanforderungen an den Inhalt der menschenlesbaren Repräsentation umfasst folgende Informationen:

* Composition.subject:Patient.name.family
* Composition.subject:Patient.birthDate
* Composition.subject:Patient.identifier:pid
* Composition.status
* Composition.type.text
* Composition.date
* Composition.title
* Composition.author.display  

### `Composition.identifier`

**Bedeutung:** Subsystem-seitig zugewiesener Identifier des Berichtes mit Angabe der URL des vom Subsystem verwendeten Namensraumes

**Hinweise:** Werden eigene Identifier bzw. NamingSystems verwendet, so sei auf den Leitfaden der Basisprofile Deutschland (HL7 Deutschland) zu den [Best-Practices bei Namensräumen](https://ig.fhir.de/basisprofile-de/stable/Terminologie-Namensraeume.html) verwiesen.

Dazu ein Beispiel für einen Identifier eines Sub-System-Berichts:
```xml
<identifier>
    <system value="https://fhir.krankenhaus.example/sid/system-a/berichtnummer" />
    <value value="0123456789" />
</identifier>
```
Die Verwendung von OIDs ist möglich, wird jedoch nicht empfohlen. Für die Verwendung von OIDs KANN folgendes Format verwendet werden:

* Das Feld `system` enthält den festen Wert "urn:ietf:rfc:3986"
* Das Feld `value` enthält die OID mit dem Präfix "urn:oid:"

Beispiel:
```xml
<identifier>
    <system value="urn:ietf:rfc:3986"/>
    <value value="urn:oid:2.16.840.1.113883.6.96"/>
</identifier>
```

### `Composition.status`

**Bedeutung:** Status des Dokumentes

### `Composition.type`

**Bedeutung:** Dokumenttyp

**Hinweise:** In der aktuellen Ausbaustufe von ISiK ist textuelle Repräsentation des Dokumenttyps (`type.text`) ausreichend. Die darüber hinausgehende Codierung des Dokumenttyps (z.B. mit LOINC, IHE-Typecodes oder KDL) in `type.coding` KANN implementiert werden

### `Composition.subject`

**Bedeutung:** Patientenbezug des Dokumentes

### `Composition.encounter`

**Bedeutung:** Fallbezug des Dokumentes

### `Composition.date`

**Bedeutung:** Datum der letzten Änderung am Dokument

### `Composition.author.display`

**Bedeutung:** Autor des Dokumentes (Person, Subsystem)

**Hinweise:** In der aktuellen Ausbaustufe von ISiK ist die Verwendung der textuellen Repräsentation (display) von Autor und Subsystem ausreichend. Die darüber hinausgehende Verlinkung auf Practitioner bzw. Device-Ressourcen KANN implementiert werden.

### `Composition.title`

**Bedeutung:** Dokumentenbezeichnung

**Hinweise:** Die Dokumentenbezeichnung dient der Darstellung des Dokumentes in einer Übersicht, z.B. in einer Patientenakte, und KANN der schnellen Auffindbarkeit eines gesuchten Dokumentes dienen. Geeignete Bezeichnungen sind zum Beispiel

* "Kleines Blutbild vom 13.10.2020"
* "Pathologiebefund (Abstrich) vom 13.10.2020"
* "Blutgasmessung vom 13.10.2020 14:14h"

### `Composition.section.title`

**Bedeutung:** Kapitelüberschrift

### `Composition.section.text`

**Bedeutung:** menschenlesbare Repräsentation des Inhalts eines Kapitels

**Hinweise:** Für Aggregation einer vollständigen menschenlesbaren Repräsentation MÜSSEN die Repräsentationen der einzelnen Kapitel an die Repräsentation der Metadaten (`Composition.text`) angehängt werden. Für die Separierung KÖNNEN einfache \<div\>-Tags verwendet werden.
Es ist zu beachten, dass Kapitel auch Unterkapitel enthalten KÖNNEN (`Composition.section.section`), die bei der Aggregation entsprechend berücksichtigt werden MÜSSEN.

Die Mindestanforderungen an den Inhalt der menschenlesbaren Repräsentation umfasst folgende Informationen:

* `section.title` + Freitext **oder**
* `section.title` + `Resource.text` der referenzierten Ressource **oder**
* `section.title` + eine aggregierte Repräsentation von `Resource.text` wenn in einer Section mehrere Ressourcen referenziert werden.

---
