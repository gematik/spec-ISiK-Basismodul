# FHIR-Artefakte - ISiK Dokumentenaustausch Implementierungsleitfaden v6.0.0-rc

ISiK Dokumentenaustausch Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* **FHIR-Artefakte**

## FHIR-Artefakte

Auf dieser Seite befindet sich eine Liste der FHIR-Artefakte, welche im Rahmen dieses Implementation Guide definiert werden.

Folgende Datenobjekte aus dem Modul ISiK Basis werden in diesem Modul verwendet:

* [Patient]()
* [Kontakt/Fall (Encounter)]()
* [Binary]()

Die Verwendung der genannten Ressourcen in diesem Modul bedeutet: Wenn ein Profil aus diesem Modul auf die genannten Datenobjekte aus dem Basismodul referenziert, dann MÜSSEN die referenzierten FHIR-Ressourcen im ISiK-Kontext konform zu Vorgaben an diese Ressourcen aus dem Basismodul sein (Profilkonformität). Die konkreten Vorgaben zu Interaktionen und Abhängigkeiten zwischen Modulen werden noch präzisiert.

Darüber hinaus gelten die [übergreifenden Festlegungen zu FHIR-Artefakten aus dem Basimodul](https://gemspec.gematik.de/fhir/ig/TODO/LINK/IG).

### CapabilityStatements

#### Akteure

| | |
| :--- | :--- |
| [ ISiK CapabilityStatement Dokumenten Server Akteur (Expanded) ](CapabilityStatement-ISiKCapabilityStatementDokumentenServerAkteur-expanded.md) | CapabilityStatement für den Akteur "ISiKCapabilityStatementDokumentenServerAkteur". Dieser Akteur aggregiert die Rollen zur Erzeugung und dem Abruf von Metadaten für Dokumente. |
| [ ISiK CapabilityStatement Dokumenten Server Akteur ](CapabilityStatement-ISiKCapabilityStatementDokumentenServerAkteur.md) | CapabilityStatement für den Akteur "ISiKCapabilityStatementDokumentenServerAkteur". Dieser Akteur aggregiert die Rollen zur Erzeugung und dem Abruf von Metadaten für Dokumente. |

**Tabelle:**Capability Statements - Akteure

#### Rollen

| | |
| :--- | :--- |
| [ ISiK CapabilityStatement Dokumentenverwaltung Rolle ](CapabilityStatement-ISiKCapabilityStatementDokumentenverwaltungRolle.md) | CapabilityStatement für die Rolle "ISiKCapabilityStatementDokumentenverwaltungRolle". Diese Rolle beschreibt verpflichtende Interaktionen zur Erstellung, dem Abruf und der Aktualisierung von Dokumenten. |
| [ ISiK CapabilityStatement Metadaten Erzeugen Rolle ](CapabilityStatement-ISiKCapabilityStatementMetadatenErzeugenRolle.md) | CapabilityStatement für die Rolle "ISiKCapabilityStatementMetadatenErzeugenRolle". Diese Rolle beschreibt verpflichtende Interaktionen zur Erzeugung von Metadaten für Dokumente. |
| [ ISiK CapabilityStatement Metadaten Update Rolle ](CapabilityStatement-ISiKCapabilityStatementMetadatenUpdateRolle.md) | CapabilityStatement für die Rolle "ISiKCapabilityStatementMetadatenUpdateRolle". Diese Rolle beschreibt verpflichtende Interaktionen zur Aktualisierung von Metadaten für Dokumente. |

**Tabelle:**Capability Statements - Rollen

### Ressourcenprofile

| | |
| :--- | :--- |
| [ ISiK CapabilityStatement Imports Expectation ](StructureDefinition-ExtensionISiKCapabilityStatementImportsExpectation.md) | Defines the level of expectation associated with a given system capability. See the capabilitystatement-prohibited modifier extension to set expectations to **not** support a feature. |
| [ ISiKBinary ](StructureDefinition-ISiKBinary.md) | Dieses Profil ermöglicht die Darstellung von FHIR-fremden Formaten (z.B. PDFs, Bilder, CDA) in ISiK Szenarien.Motivation Für FHIR-fremde Formate werden die Daten base64-codiert in der Binary-Ressource (in XML oder JSON) transportiert oder über die REST-API am Binary-Endpunkt in ihrem nativen Format bereitgestellt. Binary-Ressourcen werden von Attachment-Elementen in DocumentReference-Ressourcen verlinkt und damit in den Kontext anderer FHIR-Ressourcen (z.B. Patient und Encounter) gestellt.KompatibilitätHinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden.HinweisDas ISIK-Binary-Profil ist **nicht** Bestandteil der Implementierung und des Bestätigungsverfahrens zum ISIK Basismodul. Das Profil ist Teil des ISIK Basismoduls, da es im [Modul Dokumentenaustausch](https://simplifier.net/guide/isik-dokumentenaustausch-stufe-5/Einfuehrung/Artefakte/Datenobjekte_ISiKBinary) implementiert werden muss und ein hohes Potential für die Wiederverwednung in anderen Modulen naheliegt. |
| [ Erforderliche Metadaten für Dokumentenaustausch in ISiK ](StructureDefinition-ISiKDokumentenMetadaten.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Dokumentenmetadaten im Rahmen des Bestätigungsverfahrens der gematik.Motivation Die Ressource DocumentReference enthält die Metadaten, die für die Verwaltung von und die Suche nach Dokumenten benötigt werden. Der Inhalt des Dokumentes wird über DocumentReference.content beschrieben und über DocumentReference.content.attachment referenziert. Die Trennung von Dokument und Metadaten ermöglicht Clients die effiziente Suche und Auflistung von verfügbaren Dokumenten, ohne dass diese vollständig vom Server geladen werden müssen. Servern ermöglicht dieser Ansatz die Trennung zwischen den Metadaten in einer Datenbank und der Dokumentenablage in z.B. einem Dateisystem.Kompatibilität Dieses Profil basiert auf dem Profil [MHD DocumentReference Comprehensive UnContained References Option](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.UnContained.Comprehensive.DocumentReference.html) (Version 4.2.0) von IHE International.Abweichungen vom IHE-Profil* Die Verwendung von `DocumentReference.docStatus` ist im ISiK-Kontext gestattet.
* `DocumentReference.category` muss vom Client bei Vorhandensein eines KDL-Codes in `DocumentReference.type` nicht gefüllt werden. Bei der Verarbeitung auf dem Server im Rahmen der Interaktion {{pagelink: Dokumentenbereitstellung}} wird `DocumentReference.category` anhand der [KDL-Mappings](https://simplifier.net/kdl/%7Eresources?category=ConceptMap&sortBy=RankScore_desc) ergänzt und damit die IHE-Kompatibilität hergestellt.
* `DocumentReference.sourcePatientInfo` muss im Rahmen von ISiK nicht gefüllt werden
Einschränkungen des IHE-Profils Elemente mit ValueSet-Bindings ohne verbindliche Vorgabe seitens IHE wurden auf die in Deutschland gebräuchlichen Terminologien (gemäß der Festlegungen von IHE Deutschland e.V.) eingeschränkt. |
| [ ISiKTerminPriorityExtension ](StructureDefinition-ISiKTerminPriorityExtension.md) | Diese Extension ermöglicht die strukturierte Angabe der Dringlichkeit (Priorität) eines Termins. Dies ist wichtig, um Notfälle oder besonders dringliche Termine im Buchungs- und Verwaltungssystem deutlich zu kennzeichnen und eine priorisierte Bearbeitung zu ermöglichen. |

**Tabelle:**Ressourcenprofile

### Terminologien

#### Value Sets

Die folgenden Value Sets sind für die Audit-Event-Service-Funktionalitäten festgelegt.

| | |
| :--- | :--- |
| [ ISiKConfidentialityCodes ](ValueSet-ISiKConfidentialityCodes.md) | Vertraulichkeitsstufen |

**Tabelle:**Value Sets

#### Code Systems

|
|

**Tabelle:**Code Systems

### Beispiele

**DocumentReference**

* [Example DocumentReference - dok-beispiel-client-with-binary-jpeg-example-short](DocumentReference-dok-beispiel-client-with-binary-jpeg-example-short.md)

* [Example DocumentReference - dok-beispiel-client-with-binary-jpeg-example](DocumentReference-dok-beispiel-client-with-binary-jpeg-example.md)

* [Example DocumentReference - dok-beispiel-client-with-binary-pdf-example-short](DocumentReference-dok-beispiel-client-with-binary-pdf-example-short.md)

* [Example DocumentReference - dok-beispiel-client-with-binary-pdf-example](DocumentReference-dok-beispiel-client-with-binary-pdf-example.md)

* [Example DocumentReference - dok-beispiel-server](DocumentReference-dok-beispiel-server.md)

**Tabelle:**Beispiel-Instanzen

