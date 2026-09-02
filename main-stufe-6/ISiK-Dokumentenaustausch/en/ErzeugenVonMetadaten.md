# Interaktion: Erzeugen von Metadaten - ISiK Dokumentenaustausch Implementierungsleitfaden v6.0.0

ISiK Dokumentenaustausch Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* **Interaktion: Erzeugen von Metadaten**

## Interaktion: Erzeugen von Metadaten

### Hinweise und Anmerkungen zur Implementierung von IHE MHD ITI-106 (Generate Metadata)

Für die Implementierung der Interaktion "Erzeugen von Dokumentenmetadaten" gelten die in IHE MHD festgelegten Vereinbarungen zu [ITI-106](https://profiles.ihe.net/ITI/MHD/ITI-106.html) (Generate Metadata) gemäß der unten aufgelisteten Kapitel. Abweichungen bzw. zusätzliche Festlegungen im Kontext von ISiK sind im Folgenden zu den einzelnen Kapiteln vermerkt. Die verlinkte Webseite bietet weiterführende Informationen zur "Generate Metadata" Interaktion, einschließlich grafischer Darstellungen der Interaktionen. Für Informationen zu einem historischen Breaking Change zwischen ISiK Stufe 2 und 3, siehe [Hinweis] (https://simplifier.net/guide/isik-dokumentenaustausch-stufe-5/Einfuehrung/Festlegungen/ErzeugenVonMetadaten?version=5.1.2).

#### 2:3.106.4.1 Generate Metadata Request Message

##### 2:3.106.4.1.1 Trigger Events

Die Vereinbarungen gelten uneingeschränkt.

##### 2:3.106.4.1.2 Message Semantics

Die Vereinbarungen gelten uneingeschränkt.

##### 2:3.106.4.1.3 Expected Actions

Der Fokus für die Implementierung der Operation im ISiK-Kontext sollte auf dem Persistieren und Erzeugen von Metadaten für ISiK-konforme Bundles gemäß [Interaktion ISiK Modul Basis: Bericht aus Subsystem](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc1/StructureDefinition-ISiKBerichtSubSysteme.html) liegen. Für die Implementierung kann das unten angegeben ISiK-Spezifische Mapping Composition -> DocumentReference als Anhaltspunkt verwendet werden.

Die Unterstützung weiterer Input-Formate (z.B. CDA oder andere FHIR-Dokumente, wie MIOs, eRezept, eAU etc.) ist optional.

Alle weiteren Unterkapitel von 2:3.106.4.1.3 Expected Actions sind für den ISiK-Kontext nicht relevant.

#### 2:3.106.4.2 Generate Metadata Response Message

##### 2:3.106.4.2.1 Trigger Events

Die Vereinbarungen gelten uneingeschränkt.

##### 2:3.106.4.2.2 Message Semantics

Die Vereinbarungen gelten uneingeschränkt.

##### 2:3.106.4.2.3 Expected Actions

Die Vereinbarungen gelten uneingeschränkt.

#### 2:3.106.4.3 CapabilityStatement Resource

Es gelten die Vereinbarungen gemäß [dem CapabilityStatement](CapabilityStatement-ISiKCapabilityStatementDokumentenServerAkteur-expanded.md).

#### 2:3.106.5 Security Considerations

Für Hinweise zur Implementierung von Autorisation und Authentifikation im ISiK-Kontext, siehe [Modul ISiK-Connect](https://gemspec.gematik.de/ig/fhir/isik/connect/6.0.0-rc1/index.html)

### ISiK-Spezifisches Mapping Composition -> DocumentReference

| | | |
| :--- | :--- | :--- |
| DocumentReference.author | Composition.author |  |
| DocumentReference.category.coding:XDS | Composition.category.coding[XDS] | Kann mittels Lookup in den KDL->XDS ConceptMaps anhand des KDL-Type-Codes ermittelt werden |
| DocumentReference.content.attachment.contentType | `application/html` für den extrahierten Narrative, `application/fhir+xml` oder `application/fhir+json` für das Bundle |  |
| DocumentReference.content.attachment.creation | Composition.date |  |
| DocumentReference.content.attachment.language | =de sofern keine abweichende Angabe in Composition.language |  |
| DocumentReference.content.attachment.title | Composition.title |  |
| DocumentReference.content.attachment.url | vom Server festgelegter Speicherort des Bundles/Narratives |  |
| DocumentReference.content.format | =urn:ihe:iti:xds:2017:mimeTypeSufficient |  |
| DocumentReference.context.encounter | Lookup Composition.encounter.resolve().identifier | Ermittlung des korrekten Encounters auf dem Server anhand des Identifiers(Fallnummer) und/oder weiterer Kriterien erforderlich |
| DocumentReference.context.facilityType | =KHS, sofern nichts anderes bekannt |  |
| DocumentReference.context.practiceSetting | Lookup Composition.encounter.resolve().serviceType | Mapping per https://wiki.hl7.de/index.php?title=Ihevs:DocumentEntry.PracticeSettingCode von Fachabteilungsschlüssel auf PracticeSetting erforderlich. |
| DocumentReference.docStatus | Composition.status |  |
| DocumentReference.identifier | Composition.identifier |  |
| DocumentReference.masterIdentifier | Bundle.identifier |  |
| DocumentReference.relatesTo.code | Composition.relatesTo.code |  |
| DocumentReference.relatesTo.target | Lookup Composition.relatesTo.targetReference.resolve().identifier | Ermittlung der zu ersetzenden DocumentReference anhand des identifiers der referenzierten Composition erforderlich |
| DocumentReference.status | =current |  |
| DocumentReference.subject | Lookup Composition.subject.resolve().identifier[PID] | Ermittlung des korrekten Patienten auf dem Server anhand des Identifiers (PID) und/oder weiterer Kriterien erforderlich |
| DocumentReference.type.coding:KDL | Composition.type.coding[KDL] |  |
| DocumentReference.type.coding:XDS | Composition.type.coding[XDS] | Kann mittels Lookup in den KDL->XDS ConceptMaps anhand des KDL-Type-Codes ermittelt werden |

