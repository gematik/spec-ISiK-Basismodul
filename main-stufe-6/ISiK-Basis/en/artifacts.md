# FHIR-Artefakte - ISiK Basis Implementierungsleitfaden v6.0.0

ISiK Basis Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* **FHIR-Artefakte**

## FHIR-Artefakte

Auf dieser Seite befindet sich eine Liste der FHIR-Artefakte, welche im Rahmen dieses Implementation Guide definiert werden.

Es gelten zur Umsetzung der basalen Funktionalität und weiterer Use Cases in ISiK die Festlegungen zu CapabilityStatements [(Akteure und Rollen)](Erlaeuterung-Akteurs-und-Rollenmodell.md) sowie Datenstrukturen entsprechend der folgenden Abschnitte.

Softwareherstellern steht es frei, über die hier spezifizierten Profiltypen hinaus weitere FHIR-Profile zu nutzen, zu implementieren oder zu spezifizieren und über eine API bereitzustellen. Wir bitten in solchen Fällen jedoch um eine Meldung entsprechender Bedarfe über das [ISiK Anfrageportal](https://service.gematik.de/servicedesk/customer/portal/16), damit wir über mögliche Leerstellen der ISiK-Spezifikation in grundlegenden API-Funktionalitäten zur Abdeckung spezifischer Workflows informiert werden.

### CapabilityStatements

#### Akteure

Das CapabilityStatement mit der Kennzeichnung "Expanded" dient der direkten Übersicht aller zu implementierender Interaktionen und Profile.

| | |
| :--- | :--- |
| [ Akteur ISiKCapabilityStatementBasisServerAkteur (Expanded) ](CapabilityStatement-ISiKCapabilityStatementBasisServerAkteur-expanded.md) | CapabilityStatement für den Akteur ISiKCapabilityStatementBasisServerAkteur. Dieser Akteur aggregiert die Rollen zur Abfrage von Stammdaten, Erweiterte Stammdaten, Aufbau-Struktur, Terminologie, klinischen Daten, Abrechnungsinformationen und Gesundheitsstatus. |
| [ Akteur ISiKCapabilityStatementBasisServerAkteur ](CapabilityStatement-ISiKCapabilityStatementBasisServerAkteur.md) | CapabilityStatement für den Akteur ISiKCapabilityStatementBasisServerAkteur. Dieser Akteur aggregiert die Rollen zur Abfrage von Stammdaten, Erweiterte Stammdaten, Aufbau-Struktur, Terminologie, klinischen Daten, Abrechnungsinformationen und Gesundheitsstatus. |

**Tabelle:**Capability Statements - Akteure

#### Rollen

| | |
| :--- | :--- |
| [ CapabilityStatement für Rolle ISiKCapabilityStatementAmbulanteStammdatenRolle ](CapabilityStatement-ISiKCapabilityStatementAmbulanteStammdatenRolle.md) | CapabilityStatement für die Rolle ISiKCapabilityStatementAmbulanteStammdatenRolle. Diese Rolle beschreibt verpflichtende Interaktionen zum Abruf von ISiKAmbulanteStammdaten-Ressourcen. |
| [ CapabilityStatement für Rolle AufbaustrukturRolle ](CapabilityStatement-ISiKCapabilityStatementAufbaustrukturRolle.md) | CapabilityStatement für die Rolle ISiKCapabilityStatementAufbaustrukturRolle. Diese Rolle stellt Interaktionen zur Abfrage von Informationen zur Aufbaustruktur bereit. Die Aufbaustruktur umfasst die Organisationseinheiten, Standorte und deren Zuordnungen. |
| [ CapabilityStatement für Rolle ISiKCapabilityStatementCompositionKonsumentenRolle ](CapabilityStatement-ISiKCapabilityStatementCompositionKonsumentenRolle.md) | CapabilityStatement für die Rolle ISiKCapabilityStatementCompositionKonsumentenRolle. Diese Rolle beschreibt verpflichtende Interaktionen zum Abruf und der Verarbeitung von ISiKBerichtBundles. |
| [ CapabilityStatement für Rolle ISiKCapabilityStatementErweiterteStammdatenRolle ](CapabilityStatement-ISiKCapabilityStatementErweiterteStammdatenRolle.md) | CapabilityStatement für die Rolle ISiKCapabilityStatementErweiterteStammdatenRolle. Diese Rolle stellt erweiterte Interaktionen zur Abfrage von Stammdaten bereit. |
| [ CapabilityStatement für Rolle ISiKCapabilityStatementGesundheitsstatusRolle ](CapabilityStatement-ISiKCapabilityStatementGesundheitsstatusRolle.md) | CapabilityStatement für die Rolle ISiKCapabilityStatementGesundheitsstatusRolle. Diese Rolle beschreibt verpflichtende Interaktionen zum Abruf und der Verarbeitung von ISiKObservation-Ressourcen. |
| [ CapabilityStatement für Rolle ImplantatRolle ](CapabilityStatement-ISiKCapabilityStatementImplantatRolle.md) | CapabilityStatement für die Rolle ISiKCapabilityStatementImplantatRolle. Diese Rolle stellt Interaktionen zur Abfrage von Informationen zu Implantaten bereit. |
| [ CapabilityStatement für Rolle ISiKCapabilityStatementKlinischeRolle ](CapabilityStatement-ISiKCapabilityStatementKlinischeRolle.md) | CapabilityStatement für die Rolle ISiKCapabilityStatementKlinischeRolle. Diese Rolle beschreibt verpflichtende Interaktionen zum Abruf und der Verarbeitung von ISiKProzeduren und ISiKDiagnosen. |
| [ CapabilityStatement für Rolle LeistungserbringerRolle ](CapabilityStatement-ISiKCapabilityStatementLeistungserbringerRolle.md) | CapabilityStatement für die Rolle ISiKCapabilityStatementLeistungserbringerRolle. Diese Rolle beschreibt verpflichtende Interaktionen zum Abruf und der Verarbeitung von ISiKPersonen im Gesundheitsberuf. |
| [ CapabilityStatement für Rolle StammdatenRolle ](CapabilityStatement-ISiKCapabilityStatementStammdatenRolle.md) | CapabilityStatement für die Rolle ISiKCapabilityStatementStammdatenRolle. Diese Rolle beschreibt Interaktionen zum Abruf und der Verarbeitung grundlegender Stammdaten. |
| [ CapabilityStatement für Rolle ISiKCapabilityStatementTerminologieRolle ](CapabilityStatement-ISiKCapabilityStatementTerminologieRolle.md) | CapabilityStatement für die Rolle ISiKCapabilityStatementTerminologieRolle. Diese Rolle beschreibt verpflichtende Interaktionen zum Abruf und der Verarbeitung von Terminologie-Ressourcen. |
| [ CapabilityStatement für Rolle ISiKCapabilityStatementVersicherungsverhaeltnisRolle ](CapabilityStatement-ISiKCapabilityStatementVersicherungsverhaeltnisRolle.md) | CapabilityStatement für die Rolle ISiKCapabilityStatementVersicherungsverhaeltnisRolle. Diese Rolle beschreibt verpflichtende Interaktionen zum Abruf von ISiKVersicherungsverhaeltnis-Ressourcen. |

**Tabelle:**Capability Statements - Rollen

### Profile

#### Ressourcen-Profile

| | | |
| :--- | :--- | :--- |
| [ ISiKAbrechnungsfall (Account) ](StructureDefinition-ISiKAbrechnungsfall.md) | Account | Dieses Profil ermöglicht die Gruppierung von medizinischen Leistungen zu einem gemeinsamen Abrechnungskontext. Zugleich dient es im Kontext von ISiK derzeit im Wesentlichen der Abbildung einer Fallnummer, über die im Krankenhaus unterschiedliche Prozesse - auch administrativer Natur - abgewickelt werden. Das Profil wurde **nicht** primär zum Zweck der Abbildung von Abrechnungsprozessen definiert.**Motivation**Komplementär zum Datenobjekt 'Kontakt - Encounter' können Fälle, im Sinne einer Gruppierung von medizinischen Leistungen innerhalb eines gemeinsamen Kontextes, zu einem Abrechnungsfall zusammengefasst werden. Ein solcher Abrechnungsfall kann mehrere Kontakte umfassen (z.B. vorstationärer Besuch, stationärer Aufenthalt und nachstationärer Besuch).Gemeinsam mit dem Einrichtungskontakt bildet der Abrechnungsfall einen wichtigen Einstiegspunkt in die Dokumentation der Behandlungsleistungen der Patienten. Als Bindeglied zwischen den Kontakten und dem Versicherungsverhältnis erfolgt eine feingranulare Auflistung, in welchen Zeiträumen ein Behandlungskontext zwischen einer Gesundheitseinrichtung und der Patienten bestand. Zudem werden Diagnosen abschließend / nachträglich dokumentiert, sodass eine Übersicht von relevanten (DRG)-Diagnosen ermöglicht wird, ohne die Gesamtheit aller Kontakte betrachten zu müssen.In FHIR wird der Abrechnungsfall mit der `Account`-Ressource repräsentiert.Weitere Hinweise zu den Abgrenzungen der Begrifflichkeiten Fall und Kontakt finden sie unter [Fall-Begriff in ISiK](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc1/Abbildung-des-Konstrukts-Fall.html).**Kompatibilität*** zum Zeitpunkt der Veröffentlichung sind keine abweichenden Modellierungen der Account-Ressource bekannt.
Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. |
| [ ISiKAbrechnungsfallAmbulant (ISiKAbrechnungsfall) ](StructureDefinition-ISiKAbrechnungsfallAmbulant.md) | Account | Dieses Profil spezifiziert die Anforderungen an die Abbildung von ambulanten Abrechnungsfällen im Krankenhauskontext. Es handelt sich dabei um eine Spezialisierung des ISiK Abrechnungsfall-Profils, das allgemeine Anforderungen an die Abbildung von Abrechnungsfällen definiert.Ambulante-Abrechnungsfall-Angaben unterscheiden sich von stationären im Krankenhaus im Wesentlichen durch die Angabe von:* die Extenion `AbrechnungsDiagnoseProzedurAmbulant` wurde ergänzt, um die Angabe von abrechnungsrelevanten Diagnosen und Prozeduren zu ermöglichen, ohne dass diese in Haupt- und Nebendiagnosen aufgeteilt werden müssen. Eine Aufteilung ist im ambulanten Kontext nicht üblich, aber da es dennoch in der Praxis vorkommen kann, wurde die ursprüngliche Extension `AbrechnungsDiagnoseProzedur` nicht ausgeschlossen, sondern die neue Extension als Ergänzung hinzugefügt.
* die Angabe einer Scheinnummer als Identifier. Amulante Fälle werden meist über die Existenz eines so genannten Scheins definiert. Die Scheinnummer ist eine Nummer, die innerhalb einer Einrichtung diesen Schein eindeutig identifiziert. Da es häufig auch noch eine klassische Fallnummer gibt, sind beide Identifier vorgesehen und kommen auch vor.
* die Angabe eines `servicePeriod` als Gültigkeitszeitraum des ambulanten Abrechnungsfalls, da es sich hierbei um punktuelle Kontakte handelt und der Zeitraum der Gültigkeit nicht direkt aus den zugeordneten Encountern ableitbar ist.
* die Angabe eines `owner`, um die Ambulanz als verantwortliche Organisation zu dokumentieren.
 |
| [ ISiKAllergieUnvertraeglichkeit (AllergyIntolerance) ](StructureDefinition-ISiKAllergieUnvertraeglichkeit.md) | AllergyIntolerance | Diese Profil ermöglicht die Dokumentation von Allergien und Unverträglichkeiten in ISiK Szenarien.**Motivation**Die Möglichkeit, auf eine Übersicht der Allergien und Unverträglichkeiten eines Patienten zuzugreifen, ist eine wichtige Funktion im klinischen Behandlungsablauf. Dies gilt insbesondere, aber nicht ausschließlich, im Bereich der Arzneimitteltherapiesicherheit. Motivierender Use-Case zur Einführung dieser Profile ist die [Arzneitmitteltherapiesicherheit im Krankenhaus - AMTS](https://gemspec.gematik.de/ig/fhir/isik/amts/6.0.0-rc1/UseCases.html).In FHIR werden Allergien und Unverträglichkeiten mit der [AllergyIntolerance](https://hl7.org/fhir/R4/allergyintolerance.html)-Ressource repräsentiert.**Kompatibilität**Für das Profil ISiKAllergieUnvertraeglichkeit wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISiKAllergieUnvertraeglichkeit valide sind, auch valide sind gegen:* [das Profil KBV_PR_Base_AllergyIntolerance der KBV](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_AllergyIntolerance)
* [das Profil EMDAF_PR_AllergyIntolerance der GEVKO](https://fhir.gevko.de/StructureDefinition/EMDAF_PR_AllergyIntolerance)
* [das Profil AllergyIntolerance-uv-ips der International Patient Summary](http://hl7.org/fhir/uv/ips/StructureDefinition/AllergyIntolerance-uv-ips)
Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. |
| [ ISiKBerichtBundle (Bundle) ](StructureDefinition-ISiKBerichtBundle.md) | Bundle | Das Document-Bundle dient dem Transport von Berichten zwischen Subsystemen im Krankenhaus. Das Bundle entspricht den Anforderungen an ein [FHIR Document Bundle](https://hl7.org/fhir/R4/documents.html) : Alle referenzierten Ressourcen müssen als Einträge im Bundle enthalten sein. Das Bundle unterstützt die Übermittlung einer menschenlesbaren Dokumentation (Narrative) und erlaubt zudem die Übernahme wichtiger Ressourcen (z. B. Diagnosen und Prozeduren), die einem Patienten und Fall (Patient, Encounter) zugeordnet sind. |
| [ ISiKCodeSystem (CodeSystem) ](StructureDefinition-ISiKCodeSystem.md) | CodeSystem | Dieses Profil beschreibt die maschinenlesbare Repräsentation von system-spezifischen Kodierungen in ISiK-Szenarien.**Motivation**ISiK erlaubt in diversen Kontexten die Erweiterung der Kodierung durch Krankenhaus-/System-interne Kodierungen. Das Profil ISiKKatalog (CodeSystem) als Profil erlaubt die Repräsentation der dazugehörigen Codes und Display-Werte.Eine maschinenlesbare Repräsentation dieser Kodierungen erlaubt es Clients, dazugehörige Anzeigetext und Definitionen zu verarbeiten.Ein Codesystem eignet sich auch dazu, auf dessen Basis definierte ValueSets zu expandieren (https://hl7.org/fhir/R4/valueset-operation-expand.html). Da ISiKValueSet expandierte Valuesets vorsieht, ist eine dynamische Expansion in der Regel nicht erforderlich. Darüber hinausgehend ist ein Use Case im Kontext der Katalogabfrage folgender: Ein Client möchte eine Expansion neu generieren (z.B. mit anderen Expansionen-Parametern), um das ValueSet beispielsweise in einer anderen Sprache auszugeben. |
| [ ISiKBerichtSubSysteme (Composition) ](StructureDefinition-ISiKBerichtSubSysteme.md) | Composition | Dieses Profil ermöglicht die krankenhaus-interne Übermittlung eines Berichtes bestehend aus beliebigen strukturierten FHIR-Ressourcen sowie einer textuellen HTML-Repräsentation (Narrative) an einen ISiK-Basis-kompatiblen Server.**Motivation**In der heterogenen Systemlandschaft im Krankenhaus sind eine Vielzahl spezialisierter Subsysteme im Einsatz. Die Ergebnisse aus diesen Subsystemen sind aktuell jedoch häufig nicht in den Primärsystemen des Krankenhauses verfügbar, denn es bestehen folgende Herausforderungen:Die Daten in Subsystemen sind sehr heterogen und können hochspezialisiert sein. Bei der Nutzung dieser Subsysteme besteht häufig ein Interesse, auf die menschenlesbare Repräsentation der strukturierten Daten einwirken zu können. Künftig ist mit Szenarien zu rechnen, bei denen Befunde aus Subsystemen in eine elektronische Patientenakte übertragen werden sollen. Aktuell werden Befunde, obwohl diese in den Subsystemen in hochstrukturierter Form vorliegen, nur als PDF an das Primärsystem übermittelt. Oft weil kein strukturiertes Format spezifiziert ist, das sowohl versendendes Subsystem als auch empfangendes Primärsystem implementiert haben. Der Umfang, in dem eine Datenübernahme in ein Primärsystem möglich ist, variiert stark zwischen den Systemen oder Installationen, z.B. abhängig davon, ob ein Modul für Vitalparameter installiert ist. Die ISiK-Spezifikation begegnet diesen Herausforderungen, indem sie die Übermittlung von Ergebnissen aus Subsystemen an die Primärsysteme in Form von strukturierten Dokumenten erfordert, die über eine menschenlesbare Repräsentation verfügen. Diese strukturierten Dokumente werden im ISiK-Kontext als Berichte bezeichnet. Dabei sind die strukturierten Inhalte der Berichte harmonisiert mit den verbreiteten Formaten für Primärsysteme.(Semi-)Strukturierte Dokumente werden in FHIR mit der `Composition`-Ressource repräsentiert, die die Dokumentenmetadaten sowie die textuelle Repräsentation des Dokumentes enthält. Die Composition referenziert auf beliebige weitere FHIR-Ressourcen, die die strukturierten Komponenten des Dokumentes darstellen.Für den Transport wird die Composition zusammen mit allen direkt oder indirekt referenzierten Ressourcen in eine `Bundle`-Ressource vom Typ `document` aggregiert. Das Document-Bundle trägt alle Eigenschaften eines Dokumentes: Abgeschlossenheit, Unveränderbarkeit, Signierbarkeit.Es obliegt dem empfangenden System, ob dieses Dokument lediglich in seiner Gesamtheit persistiert wird, oder ob darüber hinaus einzelne Bestandteile (Ressourcen) als strukturierte Daten automatisch oder auf Veranlassung eines Benutzers in die Patientenakte übernommen werden.In der aktuellen Ausbaustufe von ISiK ist lediglich die Übernahme und Anzeige der Dokument-Metadaten (z.B. Dokumenttyp, Dokumentdatum, Quelle) und der menschenlesbaren HTML-Repräsentation in die Primärsysteme erforderlich.In weiteren Ausbaustufen von ISiK soll darüber hinaus eine Übernahme der strukturierten Anteile der Dokumente möglich sein, die den ISiK-Spezifikationen entsprechen, z.B. Diagnosen und Prozeduren.**Kompatibilität**Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. |
| [ ISiKDiagnose (Condition) ](StructureDefinition-ISiKDiagnose.md) | Condition | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Diagnosen eines Patienten im Rahmen des Bestätigungsverfahrens der gematik.**Motivation**Die Möglichkeit, auf eine Übersicht der Diagnosen eines Patienten zuzugreifen, Patienten anhand ihrer Diagnose zu suchen oder zu prüfen, ob eine konkrete Diagnose bei einem Patienten vorliegt, sind wichtige Funktionen im klinischen Behandlungsablauf.In FHIR werden Diagnosen mit der Condition-Ressource repräsentiert.Da die Diagnosen in klinischen Primärsystemen in der Regel in ICD-10-codierter Form vorliegen, fordert ISiK in erster Linie diese Form des Austausches. Falls eine Diagnose zwar dokumentiert, aber noch nicht codiert wurde (z.B. wenn die Kodierung erst nach der Entlassung erfolgt), ist alternativ eine Repräsentation als Freitext-Diagnose möglich.**Kompatibilität**Für das Profil ISiKDiagnose wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISiKDiagnose valide sind, auch valide sind gegen:* das [Profil ProfileConditionDiagnose der Medizininformatik-Initative](https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose)
* das [Profil KBV_PR_Base_Condition_Diagnosis der KBV](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Condition_Diagnosis)]
 Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden.
 |
| [ ISiKVersicherungsverhaeltnisGesetzlich (CoverageDeBasis) ](StructureDefinition-ISiKVersicherungsverhaeltnisGesetzlich.md) | Coverage | Dieses Profil ermöglicht die Darstellung eines gesetzlichen Versicherungsverhältnisses in ISiK Szenarien.**Motivation**ISiK unterstützt Anwendungsszenarien, in denen durch das Krankenhaus erbrachte Leistungen erfasst oder gegenüber Kostenträgern abgerechnet werden. In diesen Anwendungsszenarien wird das Versicherungsverhältnis verwendet, um bspw. den Versicherungsstatus oder die Rechnungsanschrift der Versicherung zu ermitteln. In FHIR werden Versicherungsverhältnisse mit der Coverage-Ressource repräsentiert.**Kompatibilität**Das Profil ISiKVersicherungsverhaeltnisGesetzlich basiert auf dem [GKV-Profil der deutschen Basisprofile](http://fhir.de/StructureDefinition/coverage-de-basis). Instanzen, die gegen ISiKVersicherungsverhaeltnisGesetzlich valide sind, sind auch valide gegen* [GKV-Profil der deutschen Basisprofile](http://fhir.de/StructureDefinition/coverage-de-basis)
Instanzen, die gegen [VSDM 2.0 Versicherungsdaten GKV](https://simplifier.net/vsdm2/vsdmcoveragegkv) valide sind, sind auch valide gegen dieses ProfilHinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. |
| [ ISiKVersicherungsverhaeltnisSelbstzahler (CoverageDeSel) ](StructureDefinition-ISiKVersicherungsverhaeltnisSelbstzahler.md) | Coverage | Dieses Profil ermöglicht die Darstellung eines privaten Versicherungsverhältnisses, bzw. eines Selbstzahler-Verhältnisses in ISiK Szenarien.**Motivation**:ISiK unterstützt Anwendungsszenarien, in denen durch das Krankenhaus erbrachte Leistungen erfasst oder gegenüber Kostenträgern abgerechnet werden. In diesen Anwendungsszenarien wird die `Coverage`-Ressource verwendet, um bspw. den Versicherungsstatus oder die Rechnungsanschrift des Kostenträgers zu ermitteln.**Abgrenzung:** Das Selbstzahler-Profil gilt für Szenarien, in denen der Patient selbst (oder eine abweichende natürliche oder juristische Person) als Kostenträger auftritt. Für PKV-Verhältnisse, in denen die Kosten **unmittelbar** von einer privaten Versicherung übernommen werden (ohne dass der Patient in Vorleistung geht), KANN das Profil [Versicherungsdaten PKV](https://simplifier.net/vsdm2/vsdmcoveragepkv) aus der jeweils geltenden VSDM 2.0 Spezifikation verwendet werden.**Kompatibilität**:Das Profil ISiKVersicherungsverhaeltnisSelbstzahler basiert auf dem [Selbstzahler-Profil der deutschen Basisprofile](https://fhir.de/StructureDefinition/coverage-de-sel). Instanzen, die gegen ISiKVersicherungsverhaeltnisSelbstzahler valide sind, sind auch valide gegen* [Selbstzahler-Profil der deutschen Basisprofile](https://fhir.de/StructureDefinition/coverage-de-sel)
Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. |
| [ ISiKVersicherungsverhaeltnisSonstige (CoverageDeBasis) ](StructureDefinition-ISiKVersicherungsverhaeltnisSonstige.md) | Coverage | Dieses Profil ermöglicht die Darstellung sonstiger Versicherungsverhältnisses in ISiK Szenarien.**Motivation**ISiK unterstützt Anwendungsszenarien, in denen durch das Krankenhaus erbrachte Leistungen erfasst oder gegenüber Kostenträgern abgerechnet werden, bei denen es sich **weder** um gesetzliche Versicherungen noch Selbstzahlerverhältnisse handelt. In diesen Anwendungsszenarien wird das Versicherungsverhältnis verwendet, um bspw. den Versicherungsstatus oder die Rechnungsanschrift der Versicherung zu ermitteln. In FHIR werden Versicherungsverhältnisse mit der Coverage-Ressource repräsentiert.**Kompatibilität**Das Profil ISiKVersicherungsverhaeltnisSonstige basiert auf dem [Basis-Coverage-Profil der deutschen Basisprofile](http://fhir.de/StructureDefinition/coverage-de-basis).Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. |
| [ ISiKImplantat (Device) ](StructureDefinition-ISiKImplantat.md) | Device | Dieses Profil ermöglicht die strukturierte Abbildung von Implantaten eines Patienten in ISiK-Szenarien. Implantate stellen dauerhaft oder langfristig im Körper befindliche Medizinprodukte dar und sind häufig von hoher klinischer Relevanz, da sie Diagnostik, Therapieentscheidungen sowie zukünftige Behandlungsmaßnahmen unmittelbar beeinflussen können.MotivationDie standardisierte Bereitstellung von Implantatinformationen unterstützt insbesondere:```
die eindeutige Identifikation implantierter Medizinprodukte,

die Berücksichtigung implantatspezifischer Besonderheiten bei weiteren diagnostischen oder therapeutischen Maßnahmen,

die Nachverfolgbarkeit im Rahmen von Sicherheitsmeldungen und Rückrufaktionen sowie

die Dokumentation wesentlicher Implantatmerkmale (z. B. Hersteller, Modell, Seriennummer).

```
Darüber hinaus ermöglicht das Profil eine interoperable und maschinenlesbare Darstellung implantatrelevanter Informationen und trägt zur Verbesserung der Patientensicherheit sowie zur Vermeidung von Risiken und Fehlentscheidungen im Behandlungsprozess bei. Als Bestandteil interoperabler Patientendaten stellt es sicher, dass relevante Implantatvorinformationen systemübergreifend verfügbar sind.Da Implantate auch im Kontext des EHDS berücksichtigt werden, erscheint eine Aufnahme in ISiK sinnvoll, um die Verfügbarkeit von Implantatinformationen in verschiedenen Anwendungsfällen zu gewährleisten, insbesondere in solchen, die über die Dokumentation in einem Entlassbrief hinausgehen. |
| [ ISiKKontaktGesundheitseinrichtung (Encounter) ](StructureDefinition-ISiKKontaktGesundheitseinrichtung.md) | Encounter | Dieses Profil ermöglicht die Abbildung von Besuchen/Aufenthalten eines Patienten in einer Gesundheitseinrichtung.**Motivation**Informationen über die Besuche des Patienten entlang seines Behandlungspfades im Krankenhaus sind ein wichtiger Bestandteil des einrichtungsinternen Datenaustausches. Sie ermöglichen die Unterscheidung von stationären und ambulanten sowie aufgenommenen und entlassenen Patienten. Weiterhin ist aus den Besuchsinformationen der aktuelle Aufenthaltsort des Patienten (Fachabteilung, Station, Bettplatz) ermittelbar. Klinische Ressourcen werden in FHIR durch Verlinkung auf die Encounter-Ressource in einen Kontext zum Besuch gestellt. Dieser Kontext ist wichtig für die Steuerung von Zugriffsberechtigungen und Abrechnungsprozessen.Zu Beginn der meisten klinischen Workflows steht die Auswahl des Besuchskontextes. Dies geschieht bspw. durch das Suchen der Encounter-Ressource anhand von Eigenschaften wie Aufnahmenummer, Fallart oder Aufnahmedatum. Daraufhin werden die zutreffenden Suchergebnisse angezeigt und der gewünschte Besuch ausgewählt.In FHIR werden Besuche, Aufenthalte, aber auch virtuelle Kontakte mit der `Encounter`-Ressource repräsentiert.Weitere Hinweise zu den Abgrenzungen der Begrifflichkeiten Fall und Kontakt finden sie unter [Fall-Begriff in ISiK](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc1/Abbildung-des-Konstrukts-Fall.html).**Kompatibilität**Für das Profil ISiKKontaktGesundheitseinrichtung wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISiKKontaktGesundheitseinrichtung valide sind, auch valide sind gegen:* Profil [Kontakt mit einer Gesundheitseinrichtung der Medizininformatik-Initiative](https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung)
Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. |
| [ ISiKStandort (Location) ](StructureDefinition-ISiKStandort.md) | Location | Dieses Profil dient der strukturierten Erfassung von Standortangaben eines Krankenhauses oder von Organisationseinheiten innerhalb eines Krankenhauses in ISiK-Szenarien.**Motivation**In FHIR wird die Organisation (Organization) vom Standort (Location) eindeutig abgegrenzt.Die Abbildung von Standorten in einem Krankenhaus unterstützt u.a. die Raum- und Bettenbelegung in strukturierter Form.Die Erfassung des Standortes in strukturierter Form soll u.a. ermöglichen:* Zuweisungen von Diensten an bestimmte Standorte im Rahmen des Terminmanagements
* Die Raum- und Betten-Belegung in strukturierter Form (interdisziplinär) - u.a. für 
* Patientenportale im Rahmen der Terminbuchung, z.B. um den Wunsch nach Einzelbett, bzw. 1 oder 2 Betten abzubilden
* KIS und weitere Subsysteme: 
* zur Patientenabholung und Information für den Transportdienst
* Abbildung der Verfügbarkeit eines spezifischen Bettenstellplatzes (z.B. mit spezifischem Monitoring-Device)
 
 
* Im Rahmen der Versorgung kann eine der folgenden Beispiel-Fragen beantworten werden: 
* Handelt es sich um ein Isolationszimmer?
* Gibt es bestimmte Ausstattung, z.B. Beatmungsgeräte?
* etc.
 
Dafür werden Standort-Profile in unterschiedlicher Granularität definiert.**Kompatibilität**Für das Profil ISiKStandort wurde bis zum Zeitpunkt der Veröffentlichung kein Abgleich der Kompatibilität zu anderen Profilen (der KBV und der Medizininformatik-Initiative) durchgeführt. Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. |
| [ ISiKStandortBettenstellplatz (ISiKStandort) ](StructureDefinition-ISiKStandortBettenstellplatz.md) | Location | Dieses Profil dient der strukturierten Erfassung von Bettenstellplätzen (als Standorten) eines Krankenhauses.HinweisEin einzelnes Bett als Gegenstand kann als FHIR-Ressource 'Device' abgebildet werden, das einen Bettenstellplatz referenziert. |
| [ ISiKStandortRaum (ISiKStandort) ](StructureDefinition-ISiKStandortRaum.md) | Location | Dieses Profil dient der strukturierten Erfassung von Räumen (als Standorten) eines Krankenhauses. |
| [ ISiK Alkohol Abusus (ISiKLebensZustand) ](StructureDefinition-ISiKAlkoholAbusus.md) | Observation | Dieses Profil dient der Abbildung des schädlichen Gebrauchs von Alkohol. |
| [ ISiKLebensZustand (Observation) ](StructureDefinition-ISiKLebensZustand.md) | Observation | Basisprofil für ISiKLebensZustand Observation**Motivation**Viele medizinischen Entscheidungen benötigen Informationen zu den Lebensumständen eines Patienten. Hierzu gehören eine aktuelle Schwangerschaft, Raucherstatus sowie der Alkoholabususstatus. Motivierender Use-Case zur Einführung dieser Profile ist die [Arzneitmitteltherapiesicherheit im Krankenhaus - AMTS](https://gemspec.gematik.de/ig/fhir/isik/amts/6.0.0-rc1/UseCases.html).In FHIR werden Untersuchungen, bzw. Beobachtungen als [`Observation`](https://hl7.org/fhir/R4/observation.html)-Ressource repräsentiert.Dieses Profil ist eine generische, ISiK-spezifische Observation für die Abbildung von Lebenszuständen. Die folgenden Profile vom Typ `Observation` sind spezifische Profile im oben genannten Sinn:* https://gematik.de/fhir/isik/StructureDefinition/ISiKSchwangerschaftsstatus
* https://gematik.de/fhir/isik/StructureDefinition/ISiKSchwangerschaftErwarteterEntbindungstermin
* https://gematik.de/fhir/isik/StructureDefinition/ISiKStillstatus
* https://gematik.de/fhir/isik/StructureDefinition/ISiKAlkoholAbusus
* https://gematik.de/fhir/isik/StructureDefinition/ISiKRaucherStatus
**Kompatibilität**Für Schwangerschaftsstatus & Erwarteter Geburtstermin wird eine Kompatibilität mit folgenden **IPS** Profilen angestrebt:* [IPS Resource Profile: Observation - Pregnancy: EDD](https://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Observation-pregnancy-edd-uv-ips.html).
* [IPS Resource Profile: Observation - Pregnancy: status](https://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Observation-pregnancy-status-uv-ips.html)
Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. |
| [ ISiK Raucherstatus (ISiKLebensZustand) ](StructureDefinition-ISiKRaucherStatus.md) | Observation | Dieses Profil dient der Abbildung des Raucherstatus von Patienten. |
| [ ISiK Schwangerschaft - Erwarteter Entbindungstermin (ISiKLebensZustand) ](StructureDefinition-ISiKSchwangerschaftErwarteterEntbindungstermin.md) | Observation | Dieses Profil dient der Abbildung des erwarteten Entbindungstermins bei einer Schwangerschaft. |
| [ ISiK Schwangerschaftsstatus (ISiKLebensZustand) ](StructureDefinition-ISiKSchwangerschaftsstatus.md) | Observation | Dieses Profil bildet den Schwangerschaftsstatus einer Patientin ab. |
| [ ISiKStillstatus (ISiKLebensZustand) ](StructureDefinition-ISiKStillstatus.md) | Observation | Dieses Profil dient der Abbildung des Stillstatus, d.h ob gestillt/Muttermilch abgepumpt und gefüttert wird. |
| [ ISiKOrganisation (Organization) ](StructureDefinition-ISiKOrganisation.md) | Organization | Dieses Profil beschreibt die Nutzung von Organisationseinheiten innerhalb eines Krankenhauses oder eines Krankenhauses als Ganzes in ISiK-Szenarien. |
| [ ISiKOrganisationFachabteilung (ISiKOrganisation) ](StructureDefinition-ISiKOrganisationFachabteilung.md) | Organization | Dieses Profil beschreibt die Organisationseinheit Fachabteilung innerhalb eines Krankenhauses.**Motivation**Die Abbildung der Aufbauorganisation eines Krankenhauses dient der Festlegung von Zuständigkeiten und (Entscheidungs-)Verantwortungen von Organisationseinheiten (z.B. Fachkliniken, Fachabteilungen und -bereichen etc.) in strukturierter Form.In FHIR wird die Organisation (Organization) vom Standort (Location) eindeutig abgegrenzt.Die Erfassung der Organisation in strukturierter Form ermöglicht u.a.:* Zuweisungen von Diensten an bestimmte Bereiche der Aufbauorganisation im Rahmen des Terminmanagements
* Die Raum- und Betten-Belegung in strukturierter Form (interdisziplinär)
Auch die Erfassung des Krankenhauses als Ganzes ist relevant. Entsprechend fokussieren die folgenden Profile zur Organisation auf das Krankenhaus als Ganzes und die Fachabteilung als Organisation.**Kompatibilität**Für das Profil ISiKOrganisationFachabteilung wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen das ISIK Profil valide sind, auch valide sind gegen:* [Profil TIOrganization der gematik](https://gematik.de/fhir/ti/StructureDefinition/ti-organization)
Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. |
| [ ISiKPatient (Patient) ](StructureDefinition-ISiKPatient.md) | Patient | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von administrativen Patientendaten im Rahmen des Bestätigungsverfahrens der gematik. **Motivation**: Der Austausch administrativer Patientendaten ist eine der grundlegenden Funktionalitäten beim Datenaustausch in der klinischen Versorgung. In FHIR werden sämtliche klinischen Ressourcen durch Verlinkung auf die Ressource 'Patient' in einen Patientenkontext gestellt. Die Herstellung des korrekten Patientenkontextes durch Suchen der Patientenressource anhand von Eigenschaften wie Aufnahmenummer, Name oder Geburtsdatum, die Anzeige der zutreffenden Suchergebnisse und der Auswahl bzw. Bestätigung des richtigen Datensatzes durch den Anwender steht am Beginn der meisten klinischen Workflows.**Kompatibilität**: Für das Profil ISIKPatient wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKPatient valide sind, auch valide sind gegen:* [Profil KBV_PR_Base_Patient der KBV Basisprofile](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Patient)
* [Profil Patient im International Patient Summary (IPS)](https://hl7.org/fhir/uv/ips/StructureDefinition-Patient-uv-ips.html)
* [Profil Patient der MI-Initiative](https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient)
Gegen folgende Profile ist das Profil ISiKPatient unmittelbar kompatibel:* [Profil TIPatient der gematik](https://gematik.de/fhir/ti/StructureDefinition/ti-patient)
Es ist zu beachten, dass das Profil ISiKPatient NICHT unmittelbar kompatibel mit folgenden Profilen ist:* [Profil EPAPatient der gematik](https://gematik.de/fhir/epa/StructureDefinition/epa-patient): In ISiK ist die Angabe einer KVNR nicht verpflichtend, da in vielen Use Cases bereits eine PID ausreichend ist. Außerdem ist in ISiK keine verpflichtende Versionierung über meta.versionId vorgesehen.
 |
| [ ISiKPersonImGesundheitsberuf (Practitioner) ](StructureDefinition-ISiKPersonImGesundheitsberuf.md) | Practitioner | Dieses Profil ermöglicht die Nutzung von in Gesundheitsberufen tätigen Personen in ISiK Szenarien. **Motivation**: Das Profil ISIKPersonImGesundheitsberuf bildet alle denkbaren medizinischen Leistungserbringer und Fachexperten ab. In den ISiK-FHIR-Profilen können PersonImGesundheitsberuf bspw. als Ausführende einer Prozedur auftreten, im Element `performer` der Procedure Ressource, oder als die Person, die eine Diagnose stellt, im Element `asserter` der Condition Ressource.In FHIR werden PersonImGesundheitsberuf mit der [`Practitioner`](https://hl7.org/fhir/R4/practitioner.html)-Ressource repräsentiert. Für das Profil ISIKPersonImGesundheitsberuf wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKPersonImGesundheitsberuf valide sind, auch valide sind gegen:* [Profil KBV_PR_Base_Practitioner der KBV Basisprofile](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Practitioner).
* [Profil HiGHmed_IC_Practitioner, MI Initiative - HiGHmed Use Case Infection Control der Medizininformatik Initiative ](https://simplifier.net/medizininformatikinitiative-highmed-ic/highmed-ic-practitioner)
Gegen folgende Profile ist das Profil ISiKPersonImGesundheitsberuf unmittelbar kompatibel:* [Profil TIPractitioner der gematik](https://gematik.de/fhir/ti/StructureDefinition/ti-practitioner)
Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. |
| [ ISiKRolleImKrankenhaus (PractitionerRole) ](StructureDefinition-ISiKRolleImKrankenhaus.md) | PractitionerRole | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Rolle eines Leistungserbringers im Rahmen des Bestätigungsverfahrens der gematik. Motivation Die Rolle von Leistungserbringern innerhalb einer Organisation (z.B. Fachabteilung, Praxis, Krankenhaus) ist eine wichtige Information in Bezug auf die Leistungen, die durch diese Person erbracht werden.In FHIR wird die Rolle eines Leistungserbringers mit der PractitionerRole-Ressource repräsentiert und wir ausgehend vom PractitionerRole Profil aus dem EHDS in ISiK aufgenommen.**HISTORIE:*** Dieses Profil wird vor dem Hintergrund von FHIR-Profilierungen im Kontext des EHDS in Stufe 6 initial eingebracht.
 |
| [ ISiKProzedur (Procedure) ](StructureDefinition-ISiKProzedur.md) | Procedure | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Behandlungen/Prozeduren eines Patienten im Rahmen des Bestätigungsverfahrens der gematik.**Motivation**Die Möglichkeit auf eine Übersicht der Prozeduren eines Patienten zuzugreifen, Patienten anhand durchgeführter oder geplanter Prozeduren zu suchen, oder zu prüfen, ob eine konkrete Prozedur bei einem Patienten durchgeführt wurde, sind wichtige Funktionen im klinischen Behandlungsablauf.In FHIR werden Prozeduren mit der Procedure-Ressource repräsentiert.Da die Prozeduren in klinischen Primärsystemen, in der Regel, in OPS-codierter Form vorliegen, fordert ISiK in erster Linie diese Form des Austausches. Falls eine Prozedur zwar dokumentiert aber noch nicht codiert wurde (z.B. wenn die Kodierung erst nach der Entlassung erfolgt), ist alternativ eine Repräsentation als Freitext-Prozedur möglich.**Kompatibilität**Für das Profil ISIKProzedur wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKProzedur valide sind, auch valide sind gegen:* [Profil Prozedur](https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure) der Medizininformatik Initiative
 Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden.
 |
| [ ISiKAngehoeriger (RelatedPerson) ](StructureDefinition-ISiKAngehoeriger.md) | RelatedPerson | Dieses Profil ermöglicht die Darstellung von Angehörigen in ISiK Szenarien.**Motivation**Der Angehörige wird vor allem im Zusammenhang mit Anwendungsszenarien verwendet, in denen das Versicherungsverhältnis eine Rolle spielt. Hier können Angehörige, bspw. der hauptversicherte Elternteil eines minderjährigen Kindes, in der Familienversicherung sein. In Selbstzahler-Szenarien können Angehörige die Zahler für eine im Krankenhaus erbrachte Leistung sein. In FHIR werden Angehörige von Patienten mit der RelatedPerson-Ressource repräsentiert.**Kompatibilität**Für das Profil ISiKAngehoeriger wurde bis zum Zeitpunkt der Veröffentlichung kein Abgleich der Kompatibilität zu anderen Profilen (der KBV und der Medizininformatik-Initiative) durchgeführt.Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. |
| [ ISiKValueSet (ValueSet) ](StructureDefinition-ISiKValueSet.md) | ValueSet | Dieses Profil beschreibt die maschinenlesbare Auswahl von Codes für die Kodierung spezifischer FHIR-Elemente in ISiK-Szenarien.**Motivation**ISiK erlaubt in diversen Kontexten die Erweiterung der Kodierung durch Krankenhaus- / System-interne Kodierungen. Mittels der Veröffentlichung von ValueSets können Auswahllisten für externe Clients bereitgestellt werden, sodass diese entsprechende Kodierungen ebenfalls anbieten können.**Kompatibilität**Für das Profil ISiKValueSet wurde bis zum Zeitpunkt der Veröffentlichung kein Abgleich der Kompatibilität zu anderen Profilen (der KBV und der Medizininformatik-Initiative) durchgeführt. Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. |

**Tabelle:**Ressourcen-Profile

#### Datentyp-Profile

| | | |
| :--- | :--- | :--- |
| [ ISiKASKCoding (CodingASK) ](StructureDefinition-ISiKASKCoding.md) | Coding | Data Type profile for ASK Codings in ISiK |
| [ ISiKATCCoding (CodingATC) ](StructureDefinition-ISiKATCCoding.md) | Coding | Data Type profile for ATC Codings in ISiK |
| [ ISiKCoding (Coding) ](StructureDefinition-ISiKCoding.md) | Coding | Data Type profile for Codings in ISiK |
| [ ISiKICD10GMCoding (CodingICD10GM) ](StructureDefinition-ISiKICD10GMCoding.md) | Coding | Data Type profile for ICD10-GM Codings in ISiK |
| [ ISiKLoincCoding (ISiKCoding) ](StructureDefinition-ISiKLoincCoding.md) | Coding | Data Type profile for LOINC Codings in ISiK |
| [ ISiKSnomedCTCoding (ISiKCoding) ](StructureDefinition-ISiKSnomedCTCoding.md) | Coding | Data Type profile for Snomed-CT Codings in ISiK |

**Tabelle:**Datentyp-Profile

#### Extensions

| | |
| :--- | :--- |
| [ ISiK CapabilityStatement Imports Expectation (Extension) ](StructureDefinition-ExtensionISiKCapabilityStatementImportsExpectation.md) | Defines the level of expectation associated with a given system capability. See the capabilitystatement-prohibited modifier extension to set expectations to **not** support a feature. |
| [ ExtensionISiKRehaEntlassung (Extension) ](StructureDefinition-ExtensionISiKRehaEntlassung.md) | Extension zur Dokumentation von Informationen nach §301 (4 und 4a) SGB V, entsprechend dem ärztliche Reha-Entlassungsbericht. Mit dieser Extension können spezifische Entlassungsinformationen im Kontext einer Rehabilitationsmaßnahme angegeben werden. Dies ist besonders relevant für Einrichtungen, die Leistungen im Bereich Rehabilitation erbringen, und unterstützt die strukturierte Kommunikation im Entlassmanagement. |
| [ Fallbezogene Abrechnungsrelevanz von Diagnosen und Prozeduren (Extension) ](StructureDefinition-ISiKExtensionAbrechnungsDiagnoseProzedurAmbulant.md) | Diese Extension erlaubt es, angelehnt an die Basisprofil Extension [Fallbezogene Abrechnungsrelevanz von Diagnosen und Prozeduren](http://fhir.de/StructureDefinition/ExtensionAbrechnungsDiagnoseProzedur), Diagnosen und Prozeduren als abrechnungsrelevant in einem Fallkontext anzugeben. Allerdings ohne die Verpflichtung, einen Use anzugeben. Dies ist im ambulanten Kontext nicht üblich. |

**Tabelle:**Extensions

#### Suchparameter

| | |
| :--- | :--- |
| [ DateStart ](SearchParameter-Encounter-date-start.md) | The actual start date of the Encounter (Backport from R5). The parameter cannot repeat or have multiple values. |
| [ EndDate ](SearchParameter-Encounter-end-date.md) | The actual end date of the Encounter (Backport from R5). The parameter cannot repeat or have multiple values. |
| [ form ](SearchParameter-Location-form.md) | Die Location-Ressource kann für ein breites Spektrum an UseCases verwendet werden. Im Kontext von ISiK ist speziell die Suche nach Stationen, Zimmern und Bettplätzen relevant, es ist jedoch nicht auszuschließen, dass Systeme die Location-Ressource auch für die Abbildung von Örtlichkeiten außerhalb des ISiK-Scopes verwenden, z.B. Gebäude, Standorte, Etagen, Lagerorte. Der Suchparameter `form` ist notwendig um die Suche auf relevante Locations eingrenzen zu können. Bei der Namensgebung des Suchparameters wurde bereits berücksichtigt, dass das durchsuchte Element `physicalType` in FHIR R6 zu `form` umbenannt wurde. Durch die Prä-Adoption der Namensänderung im Suchparameter soll vorausschauend die Migration auf FHIR R6 erleichtert werden und einen Breaking Change in der API verhindern. Zum Zeitpunkt der Publikation dieses Suchparameters ist für das Element `form` in R6 zwar bereits ein Suchparameter namens `characteristic` definiert. Hier scheint es sich jedoch um eine Verwechslung mit dem gleichnamigen Element zu handeln, weshalb auf die Prä-Adoption dieses Parameters verzichtet wurde. Ein entsprechender Change Request liegt vor: https://jira.hl7.org/browse/FHIR-57431 |

**Tabelle:**Suchparameter

### Terminologien

#### Value Sets

| | |
| :--- | :--- |
| [ ISiKValueSet ](StructureDefinition-ISiKValueSet.md) | Dieses Profil beschreibt die maschinenlesbare Auswahl von Codes für die Kodierung spezifischer FHIR-Elemente in ISiK-Szenarien. **Motivation** ISiK erlaubt in diversen Kontexten die Erweiterung der Kodierung durch Krankenhaus- / System-interne Kodierungen. Mittels der Veröffentlichung von ValueSets können Auswahllisten für externe Clients bereitgestellt werden, sodass diese entsprechende Kodierungen ebenfalls anbieten können. **Kompatibilität** Für das Profil ISiKValueSet wurde bis zum Zeitpunkt der Veröffentlichung kein Abgleich der Kompatibilität zu anderen Profilen (der KBV und der Medizininformatik-Initiative) durchgeführt. Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. |
| [ DiagnosesSCT ](ValueSet-DiagnosesSCT.md) | Enthaelt alle SNOMED Clinical finding, Event und Situation with explicit context codes |
| [ ISiKBehandlungsergebnisRehaVS ](ValueSet-ISiKBehandlungsergebnisReha.md) | Behandlungsergebnis Reha gemäß §301(4 UND 4A) SGB V. Diagnosenbezogene Bewertung des Behandlungsergebnisses für einen Versicherten/Berechtigten bei Entlassung aus der Reha-Maßnahme bzw. Stellung eines Antrags auf Verlängerung. Vgl. Schlüsseltabelle 2.71 Diagnose - Behandlungsergebnis. |
| [ ISiKBesondereBehandlungsformRehaVS ](ValueSet-ISiKBesondereBehandlungsformReha.md) | Besondere Behandlungsform der Reha gemäß §301(4 UND 4A) SGB V. Vgl. Schlüsseltabelle 2.51 Besondere Behandlungsformen. |
| [ ISiKEncounterClassDE ](ValueSet-ISiKEncounterClassDE.md) | Erweitert das ValueSet EncounterClassDE der Deutschen Basisprofile um die Codes ACUTE, NONAC und OBSENC aus dem HL7 v3 ActCode System zur Harmonisierung mit dem HL7 Europe Hospital Discharge Report (HDR). Ein Issue zur Aufnahme dieser Codes in EncounterClassDE wurde bei den Deutschen Basisprofilen eingereicht. |
| [ ISiKEncounterTypeErweiterungVS ](ValueSet-ISiKEncounterTypeErweiterungVS.md) | ISiK vereint hierbei das ValueSet [KontaktArtDe](http://fhir.de/CodeSystem/kontaktart-de) aus dem deutschen Basisprofil und die übergangsweise hinzugefügten Codes für den ambulanten Kontakt im Krankenhaus. Dieses ValueSet ist als Übergangslösung zu verstehen, da die Inhalte beim TC Terminologien von HL7 eingebracht sind und sobald sie dort publiziert sind, wird eine Migration auf die dortigen Codes erfolgen. |
| [ ISiKEntlassformRehaVS ](ValueSet-ISiKEntlassformReha.md) | ISiK Entlassform Reha. Beschreibt Form und ggf. Weiterbehandlung der Entlassung eines Versicherten/Berechtigten aus verwaltungs- und medizinischer Sicht. Vgl. Schlüsseltabelle 2.107 Entlassungsform. |
| [ ISiKUnterbrechungRehaVS ](ValueSet-ISiKUnterbrechungReha.md) | ISiK Unterbrechung Reha. Dokumentiert die relevanten Gründe einer Unterbrechung einer Rehabilitationsmaßnahme im Einzelfall. Vgl. Schlüsseltabelle 2.111 Erläuterung zur Unterbrechung. |
| [ TestValueSet ](ValueSet-ISiKValueSetExample.md) | - |
| [ ProzedurenCodesSCT ](ValueSet-ProzedurenCodesSCT.md) | Enthaelt alle SNOMED Procedure Codes |
| [ ProzedurenKategorieSCT ](ValueSet-ProzedurenKategorieSCT.md) | Enthaelt alle SNOMED Codes für ein Mapping der OPS Klassentitel |
| [ Schwangerschaft Erwarteter Entbindungstermin Methode ](ValueSet-SchwangerschaftEtMethodeVS.md) | Dieses Valueset enthält die Codes zur Beschreibung der Methode zur Bestimmung des erwarteten Entbindungstermins bei einer Schwangerschaft. |
| [ Schwangerschaftsstatus Valueset ](ValueSet-SchwangerschaftsstatusVS.md) | Dieses Valueset enthält die Codes zur Beschreibung des Schwangerschaftsstatus einer Patientin. |
| [ Stillstatus LOINC Antwortoptionen ](ValueSet-StillstatusVS.md) | Dieses Valueset enthält die Codes zur Beschreibung von Stillstatus LOINC. |
| [ Current Smoking Status - IPS ](ValueSet-current-smoking-status-uv-ips.md) | HL7 LOINC value set for smoking status. Based on the HL7 Vocab and Structured Doc WG (formerly TC) consensus - per US CDC submission 7/12/2012 for smoking status terms. |

**Tabelle:**Value Sets

#### Code Systems

| | |
| :--- | :--- |
| [ TestKatalog ](CodeSystem-CodeSystemExample.md) | - |
| [ ISiKBehandlungsergebnisReha ](CodeSystem-ISiKBehandlungsergebnisRehaCS.md) | Behandlungsergebnis Reha gemäß §301(4 UND 4A) SGB V. Diagnosenbezogene Bewertung des Behandlungsergebnisses für einen Versicherten/Berechtigten bei Entlassung aus der Reha-Maßnahme bzw. Stellung eines Antrags auf Verlängerung. Vgl. Schlüsseltabelle 2.71 Diagnose - Behandlungsergebnis. |
| [ ISiKBesondereBehandlungsformReha ](CodeSystem-ISiKBesondereBehandlungsformRehaCS.md) | Besondere Behandlungsform der Reha gemäß §301(4 UND 4A) SGB V. Vgl. Schlüsseltabelle 2.51 Besondere Behandlungsformen. |
| [ Erweiterung von Encounter.type in ISiK ](CodeSystem-ISiKEncounterTypeErweiterungCS.md) | ISiK definiert an dieser Stelle eigene Encounter Typen. Dieses CodeSystem ist als Übergangslösung zu verstehen, da die Inhalte beim TC Terminologien von HL7 eingebracht sind und sobald sie dort publiziert sind, wird eine Migration auf die dortigen Codes erfolgen. |
| [ ISiKEntlassformReha ](CodeSystem-ISiKEntlassformRehaCS.md) | ISiK Entlassform Reha. Beschreibt Form und ggf. Weiterbehandlung der Entlassung eines Versicherten/Berechtigten aus verwaltungs- und medizinischer Sicht. Vgl. Schlüsseltabelle 2.107 Entlassungsform. |
| [ ISiKUnterbrechungReha ](CodeSystem-ISiKUnterbrechungRehaCS.md) | ISiK Unterbrechung Reha. Dokumentiert die relevanten Gründe einer Unterbrechung einer Rehabilitationsmaßnahme im Einzelfall. Vgl. Schlüsseltabelle 2.111 Erläuterung zur Unterbrechung. |
| [ ISiKCodeSystem ](StructureDefinition-ISiKCodeSystem.md) | Dieses Profil beschreibt die maschinenlesbare Repräsentation von system-spezifischen Kodierungen in ISiK-Szenarien. **Motivation** ISiK erlaubt in diversen Kontexten die Erweiterung der Kodierung durch Krankenhaus-/System-interne Kodierungen. Das Profil ISiKKatalog (CodeSystem) als Profil erlaubt die Repräsentation der dazugehörigen Codes und Display-Werte. Eine maschinenlesbare Repräsentation dieser Kodierungen erlaubt es Clients, dazugehörige Anzeigetext und Definitionen zu verarbeiten. Ein Codesystem eignet sich auch dazu, auf dessen Basis definierte ValueSets zu expandieren (https://hl7.org/fhir/R4/valueset-operation-expand.html). Da ISiKValueSet expandierte Valuesets vorsieht, ist eine dynamische Expansion in der Regel nicht erforderlich. Darüber hinausgehend ist ein Use Case im Kontext der Katalogabfrage folgender: Ein Client möchte eine Expansion neu generieren (z.B. mit anderen Expansionen-Parametern), um das ValueSet beispielsweise in einer anderen Sprache auszugeben. |

**Tabelle:**Code Systems

### Beispiele

**Account**

* [AbrechnungsfallAmbulantMvzImKrankenhaus](Account-AbrechnungsfallAmbulantMvzImKrankenhaus.md)
* [AbrechnungsfallDRG](Account-AbrechnungsfallDRG.md)
* [AbrechnungsfallGonarthrose](Account-AbrechnungsfallGonarthrose.md)
* [SZ1DRGFall](Account-SZ1DRGFall.md)
* [SZ2DRGFall](Account-SZ2DRGFall.md)

**AllergyIntolerance**

* [ISiKAllergieUnvertraeglichkeitBeispiel1](AllergyIntolerance-ISiKAllergieUnvertraeglichkeitBeispiel1.md)

**Bundle**

* [BundleExampleIntensivstation](Bundle-BundleExampleIntensivstation.md)
* [ISiKBundle-Example](Bundle-ISiKBundle-Example.md)

**Composition**

* [CompositionExampleBlutdruck](Composition-CompositionExampleBlutdruck.md)

**Condition**

* [AkuteInfektionDerOberenAtemwege](Condition-AkuteInfektionDerOberenAtemwege.md)
* [AltersbedingteKreislaufstoerung](Condition-AltersbedingteKreislaufstoerung.md)
* [BehandlungsDiagnoseFreitext](Condition-BehandlungsDiagnoseFreitext.md)
* [Example-condition-ausrufezeichen-primaer](Condition-Example-condition-ausrufezeichen-primaer.md)
* [Example-condition-ausrufezeichen-sekundaer](Condition-Example-condition-ausrufezeichen-sekundaer.md)
* [Example-condition-kreuz-stern-primaer](Condition-Example-condition-kreuz-stern-primaer.md)
* [Example-condition-kreuz-stern-sekundaer](Condition-Example-condition-kreuz-stern-sekundaer.md)
* [PrimaereGonarthroseMinimal](Condition-PrimaereGonarthroseMinimal.md)
* [PrimaereGonarthroseNormal](Condition-PrimaereGonarthroseNormal.md)
* [SZ2Primaerdiagnose](Condition-SZ2Primaerdiagnose.md)
* [SZ2Sekundaerdiagnose](Condition-SZ2Sekundaerdiagnose.md)

**Coverage**

* [CoverageGesetzlich](Coverage-CoverageGesetzlich.md)
* [CoveragePrivat](Coverage-CoveragePrivat.md)
* [CoverageSonstige](Coverage-CoverageSonstige.md)
* [SZ1VersicherungGesetzlich](Coverage-SZ1VersicherungGesetzlich.md)
* [SZ1VersicherungSelbstzahler](Coverage-SZ1VersicherungSelbstzahler.md)
* [SZ2VersicherungGesetzlich](Coverage-SZ2VersicherungGesetzlich.md)

**Device**

* [ISiKImplantatHerzschrittmacher](Device-ISiKImplantatHerzschrittmacher.md)
* [ISiKImplantatHueftprothese](Device-ISiKImplantatHueftprothese.md)

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

**Location**

* [BettenstellplatzStandortBeispiel](Location-BettenstellplatzStandortBeispiel.md)
* [KrankenhausStandortBeispiel](Location-KrankenhausStandortBeispiel.md)
* [RaumStandortBeispiel](Location-RaumStandortBeispiel.md)
* [StationICUStandortBeispiel](Location-StationICUStandortBeispiel.md)
* [StationPediaICUStandortBeispiel](Location-StationPediaICUStandortBeispiel.md)
* [StationStandortBeispiel](Location-StationStandortBeispiel.md)
* [isik-station-anaesthesie](Location-isik-station-anaesthesie.md)

**Observation**

* [ISiKAlkoholAbususBeispiel](Observation-ISiKAlkoholAbususBeispiel.md)
* [ISiKRaucherStatusBeispiel](Observation-ISiKRaucherStatusBeispiel.md)
* [ISiKSchwangerschaftErwarteterEntbindungsterminBeispiel](Observation-ISiKSchwangerschaftErwarteterEntbindungsterminBeispiel.md)
* [ISiKSchwangerschaftsstatusBeispiel](Observation-ISiKSchwangerschaftsstatusBeispiel.md)
* [ISiKStillstatusBeispiel](Observation-ISiKStillstatusBeispiel.md)

**Organization**

* [AbteilungAllgemeinchirurgieOrganisationBeispiel](Organization-AbteilungAllgemeinchirurgieOrganisationBeispiel.md)
* [KlinikIntensivAnaesthesieOrganisationBeispiel](Organization-KlinikIntensivAnaesthesieOrganisationBeispiel.md)
* [KlinikPaediatrieOrganisationBeispiel](Organization-KlinikPaediatrieOrganisationBeispiel.md)
* [KrankenhausOrganisationBeispiel](Organization-KrankenhausOrganisationBeispiel.md)

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

**Practitioner**

* [PractitionerWalterArzt](Practitioner-PractitionerWalterArzt.md)

**PractitionerRole**

* [RolleImKrankenhausAllgemeinchirurgieBeispiel](PractitionerRole-RolleImKrankenhausAllgemeinchirurgieBeispiel.md)
* [RolleImKrankenhausInnereMedizinBeispiel](PractitionerRole-RolleImKrankenhausInnereMedizinBeispiel.md)

**Procedure**

* [Appendektomie](Procedure-Appendektomie.md)

**RelatedPerson**

* [ISiKAngehoerigerMustermann](RelatedPerson-ISiKAngehoerigerMustermann.md)
* [SZ1Mutter](RelatedPerson-SZ1Mutter.md)

**Tabelle:**Beispiel-Instanzen

