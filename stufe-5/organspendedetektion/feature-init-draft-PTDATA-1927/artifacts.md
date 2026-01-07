# Artifacts Summary - Organspendeerkennung v0.0.1-rc

Organspendeerkennung

Version 0.0.1-rc - STU1

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Behavior: Capability Statements 

The following artifacts define the specific capabilities that different types of systems are expected to have in order to comply with this implementation guide. Systems conforming to this implementation guide are expected to declare conformance to one or more of the following capability statements.

| | |
| :--- | :--- |
| [Akteur &quot;ISiKCapabilityStatementBasisServerAkteur&quot;](CapabilityStatement-ISiKCapabilityStatementBasisServerAkteur.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diesen Akteur implementiert.Jede Instanz eines bestätigungsrelevanten Systems MUSS an ihrem Endpunkt eine CapabilityStatement-Ressource bereitstellen. Hierzu MUSS die[capabilities-Interaktion gemäß FHIR-Kernspezifikation](https://hl7.org/fhir/R4/http.html#capabilities)unterstützt werden. Der`MODE`-Parameter kann ignoriert werden.Das CapabilityStatement in dieser Spezifikation stellt die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Rollen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Imports-Expectation-Extension](https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation)mit den möglichen Werten ‘SHALL’ (=MUSS) ‘SHOULD’ (=SOLL) ‘MAY’ (=KANN) ‘SHOULD-NOT’ (=SOLL NICHT) verwendet.Eine Server-Instanz MUSS ihrerseits ein CapabilityStatement vom`kind = instance`liefern und im Element`software`den Namen und die Versionsnummer angeben.Darüber hinaus MÜSSEN in`CapabilityStatement.instantiates`sämtliche Canonical URLs der implementierten Rollen angegeben werden. Die mindestens zu implementierenden Profile für einen Akteur und Interaktionen entsprechen daher den aggregierten Anforderungen der einzelnen Rolle (per ‘imports’). In den CapabilityStatements zu den Rollen sind die Anforderungen tabellarisch gelistet und weisen so die zu implementierenden Profile aus.Das CapabilityStatement der Instanz MUSS alle Funktionalitäten auflisten, die im folgenden CapabilityStatement (bzw. der in ihm importierten Rollen - siehe ‘imports’) mit`SHALL`gekennzeichnet sind. Das CapabilityStatement KANN darüber hinaus die mit`MAY`gekennzeichneten Funktionalitäten, sowie weitere Funktionalitäten auflisten, sofern diese in der Instanz implementiert wurden.Die Verwendung der CapabilityStatement-Expectation-Extension ist im CapabilityStatement der Server-Instanz nicht erforderlich. |
| [Akteur &quot;ISiKCapabilityStatementBasisServerAkteur&quot; (Expanded)](CapabilityStatement-ISiKCapabilityStatementBasisServerAkteur-expanded.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diesen Akteur implementiert.Jede Instanz eines bestätigungsrelevanten Systems MUSS an ihrem Endpunkt eine CapabilityStatement-Ressource bereitstellen. Hierzu MUSS die[capabilities-Interaktion gemäß FHIR-Kernspezifikation](https://hl7.org/fhir/R4/http.html#capabilities)unterstützt werden. Der`MODE`-Parameter kann ignoriert werden.Das CapabilityStatement in dieser Spezifikation stellt die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Rollen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Imports-Expectation-Extension](https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation)mit den möglichen Werten ‘SHALL’ (=MUSS) ‘SHOULD’ (=SOLL) ‘MAY’ (=KANN) ‘SHOULD-NOT’ (=SOLL NICHT) verwendet.Eine Server-Instanz MUSS ihrerseits ein CapabilityStatement vom`kind = instance`liefern und im Element`software`den Namen und die Versionsnummer angeben.Darüber hinaus MÜSSEN in`CapabilityStatement.instantiates`sämtliche Canonical URLs der implementierten Rollen angegeben werden. Die mindestens zu implementierenden Profile für einen Akteur und Interaktionen entsprechen daher den aggregierten Anforderungen der einzelnen Rolle (per ‘imports’). In den CapabilityStatements zu den Rollen sind die Anforderungen tabellarisch gelistet und weisen so die zu implementierenden Profile aus.Das CapabilityStatement der Instanz MUSS alle Funktionalitäten auflisten, die im folgenden CapabilityStatement (bzw. der in ihm importierten Rollen - siehe ‘imports’) mit`SHALL`gekennzeichnet sind. Das CapabilityStatement KANN darüber hinaus die mit`MAY`gekennzeichneten Funktionalitäten, sowie weitere Funktionalitäten auflisten, sofern diese in der Instanz implementiert wurden.Die Verwendung der CapabilityStatement-Expectation-Extension ist im CapabilityStatement der Server-Instanz nicht erforderlich. |
| [CapabilityStatement für Rolle &quot;AufbaustrukturRolle&quot;](CapabilityStatement-ISiKCapabilityStatementAufbaustrukturRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. |
| [CapabilityStatement für Rolle &quot;ISiKCapabilityStatementCompositionKonsumentenRolle&quot;](CapabilityStatement-ISiKCapabilityStatementCompositionKonsumentenRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. |
| [CapabilityStatement für Rolle &quot;ISiKCapabilityStatementErweiterteStammdatenRolle&quot;](CapabilityStatement-ISiKCapabilityStatementErweiterteStammdatenRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. |
| [CapabilityStatement für Rolle &quot;ISiKCapabilityStatementGesundheitsstatusRolle&quot;](CapabilityStatement-ISiKCapabilityStatementGesundheitsstatusRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. |
| [CapabilityStatement für Rolle &quot;ISiKCapabilityStatementKlinischeRolle&quot;](CapabilityStatement-ISiKCapabilityStatementKlinischeRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. |
| [CapabilityStatement für Rolle &quot;ISiKCapabilityStatementTerminologieRolle&quot;](CapabilityStatement-ISiKCapabilityStatementTerminologieRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. |
| [CapabilityStatement für Rolle &quot;ISiKCapabilityStatementVersicherungsverhaeltnisRolle&quot;](CapabilityStatement-ISiKCapabilityStatementVersicherungsverhaeltnisRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. |
| [CapabilityStatement für Rolle &quot;LeistungserbringerRolle&quot;](CapabilityStatement-ISiKCapabilityStatementLeistungserbringerRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. |
| [CapabilityStatement für Rolle &quot;StammdatenRolle&quot;](CapabilityStatement-ISiKCapabilityStatementStammdatenRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die[CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html)mit den möglichen Werten`SHALL`(=MUSS) und`MAY`(=KANN) verwendet. |

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
| [ISiK Alkohol Abusus](StructureDefinition-ISiKAlkoholAbusus.md) |  |
| [ISiK Raucherstatus](StructureDefinition-ISiKRaucherStatus.md) |  |
| [ISiK Schwangerschaft - Erwarteter Entbindungstermin](StructureDefinition-ISiKSchwangerschaftErwarteterEntbindungstermin.md) |  |
| [ISiK Schwangerschaftsstatus](StructureDefinition-ISiKSchwangerschaftsstatus.md) | Schwangerschaftsstatus einer Patientin |
| [ISiKAbrechnungsfall](StructureDefinition-ISiKAbrechnungsfall.md) | Dieses Profil ermöglicht die Gruppierung von medizinischen Leistungen zu einem gemeinsamen Abrechnungskontext.Zugleich dient es im Kontext von ISiK derzeit im Wesentlichen der Abbildung einer Fallnummer, über die im Krankenhaus unterschiedliche Prozesse - auch administrativer Natur - abgewickelt werden. Das Profil wurde**nicht**primär zum Zweck der Abbildung von Abrechnungsprozessen definiert.### MotivationKomplementär zum Datenobjekt &quot;Kontakt - Encounter&quot; können Fälle, im Sinne einer Gruppierung von medizinischen Leistungen innerhalb eines gemeinsamen Kontextes, zu einem Abrechnungsfall zusammengefasst werden. Ein solcher Abrechnungsfall kann mehrere Kontakte umfassen (z.B. vorstationärer Besuch, stationärer Aufenthalt und nachstationärer Besuch).Gemeinsam mit dem Einrichtungskontakt bildet der Abrechnungsfall einen wichtigen Einstiegspunkt in die Dokumentation der Behandlungsleistungen der Patienten. Als Bindeglied zwischen den Kontakten und dem Versicherungsverhältnis erfolgt eine feingranulare Auflistung, in welchen Zeiträumen ein Behandlungskontext zwischen einer Gesundheitseinrichtung und der Patienten bestand. Zudem werden Diagnosen abschließend / nachträglich dokumentiert, sodass eine Übersicht von relevanten (DRG)-Diagnosen ermöglicht wird, ohne die Gesamtheit aller Kontakte betrachten zu müssen.In FHIR wird der Abrechnungsfall mit der`Account`-Ressource repräsentiert.Weitere Hinweise zu den Abgrenzungen der Begrifflichkeiten Fall und Kontakt finden sie unter .### Kompatibilität* zum Zeitpunkt der Veröffentlichung sind keine abweichenden Modellierungen der Account-Ressource bekannt.
Hinweise zu Inkompatibilitäten können über die[Portalseite](https://service.gematik.de/servicedesk/customer/portal/16)gemeldet werden. |
| [ISiKAllergieUnvertraeglichkeit](StructureDefinition-ISiKAllergieUnvertraeglichkeit.md) | Diese Profil ermöglicht die Dokumentation von Allergien und Unverträglichkeiten in ISiK Szenarien.### MotivationDie Möglichkeit, auf eine Übersicht der Allergien und Unverträglichkeiten eines Patienten zuzugreifen, ist eine wichtige Funktion im klinischen Behandlungsablauf. Dies gilt insbesondere, aber nicht ausschließlich, im Bereich der Arzneimitteltherapiesicherheit. Motivierender Use-Case zur Einführung dieser Profile ist die[Arzneitmitteltherapiesicherheit im Krankenhaus - AMTS](https://simplifier.net/guide/isik-medikation-v4/ImplementationGuide-markdown-UebergreifendeUseCases-AMTS).In FHIR werden Allergien und Unverträglichkeiten mit der[AllergyIntolerance](https://hl7.org/fhir/R4/allergyintolerance.html)-Ressource repräsentiert.### KompatibilitätFür das Profil ISiKAllergieUnvertraeglichkeit wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISiKAllergieUnvertraeglichkeit valide sind, auch valide sind gegen:* [das Profil KBV_PR_Base_AllergyIntolerance der KBV](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_AllergyIntolerance)
* [das Profil EMDAF_PR_AllergyIntolerance der GEVKO](https://fhir.gevko.de/StructureDefinition/EMDAF_PR_AllergyIntolerance)
* [das Profil AllergyIntolerance-uv-ips der International Patient Summary](http://hl7.org/fhir/uv/ips/StructureDefinition/AllergyIntolerance-uv-ips)
Hinweise zu Inkompatibilitäten können über die[Portalseite](https://service.gematik.de/servicedesk/customer/portal/16)gemeldet werden. |
| [ISiKAngehoeriger](StructureDefinition-ISiKAngehoeriger.md) | Dieses Profil ermöglicht die Darstellung von Angehörigen in ISiK Szenarien.### MotivationDer Angehörige wird vor allem im Zusammenhang mit Anwendungsszenarien verwendet, in denen das Versicherungsverhältnis eine Rolle spielt. Hier können Angehörige, bspw. der hauptversicherte Elternteil eines minderjährigen Kindes, in der Familienversicherung sein. In Selbstzahler-Szenarien können Angehörige die Zahler für eine im Krankenhaus erbrachte Leistung sein. In FHIR werden Angehörige von Patienten mit der RelatedPerson-Ressource repräsentiert.### KompatibilitätFür das Profil ISiKAngehoeriger wurde bis zum Zeitpunkt der Veröffentlichung kein Abgleich der Kompatibilität zu anderen Profilen (der KBV und der Medizininformatik-Initiative) durchgeführt.Hinweise zu Inkompatibilitäten können über die[Portalseite](https://service.gematik.de/servicedesk/customer/portal/16)gemeldet werden. |
| [ISiKBerichtBundle](StructureDefinition-ISiKBerichtBundle.md) | Das Document-Bundle dient dem Transport von Berichten zwischen Subsystemen im Krankenhaus. Das Bundle entspricht den Anforderungen an ein[FHIR Document Bundle](https://hl7.org/fhir/R4/documents.html): Alle referenzierten Ressourcen müssen als Einträge im Bundle enthalten sein. Das Bundle unterstützt die Übermittlung einer menschenlesbaren Dokumentation (Narrative) und erlaubt zudem die Übernahme wichtiger Ressourcen (z. B. Diagnosen und Prozeduren), die einem Patienten und Fall (Patient, Encounter) zugeordnet sind. |
| [ISiKCodeSystem](StructureDefinition-ISiKCodeSystem.md) | Dieses Profil beschreibt die maschinenlesbare Repräsentation von system-spezifischen Kodierungen in ISiK-Szenarien.### MotivationISiK erlaubt in diversen Kontexten die Erweiterung der Kodierung durch Krankenhaus-/System-interne Kodierungen. Das Profil ISiKKatalog (CodeSystem) als Profil erlaubt die Repräsentation der dazugehörigen Codes und Display-Werte.Eine maschinenlesbare Repräsentation dieser Kodierungen erlaubt es Clients, dazugehörige Anzeigetext und Definitionen zu verarbeiten.Ein Codesystem eignet sich auch dazu, auf dessen Basis definierte[ValueSets zu expandieren](https://hl7.org/fhir/R4/valueset-operation-expand.html). Da ISiKValueSet expandierte Valuesets vorsieht, ist eine dynamische Expansion in der Regel nicht erforderlich. Darüber hinausgehend ist ein Use Case im Kontext der Katalogabfrage folgender: Ein Client möchte eine Expansion neu generieren (z.B. mit anderen Expansionen-Parametern), um das ValueSet beispielsweise in einer anderen Sprache auszugeben. |
| [ISiKDiagnose](StructureDefinition-ISiKDiagnose.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Diagnosen eines Patienten im Rahmen des Bestätigungsverfahrens der gematik.### MotivationDie Möglichkeit, auf eine Übersicht der Diagnosen eines Patienten zuzugreifen, Patienten anhand ihrer Diagnose zu suchen oder zu prüfen, ob eine konkrete Diagnose bei einem Patienten vorliegt, sind wichtige Funktionen im klinischen Behandlungsablauf.In FHIR werden Diagnosen mit der Condition-Ressource repräsentiert.Da die Diagnosen in klinischen Primärsystemen in der Regel in ICD-10-codierter Form vorliegen, fordert ISiK in erster Linie diese Form des Austausches. Falls eine Diagnose zwar dokumentiert, aber noch nicht codiert wurde (z.B. wenn die Kodierung erst nach der Entlassung erfolgt), ist alternativ eine Repräsentation als Freitext-Diagnose möglich.### KompatibilitätFür das Profil ISiKDiagnose wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISiKDiagnose valide sind, auch valide sind gegen:* das [Profil ProfileConditionDiagnose der Medizininformatik-Initative](https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose)
* das [Profil KBV_PR_Base_Condition_Diagnosis der KBV](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Condition_Diagnosis)]
 Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden.
 |
| [ISiKKontaktGesundheitseinrichtung](StructureDefinition-ISiKKontaktGesundheitseinrichtung.md) | Dieses Profil ermöglicht die Abbildung von Besuchen/Aufenthalten eines Patienten in einer Gesundheitseinrichtung.### MotivationInformationen über die Besuche des Patienten entlang seines Behandlungspfades im Krankenhaus sind ein wichtiger Bestandteil des einrichtungsinternen Datenaustausches. Sie ermöglichen die Unterscheidung von stationären und ambulanten sowie aufgenommenen und entlassenen Patienten. Weiterhin ist aus den Besuchsinformationen der aktuelle Aufenthaltsort des Patienten (Fachabteilung, Station, Bettplatz) ermittelbar. Klinische Ressourcen werden in FHIR durch Verlinkung auf die Encounter-Ressource in einen Kontext zum Besuch gestellt. Dieser Kontext ist wichtig für die Steuerung von Zugriffsberechtigungen und Abrechnungsprozessen.Zu Beginn der meisten klinischen Workflows steht die Auswahl des Besuchskontextes. Dies geschieht bspw. durch das Suchen der Encounter-Ressource anhand von Eigenschaften wie Aufnahmenummer, Fallart oder Aufnahmedatum. Daraufhin werden die zutreffenden Suchergebnisse angezeigt und der gewünschte Besuch ausgewählt.In FHIR werden Besuche, Aufenthalte, aber auch virtuelle Kontakte mit der`Encounter`-Ressource repräsentiert.Weitere Hinweise zu den Abgrenzungen der Begrifflichkeiten Fall und Kontakt finden sie unter### KompatibilitätFür das Profil ISiKKontaktGesundheitseinrichtung wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISiKKontaktGesundheitseinrichtung valide sind, auch valide sind gegen:* Profil [Kontakt mit einer Gesundheitseinrichtung der Medizininformatik-Initiative](https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung)
Hinweise zu Inkompatibilitäten können über die[Portalseite](https://service.gematik.de/servicedesk/customer/portal/16)gemeldet werden. |
| [ISiKOrganisation](StructureDefinition-ISiKOrganisation.md) | Dieses Profil beschreibt die Nutzung von Organisationseinheiten innerhalb eines Krankenhauses oder eines Krankenhauses als ganzem in ISiK-Szenarien. |
| [ISiKOrganisationFachabteilung](StructureDefinition-ISiKOrganisationFachabteilung.md) | Dieses Profil beschreibt die Organisationseinheit Fachabteilung innerhalb eines Krankenhauses.### MotivationDie Abbildung der Aufbauorganisation eines Krankenhauses dient der Festlegung von Zuständigkeiten und (Entscheidungs-)Verantwortungen von Organisationseinheiten (z.B. Fachkliniken, Fachabteilungen und -bereichen etc.) in strukturierter Form.In FHIR wird die Organisation (Organization) vom Standort (Location) eindeutig abgegrenzt.Die Erfassung der Organisation in strukturierter Form ermöglicht u.a.:* Zuweisungen von Diensten an bestimmte Bereiche der Aufbauorganisation im Rahmen des Terminmanagements
* Die Raum- und Betten-Belegung in strukturierter Form (interdisziplinär)
Auch die Erfassung des Krankenhauses als Ganzem ist relevant. Entsprechend fokussieren die folgenden Profile zur Organisation auf das Krankenhaus als Ganzes und die Fachabteilung als Organisation.### KompatibilitätFür das Profil ISiKOrganisationFachabteilung wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKPatient valide sind, auch valide sind gegen:* [Profil TIOrganization der gematik](https://gematik.de/fhir/ti/StructureDefinition/ti-organization)
Hinweise zu Inkompatibilitäten können über die[Portalseite](https://service.gematik.de/servicedesk/customer/portal/16)gemeldet werden. |
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
| [ISiKStandort](StructureDefinition-ISiKStandort.md) | Dieses Profil dient der strukturierten Erfassung von Standortangaben eines Krankenhauses oder von Organisationseinheiten innerhalb eines Krankenhauses in ISiK-Szenarien.### MotivationIn FHIR wird die Organisation (Organization) vom Standort (Location) eindeutig abgegrenzt.Die Abbildung von Standorten in einem Krankenhaus unterstützt u.a. die Raum- und Bettenbelegung in strukturierter Form.Die Erfassung des Standortes in strukturierter Form soll u.a. ermöglichen:* Zuweisungen von Diensten an bestimmte Standorte im Rahmen des Terminmanagements
* Die Raum- und Betten-Belegung in strukturierter Form (interdisziplinär) - u.a. für 
* Patientenportale im Rahmen der Terminbuchung, z.B. um den Wunsch nach Einzelbett, bzw. 1 oder 2 Betten abzubilden
* KIS und weitere Subsysteme: 
* zur Patientenabholung und Information für den Transportdienst
* Abbildung der Verfügbarkeit eines spezifischen Bettenstellplatzes (z.B. mit spezifischem Monitoring-Device)
 
 
* Im Rahmen der Versorgung kann eine der folgenden Beispiel-Fragen beantworten werden: 
* Handelt es sich um ein Isolationszimmer?
* Gibt es bestimmte Ausstattung, z.B. Beatmungsgeräte?
* etc.
 
Dafür werden Standort-Profile in unterschiedlicher Granularität definiert.### KompatibilitätFür das Profil ISiKStandort wurde bis zum Zeitpunkt der Veröffentlichung kein Abgleich der Kompatibilität zu anderen Profilen (der KBV und der Medizininformatik-Initiative) durchgeführt.Hinweise zu Inkompatibilitäten können über die[Portalseite](https://service.gematik.de/servicedesk/customer/portal/16)gemeldet werden. |
| [ISiKStandortBettenstellplatz](StructureDefinition-ISiKStandortBettenstellplatz.md) | Dieses Profil dient der strukturierten Erfassung von Bettenstellplätzen (als Standorten) eines Krankenhauses.### HinweisEin einzelnes Bett als Gegenstand kann als FHIR-Ressource ‘Device’ abgebildet werden, das einen Bettenstellplatz referenziert. |
| [ISiKStandortRaum](StructureDefinition-ISiKStandortRaum.md) | Dieses Profil dient der strukturierten Erfassung von Räumen (als Standorten) eines Krankenhauses. |
| [ISiKStillstatus](StructureDefinition-ISiKStillstatus.md) | Profil zur Abbildung ob gestillt/Muttermilch abgepumpt und gefüttert wird |
| [ISiKValueSet](StructureDefinition-ISiKValueSet.md) | Dieses Profil beschreibt die maschinenlesbare Auswahl von Codes für die Kodierung spezifischer FHIR-Elemente in ISiK-Szenarien.### MotivationISiK erlaubt in diversen Kontexten die Erweiterung der Kodierung durch Krankenhaus- / System-interne Kodierungen. Mittels der Veröffentlichung von ValueSets können Auswahllisten für externe Clients bereitgestellt werden, sodass diese entsprechende Kodierungen ebenfalls anbieten können.### KompatibilitätFür das Profil ISiKValueSet wurde bis zum Zeitpunkt der Veröffentlichung kein Abgleich der Kompatibilität zu anderen Profilen (der KBV und der Medizininformatik-Initiative) durchgeführt. Hinweise zu Inkompatibilitäten können über die[Portalseite](https://service.gematik.de/servicedesk/customer/portal/16)gemeldet werden. |
| [ISiKVersicherungsverhaeltnisGesetzlich](StructureDefinition-ISiKVersicherungsverhaeltnisGesetzlich.md) | Dieses Profil ermöglicht die Darstellung eines gesetzlichen Versicherungsverhältnisses in ISiK Szenarien.### MotivationISiK unterstützt Anwendungsszenarien, in denen durch das Krankenhaus erbrachte Leistungen erfasst oder gegenüber Kostenträgern abgerechnet werden. In diesen Anwendungsszenarien wird das Versicherungsverhältnis verwendet, um bspw. den Versicherungsstatus oder die Rechnungsanschrift der Versicherung zu ermitteln.In FHIR werden Versicherungsverhältnisse mit der Coverage-Ressource repräsentiert.### KompatibilitätDas Profil ISiKVersicherungsverhaeltnisGesetzlich basiert auf dem[GKV-Profil der deutschen Basisprofile](http://fhir.de/StructureDefinition/coverage-de-basis). Instanzen, die gegen ISiKVersicherungsverhaeltnisGesetzlich valide sind, sind auch valide gegen* [GKV-Profil der deutschen Basisprofile](http://fhir.de/StructureDefinition/coverage-de-basis)
Hinweise zu Inkompatibilitäten können über die[Portalseite](https://service.gematik.de/servicedesk/customer/portal/16)gemeldet werden. |
| [ISiKVersicherungsverhaeltnisSelbstzahler](StructureDefinition-ISiKVersicherungsverhaeltnisSelbstzahler.md) | Dieses Profil ermöglicht die Darstellung eines gesetzlichen Versicherungsverhältnisses in ISiK Szenarien.### MotivationISiK unterstützt Anwendungsszenarien, in denen durch das Krankenhaus erbrachte Leistungen erfasst oder gegenüber Kostenträgern abgerechnet werden. In diesen Anwendungsszenarien wird das Versicherungsverhältnis verwendet, um bspw. den Versicherungsstatus oder die Rechnungsanschrift der Versicherung zu ermitteln.In FHIR werden Versicherungsverhältnisse mit der Coverage-Ressource repräsentiert.### KompatibilitätDas Profil ISiKVersicherungsverhaeltnisSelbstzahler basiert auf dem[Selbstzahler-Profil der deutschen Basisprofile](https://fhir.de/StructureDefinition/coverage-de-sel). Instanzen, die gegen ISiKVersicherungsverhaeltnisSelbstzahler valide sind, sind auch valide gegen* [Selbstzahler-Profil der deutschen Basisprofile](https://fhir.de/StructureDefinition/coverage-de-sel)
Hinweise zu Inkompatibilitäten können über die[Portalseite](https://service.gematik.de/servicedesk/customer/portal/16)gemeldet werden. |
| [ISiKVersicherungsverhaeltnisSonstige](StructureDefinition-ISiKVersicherungsverhaeltnisSonstige.md) | Dieses Profil ermöglicht die Darstellung sonstiger Versicherungsverhältnisses in ISiK Szenarien.### MotivationISiK unterstützt Anwendungsszenarien, in denen durch das Krankenhaus erbrachte Leistungen erfasst oder gegenüber Kostenträgern abgerechnet werden, bei denen es sich**weder**um gesetzliche Versicherungen noch Selbstzahlerverhältnisse handelt. In diesen Anwendungsszenarien wird das Versicherungsverhältnis verwendet, um bspw. den Versicherungsstatus oder die Rechnungsanschrift der Versicherung zu ermitteln.In FHIR werden Versicherungsverhältnisse mit der Coverage-Ressource repräsentiert.### KompatibilitätDas Profil ISiKVersicherungsverhaeltnisSonstige basiert auf dem[Basis-Coverage-Profil der deutschen Basisprofile](http://fhir.de/StructureDefinition/coverage-de-basis).Hinweise zu Inkompatibilitäten können über die[Portalseite](https://service.gematik.de/servicedesk/customer/portal/16)gemeldet werden. |

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
| [ProzedurenCodesSCT](ValueSet-ProzedurenCodesSCT.md) | Enthaelt alle SNOMED Procedure Codes |
| [ProzedurenKategorieSCT](ValueSet-ProzedurenKategorieSCT.md) | Enthaelt alle SNOMED Codes für ein Mapping der OPS Klassentitel |
| [Schwangerschaft Erwarteter Entbindungstermin Methode](ValueSet-SchwangerschaftEtMethodeVS.md) |  |
| [Schwangerschaftsstatus Valueset](ValueSet-SchwangerschaftsstatusVS.md) |  |
| [Stillstatus LOINC Antwortoptionen](ValueSet-StillstatusVS.md) | Dieses Valueset enthält die Codes zur Beschreibung von Stillstatus LOINC. |
| [TestValueSet](ValueSet-ISiKValueSetExample.md) |  |

### Terminology: Code Systems 

These define new code systems used by systems conforming to this implementation guide.

| |
| :--- |
| [TestKatalog](CodeSystem-CodeSystemExample.md) |

### Other 

These are resources that are used within this implementation guide that do not fit into one of the other categories.

| |
| :--- |
| [Account/AbrechnungsfallDRG](Account-AbrechnungsfallDRG.md) |
| [Account/AbrechnungsfallGonarthrose](Account-AbrechnungsfallGonarthrose.md) |
| [Account/SZ1DRGFall](Account-SZ1DRGFall.md) |
| [Account/SZ2DRGFall](Account-SZ2DRGFall.md) |
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
| [Coverage/CoverageGesetzlich](Coverage-CoverageGesetzlich.md) |
| [Coverage/CoveragePrivat](Coverage-CoveragePrivat.md) |
| [Coverage/CoverageSonstige](Coverage-CoverageSonstige.md) |
| [Coverage/SZ1VersicherungGesetzlich](Coverage-SZ1VersicherungGesetzlich.md) |
| [Coverage/SZ1VersicherungSelbstzahler](Coverage-SZ1VersicherungSelbstzahler.md) |
| [Coverage/SZ2VersicherungGesetzlich](Coverage-SZ2VersicherungGesetzlich.md) |
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
| [Location/BettenstellplatzStandortBeispiel](Location-BettenstellplatzStandortBeispiel.md) |
| [Location/RaumStandortBeispiel](Location-RaumStandortBeispiel.md) |
| [Observation/ISiKAlkoholAbususBeispiel](Observation-ISiKAlkoholAbususBeispiel.md) |
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
| [RelatedPerson/ISiKAngehoerigerMustermann](RelatedPerson-ISiKAngehoerigerMustermann.md) |
| [RelatedPerson/SZ1Mutter](RelatedPerson-SZ1Mutter.md) |
| [Allgemeinchirurgie](Organization-AbteilungAllgemeinchirurgieOrganisationBeispiel.md) |
| [Blutdruckmessung vom 3.5.2022 (Bundle)](Bundle-ISiKBundle-Example.md) |
| [Station A](Location-StationStandortBeispiel.md) |
| [Uniklinik Entenhausen](Organization-KrankenhausOrganisationBeispiel.md) |
| [Verlegungsbericht für Patient Herrn Thomas Müller (1234567890) - Intensivstation 0100 (Bundle)](Bundle-BundleExampleIntensivstation.md) |

