# FHIR-Artefakte - ISiK Dokumentenaustausch Implementierungsleitfaden v6.0.0

ISiK Dokumentenaustausch Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* **FHIR-Artefakte**

## FHIR-Artefakte

Auf dieser Seite befindet sich eine Liste der FHIR-Artefakte, welche im Rahmen dieses Implementation Guide definiert werden.

Folgende Datenobjekte aus dem Modul ISiK Basis werden in diesem Modul verwendet:

* Patient - https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc1/StructureDefinition-ISiKPatient.html
* Kontakt/Fall (Encounter) - https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc1/StructureDefinition-ISiKKontaktGesundheitseinrichtung.html
* Binary - https://gemspec.gematik.de/ig/fhir/isik/dokumentenaustausch/6.0.0-rc1/StructureDefinition-ISiKBinary.html

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
| [ CapabilityStatement für Rolle StammdatenRolle ](CapabilityStatement-ISiKCapabilityStatementStammdatenRolle.md) | CapabilityStatement für die Rolle ISiKCapabilityStatementStammdatenRolle. Diese Rolle beschreibt Interaktionen zum Abruf und der Verarbeitung grundlegender Stammdaten. |

**Tabelle:**Capability Statements - Rollen

### Profile

#### Datentyp-Profile

|
|

**Tabelle:**Datentyp-Profile

#### Extensions

| | |
| :--- | :--- |
| [ ISiK CapabilityStatement Imports Expectation (Extension) ](StructureDefinition-ExtensionISiKCapabilityStatementImportsExpectation.md) | Defines the level of expectation associated with a given system capability. See the capabilitystatement-prohibited modifier extension to set expectations to **not** support a feature. |
| [ ExtensionISiKRehaEntlassung (Extension) ](StructureDefinition-ExtensionISiKRehaEntlassung.md) | Extension zur Dokumentation von Informationen nach §301 (4 und 4a) SGB V, entsprechend dem ärztliche Reha-Entlassungsbericht. Mit dieser Extension können spezifische Entlassungsinformationen im Kontext einer Rehabilitationsmaßnahme angegeben werden. Dies ist besonders relevant für Einrichtungen, die Leistungen im Bereich Rehabilitation erbringen, und unterstützt die strukturierte Kommunikation im Entlassmanagement. |

**Tabelle:**Extensions

#### Ressourcen-Profile

