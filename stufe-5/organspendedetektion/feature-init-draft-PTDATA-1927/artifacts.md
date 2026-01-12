# FHIR-Artefakte - Organspendeerkennung v0.0.1-rc

Organspendeerkennung

Version 0.0.1-rc - STU1

* [**Table of Contents**](toc.md)
* **FHIR-Artefakte**

## FHIR-Artefakte

Auf dieser Seite befindet sich eine Liste der FHIR-Artefakte, welche im Rahmen dieses Implementation Guide definiert werden.

### CapabilityStatements

#### Akteure

| | |
| :--- | :--- |
| [Akteur "ISiKCapabilityStatementBasisServerAkteur" (Expanded)](CapabilityStatement-ISiKCapabilityStatementBasisServerAkteur-expanded.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diesen Akteur implementiert.Jede Instanz eines bestätigungsrelevanten Systems MUSS an ihrem Endpunkt eine CapabilityStatement-Ressource bereitstellen. Hierzu MUSS die[capabilities-Interaktion gemäß FHIR-Kernspezifikation](https://hl7.org/fhir/R4/http.html#capabilities)unterstützt werden. Der`MODE`-Parameter kann ignoriert werden.Das CapabilityStatement in dieser Spezifikation stellt die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Rollen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Imports-Expectation-Extension](https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation)mit den möglichen Werten ‘SHALL’ (=MUSS) ‘SHOULD’ (=SOLL) ‘MAY’ (=KANN) ‘SHOULD-NOT’ (=SOLL NICHT) verwendet.Eine Server-Instanz MUSS ihrerseits ein CapabilityStatement vom`kind = instance`liefern und im Element`software`den Namen und die Versionsnummer angeben.Darüber hinaus MÜSSEN in`CapabilityStatement.instantiates`sämtliche Canonical URLs der implementierten Rollen angegeben werden. Die mindestens zu implementierenden Profile für einen Akteur und Interaktionen entsprechen daher den aggregierten Anforderungen der einzelnen Rolle (per ‘imports’). In den CapabilityStatements zu den Rollen sind die Anforderungen tabellarisch gelistet und weisen so die zu implementierenden Profile aus.Das CapabilityStatement der Instanz MUSS alle Funktionalitäten auflisten, die im folgenden CapabilityStatement (bzw. der in ihm importierten Rollen - siehe ‘imports’) mit`SHALL`gekennzeichnet sind. Das CapabilityStatement KANN darüber hinaus die mit`MAY`gekennzeichneten Funktionalitäten, sowie weitere Funktionalitäten auflisten, sofern diese in der Instanz implementiert wurden.Die Verwendung der CapabilityStatement-Expectation-Extension ist im CapabilityStatement der Server-Instanz nicht erforderlich. |
| [Akteur "ISiKCapabilityStatementBasisServerAkteur"](CapabilityStatement-ISiKCapabilityStatementBasisServerAkteur.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diesen Akteur implementiert.Jede Instanz eines bestätigungsrelevanten Systems MUSS an ihrem Endpunkt eine CapabilityStatement-Ressource bereitstellen. Hierzu MUSS die[capabilities-Interaktion gemäß FHIR-Kernspezifikation](https://hl7.org/fhir/R4/http.html#capabilities)unterstützt werden. Der`MODE`-Parameter kann ignoriert werden.Das CapabilityStatement in dieser Spezifikation stellt die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Rollen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Imports-Expectation-Extension](https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation)mit den möglichen Werten ‘SHALL’ (=MUSS) ‘SHOULD’ (=SOLL) ‘MAY’ (=KANN) ‘SHOULD-NOT’ (=SOLL NICHT) verwendet.Eine Server-Instanz MUSS ihrerseits ein CapabilityStatement vom`kind = instance`liefern und im Element`software`den Namen und die Versionsnummer angeben.Darüber hinaus MÜSSEN in`CapabilityStatement.instantiates`sämtliche Canonical URLs der implementierten Rollen angegeben werden. Die mindestens zu implementierenden Profile für einen Akteur und Interaktionen entsprechen daher den aggregierten Anforderungen der einzelnen Rolle (per ‘imports’). In den CapabilityStatements zu den Rollen sind die Anforderungen tabellarisch gelistet und weisen so die zu implementierenden Profile aus.Das CapabilityStatement der Instanz MUSS alle Funktionalitäten auflisten, die im folgenden CapabilityStatement (bzw. der in ihm importierten Rollen - siehe ‘imports’) mit`SHALL`gekennzeichnet sind. Das CapabilityStatement KANN darüber hinaus die mit`MAY`gekennzeichneten Funktionalitäten, sowie weitere Funktionalitäten auflisten, sofern diese in der Instanz implementiert wurden.Die Verwendung der CapabilityStatement-Expectation-Extension ist im CapabilityStatement der Server-Instanz nicht erforderlich. |

**Tabelle:**Capability Statements - Akteure

#### Rollen

| | |
| :--- | :--- |
| [CapabilityStatement für Rolle "AufbaustrukturRolle"](CapabilityStatement-ISiKCapabilityStatementAufbaustrukturRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. |
| [CapabilityStatement für Rolle "ISiKCapabilityStatementCompositionKonsumentenRolle"](CapabilityStatement-ISiKCapabilityStatementCompositionKonsumentenRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. |
| [CapabilityStatement für Rolle "ISiKCapabilityStatementErweiterteStammdatenRolle"](CapabilityStatement-ISiKCapabilityStatementErweiterteStammdatenRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. |
| [CapabilityStatement für Rolle "ISiKCapabilityStatementGesundheitsstatusRolle"](CapabilityStatement-ISiKCapabilityStatementGesundheitsstatusRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. |
| [CapabilityStatement für Rolle "ISiKCapabilityStatementKlinischeRolle"](CapabilityStatement-ISiKCapabilityStatementKlinischeRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. |
| [CapabilityStatement für Rolle "LeistungserbringerRolle"](CapabilityStatement-ISiKCapabilityStatementLeistungserbringerRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. |
| [CapabilityStatement für Rolle "StammdatenRolle"](CapabilityStatement-ISiKCapabilityStatementStammdatenRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. |
| [CapabilityStatement für Rolle "ISiKCapabilityStatementTerminologieRolle"](CapabilityStatement-ISiKCapabilityStatementTerminologieRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. |
| [CapabilityStatement für Rolle "ISiKCapabilityStatementVersicherungsverhaeltnisRolle"](CapabilityStatement-ISiKCapabilityStatementVersicherungsverhaeltnisRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. |

**Tabelle:**Capability Statements - Rollen

### Ressourcenprofile

|
|

**Tabelle:**Ressourcenprofile

### Datentypen

|
|

**Tabelle:**Datentypen

### Terminologien

#### Value Sets

Die folgenden Value Sets sind für die Audit-Event-Service-Funktionalitäten festgelegt.

| | |
| :--- | :--- |
| [ISiKValueSet](StructureDefinition-ISiKValueSet.md) | Dieses Profil beschreibt die maschinenlesbare Auswahl von Codes für die Kodierung spezifischer FHIR-Elemente in ISiK-Szenarien.### MotivationISiK erlaubt in diversen Kontexten die Erweiterung der Kodierung durch Krankenhaus- / System-interne Kodierungen. Mittels der Veröffentlichung von ValueSets können Auswahllisten für externe Clients bereitgestellt werden, sodass diese entsprechende Kodierungen ebenfalls anbieten können.### KompatibilitätFür das Profil ISiKValueSet wurde bis zum Zeitpunkt der Veröffentlichung kein Abgleich der Kompatibilität zu anderen Profilen (der KBV und der Medizininformatik-Initiative) durchgeführt. Hinweise zu Inkompatibilitäten können über die[Portalseite](https://service.gematik.de/servicedesk/customer/portal/16)gemeldet werden. |
| [DiagnosesSCT](ValueSet-DiagnosesSCT.md) | Enthaelt alle SNOMED Clinical finding, Event und Situation with explicit context codes |
| [ISiKLocationPhysicalType](ValueSet-ISiKLocationPhysicalType.md) | - |
| [TestValueSet](ValueSet-ISiKValueSetExample.md) | - |
| [ProzedurenCodesSCT](ValueSet-ProzedurenCodesSCT.md) | Enthaelt alle SNOMED Procedure Codes |
| [ProzedurenKategorieSCT](ValueSet-ProzedurenKategorieSCT.md) | Enthaelt alle SNOMED Codes für ein Mapping der OPS Klassentitel |
| [Schwangerschaft Erwarteter Entbindungstermin Methode](ValueSet-SchwangerschaftEtMethodeVS.md) | - |
| [Schwangerschaftsstatus Valueset](ValueSet-SchwangerschaftsstatusVS.md) | - |
| [Stillstatus LOINC Antwortoptionen](ValueSet-StillstatusVS.md) | Dieses Valueset enthält die Codes zur Beschreibung von Stillstatus LOINC. |
| [Current Smoking Status - IPS](ValueSet-current-smoking-status-uv-ips.md) | HL7 LOINC value set for smoking status. Based on the HL7 Vocab and Structured Doc WG (formerly TC) consensus - per US CDC submission 7/12/2012 for smoking status terms. |

**Tabelle:**Value Sets

#### Code Systems

| | |
| :--- | :--- |
| [TestKatalog](CodeSystem-CodeSystemExample.md) | - |
| [ISiKCodeSystem](StructureDefinition-ISiKCodeSystem.md) | Dieses Profil beschreibt die maschinenlesbare Repräsentation von system-spezifischen Kodierungen in ISiK-Szenarien.### MotivationISiK erlaubt in diversen Kontexten die Erweiterung der Kodierung durch Krankenhaus-/System-interne Kodierungen. Das Profil ISiKKatalog (CodeSystem) als Profil erlaubt die Repräsentation der dazugehörigen Codes und Display-Werte.Eine maschinenlesbare Repräsentation dieser Kodierungen erlaubt es Clients, dazugehörige Anzeigetext und Definitionen zu verarbeiten.Ein Codesystem eignet sich auch dazu, auf dessen Basis definierte[ValueSets zu expandieren](https://hl7.org/fhir/R4/valueset-operation-expand.html). Da ISiKValueSet expandierte Valuesets vorsieht, ist eine dynamische Expansion in der Regel nicht erforderlich. Darüber hinausgehend ist ein Use Case im Kontext der Katalogabfrage folgender: Ein Client möchte eine Expansion neu generieren (z.B. mit anderen Expansionen-Parametern), um das ValueSet beispielsweise in einer anderen Sprache auszugeben. |

**Tabelle:**Code Systems

