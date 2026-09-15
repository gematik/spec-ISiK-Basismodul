# FHIR-Artefakte - AMTS ISiK Implementierungsleitfaden v6.0.0-rc

AMTS ISiK Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* **FHIR-Artefakte**

## FHIR-Artefakte

Auf dieser Seite befindet sich eine Liste der FHIR-Artefakte, welche im Rahmen dieses Implementation Guide definiert werden.

Es gelten zur Umsetzung der basalen Funktionalität und weiterer Use Cases in ISiK die Festlegungen zu CapabilityStatements [(Akteure und Rollen)](Erlaeuterung-Akteurs-und-Rollenmodell.md) sowie Datenstrukturen entsprechend der folgenden Abschnitte.

Softwareherstellern steht es frei, über die hier spezifizierten Profiltypen hinaus weitere FHIR-Profile zu nutzen, zu implementieren oder zu spezifizieren und über eine API bereitzustellen. Wir bitten in solchen Fällen jedoch um eine Meldung entsprechender Bedarfe über das [ISiK Anfrageportal](https://service.gematik.de/servicedesk/customer/portal/16), damit wir über mögliche Leerstellen der ISiK-Spezifikation in grundlegenden API-Funktionalitäten zur Abdeckung spezifischer Workflows informiert werden.

### CapabilityStatements

#### Akteure

Das CapabilityStatement mit der Kennzeichnung “Expanded” dient der direkten Übersicht aller zu implementierender Interaktionen und Profile.

| | |
| :--- | :--- |
| [ ISiK CapabilityStatement AMTS Akteur (Expanded) ](CapabilityStatement-ISiKCapabilityStatementAMTSAkteur-expanded.md) | Das vorliegende CapabilityStatement bündelt alle Rollen die ein ISiK-konformes System unterstützen muss, um das Bestätigungsverfahren des Moduls ‘Medikation’, Bereich ‘AMTS’ zu bestehen.**HISTORIE:*** 5.0.0 
* Hinzufügen von Interaktionen für die Prozedur für den AMTS-Bereich.
* Erzeugung des Akteurs-CapabilityStatement zur Bündelung der Rollen.
 
 |
| [ ISiK CapabilityStatement AMTS Akteur ](CapabilityStatement-ISiKCapabilityStatementAMTSAkteur.md) | Das vorliegende CapabilityStatement bündelt alle Rollen die ein ISiK-konformes System unterstützen muss, um das Bestätigungsverfahren des Moduls ‘Medikation’, Bereich ‘AMTS’ zu bestehen.**HISTORIE:*** 5.0.0 
* Hinzufügen von Interaktionen für die Prozedur für den AMTS-Bereich.
* Erzeugung des Akteurs-CapabilityStatement zur Bündelung der Rollen.
 
 |

**Tabelle:**Capability Statements - Akteure

#### Rollen

| | |
| :--- | :--- |
| [ ISiK CapabilityStatement AMTS Rolle ](CapabilityStatement-ISiKCapabilityStatementAMTSRolle.md) | Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein ISiK-konformes System unterstützen muss um das Bestätigungsverfahren des Moduls ‘Medikation’, Bereich ‘AMTS’ zu bestehen.**HISTORIE:*** `change` Die Verbindlichkeit des Suchparameters `subject` wurde von SHALL auf MAY reduziert, da der Suchparameter `patient` für ISiK-Zwecke ausreichend ist.
* `change` Die Verbindlichkeit von Include und RevInclude wurde von SHALL auf MAY reduziert, außer bei den Parameter `patient` und `encounter`, da diese für ISiK-Zwecke ausreichend sind.
 |
| [ CapabilityStatement für Rolle ISiKCapabilityStatementGesundheitsstatusRolle ](CapabilityStatement-ISiKCapabilityStatementGesundheitsstatusRolle.md) | CapabilityStatement für die Rolle ISiKCapabilityStatementGesundheitsstatusRolle. Diese Rolle beschreibt verpflichtende Interaktionen zum Abruf und der Verarbeitung von ISiKObservation-Ressourcen. |
| [ CapabilityStatement für Rolle ISiKCapabilityStatementKlinischeRolle ](CapabilityStatement-ISiKCapabilityStatementKlinischeRolle.md) | CapabilityStatement für die Rolle ISiKCapabilityStatementKlinischeRolle. Diese Rolle beschreibt verpflichtende Interaktionen zum Abruf und der Verarbeitung von ISiKProzeduren und ISiKDiagnosen. |
| [ ISiK CapabilityStatement Labor Minimal Rolle ](CapabilityStatement-ISiKCapabilityStatementLaborMinimalRolle.md) | Das vorliegende CapabilityStatement beschreibt Interaktionen für ein System, das Labordaten exponiert.**HISTORIE****Historie**: mit der Version 4.0.2 des IG ICU-Normalstation-Workflow wurde das vorliegende CapabilityStatement im Sinne einer eigenständigen Rolle extrahiert (die Funktionalität bleibt dabei unverändert). |
| [ CapabilityStatement für Rolle LeistungserbringerRolle ](CapabilityStatement-ISiKCapabilityStatementLeistungserbringerRolle.md) | CapabilityStatement für die Rolle ISiKCapabilityStatementLeistungserbringerRolle. Diese Rolle beschreibt verpflichtende Interaktionen zum Abruf und der Verarbeitung von ISiKPersonen im Gesundheitsberuf. |
| [ ISiK CapabilityStatement MedikamentRolle ](CapabilityStatement-ISiKCapabilityStatementMedikamentRolle.md) | Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen, die ein ISiK-konformes System unterstützen muss, um Abfragen zum Medikament zu ermöglichen.**HISTORIE:*** 5.0.0 
* `refactor`als eigene Rolle initiiert
 
 |
| [ ISiK CapabilityStatement Medikation Server - Medikationsinformation ](CapabilityStatement-ISiKCapabilityStatementMedikationInformationRolle.md) | Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein ISiK-konformes System unterstützen muss um das Bestätigungsverfahren des Moduls ‘Medikation’, Bereich ‘Medikationsinformation’ zu bestehen.**HISTORIE:*** `change` Die Verbindlichkeit des Suchparameters `subject` wurde von SHALL auf MAY reduziert, da der Suchparameter `patient` für ISiK-Zwecke ausreichend ist.
* `change` Die Verbindlichkeit von Include und RevInclude wurde von SHALL auf MAY reduziert, außer bei den Parameter `patient` und `encounter`, da diese für ISiK-Zwecke ausreichend sind.
 |
| [ ISiK CapabilityStatement Medikationsverabreichung Rolle ](CapabilityStatement-ISiKCapabilityStatementMedikationVerabreichungRolle.md) | Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein ISiK-konformes System unterstützen muss um das Bestätigungsverfahren des Moduls ‘Medikation’, Bereich ‘Medikationsverabreichung’ zu bestehen.**HISTORIE:*** `change` Die Verbindlichkeit des Suchparameters `subject` wurde von SHALL auf MAY reduziert, da der Suchparameter `patient` für ISiK-Zwecke ausreichend ist.
* `change` Die Verbindlichkeit von Include und RevInclude wurde von SHALL auf MAY reduziert, außer bei den Parameter `patient` und `encounter`, da diese für ISiK-Zwecke ausreichend sind.
 |
| [ ISiK CapabilityStatement Medikationsverordnung Rolle ](CapabilityStatement-ISiKCapabilityStatementMedikationVerordnungRolle.md) | Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein ISiK-konformes System unterstützen muss um das Bestätigungsverfahren des Moduls ‘Medikation’, Bereich ‘Medikationsverordnung’ zu bestehen.**HISTORIE:*** `change` Die Verbindlichkeit des Suchparameters `subject` wurde von SHALL auf MAY reduziert, da der Suchparameter `patient` für ISiK-Zwecke ausreichend ist.
* `change` Die Verbindlichkeit von Include und RevInclude wurde von SHALL auf MAY reduziert, außer bei den Parameter `patient` und `encounter`, da diese für ISiK-Zwecke ausreichend sind.
 |
| [ CapabilityStatement für Rolle StammdatenRolle ](CapabilityStatement-ISiKCapabilityStatementStammdatenRolle.md) | CapabilityStatement für die Rolle ISiKCapabilityStatementStammdatenRolle. Diese Rolle beschreibt Interaktionen zum Abruf und der Verarbeitung grundlegender Stammdaten. |

**Tabelle:**Capability Statements - Rollen

### Ressourcenprofile

| | |
| :--- | :--- |
| [ ISiK Accepted Risk ](StructureDefinition-ExtensionISiKAcceptedRisk.md) | Extension zur Dokumentation eines im Rahmen der AMTS bewusst eingegangenen Risikos. In diesem Freitext kann die Begründung und ggf. zu treffende besondere Maßnahmen dokumentiert werden. |
| [ ISiK Behandlungsziel ](StructureDefinition-ExtensionISiKBehandlungsziel.md) | Mit dieser Erweiterung kann das mit einer Medikation angestrebte Behandlungsziel ausführlich dokumentiert werden (z. B. Symptomkontrolle, Heilung, Prävention). Dies unterstützt die individuelle Therapieplanung, die Erfolgskontrolle und die Kommunikation zwischen verschiedenen Leistungserbringern. |
| [ ISiK CapabilityStatement Imports Expectation ](StructureDefinition-ExtensionISiKCapabilityStatementImportsExpectation.md) | Defines the level of expectation associated with a given system capability. See the capabilitystatement-prohibited modifier extension to set expectations to **not** support a feature. |
| [ ISiK MedicationRequestReplaces ](StructureDefinition-ExtensionISiKMedicationRequestReplaces.md) | Extension zur Verlinkung der Medikationsverordnung die ersetzt wurde |
| [ ISiK MedicationStatementReplaces ](StructureDefinition-ExtensionISiKMedicationStatementReplaces.md) | Mit dieser Erweiterung kann festgelegt werden, welche vorherige Medikation durch die aktuelle Verordnung ersetzt wird. Sie erleichtert die Nachverfolgung von Therapieänderungen, sorgt für Transparenz im Medikationsprozess. |
| [ ISiK Medikationsart ](StructureDefinition-ExtensionISiKMedikationsart.md) | Diese Erweiterung ermöglicht die genaue Angabe der Art der Medikation, beispielsweise ob es sich um eine Dauermedikation, Bedarfsmedikation oder eine situative Medikation handelt. Dies trägt zur besseren Strukturierung von Medikationsplänen und zur eindeutigen Kommunikation über die Medikation bei. |
| [ ExtensionISiKRehaEntlassung ](StructureDefinition-ExtensionISiKRehaEntlassung.md) | Extension zur Dokumentation von Informationen nach §301 (4 und 4a) SGB V, entsprechend dem ärztliche Reha-Entlassungsbericht. Mit dieser Extension können spezifische Entlassungsinformationen im Kontext einer Rehabilitationsmaßnahme angegeben werden. Dies ist besonders relevant für Einrichtungen, die Leistungen im Bereich Rehabilitation erbringen, und unterstützt die strukturierte Kommunikation im Entlassmanagement. |
| [ ISiK Selbstmedikation ](StructureDefinition-ExtensionISiKSelbstmedikation.md) | Mit dieser Erweiterung kann kenntlich gemacht werden, ob ein Arzneimittel als Selbstmedikation (d. h. ohne ärztliche Verordnung) eingenommen wird. Sie trägt zur vollständigen Erfassung der aktuellen Medikation und zur Erhöhung der Therapiesicherheit bei. |
| [ ISiK AMTS-Bewertung ](StructureDefinition-ISiKAMTSBewertung.md) | Dieses Profil ermöglicht die Abbildung von Informationen zur Risikobeurteilung im Rahmen der Arzneimitteltherapiesicherheit (AMTS). |
| [ ISiKASKCoding ](StructureDefinition-ISiKASKCoding.md) | Data Type profile for ASK Codings in ISiK |
| [ ISiKATCCoding ](StructureDefinition-ISiKATCCoding.md) | Data Type profile for ATC Codings in ISiK |
| [ ISiK Alkohol Abusus ](StructureDefinition-ISiKAlkoholAbusus.md) | Dieses Profil dient der Abbildung des schädlichen Gebrauchs von Alkohol. |
| [ ISiKAllergieUnvertraeglichkeit ](StructureDefinition-ISiKAllergieUnvertraeglichkeit.md) | Diese Profil ermöglicht die Dokumentation von Allergien und Unverträglichkeiten in ISiK Szenarien. MotivationDie Möglichkeit, auf eine Übersicht der Allergien und Unverträglichkeiten eines Patienten zuzugreifen, ist eine wichtige Funktion im klinischen Behandlungsablauf. Dies gilt insbesondere, aber nicht ausschließlich, im Bereich der Arzneimitteltherapiesicherheit. Motivierender Use-Case zur Einführung dieser Profile ist die [Arzneitmitteltherapiesicherheit im Krankenhaus - AMTS](https://simplifier.net/guide/isik-medikation-v4/ImplementationGuide-markdown-UebergreifendeUseCases-AMTS).In FHIR werden Allergien und Unverträglichkeiten mit der [AllergyIntolerance](https://hl7.org/fhir/R4/allergyintolerance.html)-Ressource repräsentiert.KompatibilitätFür das Profil ISiKAllergieUnvertraeglichkeit wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISiKAllergieUnvertraeglichkeit valide sind, auch valide sind gegen:* [das Profil KBV_PR_Base_AllergyIntolerance der KBV](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_AllergyIntolerance)
* [das Profil EMDAF_PR_AllergyIntolerance der GEVKO](https://fhir.gevko.de/StructureDefinition/EMDAF_PR_AllergyIntolerance)
* [das Profil AllergyIntolerance-uv-ips der International Patient Summary](http://hl7.org/fhir/uv/ips/StructureDefinition/AllergyIntolerance-uv-ips)
Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. |
| [ ISiKCoding ](StructureDefinition-ISiKCoding.md) | Data Type profile for Codings in ISiK |
| [ ISiKDiagnose ](StructureDefinition-ISiKDiagnose.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Diagnosen eines Patienten im Rahmen des Bestätigungsverfahrens der gematik. Motivation Die Möglichkeit, auf eine Übersicht der Diagnosen eines Patienten zuzugreifen, Patienten anhand ihrer Diagnose zu suchen oder zu prüfen, ob eine konkrete Diagnose bei einem Patienten vorliegt, sind wichtige Funktionen im klinischen Behandlungsablauf.In FHIR werden Diagnosen mit der Condition-Ressource repräsentiert.Da die Diagnosen in klinischen Primärsystemen in der Regel in ICD-10-codierter Form vorliegen, fordert ISiK in erster Linie diese Form des Austausches. Falls eine Diagnose zwar dokumentiert, aber noch nicht codiert wurde (z.B. wenn die Kodierung erst nach der Entlassung erfolgt), ist alternativ eine Repräsentation als Freitext-Diagnose möglich.Kompatibilität Für das Profil ISiKDiagnose wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISiKDiagnose valide sind, auch valide sind gegen:* das [Profil ProfileConditionDiagnose der Medizininformatik-Initative](https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose)
* das [Profil KBV_PR_Base_Condition_Diagnosis der KBV](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Condition_Diagnosis)]
 Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden.
 |
| [ ISiKICD10GMCoding ](StructureDefinition-ISiKICD10GMCoding.md) | Data Type profile for ICD10-GM Codings in ISiK |
| [ ISiKKoerpergewicht ](StructureDefinition-ISiKKoerpergewicht.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über das Körpergewicht eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK. Motivation Die Erfassung und Überwachung des Körpergewichts ist essenziell für die Beurteilung des Ernährungszustands, die Überwachung von Veränderungen im Rahmen der Therapie sowie die Unterstützung klinischer Entscheidungen in der Patientenversorgung.In FHIR wird das Körpergewicht mit der Observation-Ressource repräsentiert.Kompatibilität Das Profil ISiKKoerpergewicht ist vom Profil [VitalSignDE_Koerpergewicht](http://fhir.de/StructureDefinition/observation-de-vitalsign-koerpergewicht) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Body Weight Profile](http://hl7.org/fhir/StructureDefinition/bodyweight) aus der FHIR R4 Spezifikation. |
| [ ISiKKoerpergroesse ](StructureDefinition-ISiKKoerpergroesse.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Körpergröße eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK. Motivation Die Erfassung und Überwachung der Körpergröße ist essenziell für die Beurteilung von Wachstumsprozessen, die Berechnung wichtiger Indizes wie des Body-Mass-Index (BMI) sowie die Unterstützung klinischer Entscheidungen in der Patientenversorgung.In FHIR wird die Körpergröße mit der Observation-Ressource repräsentiert.Kompatibilität Das Profil ISiKKoerpergroesse ist vom Profil [VitalSignDE_Koerpergroesse](http://fhir.de/StructureDefinition/observation-de-vitalsign-koerpergroesse) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Body Height Profile](http://hl7.org/fhir/StructureDefinition/bodyheight) aus der FHIR R4 Spezifikation. |
| [ ISiKKontaktGesundheitseinrichtung ](StructureDefinition-ISiKKontaktGesundheitseinrichtung.md) | Dieses Profil ermöglicht die Abbildung von Besuchen/Aufenthalten eines Patienten in einer Gesundheitseinrichtung. Motivation Informationen über die Besuche des Patienten entlang seines Behandlungspfades im Krankenhaus sind ein wichtiger Bestandteil des einrichtungsinternen Datenaustausches. Sie ermöglichen die Unterscheidung von stationären und ambulanten sowie aufgenommenen und entlassenen Patienten. Weiterhin ist aus den Besuchsinformationen der aktuelle Aufenthaltsort des Patienten (Fachabteilung, Station, Bettplatz) ermittelbar. Klinische Ressourcen werden in FHIR durch Verlinkung auf die Encounter-Ressource in einen Kontext zum Besuch gestellt. Dieser Kontext ist wichtig für die Steuerung von Zugriffsberechtigungen und Abrechnungsprozessen.Zu Beginn der meisten klinischen Workflows steht die Auswahl des Besuchskontextes. Dies geschieht bspw. durch das Suchen der Encounter-Ressource anhand von Eigenschaften wie Aufnahmenummer, Fallart oder Aufnahmedatum. Daraufhin werden die zutreffenden Suchergebnisse angezeigt und der gewünschte Besuch ausgewählt.In FHIR werden Besuche, Aufenthalte, aber auch virtuelle Kontakte mit der `Encounter`-Ressource repräsentiert.Weitere Hinweise zu den Abgrenzungen der Begrifflichkeiten Fall und Kontakt finden sie unter {{pagelink: Fall, text: Fall-Begriff in ISiK}}Kompatibilität Für das Profil ISiKKontaktGesundheitseinrichtung wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISiKKontaktGesundheitseinrichtung valide sind, auch valide sind gegen:* Profil [Kontakt mit einer Gesundheitseinrichtung der Medizininformatik-Initiative](https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung)
Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. |
| [ ISiKLaboruntersuchung ](StructureDefinition-ISiKLaboruntersuchung.md) | Dieses Profil ermöglicht die Abbildung von Informationen zur Laboruntersuchungen eines Patienten in ISiK Szenarien. Es dient primär als Vorlage, von der spezifische Laboruntersuchungs-Profile abgeleitet werden, kann aber grundsätzlich auch zur Repräsentation von nicht weiter ausspezifizierten Laboruntersuchungen genutzt werden.Viele medizinischen Entscheidungen benötigen Informationen zu den Laboruntersuchungen eines Patienten. Hierzu gehören z.B. aktuelle Nierenfunktionswerte, Leberwerte, Blutbildwerte oder Hormone aus Schilddrüse. Jede dieser Untersuchungen wird durch bestimmte [[https://loinc.org/ LOINC]] oder [[http://snomed.info/sct SNOMED CT]] Codes bezeichnet. Der angegebene Wert ist durch genaue Einheitenangaben in [[http://unitsofmeasure.org UCUM]] zu konkretitiseren. Motivierender Use-Case zur Einführung dieser Profile ist die [Arzneitmitteltherapiesicherheit im Krankenhaus - AMTS](https://simplifier.net/guide/isik-medikation-v4/ImplementationGuide-markdown-UseCases-AMTS?version=current).In FHIR werden Untersuchungen, bzw. Beobachtungen als [`Observation`](https://hl7.org/fhir/R4/observation.html)-Ressource repräsentiert. Zugehörige Codes und Einheiten sind den entsprechenden Valuessets zu entnehmen. |
| [ ISiKLaboruntersuchungCRP ](StructureDefinition-ISiKLaboruntersuchungCRP.md) | Dieses Profil ermöglicht die Abbildung der Laboruntersuchung CRP eines Patienten in ISiK Szenarien. |
| [ ISiKLaboruntersuchungGFR ](StructureDefinition-ISiKLaboruntersuchungGFR.md) | Dieses Profil ermöglicht die Abbildung der Laboruntersuchung GFR eines Patienten in ISiK Szenarien. |
| [ ISiKLaboruntersuchungHb ](StructureDefinition-ISiKLaboruntersuchungHb.md) | Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Hb eines Patienten in ISiK Szenarien. |
| [ ISiKLaboruntersuchungPCT ](StructureDefinition-ISiKLaboruntersuchungPCT.md) | Dieses Profil ermöglicht die Abbildung der Laboruntersuchung PCT eines Patienten in ISiK Szenarien. |
| [ ISiKLaboruntersuchungSerumkreatinin ](StructureDefinition-ISiKLaboruntersuchungSerumkreatinin.md) | Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Serumkreatinin eines Patienten in ISiK Szenarien. |
| [ ISiKLaboruntersuchungTSH ](StructureDefinition-ISiKLaboruntersuchungTSH.md) | Dieses Profil ermöglicht die Abbildung der Laboruntersuchung TSH eines Patienten in ISiK Szenarien. |
| [ ISiKLaboruntersuchungThrombozyten ](StructureDefinition-ISiKLaboruntersuchungThrombozyten.md) | Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Thrombozyten eines Patienten in ISiK Szenarien. |
| [ ISiKLaboruntersuchungTroponin ](StructureDefinition-ISiKLaboruntersuchungTroponin.md) | Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Troponin eines Patienten in ISiK Szenarien. |
| [ ISiKLebensZustand ](StructureDefinition-ISiKLebensZustand.md) | Basisprofil für ISiKLebensZustand ObservationMotivationViele medizinischen Entscheidungen benötigen Informationen zu den Lebensumständen eines Patienten. Hierzu gehören eine aktuelle Schwangerschaft, Raucherstatus sowie der Alkoholabususstatus. Motivierender Use-Case zur Einführung dieser Profile ist die [Arzneitmitteltherapiesicherheit im Krankenhaus - AMTS](https://simplifier.net/guide/isik-medikation-v4/ImplementationGuide-markdown-UebergreifendeUseCases-AMTS).In FHIR werden Untersuchungen, bzw. Beobachtungen als [`Observation`](https://hl7.org/fhir/R4/observation.html)-Ressource repräsentiert.Dieses Profil ist eine generische, ISiK-spezifische Observation für die Abbildung von Lebenszuständen. Die folgenden Profile vom Typ `Observation` sind spezifische Profile im oben genannten Sinn:* https://gematik.de/fhir/isik/StructureDefinition/ISiKSchwangerschaftsstatus
* https://gematik.de/fhir/isik/StructureDefinition/ISiKSchwangerschaftErwarteterEntbindungstermin
* https://gematik.de/fhir/isik/StructureDefinition/ISiKStillstatus
* https://gematik.de/fhir/isik/StructureDefinition/ISiKAlkoholAbusus
* https://gematik.de/fhir/isik/StructureDefinition/ISiKRaucherStatus
KompatibilitätFür Schwangerschaftsstatus & Erwarteter Geburtstermin wird eine Kompatibilität mit folgenden **IPS** Profilen angestrebt:* [IPS Resource Profile: Observation - Pregnancy: EDD](https://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Observation-pregnancy-edd-uv-ips.html).
* [IPS Resource Profile: Observation - Pregnancy: status](https://hl7.org/fhir/uv/ips/STU1.1/StructureDefinition-Observation-pregnancy-status-uv-ips.html)
Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. |
| [ ISiKLoincCoding ](StructureDefinition-ISiKLoincCoding.md) | Data Type profile for LOINC Codings in ISiK |
| [ ISiKMedikament ](StructureDefinition-ISiKMedikament.md) | Dieses Profil ermöglicht die Abbildung von patientenunabhängigen Informationen zu Medikamenten in ISiK Szenarien. |
| [ ISiKMedikationsInformation ](StructureDefinition-ISiKMedikationsInformation.md) | Dieses Profil ermöglicht die Abbildung von Informationen zur Medikation eines Patienten in ISiK Szenarien.Hinweis zur Auswahl des Profils: In Abgrenzung zu ISiKMedikationsVerabreichung (MedicationAdministration) wird mittels des vorliegenden Profils die Verabreichung eines Medikaments an einen Patienten mit einer lediglich Datums-genauen Angabe abgebildet (einschließlich Granularität Jahr, Monat oder Tag für .effectiveDateTime oder .effectivePeriod auf Datums-Ebene gemäß der [FHIR-Core Vorgabe](https://hl7.org/fhir/R4/datatypes.html#dateTime)). Zur sekunden-genauen Angabe der Verabreichung eines Medikaments (im Sinne einer medizinischen Verabreichungsdokumentation durch medizinisches Personal) an einen Patienten SOLL das Profil ISiKMedikationsVerabreichung (MedicationAdministration) verwendet werden. Siehe entsprechende Profilseite für weitere Begründung.**Hinweis zur Pausierung einer Medikation (Best-Practice):**Für die Abbildung der Pausierung einer Medikation wird empfohlen, **mehrere `MedicationStatement`-Ressourcen** zu verwenden, anstatt eine bestehende zu überschreiben. Dies bringt folgende Vorteile:* **Korrekte Statusabbildung:**
 Das `status`-Feld muss stets aktuell gepflegt werden, um den momentanen Zustand der Medikation systemweit sichtbar und durchsuchbar zu halten.
* **Effiziente Abfragen über REST API:**
 In Kombination mit `effective[x]` ermöglicht das `status`-Feld die gezielte Abfrage aller aktuell gültigen Medikationseinträge über die REST API.
 Wird stattdessen nur das `dosage`-Element verändert, ist keine zuverlässige Filterung möglich – alle `MedicationStatements` müssten abgerufen und manuell analysiert werden.
* **Erhalt von Verlaufsinformationen:**
 Wenn z. B. auch ein `statusReason` (z. B. „pausiert wegen Nebenwirkungen“) dokumentiert wird, ginge diese Information bei einem Update der bestehenden Ressource verloren, sobald die Medikation fortgesetzt wird.
 Durch neue `MedicationStatement`-Einträge bleibt die Verlaufshistorie erhalten.
 **(Dieser Anwendungsfall ist aktuell nicht gefordert, aber zukünftig denkbar.)**
 |
| [ ISiK Medikationsliste ](StructureDefinition-ISiKMedikationsListe.md) | Dieses Profil ermöglicht die Zusammenführung einzelner MedikationsInformationen eines Patienten in ISiK Szenarien.Die MedicationList verweist auf MedicationStatement-Ressourcen und bildet Medikationen ab, die aktuell eingenommen, im Krankenhaus verabreicht oder aus externen Quellen dokumentiert wurden - etwa durch Patientenangaben, Medikationspläne oder Entlassbriefe. Im Unterschied zum eMP der ePA ist die ISiK-MedikationsListe dynamisch generierbar und systemseitig aktualisierbar. Sie kann auch Informationen enthalten, die außerhalb des eigenen Hauses erfasst wurden – sofern diese dem System strukturiert vorliegen (z.B. durch eMP-Import). Ein Import aus dem eMP ist möglich, aber nicht verpflichtend. |
| [ ISiKMedikationsVerabreichung ](StructureDefinition-ISiKMedikationsVerabreichung.md) | Dieses Profil ermöglicht die Abbildung der Verabreichung von Medikamenten für einen Patienten in ISiK Szenarien. Hinweis zur Auswahl des Profils: In Abgrenzung zu ISiKMedikationsInformation (MedicationStatement) wird mittels des vorliegenden Profils die Verabreichung eines Medikaments an einen Patienten mit einer Zeitpunkt-genauen Angabe abgebildet (.effectiveDateTime oder .effectivePeriod auf Sekundenebene gemäß der [FHIR-Core Vorgabe](https://hl7.org/fhir/R4/datatypes.html#dateTime)). D.h. die lediglich Datums-genaue Angabe ist im vorliegenden Profil nicht erlaubt. Das Profil ISiKMedikationsInformation (MedicationStatement) kann ebenfalls für die Abbildung der Verabreichung von Medikamenten für einen Patienten verwendet werden, wenn keine Zeitpunkt-genauen Angaben zur Verabreichung vorliegen, sondern lediglich Datums-genaue Angaben (einschließlich Granularität Jahr, Monat oder Tag).Begründung zur Profil- und Nutzungsdifferenzierung: Handelt es sich bei Erfassung um eine medizinische Verabreichungsdokumentation, dann ist ein genauer Zeitstempel zwingend. Die medizinische Verabreichungsdokumentation muss durch medizinisches Personal erfolgen. Angaben von Patienten und Angehörigen sind grundsätzlich keine medizinische Verabreichungsdokumentation und daher als MedicationStament zu erfassen([‘report that such a sequence (or at least a part of it) did take place’](https://hl7.org/fhir/R4/medicationstatement.html)).**Hinweis zur Pausierung einer Medikation (Best-Practice):**Für die Abbildung der Pausierung einer Medikation wird empfohlen, **mehrere `MedicationAdministration`-Ressourcen** zu verwenden, anstatt eine bestehende zu überschreiben. Dies bringt folgende Vorteile:* **Korrekte Statusabbildung:**
 Das `status`-Feld muss stets aktuell gepflegt werden, um den momentanen Zustand der Medikation systemweit sichtbar und durchsuchbar zu halten.
* **Effiziente Abfragen über REST API:**
 In Kombination mit `effective[x]` ermöglicht das `status`-Feld die gezielte Abfrage aller aktuell gültigen Medikationseinträge über die REST API.
 Wird stattdessen nur das `dosage`-Element verändert, ist keine zuverlässige Filterung möglich – alle `MedicationAdministrations` müssten abgerufen und manuell analysiert werden.
* **Erhalt von Verlaufsinformationen:**
 Wenn z. B. auch ein `statusReason` (z. B. „pausiert wegen Nebenwirkungen“) dokumentiert wird, ginge diese Information bei einem Update der bestehenden Ressource verloren, sobald die Medikation fortgesetzt wird.
 Durch neue `MedicationAdministration`-Einträge bleibt die Verlaufshistorie erhalten.
 **(Dieser Anwendungsfall ist aktuell nicht gefordert, aber zukünftig denkbar.)**
 |
| [ ISiKMedikationsVerordnung ](StructureDefinition-ISiKMedikationsVerordnung.md) | Dieses Profil ermöglicht die Abbildung von Medikationsverordnungen eines Patienten in ISiK Szenarien. |
| [ ISiKPZNCoding ](StructureDefinition-ISiKPZNCoding.md) | Data Type profile for ATC Codings in ISiK |
| [ ISiKPatient ](StructureDefinition-ISiKPatient.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von administrativen Patientendaten im Rahmen des Bestätigungsverfahrens der gematik. **Motivation**: Der Austausch administrativer Patientendaten ist eine der grundlegenden Funktionalitäten beim Datenaustausch in der klinischen Versorgung. In FHIR werden sämtliche klinischen Ressourcen durch Verlinkung auf die Ressource ‘Patient’ in einen Patientenkontext gestellt. Die Herstellung des korrekten Patientenkontextes durch Suchen der Patientenressource anhand von Eigenschaften wie Aufnahmenummer, Name oder Geburtsdatum, die Anzeige der zutreffenden Suchergebnisse und der Auswahl bzw. Bestätigung des richtigen Datensatzes durch den Anwender steht am Beginn der meisten klinischen Workflows.**Kompatibilität**: Für das Profil ISIKPatient wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKPatient valide sind, auch valide sind gegen:* [Profil KBV_PR_Base_Patient der KBV Basisprofile](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Patient)
* [Profil Patient im International Patient Summary (IPS)](https://hl7.org/fhir/uv/ips/StructureDefinition-Patient-uv-ips.html)
* [Profil Patient der MI-Initiative](https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient)
Gegen folgende Profile ist das Profil ISiKPatient unmittelbar kompatibel:* [Profil TIPatient der gematik](https://gematik.de/fhir/ti/StructureDefinition/ti-patient)
Es ist zu beachten, dass das Profil ISiKPatient NICHT unmittelbar kompatibel mit folgenden Profilen ist:* [Profil EPAPatient der gematik](https://gematik.de/fhir/epa/StructureDefinition/epa-patient): In ISiK ist die Angabe einer KVNR nicht verpflichtend, da in vielen Use Cases bereits eine PID ausreichend ist. Außerdem ist in ISiK keine verpflichtende Versionierung über meta.versionId vorgesehen.
 |
| [ ISiKPersonImGesundheitsberuf ](StructureDefinition-ISiKPersonImGesundheitsberuf.md) | Dieses Profil ermöglicht die Nutzung von in Gesundheitsberufen tätigen Personen in ISiK Szenarien. **Motivation**: Das Profil ISIKPersonImGesundheitsberuf bildet alle denkbaren medizinischen Leistungserbringer und Fachexperten ab. In den ISiK-FHIR-Profilen können PersonImGesundheitsberuf bspw. als Ausführende einer Prozedur auftreten, im Element `performer` der Procedure Ressource, oder als die Person, die eine Diagnose stellt, im Element `asserter` der Condition Ressource.In FHIR werden PersonImGesundheitsberuf mit der [`Practitioner`](https://hl7.org/fhir/R4/practitioner.html)-Ressource repräsentiert. Für das Profil ISIKPersonImGesundheitsberuf wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKPatient valide sind, auch valide sind gegen:* [Profil KBV_PR_Base_Practitioner der KBV Basisprofile](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Practitioner).
* [Profil HiGHmed_IC_Practitioner, MI Initiative - HiGHmed Use Case Infection Control der Medizininformatik Initiative ](https://simplifier.net/medizininformatikinitiative-highmed-ic/highmed-ic-practitioner)
Gegen folgende Profile ist das Profil ISiKPersonImGesundheitsberuf unmittelbar kompatibel:* [Profil TIPractitioner der gematik](https://gematik.de/fhir/ti/StructureDefinition/ti-practitioner)
Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. |
| [ ISiKProzedur ](StructureDefinition-ISiKProzedur.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Behandlungen/Prozeduren eines Patienten im Rahmen des Bestätigungsverfahrens der gematik. Motivation Die Möglichkeit auf eine Übersicht der Prozeduren eines Patienten zuzugreifen, Patienten anhand durchgeführter oder geplanter Prozeduren zu suchen, oder zu prüfen, ob eine konkrete Prozedur bei einem Patienten durchgeführt wurde, sind wichtige Funktionen im klinischen Behandlungsablauf.In FHIR werden Prozeduren mit der Procedure-Ressource repräsentiert.Da die Prozeduren in klinischen Primärsystemen, in der Regel, in OPS-codierter Form vorliegen, fordert ISiK in erster Linie diese Form des Austausches. Falls eine Prozedur zwar dokumentiert aber noch nicht codiert wurde (z.B. wenn die Kodierung erst nach der Entlassung erfolgt), ist alternativ eine Repräsentation als Freitext-Prozedur möglich.Kompatibilität Für das Profil ISIKProzedur wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKProzedur valide sind, auch valide sind gegen:* [Profil Prozedur](https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure) der Medizininformatik Initiative
 Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden.
 |
| [ ISiK Raucherstatus ](StructureDefinition-ISiKRaucherStatus.md) | Dieses Profil dient der Abbildung des Raucherstatus von Patienten. |
| [ ISiK Schwangerschaft - Erwarteter Entbindungstermin ](StructureDefinition-ISiKSchwangerschaftErwarteterEntbindungstermin.md) | Dieses Profil dient der Abbildung des erwarteten Entbindungstermins bei einer Schwangerschaft. |
| [ ISiK Schwangerschaftsstatus ](StructureDefinition-ISiKSchwangerschaftsstatus.md) | Dieses Profil bildet den Schwangerschaftsstatus einer Patientin ab. |
| [ ISiKSnomedCTCoding ](StructureDefinition-ISiKSnomedCTCoding.md) | Data Type profile for Snomed-CT Codings in ISiK |
| [ ISiKStillstatus ](StructureDefinition-ISiKStillstatus.md) | Dieses Profil dient der Abbildung des Stillstatus, d.h ob gestillt/Muttermilch abgepumpt und gefüttert wird. |
| [ Medication Quantity ](StructureDefinition-MedicationQuantity.md) | Quantity Datentyp der die Nutzung von UCUM vorgibt. Bei dimensionslosen Einheiten wie ‘Tablette’ wird ein code von ‘1’ erwartet, ‘Tablette’ kann als String in Unit hinterlegt werden. |
| [ PlannedEndDate ](StructureDefinition-PlannedEndDate.md) | Diese Erweiterung dokumentiert das geplante Enddatum bzw. den geplanten Endzeitpunkt eines Encounters. Sie unterstützt die Vorausplanung von Aufenthalten oder Behandlungen, beispielsweise für die Ressourcenplanung, Terminverwaltung und für die Kommunikation mit nachfolgenden Einrichtungen. |
| [ PlannedStartDate ](StructureDefinition-PlannedStartDate.md) | Diese Extension dient der Erfassung des geplanten Startzeitpunkts (dateTime) eines Encounters, z. B. einer stationären Aufnahme, Operation oder eines Termins. Sie ermöglicht eine strukturierte Terminplanung, erleichtert die Koordination verschiedener Versorgungsprozesse und verbessert die Kommunikation zwischen Systemen und Leistungserbringern. |

**Tabelle:**Ressourcenprofile

### Terminologien

#### Value Sets

Die folgenden Value Sets sind für die Audit-Event-Service-Funktionalitäten festgelegt.

| | |
| :--- | :--- |
| [ DiagnosesSCT ](ValueSet-DiagnosesSCT.md) | Enthaelt alle SNOMED Clinical finding, Event und Situation with explicit context codes |
| [ ISiKBehandlungsergebnisRehaVS ](ValueSet-ISiKBehandlungsergebnisReha.md) | Behandlungsergebnis Reha gemäß §301(4 UND 4A) SGB V. Diagnosenbezogene Bewertung des Behandlungsergebnisses für einen Versicherten/Berechtigten bei Entlassung aus der Reha-Maßnahme bzw. Stellung eines Antrags auf Verlängerung. Vgl. Schlüsseltabelle 2.71 Diagnose - Behandlungsergebnis. |
| [ ISiKBesondereBehandlungsformRehaVS ](ValueSet-ISiKBesondereBehandlungsformReha.md) | Besondere Behandlungsform der Reha gemäß §301(4 UND 4A) SGB V. Vgl. Schlüsseltabelle 2.51 Besondere Behandlungsformen. |
| [ ISiKEntlassformRehaVS ](ValueSet-ISiKEntlassformReha.md) | ISiK Entlassform Reha. Beschreibt Form und ggf. Weiterbehandlung der Entlassung eines Versicherten/Berechtigten aus verwaltungs- und medizinischer Sicht. Vgl. Schlüsseltabelle 2.107 Entlassungsform. |
| [ ISiKLocationPhysicalType ](ValueSet-ISiKLocationPhysicalType.md) | Dieses Valueset beinhaltet die für ISiK Kodierbaren Standort-Typen |
| [ ISiKMedikationsartVS ](ValueSet-ISiKMedikationsartVS.md) | ISiK Therapiearten für Medikation |
| [ ISiKUnterbrechungRehaVS ](ValueSet-ISiKUnterbrechungReha.md) | ISiK Unterbrechung Reha. Dokumentiert die relevanten Gründe einer Unterbrechung einer Rehabilitationsmaßnahme im Einzelfall. Vgl. Schlüsseltabelle 2.111 Erläuterung zur Unterbrechung. |
| [ Medikationslisten-Modes ](ValueSet-MedikationsListeListModeVS.md) | Erlaubte ListModes der ISiK MedikationsListe |
| [ ObservationCodesCRP ](ValueSet-ObservationCodesCRP.md) | Enthält LOINC-Codes für die Observation CRP |
| [ ObservationCodesGFR ](ValueSet-ObservationCodesGFR.md) | Enthält LOINC-Codes für die Observation GFR |
| [ ObservationCodesHb ](ValueSet-ObservationCodesHb.md) | Enthält LOINC-Codes für die Observation Hb |
| [ ObservationCodesPCT ](ValueSet-ObservationCodesPCT.md) | Enthält LOINC-Codes für die Observation PCT |
| [ ObservationCodesSerumkreatinin ](ValueSet-ObservationCodesSerumkreatinin.md) | Enthält LOINC-Codes für die Observation Serumkreatinin |
| [ ObservationCodesTSH ](ValueSet-ObservationCodesTSH.md) | Enthält LOINC-Codes für die Observation TSH |
| [ ObservationCodesThrombozyten ](ValueSet-ObservationCodesThrombozyten.md) | Enthält LOINC-Codes für die Observation Thrombozyten |
| [ ObservationCodesTroponin ](ValueSet-ObservationCodesTroponin.md) | Enthält LOINC-Codes für die Observation Troponin |
| [ ObservationUnitsCRP ](ValueSet-ObservationUnitsCRP.md) | Enthält UCUM-Einheiten für die Observation CRP |
| [ ObservationUnitsGFR ](ValueSet-ObservationUnitsGFR.md) | Enthält UCUM-Einheiten für die Observation GFR |
| [ ObservationUnitsHb ](ValueSet-ObservationUnitsHb.md) | Enthält UCUM-Einheiten für die Observation Hb |
| [ ObservationUnitsPCT ](ValueSet-ObservationUnitsPCT.md) | Enthält UCUM-Einheiten für die Observation PCT |
| [ ObservationUnitsSerumkreatinin ](ValueSet-ObservationUnitsSerumkreatinin.md) | Enthält UCUM-Einheiten für die Observation Serumkreatinin |
| [ ObservationUnitsTSH ](ValueSet-ObservationUnitsTSH.md) | Enthält UCUM-Einheiten für die Observation TSH |
| [ ObservationUnitsThrombozyten ](ValueSet-ObservationUnitsThrombozyten.md) | Enthält UCUM-Einheiten für die Observation Thrombozyten |
| [ ObservationUnitsTroponin ](ValueSet-ObservationUnitsTroponin.md) | Enthält UCUM-Einheiten für die Observation Troponin |
| [ ProzedurenCodesSCT ](ValueSet-ProzedurenCodesSCT.md) | Enthaelt alle SNOMED Procedure Codes |
| [ ProzedurenKategorieSCT ](ValueSet-ProzedurenKategorieSCT.md) | Enthaelt alle SNOMED Codes für ein Mapping der OPS Klassentitel |
| [ Schwangerschaft Erwarteter Entbindungstermin Methode ](ValueSet-SchwangerschaftEtMethodeVS.md) | Dieses Valueset enthält die Codes zur Beschreibung der Methode zur Bestimmung des erwarteten Entbindungstermins bei einer Schwangerschaft. |
| [ Schwangerschaftsstatus Valueset ](ValueSet-SchwangerschaftsstatusVS.md) | Dieses Valueset enthält die Codes zur Beschreibung des Schwangerschaftsstatus einer Patientin. |
| [ SctRouteOfAdministration ](ValueSet-SctRouteOfAdministration.md) | Enthaelt alle SNOMED CT Administrationsarten |
| [ Stillstatus LOINC Antwortoptionen ](ValueSet-StillstatusVS.md) | Dieses Valueset enthält die Codes zur Beschreibung von Stillstatus LOINC. |
| [ Current Smoking Status - IPS ](ValueSet-current-smoking-status-uv-ips.md) | HL7 LOINC value set for smoking status. Based on the HL7 Vocab and Structured Doc WG (formerly TC) consensus - per US CDC submission 7/12/2012 for smoking status terms. |

**Tabelle:**Value Sets

#### Code Systems

| | |
| :--- | :--- |
| [ ISiKBehandlungsergebnisReha ](CodeSystem-ISiKBehandlungsergebnisRehaCS.md) | Behandlungsergebnis Reha gemäß §301(4 UND 4A) SGB V. Diagnosenbezogene Bewertung des Behandlungsergebnisses für einen Versicherten/Berechtigten bei Entlassung aus der Reha-Maßnahme bzw. Stellung eines Antrags auf Verlängerung. Vgl. Schlüsseltabelle 2.71 Diagnose - Behandlungsergebnis. |
| [ ISiKBesondereBehandlungsformReha ](CodeSystem-ISiKBesondereBehandlungsformRehaCS.md) | Besondere Behandlungsform der Reha gemäß §301(4 UND 4A) SGB V. Vgl. Schlüsseltabelle 2.51 Besondere Behandlungsformen. |
| [ ISiKEntlassformReha ](CodeSystem-ISiKEntlassformRehaCS.md) | ISiK Entlassform Reha. Beschreibt Form und ggf. Weiterbehandlung der Entlassung eines Versicherten/Berechtigten aus verwaltungs- und medizinischer Sicht. Vgl. Schlüsseltabelle 2.107 Entlassungsform. |
| [ ISiK Medikationsart ](CodeSystem-ISiKMedikationsartCS.md) | ISiK Therapiearten für Medikation |
| [ ISiKUnterbrechungReha ](CodeSystem-ISiKUnterbrechungRehaCS.md) | ISiK Unterbrechung Reha. Dokumentiert die relevanten Gründe einer Unterbrechung einer Rehabilitationsmaßnahme im Einzelfall. Vgl. Schlüsseltabelle 2.111 Erläuterung zur Unterbrechung. |

**Tabelle:**Code Systems

### Beispiele

**Tabelle:**Beispiel-Instanzen

