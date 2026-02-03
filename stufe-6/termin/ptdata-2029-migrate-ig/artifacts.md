# Artifacts Summary - ISiK Terminplanung Implementierungsleitfaden v6.0.0-rc

ISiK Terminplanung Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Behavior: Capability Statements 

The following artifacts define the specific capabilities that different types of systems are expected to have in order to comply with this implementation guide. Systems conforming to this implementation guide are expected to declare conformance to one or more of the following capability statements.

| | |
| :--- | :--- |
| [CapabilityStatement für Rolle &quot;ISiKCapabilityStatementTerminologieRolle&quot;](CapabilityStatement-ISiKCapabilityStatementTerminologieRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die [CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) mit den möglichen Werten `SHALL` (=MUSS) und `MAY` (=KANN) verwendet. |
| [CapabilityStatement für Rolle &quot;StammdatenRolle&quot;](CapabilityStatement-ISiKCapabilityStatementStammdatenRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die [CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) mit den möglichen Werten `SHALL` (=MUSS) und `MAY` (=KANN) verwendet. |
| [ISiK CapabilityStatement Termin-Repository Akteur](CapabilityStatement-ISiKCapabilityStatementTerminRepositoryAkteur.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diesen Akteur implementiert.Jede Instanz eines bestätigungsrelevanten Systems MUSS an ihrem Endpunkt eine CapabilityStatement-Ressource bereitstellen. Hierzu MUSS die [capabilities-Interaktion gemäß FHIR-Kernspezifikation](https://hl7.org/fhir/R4/http.html#capabilities) unterstützt werden. Der `MODE`-Parameter kann ignoriert werden. Das CapabilityStatement in dieser Spezifikation stellt die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Rollen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die [CapabilityStatement-Imports-Expectation-Extension](https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation) mit den möglichen Werten ‘SHALL’ (=MUSS) ‘SHOULD’ (=SOLL) ‘MAY’ (=KANN) ‘SHOULD-NOT’ (=SOLL NICHT) verwendet.Eine Server-Instanz MUSS ihrerseits ein CapabilityStatement vom `kind = instance` liefern und im Element `software` den Namen und die Versionsnummer angeben.  Darüber hinaus MÜSSEN in `CapabilityStatement.instantiates` sämtliche Canonical URLs der implementierten Rollen angegeben werden. Die mindestens zu implementierenden Profile für einen Akteur und Interaktionen entsprechen daher den aggregierten Anforderungen der einzelnen Rolle (per ‘imports’). In den CapabilityStatements zu den Rollen sind die Anforderungen tabellarisch gelistet und weisen so die zu implementierenden Profile aus.Das CapabilityStatement der Instanz MUSS alle Funktionalitäten auflisten, die im folgenden CapabilityStatement (bzw. der in ihm importierten Rollen - siehe ‘imports’) mit `SHALL` gekennzeichnet sind. Das CapabilityStatement KANN darüber hinaus die mit `MAY` gekennzeichneten Funktionalitäten, sowie weitere Funktionalitäten auflisten, sofern diese in der Instanz implementiert wurden.Die Verwendung der CapabilityStatement-Expectation-Extension ist im CapabilityStatement der Server-Instanz nicht erforderlich. |
| [ISiK CapabilityStatement Termin-Repository Akteur (Expanded)](CapabilityStatement-ISiKCapabilityStatementTerminRepositoryAkteur-expanded.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diesen Akteur implementiert.Jede Instanz eines bestätigungsrelevanten Systems MUSS an ihrem Endpunkt eine CapabilityStatement-Ressource bereitstellen. Hierzu MUSS die [capabilities-Interaktion gemäß FHIR-Kernspezifikation](https://hl7.org/fhir/R4/http.html#capabilities) unterstützt werden. Der `MODE`-Parameter kann ignoriert werden. Das CapabilityStatement in dieser Spezifikation stellt die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Rollen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die [CapabilityStatement-Imports-Expectation-Extension](https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation) mit den möglichen Werten ‘SHALL’ (=MUSS) ‘SHOULD’ (=SOLL) ‘MAY’ (=KANN) ‘SHOULD-NOT’ (=SOLL NICHT) verwendet.Eine Server-Instanz MUSS ihrerseits ein CapabilityStatement vom `kind = instance` liefern und im Element `software` den Namen und die Versionsnummer angeben.  Darüber hinaus MÜSSEN in `CapabilityStatement.instantiates` sämtliche Canonical URLs der implementierten Rollen angegeben werden. Die mindestens zu implementierenden Profile für einen Akteur und Interaktionen entsprechen daher den aggregierten Anforderungen der einzelnen Rolle (per ‘imports’). In den CapabilityStatements zu den Rollen sind die Anforderungen tabellarisch gelistet und weisen so die zu implementierenden Profile aus.Das CapabilityStatement der Instanz MUSS alle Funktionalitäten auflisten, die im folgenden CapabilityStatement (bzw. der in ihm importierten Rollen - siehe ‘imports’) mit `SHALL` gekennzeichnet sind. Das CapabilityStatement KANN darüber hinaus die mit `MAY` gekennzeichneten Funktionalitäten, sowie weitere Funktionalitäten auflisten, sofern diese in der Instanz implementiert wurden.Die Verwendung der CapabilityStatement-Expectation-Extension ist im CapabilityStatement der Server-Instanz nicht erforderlich. |
| [ISiK CapabilityStatement Termin-Repository Rolle](CapabilityStatement-ISiKCapabilityStatementTerminRepositoryRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die [CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) mit den möglichen Werten `SHALL` (=MUSS) und `MAY` (=KANN) verwendet. |

### Behavior: Operation Definitions 

These are custom operations that can be supported by and/or invoked by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Book](OperationDefinition-ISiKAppointmentBookOperation.md) | OperationDefinition für die Buchung eines Termins. Die Operation überprüft ob der Termin noch verfügbar ist im Termin-Repository. |

### Behavior: Search Parameters 

These define the properties by which a RESTful server can be searched. They can also be used for sorting and including related resources.

| | |
| :--- | :--- |
| [DateStart](SearchParameter-Encounter-date-start.md) | The actual start date of the Encounter (Backport from R5). The parameter cannot repeat or have multiple values. |
| [EndDate](SearchParameter-Encounter-end-date.md) | The actual end date of the Encounter (Backport from R5). The parameter cannot repeat or have multiple values. |

### Structures: Resource Profiles 

These define constraints on FHIR resources for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [ISiKCodeSystem](StructureDefinition-ISiKCodeSystem.md) | Dieses Profil beschreibt die maschinenlesbare Repräsentation von system-spezifischen Kodierungen in ISiK-Szenarien.### MotivationISiK erlaubt in diversen Kontexten die Erweiterung der Kodierung durch Krankenhaus-/System-interne Kodierungen. Das Profil ISiKKatalog (CodeSystem) als Profil erlaubt die Repräsentation der dazugehörigen Codes und Display-Werte.Eine maschinenlesbare Repräsentation dieser Kodierungen erlaubt es Clients, dazugehörige Anzeigetext und Definitionen zu verarbeiten.Ein Codesystem eignet sich auch dazu, auf dessen Basis definierte [ValueSets zu expandieren](https://hl7.org/fhir/R4/valueset-operation-expand.html). Da ISiKValueSet expandierte Valuesets vorsieht, ist eine dynamische Expansion in der Regel nicht erforderlich. Darüber hinausgehend ist ein Use Case im Kontext der Katalogabfrage folgender: Ein Client möchte eine Expansion neu generieren (z.B. mit anderen Expansionen-Parametern), um das ValueSet beispielsweise in einer anderen Sprache auszugeben. |
| [ISiKKalender](StructureDefinition-ISiKKalender.md) | Das Datenobjekt ISiKKalender bietet die Möglichkeit Kalender für verschiedene Akteure (Practitioner, Device, HealthcareService) zu exponieren, sodass für die Ressourcen Termine gebucht werden können. |
| [ISiKKontaktGesundheitseinrichtung](StructureDefinition-ISiKKontaktGesundheitseinrichtung.md) | Dieses Profil ermöglicht die Abbildung von Besuchen/Aufenthalten eines Patienten in einer Gesundheitseinrichtung.### MotivationInformationen über die Besuche des Patienten entlang seines Behandlungspfades im Krankenhaus sind ein wichtiger Bestandteil des einrichtungsinternen Datenaustausches. Sie ermöglichen die Unterscheidung von stationären und ambulanten sowie aufgenommenen und entlassenen Patienten. Weiterhin ist aus den Besuchsinformationen der aktuelle Aufenthaltsort des Patienten (Fachabteilung, Station, Bettplatz) ermittelbar. Klinische Ressourcen werden in FHIR durch Verlinkung auf die Encounter-Ressource in einen Kontext zum Besuch gestellt. Dieser Kontext ist wichtig für die Steuerung von Zugriffsberechtigungen und Abrechnungsprozessen.Zu Beginn der meisten klinischen Workflows steht die Auswahl des Besuchskontextes. Dies geschieht bspw. durch das Suchen der Encounter-Ressource anhand von Eigenschaften wie Aufnahmenummer, Fallart oder Aufnahmedatum. Daraufhin werden die zutreffenden Suchergebnisse angezeigt und der gewünschte Besuch ausgewählt.In FHIR werden Besuche, Aufenthalte, aber auch virtuelle Kontakte mit der `Encounter`-Ressource repräsentiert.Weitere Hinweise zu den Abgrenzungen der Begrifflichkeiten Fall und Kontakt finden sie unter### KompatibilitätFür das Profil ISiKKontaktGesundheitseinrichtung wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISiKKontaktGesundheitseinrichtung valide sind, auch valide sind gegen:* Profil [Kontakt mit einer Gesundheitseinrichtung der Medizininformatik-Initiative](https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung)
Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. |
| [ISiKMedizinischeBehandlungseinheit](StructureDefinition-ISiKMedizinischeBehandlungseinheit.md) | Unter einer medizinischen Behandlungseinheit wird hier im weiteren Sinne eine Dienstleistung (diagnostisch, therapeutisch, im weiten Sinne gesundheitsfördernd etc.) zum Zweck einer Terminbuchung verstanden. Hierfür können von der Fachabteilung (Organization) unabhängige Kalender gepflegt werden. Im Kontext der Terminplanung können somit angebotene Leistungen (z.B. CT/MRT-Untersuchungen, chirurgische Eingriffe, Beratungsstunden zur Geburt etc.) abgebildet werden.Der Kontext zu diesem Profil wird mit folgender User Story veranschaulicht:**User Story**: Ein Patient erhält von seiner Hausärztin einen Überweisungsschein für eine weitere diagnostische Untersuchung in Form einer Kapselendoskopie der Speiseröhre. Der Patient nutzt ein Patientenportal, um unter Angabe der benötigten diagnostische Leistung nach einem verfügbaren Termin zu suchen und findet einen passenden Termin bei der Fachabteilung für Gastroenterologie eines örtlichen Krankenhauses.Hintergrund: Die Suche nach verfügbaren Terminenblöcken (Slot) unter Einbeziehung der Dienstleistung entspricht der Angabe des Überweisungsscheins, ermöglicht hier zugleich eine präzisere Suche und vergrößert darüber hinaus den Raum möglicher Termine über verschiedene Abteilungen (und Institutionen im Patientenportal) hinweg. |
| [ISiKPatient](StructureDefinition-ISiKPatient.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von administrativen Patientendaten im Rahmen des Bestätigungsverfahrens der gematik.### MotivationDer Austausch administrativer Patientendaten ist eine der grundlegenden Funktionalitäten beim Datenaustausch in der klinischen Versorgung. In FHIR werden sämtliche klinischen Ressourcen durch Verlinkung auf die Ressource ‘Patient’ in einen Patientenkontext gestellt. Die Herstellung des korrekten Patientenkontextes durch Suchen der Patientenressource anhand von Eigenschaften wie Aufnahmenummer, Name oder Geburtsdatum, die Anzeige der zutreffenden Suchergebnisse und der Auswahl bzw. Bestätigung des richtigen Datensatzes durch den Anwender steht am Beginn der meisten klinischen Workflows.### KompatibilitätFür das Profil ISIKPatient wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKPatient valide sind, auch valide sind gegen:* [Profil KBV_PR_Base_Patient der KBV Basisprofile](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Patient)
* [Profil Patient im International Patient Summary (IPS)](https://hl7.org/fhir/uv/ips/StructureDefinition-Patient-uv-ips.html)
* [Profil Patient der MI-Initiative](https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient)
* [Profil TIPatient der gematik](https://gematik.de/fhir/ti/StructureDefinition/ti-patient)
Es ist zu beachten, dass das Profil ISiKPatient NICHT unmittelbar kompatibel mit folgenden Profilen ist:* [Profil EPAPatient der gematik](https://gematik.de/fhir/epa/StructureDefinition/epa-patient): In ISiK ist die Angabe einer KVNR nicht verpflichtend, da in vielen Use Cases bereits eine PID ausreichend ist. Außerdem ist in ISiK keine verpflichtende Versionierung über meta.versionId vorgesehen.
 |
| [ISiKTermin](StructureDefinition-ISiKTermin.md) | Das Datenobjekte ISiKTermin repräsentiert einen gebuchten Termin, sowie einen Terminvorschlag. |
| [ISiKTerminblock](StructureDefinition-ISiKTerminblock.md) | Die Slot-Ressource repräsentiert die Verbindung eines Termins (Appointment) und den dazugehörigen Ressourcen (z.B. HealthcareService, Device, Practitioner). Für diese Ressourcen können separate Kalender (Schedules) verwaltet werden. Der Slot agiert als Verbindungsstück zwischen diesen Ressourcen. |
| [ISiKValueSet](StructureDefinition-ISiKValueSet.md) | Dieses Profil beschreibt die maschinenlesbare Auswahl von Codes für die Kodierung spezifischer FHIR-Elemente in ISiK-Szenarien.### MotivationISiK erlaubt in diversen Kontexten die Erweiterung der Kodierung durch Krankenhaus- / System-interne Kodierungen. Mittels der Veröffentlichung von ValueSets können Auswahllisten für externe Clients bereitgestellt werden, sodass diese entsprechende Kodierungen ebenfalls anbieten können.### KompatibilitätFür das Profil ISiKValueSet wurde bis zum Zeitpunkt der Veröffentlichung kein Abgleich der Kompatibilität zu anderen Profilen (der KBV und der Medizininformatik-Initiative) durchgeführt. Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. |

### Structures: Extension Definitions 

These define constraints on FHIR data types for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [ISiK CapabilityStatement Imports Expectation](StructureDefinition-ExtensionISiKCapabilityStatementImportsExpectation.md) | Defines the level of expectation associated with a given system capability. See the capabilitystatement-prohibited modifier extension to set expectations to **not** support a feature. |
| [ISiKTerminPriorityExtension](StructureDefinition-ISiKTerminPriorityExtension.md) | Diese Extension ermöglicht die strukturierte Angabe der Dringlichkeit (Priorität) eines Termins. Dies ist wichtig, um Notfälle oder besonders dringliche Termine im Buchungs- und Verwaltungssystem deutlich zu kennzeichnen und eine priorisierte Bearbeitung zu ermöglichen. |

### Terminology: Value Sets 

These define sets of codes used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [ISiKLocationPhysicalType](ValueSet-ISiKLocationPhysicalType.md) |  |
| [ISiKTerminCancelationReason](ValueSet-ISiKTerminCancelationReason.md) | Enthaelt alle erlaubten Gruende fuer eine Stornierung eines ISiKTermins |

### Example: Example Instances 

These are example instances that show what data produced and consumed by systems conforming with this implementation guide might look like.

| |
| :--- |
| [Allgemeine Beratungsstelle der Fachabteilung 0100](HealthcareService-ISiKMedizinischeBehandlungseinheitExample.md) |
| [Example Appointment - ISiKTerminExample](Appointment-ISiKTerminExample.md) |
| [Example Appointment - ISiKTerminExampleExtendedICU](Appointment-ISiKTerminExampleExtendedICU.md) |
| [Example Encounter - Fachabteilungskontakt](Encounter-Fachabteilungskontakt.md) |
| [Example Encounter - FachabteilungskontaktBettenverlegung](Encounter-FachabteilungskontaktBettenverlegung.md) |
| [Example Encounter - FachabteilungskontaktEntlassung](Encounter-FachabteilungskontaktEntlassung.md) |
| [Example Encounter - FachabteilungskontaktFachbereichswechsel1](Encounter-FachabteilungskontaktFachbereichswechsel1.md) |
| [Example Encounter - FachabteilungskontaktFachbereichswechsel2](Encounter-FachabteilungskontaktFachbereichswechsel2.md) |
| [Example Encounter - FachabteilungskontaktMinimal2](Encounter-FachabteilungskontaktMinimal2.md) |
| [Example Encounter - FachabteilungskontaktNormal](Encounter-FachabteilungskontaktNormal.md) |
| [Example Encounter - FachabteilungskontaktStationaereAufnahme](Encounter-FachabteilungskontaktStationaereAufnahme.md) |
| [Example Encounter - FachabteilungskontaktStationswechsel1](Encounter-FachabteilungskontaktStationswechsel1.md) |
| [Example Encounter - FachabteilungskontaktStationswechsel2](Encounter-FachabteilungskontaktStationswechsel2.md) |
| [Example Encounter - SZ1Nachstationaer](Encounter-SZ1Nachstationaer.md) |
| [Example Encounter - SZ1Stationaer](Encounter-SZ1Stationaer.md) |
| [Example Encounter - SZ1Vorstationaer](Encounter-SZ1Vorstationaer.md) |
| [Example Encounter - SZ2Encounter](Encounter-SZ2Encounter.md) |
| [Example Patient - DorisQuelle](Patient-DorisQuelle.md) |
| [Example Patient - DorisZiel](Patient-DorisZiel.md) |
| [Example Patient - IsikPatientTemplate](Patient-IsikPatientTemplate.md) |
| [Example Patient - PatientinMinimal](Patient-PatientinMinimal.md) |
| [Example Patient - PatientinMusterfrau](Patient-PatientinMusterfrau.md) |
| [Example Patient - PatientinNormal](Patient-PatientinNormal.md) |
| [Example Patient - SZ1Patient](Patient-SZ1Patient.md) |
| [Example Patient - SZ2Patient](Patient-SZ2Patient.md) |
| [Example Schedule - ISiKKalenderExample](Schedule-ISiKKalenderExample.md) |
| [Example Slot - ISiKTerminblockExample](Slot-ISiKTerminblockExample.md) |
| [TestKatalog](CodeSystem-CodeSystemExample.md) |
| [TestValueSet](ValueSet-ISiKValueSetExample.md) |