| | | |
| :--- | :--- | :--- |
| [ ISiKBinary (Binary) ](StructureDefinition-ISiKBinary.md) | Binary | Dieses Profil ermöglicht die Darstellung von FHIR-fremden Formaten (z.B. PDFs, Bilder, CDA) in ISiK Szenarien.**Motivation**Für FHIR-fremde Formate werden die Daten base64-codiert in der Binary-Ressource (in XML oder JSON) transportiert oder über die REST-API am Binary-Endpunkt in ihrem nativen Format bereitgestellt. Binary-Ressourcen werden von Attachment-Elementen in DocumentReference-Ressourcen verlinkt und damit in den Kontext anderer FHIR-Ressourcen (z.B. Patient und Encounter) gestellt.**Kompatibilität**Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden.HinweisDas ISIK-Binary-Profil ist **nicht** Bestandteil der Implementierung und des Bestätigungsverfahrens zum ISIK Basismodul. Das Profil ist Teil des ISIK Basismoduls, da es im [Modul Dokumentenaustausch](https://gemspec.gematik.de/ig/fhir/isik/dokumentenaustausch/6.0.0-rc1/StructureDefinition-ISiKBinary.html) implementiert werden muss und ein hohes Potential für die Wiederverwednung in anderen Modulen naheliegt. |
| [ Erforderliche Metadaten für Dokumentenaustausch in ISiK (DocumentReference) ](StructureDefinition-ISiKDokumentenMetadaten.md) | DocumentReference | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Dokumentenmetadaten im Rahmen des Bestätigungsverfahrens der gematik.**Motivation**Die Ressource DocumentReference enthält die Metadaten, die für die Verwaltung von und die Suche nach Dokumenten benötigt werden. Der Inhalt des Dokumentes wird über DocumentReference.content beschrieben und über DocumentReference.content.attachment referenziert. Die Trennung von Dokument und Metadaten ermöglicht Clients die effiziente Suche und Auflistung von verfügbaren Dokumenten, ohne dass diese vollständig vom Server geladen werden müssen. Servern ermöglicht dieser Ansatz die Trennung zwischen den Metadaten in einer Datenbank und der Dokumentenablage in z.B. einem Dateisystem.**Kompatibilität**Dieses Profil basiert auf dem Profil [MHD DocumentReference Comprehensive UnContained References Option](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.UnContained.Comprehensive.DocumentReference.html) (Version 4.2.0) von IHE International.#**Abweichungen vom IHE-Profil*** Die Verwendung von `DocumentReference.docStatus` ist im ISiK-Kontext gestattet.
* `DocumentReference.category` muss vom Client bei Vorhandensein eines KDL-Codes in `DocumentReference.type` nicht gefüllt werden. Bei der Verarbeitung auf dem Server im Rahmen der Interaktion [Dokumentenbereitstellung](Interaktion-Dokumentenbereitstellung.md.md) wird `DocumentReference.category` anhand der [KDL-Mappings](https://simplifier.net/kdl/%7Eresources?category=ConceptMap&sortBy=RankScore_desc) ergänzt und damit die IHE-Kompatibilität hergestellt.
* `DocumentReference.sourcePatientInfo` muss im Rahmen von ISiK nicht gefüllt werden
#**Einschränkungen des IHE-Profils**Elemente mit ValueSet-Bindings ohne verbindliche Vorgabe seitens IHE wurden auf die in Deutschland gebräuchlichen Terminologien (gemäß der Festlegungen von IHE Deutschland e.V.) eingeschränkt. |
| [ ISiKKontaktGesundheitseinrichtung (Encounter) ](StructureDefinition-ISiKKontaktGesundheitseinrichtung.md) | Encounter | Dieses Profil ermöglicht die Abbildung von Besuchen/Aufenthalten eines Patienten in einer Gesundheitseinrichtung.**Motivation**Informationen über die Besuche des Patienten entlang seines Behandlungspfades im Krankenhaus sind ein wichtiger Bestandteil des einrichtungsinternen Datenaustausches. Sie ermöglichen die Unterscheidung von stationären und ambulanten sowie aufgenommenen und entlassenen Patienten. Weiterhin ist aus den Besuchsinformationen der aktuelle Aufenthaltsort des Patienten (Fachabteilung, Station, Bettplatz) ermittelbar. Klinische Ressourcen werden in FHIR durch Verlinkung auf die Encounter-Ressource in einen Kontext zum Besuch gestellt. Dieser Kontext ist wichtig für die Steuerung von Zugriffsberechtigungen und Abrechnungsprozessen.Zu Beginn der meisten klinischen Workflows steht die Auswahl des Besuchskontextes. Dies geschieht bspw. durch das Suchen der Encounter-Ressource anhand von Eigenschaften wie Aufnahmenummer, Fallart oder Aufnahmedatum. Daraufhin werden die zutreffenden Suchergebnisse angezeigt und der gewünschte Besuch ausgewählt.In FHIR werden Besuche, Aufenthalte, aber auch virtuelle Kontakte mit der `Encounter`-Ressource repräsentiert.Weitere Hinweise zu den Abgrenzungen der Begrifflichkeiten Fall und Kontakt finden sie unter [Fall-Begriff in ISiK](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc1/Abbildung-des-Konstrukts-Fall.html).**Kompatibilität**Für das Profil ISiKKontaktGesundheitseinrichtung wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISiKKontaktGesundheitseinrichtung valide sind, auch valide sind gegen:* Profil [Kontakt mit einer Gesundheitseinrichtung der Medizininformatik-Initiative](https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung)
Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. |
| [ ISiKPatient (Patient) ](StructureDefinition-ISiKPatient.md) | Patient | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von administrativen Patientendaten im Rahmen des Bestätigungsverfahrens der gematik. **Motivation**: Der Austausch administrativer Patientendaten ist eine der grundlegenden Funktionalitäten beim Datenaustausch in der klinischen Versorgung. In FHIR werden sämtliche klinischen Ressourcen durch Verlinkung auf die Ressource 'Patient' in einen Patientenkontext gestellt. Die Herstellung des korrekten Patientenkontextes durch Suchen der Patientenressource anhand von Eigenschaften wie Aufnahmenummer, Name oder Geburtsdatum, die Anzeige der zutreffenden Suchergebnisse und der Auswahl bzw. Bestätigung des richtigen Datensatzes durch den Anwender steht am Beginn der meisten klinischen Workflows.**Kompatibilität**: Für das Profil ISIKPatient wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKPatient valide sind, auch valide sind gegen:* [Profil KBV_PR_Base_Patient der KBV Basisprofile](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Patient)
* [Profil Patient im International Patient Summary (IPS)](https://hl7.org/fhir/uv/ips/StructureDefinition-Patient-uv-ips.html)
* [Profil Patient der MI-Initiative](https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient)
Gegen folgende Profile ist das Profil ISiKPatient unmittelbar kompatibel:* [Profil TIPatient der gematik](https://gematik.de/fhir/ti/StructureDefinition/ti-patient)
Es ist zu beachten, dass das Profil ISiKPatient NICHT unmittelbar kompatibel mit folgenden Profilen ist:* [Profil EPAPatient der gematik](https://gematik.de/fhir/epa/StructureDefinition/epa-patient): In ISiK ist die Angabe einer KVNR nicht verpflichtend, da in vielen Use Cases bereits eine PID ausreichend ist. Außerdem ist in ISiK keine verpflichtende Versionierung über meta.versionId vorgesehen.
 |

**Tabelle:**Ressourcen-Profile

### Terminologien

#### Value Sets

| | |
| :--- | :--- |
| [ ISiKBehandlungsergebnisRehaVS ](ValueSet-ISiKBehandlungsergebnisReha.md) | Behandlungsergebnis Reha gemäß §301(4 UND 4A) SGB V. Diagnosenbezogene Bewertung des Behandlungsergebnisses für einen Versicherten/Berechtigten bei Entlassung aus der Reha-Maßnahme bzw. Stellung eines Antrags auf Verlängerung. Vgl. Schlüsseltabelle 2.71 Diagnose - Behandlungsergebnis. |
| [ ISiKBesondereBehandlungsformRehaVS ](ValueSet-ISiKBesondereBehandlungsformReha.md) | Besondere Behandlungsform der Reha gemäß §301(4 UND 4A) SGB V. Vgl. Schlüsseltabelle 2.51 Besondere Behandlungsformen. |
| [ ISiKConfidentialityCodes ](ValueSet-ISiKConfidentialityCodes.md) | Vertraulichkeitsstufen |
| [ ISiKEncounterClassDE ](ValueSet-ISiKEncounterClassDE.md) | Erweitert das ValueSet EncounterClassDE der Deutschen Basisprofile um die Codes ACUTE, NONAC und OBSENC aus dem HL7 v3 ActCode System zur Harmonisierung mit dem HL7 Europe Hospital Discharge Report (HDR). Ein Issue zur Aufnahme dieser Codes in EncounterClassDE wurde bei den Deutschen Basisprofilen eingereicht. |
| [ ISiKEncounterTypeErweiterungVS ](ValueSet-ISiKEncounterTypeErweiterungVS.md) | ISiK vereint hierbei das ValueSet [KontaktArtDe](http://fhir.de/CodeSystem/kontaktart-de) aus dem deutschen Basisprofil und die übergangsweise hinzugefügten Codes für den ambulanten Kontakt im Krankenhaus. Dieses ValueSet ist als Übergangslösung zu verstehen, da die Inhalte beim TC Terminologien von HL7 eingebracht sind und sobald sie dort publiziert sind, wird eine Migration auf die dortigen Codes erfolgen. |
| [ ISiKEntlassformRehaVS ](ValueSet-ISiKEntlassformReha.md) | ISiK Entlassform Reha. Beschreibt Form und ggf. Weiterbehandlung der Entlassung eines Versicherten/Berechtigten aus verwaltungs- und medizinischer Sicht. Vgl. Schlüsseltabelle 2.107 Entlassungsform. |
| [ ISiKUnterbrechungRehaVS ](ValueSet-ISiKUnterbrechungReha.md) | ISiK Unterbrechung Reha. Dokumentiert die relevanten Gründe einer Unterbrechung einer Rehabilitationsmaßnahme im Einzelfall. Vgl. Schlüsseltabelle 2.111 Erläuterung zur Unterbrechung. |

**Tabelle:**Value Sets

#### Code Systems

| | |
| :--- | :--- |
| [ ISiKBehandlungsergebnisReha ](CodeSystem-ISiKBehandlungsergebnisRehaCS.md) | Behandlungsergebnis Reha gemäß §301(4 UND 4A) SGB V. Diagnosenbezogene Bewertung des Behandlungsergebnisses für einen Versicherten/Berechtigten bei Entlassung aus der Reha-Maßnahme bzw. Stellung eines Antrags auf Verlängerung. Vgl. Schlüsseltabelle 2.71 Diagnose - Behandlungsergebnis. |
| [ ISiKBesondereBehandlungsformReha ](CodeSystem-ISiKBesondereBehandlungsformRehaCS.md) | Besondere Behandlungsform der Reha gemäß §301(4 UND 4A) SGB V. Vgl. Schlüsseltabelle 2.51 Besondere Behandlungsformen. |
| [ Erweiterung von Encounter.type in ISiK ](CodeSystem-ISiKEncounterTypeErweiterungCS.md) | ISiK definiert an dieser Stelle eigene Encounter Typen. Dieses CodeSystem ist als Übergangslösung zu verstehen, da die Inhalte beim TC Terminologien von HL7 eingebracht sind und sobald sie dort publiziert sind, wird eine Migration auf die dortigen Codes erfolgen. |
| [ ISiKEntlassformReha ](CodeSystem-ISiKEntlassformRehaCS.md) | ISiK Entlassform Reha. Beschreibt Form und ggf. Weiterbehandlung der Entlassung eines Versicherten/Berechtigten aus verwaltungs- und medizinischer Sicht. Vgl. Schlüsseltabelle 2.107 Entlassungsform. |
| [ ISiKUnterbrechungReha ](CodeSystem-ISiKUnterbrechungRehaCS.md) | ISiK Unterbrechung Reha. Dokumentiert die relevanten Gründe einer Unterbrechung einer Rehabilitationsmaßnahme im Einzelfall. Vgl. Schlüsseltabelle 2.111 Erläuterung zur Unterbrechung. |

**Tabelle:**Code Systems

### Beispiele

**DocumentReference**

* [dok-beispiel-client-with-binary-jpeg-example-short](DocumentReference-dok-beispiel-client-with-binary-jpeg-example-short.md)
* [dok-beispiel-client-with-binary-jpeg-example](DocumentReference-dok-beispiel-client-with-binary-jpeg-example.md)
* [dok-beispiel-client-with-binary-pdf-example-short](DocumentReference-dok-beispiel-client-with-binary-pdf-example-short.md)
* [dok-beispiel-client-with-binary-pdf-example](DocumentReference-dok-beispiel-client-with-binary-pdf-example.md)
* [dok-beispiel-server](DocumentReference-dok-beispiel-server.md)

**Encounter**

* [Fachabteilungskontakt](Encounter-Fachabteilungskontakt.md)
* [FachabteilungskontaktBettenverlegung](Encounter-FachabteilungskontaktBettenverlegung.md)
* [FachabteilungskontaktEntlassung](Encounter-FachabteilungskontaktEntlassung.md)
* [FachabteilungskontaktFachbereichswechsel1](Encounter-FachabteilungskontaktFachbereichswechsel1.md)
* [FachabteilungskontaktFachbereichswechsel2](Encounter-FachabteilungskontaktFachbereichswechsel2.md)
* [FachabteilungskontaktMinimal2](Encounter-FachabteilungskontaktMinimal2.md)
* [FachabteilungskontaktNormal](Encounter-FachabteilungskontaktNormal.md)
* [FachabteilungskontaktStationaereAufnahme](Encounter-FachabteilungskontaktStationaereAufnahme.md)
* [FachabteilungskontaktStationswechsel1](Encounter-FachabteilungskontaktStationswechsel1.md)
* [FachabteilungskontaktStationswechsel2](Encounter-FachabteilungskontaktStationswechsel2.md)
* [SZ1Nachstationaer](Encounter-SZ1Nachstationaer.md)
* [SZ1Stationaer](Encounter-SZ1Stationaer.md)
* [SZ1Vorstationaer](Encounter-SZ1Vorstationaer.md)
* [SZ2Encounter](Encounter-SZ2Encounter.md)
* [isik-encounter-Sternenfall](Encounter-isik-encounter-Sternenfall.md)

**Parameters**

* [exp-params](Parameters-exp-params.md)

**Patient**

* [DorisQuelle](Patient-DorisQuelle.md)
* [DorisZiel](Patient-DorisZiel.md)
* [IsikPatientTemplate](Patient-IsikPatientTemplate.md)
* [PatientinMinimal](Patient-PatientinMinimal.md)
* [PatientinMusterfrau](Patient-PatientinMusterfrau.md)
* [PatientinNormal](Patient-PatientinNormal.md)
* [SZ1Patient](Patient-SZ1Patient.md)
* [SZ2Patient](Patient-SZ2Patient.md)
* [isik-patient-156722](Patient-isik-patient-156722.md)

**Tabelle:**Beispiel-Instanzen

