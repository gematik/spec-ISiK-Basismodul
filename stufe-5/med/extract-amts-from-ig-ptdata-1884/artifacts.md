# Artifacts Summary - AMTS ISiK Implementation Guide v0.0.1

AMTS ISiK Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Behavior: Capability Statements 

The following artifacts define the specific capabilities that different types of systems are expected to have in order to comply with this implementation guide. Systems conforming to this implementation guide are expected to declare conformance to one or more of the following capability statements.

| | |
| :--- | :--- |
| [CapabilityStatement für Rolle &quot;ISiKCapabilityStatementGesundheitsstatusRolle&quot;](CapabilityStatement-ISiKCapabilityStatementGesundheitsstatusRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. |
| [CapabilityStatement für Rolle &quot;ISiKCapabilityStatementKlinischeRolle&quot;](CapabilityStatement-ISiKCapabilityStatementKlinischeRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. |
| [CapabilityStatement für Rolle &quot;LeistungserbringerRolle&quot;](CapabilityStatement-ISiKCapabilityStatementLeistungserbringerRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. |
| [CapabilityStatement für Rolle &quot;StammdatenRolle&quot;](CapabilityStatement-ISiKCapabilityStatementStammdatenRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. |
| [ISiK CapabilityStatement AMTS Akteur](CapabilityStatement-ISiKCapabilityStatementAMTSAkteur.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diesen Akteur implementiert.Jede Instanz eines bestätigungsrelevanten Systems MUSS an ihrem Endpunkt eine CapabilityStatement-Ressource bereitstellen. Hierzu MUSS die[capabilities-Interaktion gemäß FHIR-Kernspezifikation](https://hl7.org/fhir/R4/http.html#capabilities)unterstützt werden. Der`MODE`-Parameter kann ignoriert werden.Das CapabilityStatement in dieser Spezifikation stellt die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Rollen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Imports-Expectation-Extension](https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation)mit den möglichen Werten ‘SHALL’ (=MUSS) ‘SHOULD’ (=SOLL) ‘MAY’ (=KANN) ‘SHOULD-NOT’ (=SOLL NICHT) verwendet.Eine Server-Instanz MUSS ihrerseits ein CapabilityStatement vom`kind = instance`liefern und im Element`software`den Namen und die Versionsnummer angeben.Darüber hinaus MÜSSEN in`CapabilityStatement.instantiates`sämtliche Canonical URLs der implementierten Rollen angegeben werden. Die mindestens zu implementierenden Profile für einen Akteur und Interaktionen entsprechen daher den aggregierten Anforderungen der einzelnen Rolle (per ‘imports’). In den CapabilityStatements zu den Rollen sind die Anforderungen tabellarisch gelistet und weisen so die zu implementierenden Profile aus.Das CapabilityStatement der Instanz MUSS alle Funktionalitäten auflisten, die im folgenden CapabilityStatement (bzw. der in ihm importierten Rollen - siehe ‘imports’) mit`SHALL`gekennzeichnet sind. Das CapabilityStatement KANN darüber hinaus die mit`MAY`gekennzeichneten Funktionalitäten, sowie weitere Funktionalitäten auflisten, sofern diese in der Instanz implementiert wurden.Die Verwendung der CapabilityStatement-Expectation-Extension ist im CapabilityStatement der Server-Instanz nicht erforderlich. |
| [ISiK CapabilityStatement AMTS Akteur (Expanded)](CapabilityStatement-ISiKCapabilityStatementAMTSAkteur-expanded.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diesen Akteur implementiert.Jede Instanz eines bestätigungsrelevanten Systems MUSS an ihrem Endpunkt eine CapabilityStatement-Ressource bereitstellen. Hierzu MUSS die[capabilities-Interaktion gemäß FHIR-Kernspezifikation](https://hl7.org/fhir/R4/http.html#capabilities)unterstützt werden. Der`MODE`-Parameter kann ignoriert werden.Das CapabilityStatement in dieser Spezifikation stellt die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Rollen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Imports-Expectation-Extension](https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation)mit den möglichen Werten ‘SHALL’ (=MUSS) ‘SHOULD’ (=SOLL) ‘MAY’ (=KANN) ‘SHOULD-NOT’ (=SOLL NICHT) verwendet.Eine Server-Instanz MUSS ihrerseits ein CapabilityStatement vom`kind = instance`liefern und im Element`software`den Namen und die Versionsnummer angeben.Darüber hinaus MÜSSEN in`CapabilityStatement.instantiates`sämtliche Canonical URLs der implementierten Rollen angegeben werden. Die mindestens zu implementierenden Profile für einen Akteur und Interaktionen entsprechen daher den aggregierten Anforderungen der einzelnen Rolle (per ‘imports’). In den CapabilityStatements zu den Rollen sind die Anforderungen tabellarisch gelistet und weisen so die zu implementierenden Profile aus.Das CapabilityStatement der Instanz MUSS alle Funktionalitäten auflisten, die im folgenden CapabilityStatement (bzw. der in ihm importierten Rollen - siehe ‘imports’) mit`SHALL`gekennzeichnet sind. Das CapabilityStatement KANN darüber hinaus die mit`MAY`gekennzeichneten Funktionalitäten, sowie weitere Funktionalitäten auflisten, sofern diese in der Instanz implementiert wurden.Die Verwendung der CapabilityStatement-Expectation-Extension ist im CapabilityStatement der Server-Instanz nicht erforderlich. |
| [ISiK CapabilityStatement AMTS Rolle](CapabilityStatement-ISiKCapabilityStatementAMTSRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. |
| [ISiK CapabilityStatement Labor Minimal Rolle](CapabilityStatement-ISiKCapabilityStatementLaborMinimalRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. |
| [ISiK CapabilityStatement MedikamentRolle](CapabilityStatement-ISiKCapabilityStatementMedikamentRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. |
| [ISiK CapabilityStatement Medikation Server - Medikationsinformation](CapabilityStatement-ISiKCapabilityStatementMedikationInformationRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. |
| [ISiK CapabilityStatement Medikationsverabreichung Rolle](CapabilityStatement-ISiKCapabilityStatementMedikationVerabreichungRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. |
| [ISiK CapabilityStatement Medikationsverordnung Rolle](CapabilityStatement-ISiKCapabilityStatementMedikationVerordnungRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. |

### Behavior: Search Parameters 

These define the properties by which a RESTful server can be searched. They can also be used for sorting and including related resources.

| | |
| :--- | :--- |
| [DateStart](SearchParameter-Encounter-date-start.md) | The actual start date of the Encounter (Backport from R5). The parameter cannot repeat or have multiple values. |
| [EndDate](SearchParameter-Encounter-end-date.md) | The actual end date of the Encounter (Backport from R5). The parameter cannot repeat or have multiple values. |

### Structures: Abstract Profiles 

These are profiles on resources or data types that describe patterns used by other profiles, but cannot be instantiated directly. I.e. instances can conform to profiles **based** on these abstract profiles, but do not declare conformance to the abstract profiles themselves.

| | |
| :--- | :--- |
| [ISiKLebensZustand](StructureDefinition-ISiKLebensZustand.md) | Basisprofil für ISiKLebensZustand Observation### MotivationViele medizinischen Entscheidungen benötigen Informationen zu den Lebensumständen eines Patienten. Hierzu gehören eine aktuelle Schwangerschaft, Raucherstatus sowie der Alkoholabususstatus. Motivierender Use-Case zur Einführung dieser Profile ist die[Arzneitmitteltherapiesicherheit im Krankenhaus - AMTS](https://simplifier.net/guide/isik-medikation-v4/ImplementationGuide-markdown-UebergreifendeUseCases-AMTS).In FHIR werden Untersuchungen, bzw. Beobachtungen als[`Observation`](https://hl7.org/fhir/R4/observation.html)-Ressource repräsentiert.Dieses Profil ist eine generische, ISiK-spezifische Observation für die Abbildung von Lebenszuständen.Die folgenden Profile vom Typ`Observation`sind spezifische Profile im oben genannten Sinn:* 
* 
* 
* 
* 
### KompatibilitätFür Schwangerschaftsstatus & Erwarteter Geburtstermin wird eine Kompatibilität mit folgenden**IPS**Profilen angestrebt:* [IPS Resource Profile: Observation - Pregnancy: EDD](https://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Observation-pregnancy-edd-uv-ips.html).
* [IPS Resource Profile: Observation - Pregnancy: status](https://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Observation-pregnancy-status-uv-ips.html)
Hinweise zu Inkompatibilitäten können über die[Portalseite](https://service.gematik.de/servicedesk/customer/portal/16)gemeldet werden. |

### Structures: Resource Profiles 

These define constraints on FHIR resources for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [ISiK AMTS-Bewertung](StructureDefinition-ISiKAMTSBewertung.md) | Dieses Profil ermöglicht die Abbildung von Informationen zur Risikobeurteilung im Rahmen der Arzneimitteltherapiesicherheit (AMTS). |
| [ISiK Alkohol Abusus](StructureDefinition-ISiKAlkoholAbusus.md) |  |
| [ISiK Medikationsliste](StructureDefinition-ISiKMedikationsListe.md) | Dieses Profil ermöglicht die Zusammenführung einzelner MedikationsInformationen eines Patienten in ISiK Szenarien.Die MedicationList verweist auf MedicationStatement-Ressourcen und bildet Medikationen ab, die aktuell eingenommen, im Krankenhaus verabreicht oder aus externen Quellen dokumentiert wurden - etwa durch Patientenangaben, Medikationspläne oder Entlassbriefe. Im Unterschied zum eMP der ePA ist die ISiK-MedikationsListe dynamisch generierbar und systemseitig aktualisierbar. Sie kann auch Informationen enthalten, die außerhalb des eigenen Hauses erfasst wurden – sofern diese dem System strukturiert vorliegen (z.B. durch eMP-Import). Ein Import aus dem eMP ist möglich, aber nicht verpflichtend. |
| [ISiK Raucherstatus](StructureDefinition-ISiKRaucherStatus.md) |  |
| [ISiK Schwangerschaft - Erwarteter Entbindungstermin](StructureDefinition-ISiKSchwangerschaftErwarteterEntbindungstermin.md) |  |
| [ISiK Schwangerschaftsstatus](StructureDefinition-ISiKSchwangerschaftsstatus.md) | Schwangerschaftsstatus einer Patientin |
| [ISiKAllergieUnvertraeglichkeit](StructureDefinition-ISiKAllergieUnvertraeglichkeit.md) | Diese Profil ermöglicht die Dokumentation von Allergien und Unverträglichkeiten in ISiK Szenarien.### MotivationDie Möglichkeit, auf eine Übersicht der Allergien und Unverträglichkeiten eines Patienten zuzugreifen, ist eine wichtige Funktion im klinischen Behandlungsablauf. Dies gilt insbesondere, aber nicht ausschließlich, im Bereich der Arzneimitteltherapiesicherheit. Motivierender Use-Case zur Einführung dieser Profile ist die[Arzneitmitteltherapiesicherheit im Krankenhaus - AMTS](https://simplifier.net/guide/isik-medikation-v4/ImplementationGuide-markdown-UebergreifendeUseCases-AMTS).In FHIR werden Allergien und Unverträglichkeiten mit der[AllergyIntolerance](https://hl7.org/fhir/R4/allergyintolerance.html)-Ressource repräsentiert.### KompatibilitätFür das Profil ISiKAllergieUnvertraeglichkeit wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISiKAllergieUnvertraeglichkeit valide sind, auch valide sind gegen:* [das Profil KBV_PR_Base_AllergyIntolerance der KBV](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_AllergyIntolerance)
* [das Profil EMDAF_PR_AllergyIntolerance der GEVKO](https://fhir.gevko.de/StructureDefinition/EMDAF_PR_AllergyIntolerance)
* [das Profil AllergyIntolerance-uv-ips der International Patient Summary](http://hl7.org/fhir/uv/ips/StructureDefinition/AllergyIntolerance-uv-ips)
Hinweise zu Inkompatibilitäten können über die[Portalseite](https://service.gematik.de/servicedesk/customer/portal/16)gemeldet werden. |
| [ISiKDiagnose](StructureDefinition-ISiKDiagnose.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Diagnosen eines Patienten im Rahmen des Bestätigungsverfahrens der gematik.### MotivationDie Möglichkeit, auf eine Übersicht der Diagnosen eines Patienten zuzugreifen, Patienten anhand ihrer Diagnose zu suchen oder zu prüfen, ob eine konkrete Diagnose bei einem Patienten vorliegt, sind wichtige Funktionen im klinischen Behandlungsablauf.In FHIR werden Diagnosen mit der Condition-Ressource repräsentiert.Da die Diagnosen in klinischen Primärsystemen in der Regel in ICD-10-codierter Form vorliegen, fordert ISiK in erster Linie diese Form des Austausches. Falls eine Diagnose zwar dokumentiert, aber noch nicht codiert wurde (z.B. wenn die Kodierung erst nach der Entlassung erfolgt), ist alternativ eine Repräsentation als Freitext-Diagnose möglich.### KompatibilitätFür das Profil ISiKDiagnose wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISiKDiagnose valide sind, auch valide sind gegen:* das [Profil ProfileConditionDiagnose der Medizininformatik-Initative](https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose)
* das [Profil KBV_PR_Base_Condition_Diagnosis der KBV](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Condition_Diagnosis)]
 Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden.
 |
| [ISiKKoerpergewicht](StructureDefinition-ISiKKoerpergewicht.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über das Körpergewicht eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus).### MotivationDie Erfassung und Überwachung des Körpergewichts ist essenziell für die Beurteilung des Ernährungszustands, die Überwachung von Veränderungen im Rahmen der Therapie sowie die Unterstützung klinischer Entscheidungen in der Patientenversorgung.In FHIR wird das Körpergewicht mit der Observation-Ressource repräsentiert.### KompatibilitätDas Profil ISiKKoerpergewicht ist vom Profil[VitalSignDE_Koerpergewicht](http://fhir.de/StructureDefinition/observation-de-vitalsign-koerpergewicht)aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil[Observation Body Weight Profile](http://hl7.org/fhir/StructureDefinition/bodyweight)aus der FHIR R4 Spezifikation. |
| [ISiKKoerpergroesse](StructureDefinition-ISiKKoerpergroesse.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Körpergröße eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus).### MotivationDie Erfassung und Überwachung der Körpergröße ist essenziell für die Beurteilung von Wachstumsprozessen, die Berechnung wichtiger Indizes wie des Body-Mass-Index (BMI) sowie die Unterstützung klinischer Entscheidungen in der Patientenversorgung.In FHIR wird die Körpergröße mit der Observation-Ressource repräsentiert.### KompatibilitätDas Profil ISiKKoerpergroesse ist vom Profil[VitalSignDE_Koerpergroesse](http://fhir.de/StructureDefinition/observation-de-vitalsign-koerpergroesse)aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil[Observation Body Height Profile](http://hl7.org/fhir/StructureDefinition/bodyheight)aus der FHIR R4 Spezifikation. |
| [ISiKKontaktGesundheitseinrichtung](StructureDefinition-ISiKKontaktGesundheitseinrichtung.md) | Dieses Profil ermöglicht die Abbildung von Besuchen/Aufenthalten eines Patienten in einer Gesundheitseinrichtung.### MotivationInformationen über die Besuche des Patienten entlang seines Behandlungspfades im Krankenhaus sind ein wichtiger Bestandteil des einrichtungsinternen Datenaustausches. Sie ermöglichen die Unterscheidung von stationären und ambulanten sowie aufgenommenen und entlassenen Patienten. Weiterhin ist aus den Besuchsinformationen der aktuelle Aufenthaltsort des Patienten (Fachabteilung, Station, Bettplatz) ermittelbar. Klinische Ressourcen werden in FHIR durch Verlinkung auf die Encounter-Ressource in einen Kontext zum Besuch gestellt. Dieser Kontext ist wichtig für die Steuerung von Zugriffsberechtigungen und Abrechnungsprozessen.Zu Beginn der meisten klinischen Workflows steht die Auswahl des Besuchskontextes. Dies geschieht bspw. durch das Suchen der Encounter-Ressource anhand von Eigenschaften wie Aufnahmenummer, Fallart oder Aufnahmedatum. Daraufhin werden die zutreffenden Suchergebnisse angezeigt und der gewünschte Besuch ausgewählt.In FHIR werden Besuche, Aufenthalte, aber auch virtuelle Kontakte mit der`Encounter`-Ressource repräsentiert.Weitere Hinweise zu den Abgrenzungen der Begrifflichkeiten Fall und Kontakt finden sie unter### KompatibilitätFür das Profil ISiKKontaktGesundheitseinrichtung wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISiKKontaktGesundheitseinrichtung valide sind, auch valide sind gegen:* Profil [Kontakt mit einer Gesundheitseinrichtung der Medizininformatik-Initiative](https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung)
Hinweise zu Inkompatibilitäten können über die[Portalseite](https://service.gematik.de/servicedesk/customer/portal/16)gemeldet werden. |
| [ISiKLaboruntersuchung](StructureDefinition-ISiKLaboruntersuchung.md) | Dieses Profil ermöglicht die Abbildung von Informationen zur Laboruntersuchungen eines Patienten in ISiK Szenarien. Es dient primär als Vorlage, von der spezifische Laboruntersuchungs-Profile abgeleitet werden, kann aber grundsätzlich auch zur Repräsentation von nicht weiter ausspezifizierten Laboruntersuchungen genutzt werden.Viele medizinischen Entscheidungen benötigen Informationen zu den Laboruntersuchungen eines Patienten. Hierzu gehören z.B. aktuelle Nierenfunktionswerte, Leberwerte, Blutbildwerte oder Hormone aus Schilddrüse. Jede dieser Untersuchungen wird durch bestimmte [[https://loinc.org/ LOINC]] oder [[http://snomed.info/sct SNOMED CT]] Codes bezeichnet. Der angegebene Wert ist durch genaue Einheitenangaben in [[http://unitsofmeasure.org UCUM]] zu konkretitiseren. Motivierender Use-Case zur Einführung dieser Profile ist die[Arzneitmitteltherapiesicherheit im Krankenhaus - AMTS](https://simplifier.net/guide/isik-medikation-v4/ImplementationGuide-markdown-UseCases-AMTS?version=current).In FHIR werden Untersuchungen, bzw. Beobachtungen als[`Observation`](https://hl7.org/fhir/R4/observation.html)-Ressource repräsentiert. Zugehörige Codes und Einheiten sind den entsprechenden Valuessets zu entnehmen. |
| [ISiKLaboruntersuchungCRP](StructureDefinition-ISiKLaboruntersuchungCRP.md) | Dieses Profil ermöglicht die Abbildung der Laboruntersuchung CRP eines Patienten in ISiK Szenarien. |
| [ISiKLaboruntersuchungGFR](StructureDefinition-ISiKLaboruntersuchungGFR.md) | Dieses Profil ermöglicht die Abbildung der Laboruntersuchung GFR eines Patienten in ISiK Szenarien. |
| [ISiKLaboruntersuchungHb](StructureDefinition-ISiKLaboruntersuchungHb.md) | Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Hb eines Patienten in ISiK Szenarien. |
| [ISiKLaboruntersuchungPCT](StructureDefinition-ISiKLaboruntersuchungPCT.md) | Dieses Profil ermöglicht die Abbildung der Laboruntersuchung PCT eines Patienten in ISiK Szenarien. |
| [ISiKLaboruntersuchungSerumkreatinin](StructureDefinition-ISiKLaboruntersuchungSerumkreatinin.md) | Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Serumkreatinin eines Patienten in ISiK Szenarien. |
| [ISiKLaboruntersuchungTSH](StructureDefinition-ISiKLaboruntersuchungTSH.md) | Dieses Profil ermöglicht die Abbildung der Laboruntersuchung TSH eines Patienten in ISiK Szenarien. |
| [ISiKLaboruntersuchungThrombozyten](StructureDefinition-ISiKLaboruntersuchungThrombozyten.md) | Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Thrombozyten eines Patienten in ISiK Szenarien. |
| [ISiKLaboruntersuchungTroponin](StructureDefinition-ISiKLaboruntersuchungTroponin.md) | Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Troponin eines Patienten in ISiK Szenarien. |
| [ISiKMedikament](StructureDefinition-ISiKMedikament.md) | Dieses Profil ermöglicht die Abbildung von patientenunabhängigen Informationen zu Medikamenten in ISiK Szenarien. |
| [ISiKMedikationsInformation](StructureDefinition-ISiKMedikationsInformation.md) | Dieses Profil ermöglicht die Abbildung von Informationen zur Medikation eines Patienten in ISiK Szenarien.Hinweis zur Auswahl des Profils: In Abgrenzung zu ISiKMedikationsVerabreichung (MedicationAdministration) wird mittels des vorliegenden Profils die Verabreichung eines Medikaments an einen Patienten mit einer lediglich Datums-genauen Angabe abgebildet (einschließlich Granularität Jahr, Monat oder Tag für .effectiveDateTime oder .effectivePeriod auf Datums-Ebene gemäß der[FHIR-Core Vorgabe](https://hl7.org/fhir/R4/datatypes.html#dateTime)). Zur sekunden-genauen Angabe der Verabreichung eines Medikaments (im Sinne einer medizinischen Verabreichungsdokumentation durch medizinisches Personal) an einen Patienten SOLL das Profil ISiKMedikationsVerabreichung (MedicationAdministration) verwendet werden. Siehe entsprechende Profilseite für weitere Begründung.**Hinweis zur Pausierung einer Medikation (Best-Practice):**Für die Abbildung der Pausierung einer Medikation wird empfohlen,**mehrere`MedicationStatement`-Ressourcen**zu verwenden, anstatt eine bestehende zu überschreiben. Dies bringt folgende Vorteile:* **Korrekte Statusabbildung:**
 Das `status`-Feld muss stets aktuell gepflegt werden, um den momentanen Zustand der Medikation systemweit sichtbar und durchsuchbar zu halten.
* **Effiziente Abfragen über REST API:**
 In Kombination mit `effective[x]` ermöglicht das `status`-Feld die gezielte Abfrage aller aktuell gültigen Medikationseinträge über die REST API.
 Wird stattdessen nur das `dosage`-Element verändert, ist keine zuverlässige Filterung möglich – alle `MedicationStatements` müssten abgerufen und manuell analysiert werden.
* **Erhalt von Verlaufsinformationen:**
 Wenn z. B. auch ein `statusReason` (z. B. „pausiert wegen Nebenwirkungen“) dokumentiert wird, ginge diese Information bei einem Update der bestehenden Ressource verloren, sobald die Medikation fortgesetzt wird.
 Durch neue `MedicationStatement`-Einträge bleibt die Verlaufshistorie erhalten.
 **(Dieser Anwendungsfall ist aktuell nicht gefordert, aber zukünftig denkbar.)**
 |
| [ISiKMedikationsVerabreichung](StructureDefinition-ISiKMedikationsVerabreichung.md) | Dieses Profil ermöglicht die Abbildung der Verabreichung von Medikamenten für einen Patienten in ISiK Szenarien. Hinweis zur Auswahl des Profils: In Abgrenzung zu ISiKMedikationsInformation (MedicationStatement) wird mittels des vorliegenden Profils die Verabreichung eines Medikaments an einen Patienten mit einer Zeitpunkt-genauen Angabe abgebildet (.effectiveDateTime oder .effectivePeriod auf Sekundenebene gemäß der[FHIR-Core Vorgabe](https://hl7.org/fhir/R4/datatypes.html#dateTime)). D.h. die lediglich Datums-genaue Angabe ist im vorliegenden Profil nicht erlaubt. Das Profil ISiKMedikationsInformation (MedicationStatement) kann ebenfalls für die Abbildung der Verabreichung von Medikamenten für einen Patienten verwendet werden, wenn keine Zeitpunkt-genauen Angaben zur Verabreichung vorliegen, sondern lediglich Datums-genaue Angaben (einschließlich Granularität Jahr, Monat oder Tag).Begründung zur Profil- und Nutzungsdifferenzierung: Handelt es sich bei Erfassung um eine medizinische Verabreichungsdokumentation, dann ist ein genauer Zeitstempel zwingend. Die medizinische Verabreichungsdokumentation muss durch medizinisches Personal erfolgen. Angaben von Patienten und Angehörigen sind grundsätzlich keine medizinische Verabreichungsdokumentation und daher als MedicationStament zu erfassen([‘report that such a sequence (or at least a part of it) did take place’](https://hl7.org/fhir/R4/medicationstatement.html)).**Hinweis zur Pausierung einer Medikation (Best-Practice):**Für die Abbildung der Pausierung einer Medikation wird empfohlen,**mehrere`MedicationAdministration`-Ressourcen**zu verwenden, anstatt eine bestehende zu überschreiben. Dies bringt folgende Vorteile:* **Korrekte Statusabbildung:**
 Das `status`-Feld muss stets aktuell gepflegt werden, um den momentanen Zustand der Medikation systemweit sichtbar und durchsuchbar zu halten.
* **Effiziente Abfragen über REST API:**
 In Kombination mit `effective[x]` ermöglicht das `status`-Feld die gezielte Abfrage aller aktuell gültigen Medikationseinträge über die REST API.
 Wird stattdessen nur das `dosage`-Element verändert, ist keine zuverlässige Filterung möglich – alle `MedicationAdministrations` müssten abgerufen und manuell analysiert werden.
* **Erhalt von Verlaufsinformationen:**
 Wenn z. B. auch ein `statusReason` (z. B. „pausiert wegen Nebenwirkungen“) dokumentiert wird, ginge diese Information bei einem Update der bestehenden Ressource verloren, sobald die Medikation fortgesetzt wird.
 Durch neue `MedicationAdministration`-Einträge bleibt die Verlaufshistorie erhalten.
 **(Dieser Anwendungsfall ist aktuell nicht gefordert, aber zukünftig denkbar.)**
 |
| [ISiKMedikationsVerordnung](StructureDefinition-ISiKMedikationsVerordnung.md) | Dieses Profil ermöglicht die Abbildung von Medikationsverordnungen eines Patienten in ISiK Szenarien. |
| [ISiKPatient](StructureDefinition-ISiKPatient.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von administrativen Patientendaten im Rahmen des Bestätigungsverfahrens der gematik.### MotivationDer Austausch administrativer Patientendaten ist eine der grundlegenden Funktionalitäten beim Datenaustausch in der klinischen Versorgung.In FHIR werden sämtliche klinischen Ressourcen durch Verlinkung auf die Ressource ‘Patient’ in einen Patientenkontext gestellt.Die Herstellung des korrekten Patientenkontextes durch Suchen der Patientenressource anhand von Eigenschaften wie Aufnahmenummer, Name oder Geburtsdatum, die Anzeige der zutreffenden Suchergebnisse und der Auswahl bzw. Bestätigung des richtigen Datensatzes durch den Anwender steht am Beginn der meisten klinischen Workflows.### KompatibilitätFür das Profil ISIKPatient wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKPatient valide sind, auch valide sind gegen:* [Profil KBV_PR_Base_Patient der KBV Basisprofile](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Patient)
* [Profil Patient im International Patient Summary (IPS)](https://hl7.org/fhir/uv/ips/StructureDefinition-Patient-uv-ips.html)
* [Profil Patient der MI-Initiative](https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient)
* [Profil TIPatient der gematik](https://gematik.de/fhir/ti/StructureDefinition/ti-patient)
Es ist zu beachten, dass das Profil ISiKPatient NICHT unmittelbar kompatibel mit folgenden Profilen ist:* [Profil EPAPatient der gematik](https://gematik.de/fhir/epa/StructureDefinition/epa-patient): In ISiK ist die Angabe einer KVNR nicht verpflichtend, da in vielen Use Cases bereits eine PID ausreichend ist. Außerdem ist in ISiK keine verpflichtende Versionierung über meta.versionId vorgesehen.
 |
| [ISiKPersonImGesundheitsberuf](StructureDefinition-ISiKPersonImGesundheitsberuf.md) | Dieses Profil ermöglicht die Nutzung von in Gesundheitsberufen tätigen Personen in ISiK Szenarien.### MotivationDas Profil ISIKPersonImGesundheitsberuf bildet alle denkbaren medizinischen Leistungserbringer und Fachexperten ab. In den ISiK-FHIR-Profilen können PersonImGesundheitsberuf bspw. als Ausführende einer Prozedur auftreten, im Element`performer`der Procedure Ressource, oder als die Person, die eine Diagnose stellt, im Element`asserter`der Condition Ressource.In FHIR werden PersonImGesundheitsberuf mit der[`Practitioner`](https://hl7.org/fhir/R4/practitioner.html)-Ressource repräsentiert.Für das Profil ISIKPersonImGesundheitsberuf wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKPatient valide sind, auch valide sind gegen:* [Profil KBV_PR_Base_Practitioner der KBV Basisprofile](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Practitioner).
* [Profil HiGHmed_IC_Practitioner, MI Initiative - HiGHmed Use Case Infection Control der Medizininformatik Initiative](https://simplifier.net/medizininformatikinitiative-highmed-ic/highmed-ic-practitioner)
* [Profil TIPractitioner der gematik](https://gematik.de/fhir/ti/StructureDefinition/ti-practitioner)
Hinweise zu Inkompatibilitäten können über die[Portalseite](https://service.gematik.de/servicedesk/customer/portal/16)gemeldet werden. |
| [ISiKProzedur](StructureDefinition-ISiKProzedur.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Behandlungen/Prozeduren eines Patienten im Rahmen des Bestätigungsverfahrens der gematik.### MotivationDie Möglichkeit auf eine Übersicht der Prozeduren eines Patienten zuzugreifen, Patienten anhand durchgeführter oder geplanter Prozeduren zu suchen, oder zu prüfen, ob eine konkrete Prozedur bei einem Patienten durchgeführt wurde, sind wichtige Funktionen im klinischen Behandlungsablauf.In FHIR werden Prozeduren mit der Procedure-Ressource repräsentiert.Da die Prozeduren in klinischen Primärsystemen, in der Regel, in OPS-codierter Form vorliegen, fordert ISiK in erster Linie diese Form des Austausches. Falls eine Prozedur zwar dokumentiert aber noch nicht codiert wurde (z.B. wenn die Kodierung erst nach der Entlassung erfolgt), ist alternativ eine Repräsentation als Freitext-Prozedur möglich.### KompatibilitätFür das Profil ISIKProzedur wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKProzedur valide sind, auch valide sind gegen:* [Profil Prozedur](https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure) der Medizininformatik Initiative
 Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden.
 |
| [ISiKStillstatus](StructureDefinition-ISiKStillstatus.md) | Profil zur Abbildung ob gestillt/Muttermilch abgepumpt und gefüttert wird |

### Structures: Extension Definitions 

These define constraints on FHIR data types for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [ISiK CapabilityStatement Imports Expectation](StructureDefinition-ExtensionISiKCapabilityStatementImportsExpectation.md) | Defines the level of expectation associated with a given system capability. See the capabilitystatement-prohibited modifier extension to set expectations to**not**support a feature. |
| [ISiKTerminPriorityExtension](StructureDefinition-ISiKTerminPriorityExtension.md) | Diese Extension ermöglicht die strukturierte Angabe der Dringlichkeit (Priorität) eines Termins. Dies ist wichtig, um Notfälle oder besonders dringliche Termine im Buchungs- und Verwaltungssystem deutlich zu kennzeichnen und eine priorisierte Bearbeitung zu ermöglichen. |

### Terminology: Value Sets 

These define sets of codes used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Current Smoking Status - IPS](ValueSet-current-smoking-status-uv-ips.md) | HL7 LOINC value set for smoking status. Based on the HL7 Vocab and Structured Doc WG (formerly TC) consensus - per US CDC submission 7/12/2012 for smoking status terms. |
| [DiagnosesSCT](ValueSet-DiagnosesSCT.md) | Enthaelt alle SNOMED Clinical finding, Event und Situation with explicit context codes |
| [ISiKLocationPhysicalType](ValueSet-ISiKLocationPhysicalType.md) |  |
| [Medikationslisten-Modes](ValueSet-MedikationsListeListModeVS.md) | Erlaubte ListModes der ISiK MedikationsListe |
| [ObservationCodesCRP](ValueSet-ObservationCodesCRP.md) | Enthält LOINC-Codes für die Observation CRP |
| [ObservationCodesGFR](ValueSet-ObservationCodesGFR.md) | Enthält LOINC-Codes für die Observation GFR |
| [ObservationCodesHb](ValueSet-ObservationCodesHb.md) | Enthält LOINC-Codes für die Observation Hb |
| [ObservationCodesPCT](ValueSet-ObservationCodesPCT.md) | Enthält LOINC-Codes für die Observation PCT |
| [ObservationCodesSerumkreatinin](ValueSet-ObservationCodesSerumkreatinin.md) | Enthält LOINC-Codes für die Observation Serumkreatinin |
| [ObservationCodesTSH](ValueSet-ObservationCodesTSH.md) | Enthält LOINC-Codes für die Observation TSH |
| [ObservationCodesThrombozyten](ValueSet-ObservationCodesThrombozyten.md) | Enthält LOINC-Codes für die Observation Thrombozyten |
| [ObservationCodesTroponin](ValueSet-ObservationCodesTroponin.md) | Enthält LOINC-Codes für die Observation Troponin |
| [ObservationUnitsCRP](ValueSet-ObservationUnitsCRP.md) | Enthält UCUM-Einheiten für die Observation CRP |
| [ObservationUnitsGFR](ValueSet-ObservationUnitsGFR.md) | Enthält UCUM-Einheiten für die Observation GFR |
| [ObservationUnitsHb](ValueSet-ObservationUnitsHb.md) | Enthält UCUM-Einheiten für die Observation Hb |
| [ObservationUnitsPCT](ValueSet-ObservationUnitsPCT.md) | Enthält UCUM-Einheiten für die Observation PCT |
| [ObservationUnitsSerumkreatinin](ValueSet-ObservationUnitsSerumkreatinin.md) | Enthält UCUM-Einheiten für die Observation Serumkreatinin |
| [ObservationUnitsTSH](ValueSet-ObservationUnitsTSH.md) | Enthält UCUM-Einheiten für die Observation TSH |
| [ObservationUnitsThrombozyten](ValueSet-ObservationUnitsThrombozyten.md) | Enthält UCUM-Einheiten für die Observation Thrombozyten |
| [ObservationUnitsTroponin](ValueSet-ObservationUnitsTroponin.md) | Enthält UCUM-Einheiten für die Observation Troponin |
| [ProzedurenCodesSCT](ValueSet-ProzedurenCodesSCT.md) | Enthaelt alle SNOMED Procedure Codes |
| [ProzedurenKategorieSCT](ValueSet-ProzedurenKategorieSCT.md) | Enthaelt alle SNOMED Codes für ein Mapping der OPS Klassentitel |
| [Schwangerschaft Erwarteter Entbindungstermin Methode](ValueSet-SchwangerschaftEtMethodeVS.md) |  |
| [Schwangerschaftsstatus Valueset](ValueSet-SchwangerschaftsstatusVS.md) |  |
| [SctRouteOfAdministration](ValueSet-SctRouteOfAdministration.md) | Enthaelt alle SNOMED CT Administrationsarten |
| [Stillstatus LOINC Antwortoptionen](ValueSet-StillstatusVS.md) | Dieses Valueset enthält die Codes zur Beschreibung von Stillstatus LOINC. |

### Other 

These are resources that are used within this implementation guide that do not fit into one of the other categories.

| |
| :--- |
| [AllergyIntolerance/ISiKAllergieUnvertraeglichkeitBeispiel1](AllergyIntolerance-ISiKAllergieUnvertraeglichkeitBeispiel1.md) |
| [Condition/AltersbedingteKreislaufstoerung](Condition-AltersbedingteKreislaufstoerung.md) |
| [Condition/BehandlungsDiagnoseFreitext](Condition-BehandlungsDiagnoseFreitext.md) |
| [Condition/Example-condition-ausrufezeichen-primaer](Condition-Example-condition-ausrufezeichen-primaer.md) |
| [Condition/Example-condition-ausrufezeichen-sekundaer](Condition-Example-condition-ausrufezeichen-sekundaer.md) |
| [Condition/Example-condition-kreuz-stern-primaer](Condition-Example-condition-kreuz-stern-primaer.md) |
| [Condition/Example-condition-kreuz-stern-sekundaer](Condition-Example-condition-kreuz-stern-sekundaer.md) |
| [Condition/MittelgradigeIntelligenzminderung](Condition-MittelgradigeIntelligenzminderung.md) |
| [Condition/PrimaereGonarthroseMinimal](Condition-PrimaereGonarthroseMinimal.md) |
| [Condition/PrimaereGonarthroseNormal](Condition-PrimaereGonarthroseNormal.md) |
| [Condition/SZ2Primaerdiagnose](Condition-SZ2Primaerdiagnose.md) |
| [Condition/SZ2Sekundaerdiagnose](Condition-SZ2Sekundaerdiagnose.md) |
| [Encounter/Fachabteilungskontakt](Encounter-Fachabteilungskontakt.md) |
| [Encounter/FachabteilungskontaktBettenverlegung](Encounter-FachabteilungskontaktBettenverlegung.md) |
| [Encounter/FachabteilungskontaktEntlassung](Encounter-FachabteilungskontaktEntlassung.md) |
| [Encounter/FachabteilungskontaktFachbereichswechsel1](Encounter-FachabteilungskontaktFachbereichswechsel1.md) |
| [Encounter/FachabteilungskontaktFachbereichswechsel2](Encounter-FachabteilungskontaktFachbereichswechsel2.md) |
| [Encounter/FachabteilungskontaktMinimal2](Encounter-FachabteilungskontaktMinimal2.md) |
| [Encounter/FachabteilungskontaktNormal](Encounter-FachabteilungskontaktNormal.md) |
| [Encounter/FachabteilungskontaktStationaereAufnahme](Encounter-FachabteilungskontaktStationaereAufnahme.md) |
| [Encounter/FachabteilungskontaktStationswechsel1](Encounter-FachabteilungskontaktStationswechsel1.md) |
| [Encounter/FachabteilungskontaktStationswechsel2](Encounter-FachabteilungskontaktStationswechsel2.md) |
| [Encounter/SZ1Nachstationaer](Encounter-SZ1Nachstationaer.md) |
| [Encounter/SZ1Stationaer](Encounter-SZ1Stationaer.md) |
| [Encounter/SZ1Vorstationaer](Encounter-SZ1Vorstationaer.md) |
| [Encounter/SZ2Encounter](Encounter-SZ2Encounter.md) |
| [List/ExampleISiKMedikationsListe](List-ExampleISiKMedikationsListe.md) |
| [List/ExampleISiKMedikationsListeParkinson](List-ExampleISiKMedikationsListeParkinson.md) |
| [Medication/ExampleISiKMedikament1](Medication-ExampleISiKMedikament1.md) |
| [Medication/ExampleISiKMedikament2](Medication-ExampleISiKMedikament2.md) |
| [Medication/ExampleISiKMedikament3](Medication-ExampleISiKMedikament3.md) |
| [Medication/ExampleISiKMedikament4](Medication-ExampleISiKMedikament4.md) |
| [Medication/ExampleISiKMedikament5](Medication-ExampleISiKMedikament5.md) |
| [Medication/ExampleISiKMedikament6](Medication-ExampleISiKMedikament6.md) |
| [Medication/ExampleISiKMedikament7](Medication-ExampleISiKMedikament7.md) |
| [Medication/ExampleISiKMedikament8](Medication-ExampleISiKMedikament8.md) |
| [Medication/ExampleISiKMedikament9](Medication-ExampleISiKMedikament9.md) |
| [Medication/ParacetamolInfusion](Medication-ParacetamolInfusion.md) |
| [MedicationAdministration/ExampleISiKMedikationsVerabreichung](MedicationAdministration-ExampleISiKMedikationsVerabreichung.md) |
| [MedicationAdministration/ExampleISiKMedikationsVerabreichung2](MedicationAdministration-ExampleISiKMedikationsVerabreichung2.md) |
| [MedicationAdministration/ExampleISiKMedikationsVerabreichung3](MedicationAdministration-ExampleISiKMedikationsVerabreichung3.md) |
| [MedicationAdministration/ExampleISiKMedikationsVerabreichung4](MedicationAdministration-ExampleISiKMedikationsVerabreichung4.md) |
| [MedicationRequest/ExampleISiKMedikationsVerordnung](MedicationRequest-ExampleISiKMedikationsVerordnung.md) |
| [MedicationRequest/ExampleISiKMedikationsVerordnung2](MedicationRequest-ExampleISiKMedikationsVerordnung2.md) |
| [MedicationStatement/ExampleISiKMedikationsInformation1](MedicationStatement-ExampleISiKMedikationsInformation1.md) |
| [MedicationStatement/ExampleISiKMedikationsInformation2](MedicationStatement-ExampleISiKMedikationsInformation2.md) |
| [MedicationStatement/ExampleISiKMedikationsInformation3](MedicationStatement-ExampleISiKMedikationsInformation3.md) |
| [MedicationStatement/ExampleISiKMedikationsInformation4](MedicationStatement-ExampleISiKMedikationsInformation4.md) |
| [MedicationStatement/ExampleISiKMedikationsInformation5](MedicationStatement-ExampleISiKMedikationsInformation5.md) |
| [MedicationStatement/ExampleISiKMedikationsInformation6](MedicationStatement-ExampleISiKMedikationsInformation6.md) |
| [MedicationStatement/ExampleISiKMedikationsInformationParkinson1](MedicationStatement-ExampleISiKMedikationsInformationParkinson1.md) |
| [MedicationStatement/ExampleISiKMedikationsInformationParkinson2](MedicationStatement-ExampleISiKMedikationsInformationParkinson2.md) |
| [MedicationStatement/ExampleISiKMedikationsInformationParkinson3](MedicationStatement-ExampleISiKMedikationsInformationParkinson3.md) |
| [MedicationStatement/ExampleISiKMedikationsInformationParkinson4](MedicationStatement-ExampleISiKMedikationsInformationParkinson4.md) |
| [MedicationStatement/ExampleISiKMedikationsInformationParkinson5](MedicationStatement-ExampleISiKMedikationsInformationParkinson5.md) |
| [Observation/ExampleISiKLaboruntersuchungCRP1](Observation-ExampleISiKLaboruntersuchungCRP1.md) |
| [Observation/ExampleISiKLaboruntersuchungGFR1](Observation-ExampleISiKLaboruntersuchungGFR1.md) |
| [Observation/ExampleISiKLaboruntersuchungHb1](Observation-ExampleISiKLaboruntersuchungHb1.md) |
| [Observation/ExampleISiKLaboruntersuchungPCT1](Observation-ExampleISiKLaboruntersuchungPCT1.md) |
| [Observation/ExampleISiKLaboruntersuchungSerumkreatinin1](Observation-ExampleISiKLaboruntersuchungSerumkreatinin1.md) |
| [Observation/ExampleISiKLaboruntersuchungTSH1](Observation-ExampleISiKLaboruntersuchungTSH1.md) |
| [Observation/ExampleISiKLaboruntersuchungThrombozyten1](Observation-ExampleISiKLaboruntersuchungThrombozyten1.md) |
| [Observation/ExampleISiKLaboruntersuchungTroponin1](Observation-ExampleISiKLaboruntersuchungTroponin1.md) |
| [Observation/ExtractedObservationKoerpergewicht](Observation-ExtractedObservationKoerpergewicht.md) |
| [Observation/ExtractedObservationKoerpergroesse](Observation-ExtractedObservationKoerpergroesse.md) |
| [Observation/ISiKAlkoholAbususBeispiel](Observation-ISiKAlkoholAbususBeispiel.md) |
| [Observation/ISiKKoerpergewichtExample](Observation-ISiKKoerpergewichtExample.md) |
| [Observation/ISiKKoerpergewichtMaxExample](Observation-ISiKKoerpergewichtMaxExample.md) |
| [Observation/ISiKKoerpergewichtMinExample](Observation-ISiKKoerpergewichtMinExample.md) |
| [Observation/ISiKKoerpergroesseExample](Observation-ISiKKoerpergroesseExample.md) |
| [Observation/ISiKKoerpergroesseMaxExample](Observation-ISiKKoerpergroesseMaxExample.md) |
| [Observation/ISiKKoerpergroesseMinExample](Observation-ISiKKoerpergroesseMinExample.md) |
| [Observation/ISiKRaucherStatusBeispiel](Observation-ISiKRaucherStatusBeispiel.md) |
| [Observation/ISiKSchwangerschaftErwarteterEntbindungsterminBeispiel](Observation-ISiKSchwangerschaftErwarteterEntbindungsterminBeispiel.md) |
| [Observation/ISiKSchwangerschaftsstatusBeispiel](Observation-ISiKSchwangerschaftsstatusBeispiel.md) |
| [Observation/ISiKStillstatusBeispiel](Observation-ISiKStillstatusBeispiel.md) |
| [Patient/DorisQuelle](Patient-DorisQuelle.md) |
| [Patient/DorisZiel](Patient-DorisZiel.md) |
| [Patient/PatientinMinimal](Patient-PatientinMinimal.md) |
| [Patient/PatientinMusterfrau](Patient-PatientinMusterfrau.md) |
| [Patient/PatientinNormal](Patient-PatientinNormal.md) |
| [Patient/SZ1Patient](Patient-SZ1Patient.md) |
| [Patient/SZ2Patient](Patient-SZ2Patient.md) |
| [Practitioner/PractitionerWalterArzt](Practitioner-PractitionerWalterArzt.md) |
| [Procedure/Appendektomie](Procedure-Appendektomie.md) |
| [RiskAssessment/ExampleISiKAMTSBewertung1](RiskAssessment-ExampleISiKAMTSBewertung1.md) |

