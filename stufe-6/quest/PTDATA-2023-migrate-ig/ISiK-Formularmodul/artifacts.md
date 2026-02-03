# FHIR-Artefakte - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* **FHIR-Artefakte**

## FHIR-Artefakte

Auf dieser Seite befindet sich eine Liste der FHIR-Artefakte, welche im Rahmen dieses Implementation Guide definiert werden.

### CapabilityStatements

#### Akteure

| | |
| :--- | :--- |
| [ Akteur "ISiKCapabilityStatementFormularDatenQuelleAkteur" (Expanded) ](CapabilityStatement-ISiKCapabilityStatementFormularDatenQuelleAkteur-expanded.md) | CapabilityStatement für den Akteur "ISiKCapabilityStatementFormularDatenQuelleAkteur". Dieser Akteur aggregiert die Rollen zur Abfrage von ausgefüllten Formularen, zur Datenbereitstellung für die Formularvorbelegung und zur Rückübermittlung von aus Formularen extrahierten Daten. Verpflichtend ist in diesem Kontext nur die Rolle "FormularDatenQuelleRolle" und "CompositionKonsumentenRolle", die weiteren Rollen sind optional, da sie ggf. auch von anderen Akteuren bereitgestellt werden können. |
| [ Akteur "ISiKCapabilityStatementFormularDatenQuelleAkteur" ](CapabilityStatement-ISiKCapabilityStatementFormularDatenQuelleAkteur.md) | CapabilityStatement für den Akteur "ISiKCapabilityStatementFormularDatenQuelleAkteur". Dieser Akteur aggregiert die Rollen zur Abfrage von ausgefüllten Formularen, zur Datenbereitstellung für die Formularvorbelegung und zur Rückübermittlung von aus Formularen extrahierten Daten. Verpflichtend ist in diesem Kontext nur die Rolle "FormularDatenQuelleRolle" und "CompositionKonsumentenRolle", die weiteren Rollen sind optional, da sie ggf. auch von anderen Akteuren bereitgestellt werden können. |
| [ Akteur "ISiKCapabilityStatementFormularDefinitionsVerwalterAkteur" (Expanded) ](CapabilityStatement-ISiKCapabilityStatementFormularDefinitionsVerwalterAkteur-expanded.md) | CapabilityStatement für den Akteur "ISiKCapabilityStatementFormularDefinitionsVerwalterAkteur". Dieser Akteur aggregiert die Rollen zur Abfrage von ausgefüllten Formularen, zur Datenbereitstellung für die Formularvorbelegung und zur Rückübermittlung von aus Formularen extrahierten Daten. Verpflichtend ist in diesem Kontext nur die Rolle "FormularDefinitionsVerwalterRolle" und "CompositionKonsumentenRolle", die weiteren Rollen sind optional, da sie ggf. auch von anderen Akteuren bereitgestellt werden können. |
| [ Akteur "ISiKCapabilityStatementFormularDefinitionsVerwalterAkteur" ](CapabilityStatement-ISiKCapabilityStatementFormularDefinitionsVerwalterAkteur.md) | CapabilityStatement für den Akteur "ISiKCapabilityStatementFormularDefinitionsVerwalterAkteur". Dieser Akteur aggregiert die Rollen zur Abfrage von ausgefüllten Formularen, zur Datenbereitstellung für die Formularvorbelegung und zur Rückübermittlung von aus Formularen extrahierten Daten. Verpflichtend ist in diesem Kontext nur die Rolle "FormularDefinitionsVerwalterRolle" und "CompositionKonsumentenRolle", die weiteren Rollen sind optional, da sie ggf. auch von anderen Akteuren bereitgestellt werden können. |

**Tabelle:**Capability Statements - Akteure

#### Rollen

| | |
| :--- | :--- |
| [ ISiK CapabilityStatement AMTS Rolle ](CapabilityStatement-ISiKCapabilityStatementAMTSRolle.md) | Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein ISiK-konformes System unterstützen muss um das Bestätigungsverfahren des Moduls ‘Medikation’, Bereich ‘AMTS’ zu bestehen.**HISTORIE:*** `change` Die Verbindlichkeit des Suchparameters `subject` wurde von SHALL auf MAY reduziert, da der Suchparameter `patient` für ISiK-Zwecke ausreichend ist.
* `change` Die Verbindlichkeit von Include und RevInclude wurde von SHALL auf MAY reduziert, außer bei den Parameter `patient` und `encounter`, da diese für ISiK-Zwecke ausreichend sind.
 |
| [ CapabilityStatement für Rolle ISiKCapabilityStatementCompositionKonsumentenRolle ](CapabilityStatement-ISiKCapabilityStatementCompositionKonsumentenRolle.md) | CapabilityStatement für die Rolle ISiKCapabilityStatementCompositionKonsumentenRolle. Diese Rolle beschreibt verpflichtende Interaktionen zum Abruf und der Verarbeitung von ISiKBerichtBundles. |
| [ CapabilityStatement für Rolle "FormularDatenQuelleRolle" ](CapabilityStatement-ISiKCapabilityStatementFormularDatenQuelleRolle.md) | CapabilityStatement für die Rolle "ISiKCapabilityStatementFormularDatenQuelleRolle". Diese Rolle stellt Interaktionen zur Abfrage von FormularenDaten bereit. Hierbei liegt der Fokus auf der Bereitstellung von ausgefüllten Formularen und nicht aus den Extrahierten Ressourcen. Diese sind in Rollen der anderen Module bereitgestellt. |
| [ CapabilityStatement für Rolle "FormularDefinitionsVerwalterRolle" ](CapabilityStatement-ISiKCapabilityStatementFormularDefinitionsVerwalterRolle.md) | CapabilityStatement für die Rolle "ISiKCapabilityStatementFormularDefinitionsVerwalterRolle". Diese Rolle stellt Interaktionen zur Abfrage von Formularen bereit. |
| [ CapabilityStatement für Rolle ISiKCapabilityStatementGesundheitsstatusRolle ](CapabilityStatement-ISiKCapabilityStatementGesundheitsstatusRolle.md) | CapabilityStatement für die Rolle ISiKCapabilityStatementGesundheitsstatusRolle. Diese Rolle beschreibt verpflichtende Interaktionen zum Abruf und der Verarbeitung von ISiKObservation-Ressourcen. |
| [ CapabilityStatement für Rolle ISiKCapabilityStatementKlinischeRolle ](CapabilityStatement-ISiKCapabilityStatementKlinischeRolle.md) | CapabilityStatement für die Rolle ISiKCapabilityStatementKlinischeRolle. Diese Rolle beschreibt verpflichtende Interaktionen zum Abruf und der Verarbeitung von ISiKProzeduren und ISiKDiagnosen. |
| [ ISiK CapabilityStatement Labor Minimal Rolle ](CapabilityStatement-ISiKCapabilityStatementLaborMinimalRolle.md) | Das vorliegende CapabilityStatement beschreibt Interaktionen für ein System, das Labordaten exponiert.**HISTORIE****Historie**: mit der Version 4.0.2 des IG ICU-Normalstation-Workflow wurde das vorliegende CapabilityStatement im Sinne einer eigenständigen Rolle extrahiert (die Funktionalität bleibt dabei unverändert). |
| [ CapabilityStatement für Rolle StammdatenRolle ](CapabilityStatement-ISiKCapabilityStatementStammdatenRolle.md) | CapabilityStatement für die Rolle ISiKCapabilityStatementStammdatenRolle. Diese Rolle beschreibt Interaktionen zum Abruf und der Verarbeitung grundlegender Stammdaten. |
| [ ISiK CapabilityStatement VitalSign ICU Source Extended ](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceExtendedRolle.md) | Das vorliegende CapabilityStatement beschreibt verpflichtende Interaktionen, die ein ISiK-konformes System oder eine Systemkomponente in der Rolle ‘VitalSign ICU Source Extended’ zur Unterstützung des ICU-Normalstation-Workflows implementieren muss.Die Interaktionen umfassen die Bereitstellung von Vitalparametern, die für die Behandlung von Intensivpatienten notwendig sind und sie z.B. typischerweise auf einer Intensivstation in einem PDMS erfasst werden.**HISTORIE:****Historie**: mit der Version 4.0.2 des IG ICU-Normalstation-Workflow wurde das vorliegende CapabilityStatement im Sinne einer eigenständigen Rolle extrahiert (die Funktionalität bleibt dabei unverändert).**Historie**: mit der Version 4.0.1 des IG ICU-Normalstation-Workflow wurde das vorliegende CapabilityStatement überarbeitet. |
| [ ISiK CapabilityStatement VitalSign ICU Source Minimal Rolle ](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceMinimalRolle.md) | Das vorliegende CapabilityStatement beschreibt verpflichtende Interaktionen, die ein ISiK-konformes System oder eine Systemkomponenten in der Rolle ‘VitalSign ICU Source Minimal’ zur Unterstützung des ICU-Normalstation-Workflows implementieren muss.Die Interaktionen umfassen die Bereitstellung von Vitalparametern, die für die Behandlung von Patienten notwendig sind und sie z.B. typischerweise auf einer Normalstation in einem KIS erfasst werden.**HISTORIE:****Historie**: mit der Version 4.0.2 des IG ICU-Normalstation-Workflow wurde das vorliegende CapabilityStatement im Sinne einer eigenständigen Rolle extrahiert (die Funktionalität bleibt dabei unverändert).**Historie**: mit der Version 4.0.1 des IG ICU-Normalstation-Workflow wurde das vorliegende CapabilityStatement überarbeitet.**Version 4.0.1*** `change` Die Verbindlichkeit des Suchparameters `subject` wurde von SHALL auf MAY reduziert, da der Suchparameter `patient` für ISiK-Zwecke ausreichend ist.
* `change` Die Verbindlichkeit von Include und RevInclude wurde von SHALL auf MAY reduziert, außer bei den Parameter `patient` und `encounter`, da diese für ISiK-Zwecke ausreichend sind.
 |
| [ ISiK CapabilityStatement VitalSign Standard Source Rolle ](CapabilityStatement-ISiKCapabilityStatementVitalSignStandardSourceRolle.md) | Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen, die ein ISiK-konformes System unterstützen muss um das Bestätigungsverfahren für das Modul Vitalparameter zu bestehen.**HISTORIE:****Historie**: mit der Version 4.0.2 des IG ICU-Normalstation-Workflow wurde das vorliegende CapabilityStatement im Sinne einer eigenständigen Rolle extrahiert (die Funktionalität bleibt dabei unverändert).**Version 4.0.1*** `change` Die Verbindlichkeit des Suchparameters `subject` wurde von SHALL auf MAY reduziert, da der Suchparameter `patient` für ISiK-Zwecke ausreichend ist.
* `change` Die Verbindlichkeit von Include und RevInclude wurde von SHALL auf MAY reduziert, außer bei den Parameter `patient` und `encounter`, da diese für ISiK-Zwecke ausreichend sind.
 |

**Tabelle:**Capability Statements - Rollen

### Ressourcenprofile

| | |
| :--- | :--- |
| [ ISiK CapabilityStatement Imports Expectation ](StructureDefinition-ExtensionISiKCapabilityStatementImportsExpectation.md) | Defines the level of expectation associated with a given system capability. See the capabilitystatement-prohibited modifier extension to set expectations to **not** support a feature. |
| [ ISiK AMTS-Bewertung ](StructureDefinition-ISiKAMTSBewertung.md) | Dieses Profil ermöglicht die Abbildung von Informationen zur Risikobeurteilung im Rahmen der Arzneimitteltherapiesicherheit (AMTS). |
| [ ISiK Alkohol Abusus ](StructureDefinition-ISiKAlkoholAbusus.md) | Dieses Profil dient der Abbildung des schädlichen Gebrauchs von Alkohol. |
| [ ISiKAllergieUnvertraeglichkeit ](StructureDefinition-ISiKAllergieUnvertraeglichkeit.md) | Diese Profil ermöglicht die Dokumentation von Allergien und Unverträglichkeiten in ISiK Szenarien. MotivationDie Möglichkeit, auf eine Übersicht der Allergien und Unverträglichkeiten eines Patienten zuzugreifen, ist eine wichtige Funktion im klinischen Behandlungsablauf. Dies gilt insbesondere, aber nicht ausschließlich, im Bereich der Arzneimitteltherapiesicherheit. Motivierender Use-Case zur Einführung dieser Profile ist die [Arzneitmitteltherapiesicherheit im Krankenhaus - AMTS](https://simplifier.net/guide/isik-medikation-v4/ImplementationGuide-markdown-UebergreifendeUseCases-AMTS).In FHIR werden Allergien und Unverträglichkeiten mit der [AllergyIntolerance](https://hl7.org/fhir/R4/allergyintolerance.html)-Ressource repräsentiert.KompatibilitätFür das Profil ISiKAllergieUnvertraeglichkeit wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISiKAllergieUnvertraeglichkeit valide sind, auch valide sind gegen:* [das Profil KBV_PR_Base_AllergyIntolerance der KBV](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_AllergyIntolerance)
* [das Profil EMDAF_PR_AllergyIntolerance der GEVKO](https://fhir.gevko.de/StructureDefinition/EMDAF_PR_AllergyIntolerance)
* [das Profil AllergyIntolerance-uv-ips der International Patient Summary](http://hl7.org/fhir/uv/ips/StructureDefinition/AllergyIntolerance-uv-ips)
Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. |
| [ ISiKAtemfrequenz ](StructureDefinition-ISiKAtemfrequenz.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Atemfrequenz eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus). Motivation Die Erfassung und Überwachung der Atemfrequenz ist essenziell für die frühzeitige Erkennung von Gesundheitsveränderungen, die Behandlungsbewertung und die Unterstützung klinischer Entscheidungen.In FHIR wird die Atemfrequenz mit der Observation-Ressource repräsentiert.Kompatibilität Das Profil ISiKAtemfrequenz ist vom Profil [VitalSignDE_Atemfrequenz](http://fhir.de/StructureDefinition/observation-de-vitalsign-atemfrequenz) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Respiratory Rate Profile](http://hl7.org/fhir/StructureDefinition/resprate) aus der FHIR R4 Spezifikation. |
| [ ISiKBerichtBundle ](StructureDefinition-ISiKBerichtBundle.md) | Das Document-Bundle dient dem Transport von Berichten zwischen Subsystemen im Krankenhaus. Das Bundle entspricht den Anforderungen an ein [FHIR Document Bundle](https://hl7.org/fhir/R4/documents.html) : Alle referenzierten Ressourcen müssen als Einträge im Bundle enthalten sein. Das Bundle unterstützt die Übermittlung einer menschenlesbaren Dokumentation (Narrative) und erlaubt zudem die Übernahme wichtiger Ressourcen (z. B. Diagnosen und Prozeduren), die einem Patienten und Fall (Patient, Encounter) zugeordnet sind. |
| [ ISiKBlutdruckSystemischArteriell ](StructureDefinition-ISiKBlutdruckSystemischArteriell.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über den Blutdruck eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus). Motivation Die Erfassung und Überwachung des Blutdrucks ist essenziell für die frühzeitige Erkennung von Gesundheitsveränderungen, die Behandlungsbewertung und die Unterstützung klinischer Entscheidungen.In FHIR wird der Blutdruck mit der Observation-Ressource repräsentiert, die einzelnen Komponenten des Blutdrucks werden als Component-Elemente abgebildet.Hinweis: In Fällen, in denen fachlich motiviert ausschließlich ein systolischer Blutdruck erhoben wird (z.B. in der Intensivmedizin), kann für den Slice zur Diastole (DiastolicBP) das Element .dataAbsentReason (mit dem Code ‘not-performed’) verwendet werden.Kompatibilität Das Profil ISiKBlutdruckSystemischArteriell ist vom Profil [VitalSignDE_Blutdruck](http://fhir.de/StructureDefinition/observation-de-vitalsign-blutdruck) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Blood Pressure Profile](http://hl7.org/fhir/StructureDefinition/bp) aus der FHIR R4 Spezifikation. |
| [ ISiKDiagnose ](StructureDefinition-ISiKDiagnose.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Diagnosen eines Patienten im Rahmen des Bestätigungsverfahrens der gematik. Motivation Die Möglichkeit, auf eine Übersicht der Diagnosen eines Patienten zuzugreifen, Patienten anhand ihrer Diagnose zu suchen oder zu prüfen, ob eine konkrete Diagnose bei einem Patienten vorliegt, sind wichtige Funktionen im klinischen Behandlungsablauf.In FHIR werden Diagnosen mit der Condition-Ressource repräsentiert.Da die Diagnosen in klinischen Primärsystemen in der Regel in ICD-10-codierter Form vorliegen, fordert ISiK in erster Linie diese Form des Austausches. Falls eine Diagnose zwar dokumentiert, aber noch nicht codiert wurde (z.B. wenn die Kodierung erst nach der Entlassung erfolgt), ist alternativ eine Repräsentation als Freitext-Diagnose möglich.Kompatibilität Für das Profil ISiKDiagnose wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISiKDiagnose valide sind, auch valide sind gegen:* das [Profil ProfileConditionDiagnose der Medizininformatik-Initative](https://www.medizininformatik-initiative.de/fhir/core/modul-diagnose/StructureDefinition/Diagnose)
* das [Profil KBV_PR_Base_Condition_Diagnosis der KBV](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Condition_Diagnosis)]
 Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden.
 |
| [ ISiKEKG ](StructureDefinition-ISiKEKG.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über kurze, relevante EKG-Ausschnitte eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus). Es wurde entwickelt, um spezifische klinische Fragestellungen zu unterstützen, bei denen prägnante und gezielte EKG-Daten im Vordergrund stehen. Für vollständige und längere EKG-Aufzeichnungen sind alternative Formate vorgesehen, die für umfangreiche Daten besser geeignet sind. Motivation Die Bereitstellung kurzer EKG-Ausschnitte ermöglicht eine präzise und effiziente Unterstützung bei der Diagnose akuter kardiologischer Fragestellungen, der Überwachung von Arrhythmien oder der Beurteilung bestimmter Ereignisse wie ST-Strecken-Veränderungen. Diese fokussierte Darstellung dient der Optimierung klinischer Entscheidungen und der schnellen Verarbeitung relevanter Daten.In FHIR wird das EKG durch die Observation-Ressource repräsentiert, wobei spezifische Anforderungen für die Darstellung und Kodierung der Daten in diesem Profil berücksichtigt werden.Kompatibilität Das Profil ISiKEKG ist vom Profil [EkgDE](http://fhir.de/StructureDefinition/observation-de-ekg) aus den deutschen Basisprofilen abgeleitet. |
| [ Ausgefülltes ISiK-Formular ](StructureDefinition-ISiKFormularDaten.md) | Im Profil `ISiKFormularDaten` sind Mindestanforderungen an ISiK kompatible, ausgefüllte Formulare definiert. Die verwendbaren Extensions sind nicht mit profiliert, sondern im IG unter Spezifikationen->Extensions beschrieben. |
| [ ISiKFormularDefinition ](StructureDefinition-ISiKFormularDefinition.md) | Im Profil `ISiKFormularDefinition` sind Mindestanforderungen an ISiK kompatible Formulare definiert. Die verwendbaren Extensions sind nicht mit profiliert, sondern im IG unter Spezifikationen->Extensions beschrieben. |
| [ ISiKGCS ](StructureDefinition-ISiKGCS.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über den Glasgow Coma Scale (GCS) Score eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus).Motivation Die Erfassung und Überwachung des Bewusstseinszustands anhand des GCS ist essenziell für die Beurteilung neurologischer Funktionen, die Überwachung von Patienten mit Schädel-Hirn-Trauma oder anderen neurologischen Erkrankungen sowie die Unterstützung klinischer Entscheidungen.In FHIR wird der GCS-Score mit der Observation-Ressource repräsentiert, wobei die einzelnen Komponenten der Skala - Augenöffnung, verbale Reaktion und motorische Reaktion - als Component-Elemente abgebildet werden. Kompatibilität Das Profil ISiKGCS ist vom Profil [ScoreDE_GCS](http://fhir.de/StructureDefinition/observation-de-score-gcs) aus den deutschen Basisprofilen abgeleitet. |
| [ ISiKHerzfrequenz ](StructureDefinition-ISiKHerzfrequenz.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Herzfrequenz eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus). Motivation Die Erfassung und Überwachung der Herzfrequenz ist essenziell für die frühzeitige Erkennung von Herz-Kreislauf-Problemen, die Beurteilung des Gesundheitszustands sowie die Unterstützung klinischer Entscheidungen in der Patientenversorgung.In FHIR wird die Herzfrequenz mit der Observation-Ressource repräsentiert.Kompatibilität Das Profil ISiKHerzfrequenz ist vom Profil [VitalSignDE_Herzfrequenz](http://fhir.de/StructureDefinition/observation-de-vitalsign-herzfrequenz) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Respiratory Rate Profile](http://hl7.org/fhir/StructureDefinition/heartrate) aus der FHIR R4 Spezifikation. |
| [ ISiKKoerpergewicht ](StructureDefinition-ISiKKoerpergewicht.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über das Körpergewicht eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus). Motivation Die Erfassung und Überwachung des Körpergewichts ist essenziell für die Beurteilung des Ernährungszustands, die Überwachung von Veränderungen im Rahmen der Therapie sowie die Unterstützung klinischer Entscheidungen in der Patientenversorgung.In FHIR wird das Körpergewicht mit der Observation-Ressource repräsentiert.Kompatibilität Das Profil ISiKKoerpergewicht ist vom Profil [VitalSignDE_Koerpergewicht](http://fhir.de/StructureDefinition/observation-de-vitalsign-koerpergewicht) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Body Weight Profile](http://hl7.org/fhir/StructureDefinition/bodyweight) aus der FHIR R4 Spezifikation. |
| [ ISiKKoerpergroesse ](StructureDefinition-ISiKKoerpergroesse.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Körpergröße eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus). Motivation Die Erfassung und Überwachung der Körpergröße ist essenziell für die Beurteilung von Wachstumsprozessen, die Berechnung wichtiger Indizes wie des Body-Mass-Index (BMI) sowie die Unterstützung klinischer Entscheidungen in der Patientenversorgung.In FHIR wird die Körpergröße mit der Observation-Ressource repräsentiert.Kompatibilität Das Profil ISiKKoerpergroesse ist vom Profil [VitalSignDE_Koerpergroesse](http://fhir.de/StructureDefinition/observation-de-vitalsign-koerpergroesse) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Body Height Profile](http://hl7.org/fhir/StructureDefinition/bodyheight) aus der FHIR R4 Spezifikation. |
| [ ISiKKoerperkerntemperatur ](StructureDefinition-ISiKKoerperkerntemperatur.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Körperkerntemperatur eines Patienten im Rahmen der interoperablen Kommunikation gemäß den ISiK Vorgaben. Dieses Profil repräsentiert sowohl direkte als auch indirekte Messungen der Körperkerntemperatur. Motivation Die Erfassung und Überwachung der Körpertemperatur ist essenziell für die frühzeitige Erkennung von Infektionen, die Beurteilung des Gesundheitszustands sowie die Unterstützung klinischer Entscheidungen in der Patientenversorgung. In FHIR wird die Körpertemperatur mit der Observation-Ressource repräsentiert.Kompatibilität Das Profil ISiKKoerperkerntemperatur ist vom Profil [VitalSignDE_Koerpertemperatur](http://fhir.de/StructureDefinition/observation-de-vitalsign-koerpertemperatur) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [OObservation Body Temperature Profile](http://hl7.org/fhir/StructureDefinition/bodytemp) aus der FHIR R4 Spezifikation. |
| [ ISiKKoerpertemperatur ](StructureDefinition-ISiKKoerpertemperatur.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Körpertemperatur eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus). Motivation Die Erfassung und Überwachung der Körpertemperatur ist essenziell für die frühzeitige Erkennung von Infektionen, die Beurteilung des Gesundheitszustands sowie die Unterstützung klinischer Entscheidungen in der Patientenversorgung.In FHIR wird die Körpertemperatur mit der Observation-Ressource repräsentiert.Kompatibilität Das Profil ISiKKoerpertemperatur ist vom Profil [VitalSignDE_Koerpertemperatur](http://fhir.de/StructureDefinition/observation-de-vitalsign-koerpertemperatur) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [OObservation Body Temperature Profile](http://hl7.org/fhir/StructureDefinition/bodytemp) aus der FHIR R4 Spezifikation. |
| [ ISiKKontaktGesundheitseinrichtung ](StructureDefinition-ISiKKontaktGesundheitseinrichtung.md) | Dieses Profil ermöglicht die Abbildung von Besuchen/Aufenthalten eines Patienten in einer Gesundheitseinrichtung. Motivation Informationen über die Besuche des Patienten entlang seines Behandlungspfades im Krankenhaus sind ein wichtiger Bestandteil des einrichtungsinternen Datenaustausches. Sie ermöglichen die Unterscheidung von stationären und ambulanten sowie aufgenommenen und entlassenen Patienten. Weiterhin ist aus den Besuchsinformationen der aktuelle Aufenthaltsort des Patienten (Fachabteilung, Station, Bettplatz) ermittelbar. Klinische Ressourcen werden in FHIR durch Verlinkung auf die Encounter-Ressource in einen Kontext zum Besuch gestellt. Dieser Kontext ist wichtig für die Steuerung von Zugriffsberechtigungen und Abrechnungsprozessen.Zu Beginn der meisten klinischen Workflows steht die Auswahl des Besuchskontextes. Dies geschieht bspw. durch das Suchen der Encounter-Ressource anhand von Eigenschaften wie Aufnahmenummer, Fallart oder Aufnahmedatum. Daraufhin werden die zutreffenden Suchergebnisse angezeigt und der gewünschte Besuch ausgewählt.In FHIR werden Besuche, Aufenthalte, aber auch virtuelle Kontakte mit der `Encounter`-Ressource repräsentiert.Weitere Hinweise zu den Abgrenzungen der Begrifflichkeiten Fall und Kontakt finden sie unter {{pagelink: Fall, text: Fall-Begriff in ISiK}}Kompatibilität Für das Profil ISiKKontaktGesundheitseinrichtung wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISiKKontaktGesundheitseinrichtung valide sind, auch valide sind gegen:* Profil [Kontakt mit einer Gesundheitseinrichtung der Medizininformatik-Initiative](https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung)
Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. |
| [ ISiKKopfumfang ](StructureDefinition-ISiKKopfumfang.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über den Kopfumfang eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus). Motivation Die Erfassung und Überwachung des Kopfumfangs ist essenziell für die Beurteilung von Wachstumsprozessen, insbesondere bei Säuglingen und Kleinkindern, sowie für die frühzeitige Erkennung von Entwicklungsauffälligkeiten oder neurologischen Erkrankungen.In FHIR wird der Kopfumfang mit der Observation-Ressource repräsentiert.Kompatibilität Das Profil ISiKKopfumfang ist vom Profil [VitalSignDE_Kopfumfang](http://fhir.de/StructureDefinition/observation-de-vitalsign-kopfumfang) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Head Circumference Profile](http://hl7.org/fhir/StructureDefinition/headcircum) aus der FHIR R4 Spezifikation. |
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
| [ ISiKPatient ](StructureDefinition-ISiKPatient.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von administrativen Patientendaten im Rahmen des Bestätigungsverfahrens der gematik. Motivation Der Austausch administrativer Patientendaten ist eine der grundlegenden Funktionalitäten beim Datenaustausch in der klinischen Versorgung. In FHIR werden sämtliche klinischen Ressourcen durch Verlinkung auf die Ressource ‘Patient’ in einen Patientenkontext gestellt. Die Herstellung des korrekten Patientenkontextes durch Suchen der Patientenressource anhand von Eigenschaften wie Aufnahmenummer, Name oder Geburtsdatum, die Anzeige der zutreffenden Suchergebnisse und der Auswahl bzw. Bestätigung des richtigen Datensatzes durch den Anwender steht am Beginn der meisten klinischen Workflows.Kompatibilität Für das Profil ISIKPatient wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKPatient valide sind, auch valide sind gegen:* [Profil KBV_PR_Base_Patient der KBV Basisprofile](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Patient)
* [Profil Patient im International Patient Summary (IPS)](https://hl7.org/fhir/uv/ips/StructureDefinition-Patient-uv-ips.html)
* [Profil Patient der MI-Initiative](https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient)
* [Profil TIPatient der gematik](https://gematik.de/fhir/ti/StructureDefinition/ti-patient)
Es ist zu beachten, dass das Profil ISiKPatient NICHT unmittelbar kompatibel mit folgenden Profilen ist:* [Profil EPAPatient der gematik](https://gematik.de/fhir/epa/StructureDefinition/epa-patient): In ISiK ist die Angabe einer KVNR nicht verpflichtend, da in vielen Use Cases bereits eine PID ausreichend ist. Außerdem ist in ISiK keine verpflichtende Versionierung über meta.versionId vorgesehen.
 |
| [ ISiKProzedur ](StructureDefinition-ISiKProzedur.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Behandlungen/Prozeduren eines Patienten im Rahmen des Bestätigungsverfahrens der gematik. Motivation Die Möglichkeit auf eine Übersicht der Prozeduren eines Patienten zuzugreifen, Patienten anhand durchgeführter oder geplanter Prozeduren zu suchen, oder zu prüfen, ob eine konkrete Prozedur bei einem Patienten durchgeführt wurde, sind wichtige Funktionen im klinischen Behandlungsablauf.In FHIR werden Prozeduren mit der Procedure-Ressource repräsentiert.Da die Prozeduren in klinischen Primärsystemen, in der Regel, in OPS-codierter Form vorliegen, fordert ISiK in erster Linie diese Form des Austausches. Falls eine Prozedur zwar dokumentiert aber noch nicht codiert wurde (z.B. wenn die Kodierung erst nach der Entlassung erfolgt), ist alternativ eine Repräsentation als Freitext-Prozedur möglich.Kompatibilität Für das Profil ISIKProzedur wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKProzedur valide sind, auch valide sind gegen:* [Profil Prozedur](https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure) der Medizininformatik Initiative
 Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden.
 |
| [ ISiK Raucherstatus ](StructureDefinition-ISiKRaucherStatus.md) | Dieses Profil dient der Abbildung des Raucherstatus von Patienten. |
| [ ISiKSauerstoffsaettigungArteriell ](StructureDefinition-ISiKSauerstoffsaettigungArteriell.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die arterielle Sauerstoffsättigung eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus). Motivation Die Erfassung und Überwachung der arteriellen Sauerstoffsättigung ist essenziell für die Beurteilung der respiratorischen Funktion, die Überwachung von Patienten mit Atemwegserkrankungen sowie die Unterstützung klinischer Entscheidungen, insbesondere in kritischen Versorgungssituationen.In FHIR wird die arterielle Sauerstoffsättigung mit der Observation-Ressource repräsentiert.Kompatibilität Das Profil ISiKSauerstoffsaettigungArteriell ist vom Profil [VitalSignDE_Arterielle_Sauerstoffsaettigung_Pulsoximetrie](http://fhir.de/StructureDefinition/observation-de-vitalsign-sauerstoffsaettigung-pulsoximetrie) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Oxygen Saturation Profile](http://hl7.org/fhir/StructureDefinition/oxygensat) aus der FHIR R4 Spezifikation. |
| [ ISiK Schwangerschaft - Erwarteter Entbindungstermin ](StructureDefinition-ISiKSchwangerschaftErwarteterEntbindungstermin.md) | Dieses Profil dient der Abbildung des erwarteten Entbindungstermins bei einer Schwangerschaft. |
| [ ISiK Schwangerschaftsstatus ](StructureDefinition-ISiKSchwangerschaftsstatus.md) | Dieses Profil bildet den Schwangerschaftsstatus einer Patientin ab. |
| [ ISiKStillstatus ](StructureDefinition-ISiKStillstatus.md) | Dieses Profil dient der Abbildung des Stillstatus, d.h ob gestillt/Muttermilch abgepumpt und gefüttert wird. |
| [ ISiKTerminPriorityExtension ](StructureDefinition-ISiKTerminPriorityExtension.md) | Diese Extension ermöglicht die strukturierte Angabe der Dringlichkeit (Priorität) eines Termins. Dies ist wichtig, um Notfälle oder besonders dringliche Termine im Buchungs- und Verwaltungssystem deutlich zu kennzeichnen und eine priorisierte Bearbeitung zu ermöglichen. |
| [ SD MII ICU Herzzeitvolumen ](StructureDefinition-sd-mii-icu-herzzeitvolumen.md) | Dieses Profil dient der spezialisierten Abbildung des Herzzeitvolumens in der Akutmedizin. |
| [ SD MII ICU Ideales Koerpergewicht ](StructureDefinition-sd-mii-icu-ideales-koerpergewicht.md) | Dieses Profil dient der spezialisierten Abbildung des idealen Körpergewichts in der Akutmedizin. |
| [ SD MII ICU Intrakranieller Druck ICP ](StructureDefinition-sd-mii-icu-intrakranieller-druck-icp.md) | Dieses Profil dient der spezialisierten Abbildung des intrakraniellen Drucks (ICP) in der Akutmedizin. |
| [ SD MII ICU Koerpergewicht Percentil Altersabhaengig ](StructureDefinition-sd-mii-icu-koerpergewicht-percentil-altersabhaengig.md) | Dieses Profil dient der spezialisierten Abbildung des altersabhängigen Körpergewicht-Perzentils in der Akutmedizin. |
| [ SD MII ICU Koerpergroesse Percentil ](StructureDefinition-sd-mii-icu-koerpergroesse-percentil-altersabhaengig.md) | Dieses Profil dient der spezialisierten Abbildung des altersabhängigen Körpergrößen-Perzentils in der Akutmedizin. |
| [ SD MII ICU Koerpertemperatur Achsel ](StructureDefinition-sd-mii-icu-koerpertemperatur-achsel.md) | Dieses Profil bietet eine spezialisierte Abbildung der geschätzten KörperKERNtemperatur gemessen in der Achsel in der Akutmedizin. |
| [ SD MII ICU Koerpertemperatur Atemwege ](StructureDefinition-sd-mii-icu-koerpertemperatur-atemwege.md) | Dieses Profil dient der spezialisierten Abbildung der Körpertemperaturmessung in den Atemwegen in der Akutmedizin. Es dient nicht der Abbildung der KörperKERNtemperatur (siehe dafür Profile zu Körperkerntemperatur im generischen Modul Vitalparameter bzw. abgeleitete Profile im ICU-Bereich). |
| [ SD MII ICU Koerpertemperatur Blut ](StructureDefinition-sd-mii-icu-koerpertemperatur-blut.md) | Dieses Profil bietet eine spezialisierte Abbildung der geschätzten Körperkerntemperatur gemessen im Blut in der Akutmedizin. |
| [ SD MII ICU Koerpertemperatur Brust ](StructureDefinition-sd-mii-icu-koerpertemperatur-brust.md) | Dieses Profil dient der spezialisierten Abbildung der Körpertemperaturmessung an der Brust in der Akutmedizin. Es dient nicht der Abbildung der KörperKERNtemperatur (siehe dafür Profile zu Körperkerntemperatur im generischen Modul Vitalparameter bzw. abgeleitete Profile im ICU-Bereich). |
| [ SD MII ICU Koerpertemperatur Brustwirbelsaeule ](StructureDefinition-sd-mii-icu-koerpertemperatur-brustwirbelsaeule.md) | Dieses Profil dient der spezialisierten Abbildung der Körpertemperaturmessung an der Brustwirbelsäule in der Akutmedizin. Es dient nicht der Abbildung der KörperKERNtemperatur (siehe dafür Profile zu Körperkerntemperatur im generischen Modul Vitalparameter bzw. abgeleitete Profile im ICU-Bereich). |
| [ SD MII ICU Koerpertemperatur Gelenk ](StructureDefinition-sd-mii-icu-koerpertemperatur-gelenk.md) | Dieses Profil dient der spezialisierten Abbildung der Körpertemperaturmessung am Gelenk in der Akutmedizin. Es dient nicht der Abbildung der KörperKERNtemperatur (siehe dafür Profile zu Körperkerntemperatur im generischen Modul Vitalparameter bzw. abgeleitete Profile im ICU-Bereich). |
| [ SD MII ICU Koerpertemperatur Generisch ](StructureDefinition-sd-mii-icu-koerpertemperatur-generisch.md) | Dieses Profil bietet eine abstrahierte Schicht zur Körpertemperaturmessung in der Akutmedizin. Es ist generisch im Sinne der Profil-Abstraktion, allerdings explizit nicht im Sinne einer KörperKERNtemperatur zu verwenden (siehe dafür Profile zu Körperkerntemperatur im generischen Modul Vitalparameter). |
| [ SD MII ICU Koerpertemperatur Halswirbelsaeule ](StructureDefinition-sd-mii-icu-koerpertemperatur-halswirbelsaeule.md) | Dieses Profil dient der spezialisierten Abbildung der Körpertemperaturmessung an der Halswirbelsäule in der Akutmedizin. Es dient nicht der Abbildung der KörperKERNtemperatur (siehe dafür Profile zu Körperkerntemperatur im generischen Modul Vitalparameter bzw. abgeleitete Profile im ICU-Bereich). |
| [ SD MII ICU Koerpertemperatur Harnblase ](StructureDefinition-sd-mii-icu-koerpertemperatur-harnblase.md) | Dieses Profil bietet eine spezialisierte Abbildung der geschätzten Körperkerntemperatur gemessen in der Harnblase in der Akutmedizin. |
| [ SD MII ICU Koerpertemperatur Kern ](StructureDefinition-sd-mii-icu-koerpertemperatur-kern.md) | Dieses Profil bietet eine generische Abbildung der geschätzten KörperKERNtemperatur in der Akutmedizin. |
| [ SD MII ICU Koerpertemperatur Leiste ](StructureDefinition-sd-mii-icu-koerpertemperatur-leiste.md) | Dieses Profil bietet eine spezialisierte Abbildung der geschätzten KörperKERNtemperatur gemessen in der Leiste in der Akutmedizin. |
| [ SD MII ICU Koerpertemperatur Lendenwirbelsaeule ](StructureDefinition-sd-mii-icu-koerpertemperatur-lendenwirbelsaeule.md) | Dieses Profil dient der spezialisierten Abbildung der Körpertemperaturmessung im Bereich der Lendenwirbelsäule. Es dient nicht der Abbildung der KörperKERNtemperatur (siehe dafür Profile zu Körperkerntemperatur im generischen Modul Vitalparameter bzw. abgeleitete Profile im ICU-Bereich). |
| [ SD MII ICU Koerpertemperatur Myokard ](StructureDefinition-sd-mii-icu-koerpertemperatur-myokard.md) | Dieses Profil dient der spezialisierten Abbildung der Körpertemperaturmessung im Myokard (Herzmuskel). Es dient nicht der Abbildung der KörperKERNtemperatur (siehe dafür Profile zu Körperkerntemperatur im generischen Modul Vitalparameter bzw. abgeleitete Profile im ICU-Bereich). |
| [ SD MII ICU Koerpertemperatur nasal ](StructureDefinition-sd-mii-icu-koerpertemperatur-nasal.md) | Dieses Profil dient der spezialisierten Abbildung der Körpertemperaturmessung im Nasenbereich in der Akutmedizin. Es dient nicht der Abbildung der KörperKERNtemperatur (siehe dafür Profile zu Körperkerntemperatur im generischen Modul Vitalparameter bzw. abgeleitete Profile im ICU-Bereich). |
| [ SD MII ICU Koerpertemperatur Nasen-Rachen-Raum ](StructureDefinition-sd-mii-icu-koerpertemperatur-nasen-rachen-raum.md) | Dieses Profil dient der spezialisierten Abbildung der Körpertemperaturmessung im Nasen-Rachen-Raum in der Akutmedizin. Es dient nicht der Abbildung der KörperKERNtemperatur (siehe dafür Profile zu Körperkerntemperatur im generischen Modul Vitalparameter bzw. abgeleitete Profile im ICU-Bereich). |
| [ SD MII ICU Koerpertemperatur rektal ](StructureDefinition-sd-mii-icu-koerpertemperatur-rektal.md) | Dieses Profil bietet eine spezialisierte Abbildung der geschätzten KörperKERNtemperatur gemessen rektal in der Akutmedizin. |
| [ SD MII ICU Koerpertemperatur Speiseroehre ](StructureDefinition-sd-mii-icu-koerpertemperatur-speiseroehre.md) | Dieses Profil bietet eine spezialisierte Abbildung der geschätzten KörperKERNtemperatur gemessen in der Speiseröhre in der Akutmedizin. |
| [ SD MII ICU Koerpertemperatur Stirn ](StructureDefinition-sd-mii-icu-koerpertemperatur-stirn.md) | Dieses Profil dient der spezialisierten Abbildung der Körpertemperaturmessung an der Stirn in der Akutmedizin. Es dient nicht der Abbildung der KörperKERNtemperatur (siehe dafür Profile zu Körperkerntemperatur im generischen Modul Vitalparameter bzw. abgeleitete Profile im ICU-Bereich). |
| [ SD MII ICU Koerpertemperatur Trommelfell ](StructureDefinition-sd-mii-icu-koerpertemperatur-trommelfell.md) | Dieses Profil bietet eine spezialisierte Abbildung der geschätzten KörperKERNtemperatur gemessen im Trommelfell in der Akutmedizin. |
| [ SD MII ICU Koerpertemperatur unter der Zunge ](StructureDefinition-sd-mii-icu-koerpertemperatur-unter-der-zunge.md) | Dieses Profil bietet eine spezialisierte Abbildung der geschätzten KörperKERNtemperatur gemessen unter der Zunge in der Akutmedizin. |
| [ SD MII ICU Koerpertemperatur vaginal ](StructureDefinition-sd-mii-icu-koerpertemperatur-vaginal.md) | Dieses Profil bietet eine spezialisierte Abbildung der geschätzten KörperKERNtemperatur gemessen vaginal in der Akutmedizin. |
| [ SD MII ICU Linksatrialer Druck ](StructureDefinition-sd-mii-icu-linksatrialer-druck.md) | Dieses Profil dient der spezialisierten Abbildung des linksatrialen Drucks in der Akutmedizin. |
| [ SD MII ICU Linksventrikulaerer Herzindex durch Indikatorverduennung ](StructureDefinition-sd-mii-icu-linksventri-herzindex-durch-indikatorverduennung.md) | Dieses Profil dient der spezialisierten Abbildung des linksventrikulären Herzindex durch Indikatorverdünnung in der Akutmedizin. |
| [ SD MII ICU Linksventrikulaeres Herzzeitvolumen Durch Indikatorverduennung ](StructureDefinition-sd-mii-icu-linksventri-herzzeitvolumen-durch-indikatorverd.md) | Dieses Profil dient der spezialisierten Abbildung des linksventrikulären Herzzeitvolumens durch Indikatorverdünnung in der Akutmedizin. |
| [ SD MII ICU Linksventrikulaeres Schlagvolumen Durch Indikatorverduennung ](StructureDefinition-sd-mii-icu-linksventri-schlagvolumen-durch-indikatorverduennung.md) | Dieses Profil dient der spezialisierten Abbildung des linksventrikulären Schlagvolumens durch Indikatorverdünnung in der Akutmedizin. |
| [ SD MII ICU Linksventrikulaerer Schlagvolumenindex Durch Indikatorverduennung ](StructureDefinition-sd-mii-icu-linksventri-schlagvolumenindex-durch-indikatorverd.md) | Dieses Profil dient der spezialisierten Abbildung des linksventrikulären Schlagvolumenindex durch Indikatorverdünnung in der Akutmedizin. |
| [ SD MII ICU Linksventrikulaerer Druck ](StructureDefinition-sd-mii-icu-linksventrikulaerer-druck.md) | Dieses Profil dient der spezialisierten Abbildung des linksventrikulären Drucks in der Akutmedizin. |
| [ SD MII ICU Linksventrikulaerer Herzindex ](StructureDefinition-sd-mii-icu-linksventrikulaerer-herzindex.md) | Dieses Profil dient der spezialisierten Abbildung des linksventrikulären Herzindex in der Akutmedizin. |
| [ SD MII ICU Linksventrikulaeres Schlagvolumen ](StructureDefinition-sd-mii-icu-linksventrikulaeres-schlagvolumen.md) | Dieses Profil dient der spezialisierten Abbildung des linksventrikulären Schlagvolumens in der Akutmedizin. |
| [ SD MII ICU Linksventrikulaeres Schlagvolumenindex ](StructureDefinition-sd-mii-icu-linksventrikulaeres-schlagvolumenindex.md) | Dieses Profil dient der spezialisierten Abbildung des linksventrikulären Schlagvolumenindex in der Akutmedizin. |
| [ SD MII ICU Monitoring und Vitaldaten ](StructureDefinition-sd-mii-icu-monitoring-und-vitaldaten.md) | Dieses Profil dient als Abstraktionsprofil für verschiedene spezialisierte Beobachtungen in der Akutmedizin zur Abbildung von Monitoring- und Vitaldaten. |
| [ SD MII ICU Sauerstoffsaettigung Im Arteriellen Blut Durch Pulsoxymetrie ](StructureDefinition-sd-mii-icu-o2saettigung-im-arteriellen-blut-durch-pulsoxymetrie.md) | Dieses Profil dient der spezialisierten Abbildung der Sauerstoffsättigung im arteriellen Blut durch Pulsoxymetrie in der Akutmedizin. |
| [ SD MII ICU Sauerstoffsaettigung Im Blut Postduktal Durch Pulsoxymetrie ](StructureDefinition-sd-mii-icu-o2saettigung-im-blut-postduktal-durch-pulsoxymetrie.md) | Dieses Profil dient der spezialisierten Abbildung der Sauerstoffsättigung im Blut postduktal durch Pulsoxymetrie in der Akutmedizin. |
| [ SD MII ICU Sauerstoffsaettigung Im Blut Preduktal Durch Pulsoxymetrie ](StructureDefinition-sd-mii-icu-o2saettigung-im-blut-preduktal-durch-pulsoxymetrie.md) | Dieses Profil dient der spezialisierten Abbildung der Sauerstoffsättigung im Blut preduktal durch Pulsoxymetrie in der Akutmedizin. |
| [ SD MII ICU Pulmonalarterieller Blutdruck ](StructureDefinition-sd-mii-icu-pulmonalarterieller-blutdruck.md) | Dieses Profil dient der spezialisierten Abbildung des pulmonalarteriellen Blutdrucks in der Akutmedizin. |
| [ SD MII ICU Pulmonalarterieller Wedge Druck ](StructureDefinition-sd-mii-icu-pulmonalarterieller-wedge-druck.md) | Dieses Profil dient der spezialisierten Abbildung des pulmonalarteriellen Wedge-Drucks in der Akutmedizin. |
| [ SD MII ICU Pulmonalvaskulaerer Widerstandsindex ](StructureDefinition-sd-mii-icu-pulmonalvaskulaerer-widerstandsindex.md) | Dieses Profil dient der spezialisierten Abbildung des pulmonalvaskulären Widerstandsindex in der Akutmedizin. |
| [ SD MII ICU Puls ](StructureDefinition-sd-mii-icu-puls.md) | Dieses Profil repräsentiert Pulsuntersuchungen die nicht den Zweck einer Herzfrequenzmessung haben, sondern die Pulsfrequenz als eigenständige Vitalfunktion erfassen. |
| [ SD MII ICU Rechtsatrialer Druck ](StructureDefinition-sd-mii-icu-rechtsatrialer-druck.md) | Dieses Profil dient der spezialisierten Abbildung des rechtsatrialen Drucks in der Akutmedizin. |
| [ SD MII ICU Rechtsventrikulaerer Druck ](StructureDefinition-sd-mii-icu-rechtsventrikulaerer-druck.md) | Dieses Profil dient der spezialisierten Abbildung des rechtsventrikulären Drucks in der Akutmedizin. |
| [ SD MII ICU Sonstige pulsatile Druecke Generisch ](StructureDefinition-sd-mii-icu-sonstige-pulsatile-druecke-generisch.md) | Dieses Profil bietet eine abstrahierte Schicht zur Abbildung sonstiger pulsatiler Drücke in der Akutmedizin. Es ist generisch im Sinne der Profil-Abstraktion, allerdings explizit nicht im Sinne einer Blutdruckmessung (siehe dafür Profile zu Blutdruck im generischen Modul Vitalparameter). |
| [ SD MII ICU Systemischer Vaskulaerer Widerstandsindex ](StructureDefinition-sd-mii-icu-systemischer-vaskulaerer-widerstandsindex.md) | Dieses Profil dient der spezialisierten Abbildung des systemisch-vaskulären Widerstandsindex in der Akutmedizin. |
| [ SD MII ICU Zentralvenoeser Blutdruck ](StructureDefinition-sd-mii-icu-zentralvenoeser-blutdruck.md) | Dieses Profil dient der spezialisierten Abbildung des zentralvenösen Blutdrucks in der Akutmedizin. |

**Tabelle:**Ressourcenprofile

### Terminologien

#### Value Sets

Die folgenden Value Sets sind für die Audit-Event-Service-Funktionalitäten festgelegt.

| | |
| :--- | :--- |
| [ PflegegradDE ValueSet ](ValueSet-ExamplePrePopObservation_pflegegrad-de.md) | Codes zur genaueren Differenzierung des Pflegegrads. |
| [ DiagnosesSCT ](ValueSet-DiagnosesSCT.md) | Enthaelt alle SNOMED Clinical finding, Event und Situation with explicit context codes |
| [ ISiK Kerntemperatur SnomedCT ValueSet ](ValueSet-ISiKKernTempSctVS.md) | ValueSet der Körperkerntemperatur SnomedCT Konzepte |
| [ ISiKLocationPhysicalType ](ValueSet-ISiKLocationPhysicalType.md) | Dieses Valueset beinhaltet die für ISiK Kodierbaren Standort-Typen |
| [ ISiK Specific Generische Koerpertemperatur LOINC Konzepte ](ValueSet-ISiKSpecificGenericTempLoincVS.md) | ValueSet der spezifischen generischen Körperkerntemperatur LOINC Konzepte die nicht dazu dienen eine Körperkerntemperatur zu messen |
| [ ISiK Specific Kerntemperatur LOINC ValueSet ](ValueSet-ISiKSpecificKernTempLoincVS.md) | ValueSet der spezifischen Körperkerntemperatur LOINC Konzepte |
| [ ISiKTerminPriority ](ValueSet-ISiKTerminPriority.md) | Enthaelt alle SNOMED Codes, die eine valide Priorität für den ISiKTermin sind |
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
| [ Stillstatus LOINC Antwortoptionen ](ValueSet-StillstatusVS.md) | Dieses Valueset enthält die Codes zur Beschreibung von Stillstatus LOINC. |
| [ Current Smoking Status - IPS ](ValueSet-current-smoking-status-uv-ips.md) | HL7 LOINC value set for smoking status. Based on the HL7 Vocab and Structured Doc WG (formerly TC) consensus - per US CDC submission 7/12/2012 for smoking status terms. |
| [ VS MII ICU BodySite Observation Blutdruck ](ValueSet-vs-mii-icu-bodysite-observation-blutdruck.md) | Dieses ValueSet enthält Codes für bodySites von Blutdrücken (pulsatilen Drücken). |
| [ VS MII ICU BodySite Observation Monitoring und Vitaldaten ](ValueSet-vs-mii-icu-bodysite-observation-monitoring-und-vitaldaten.md) | Dieses ValueSet enthält Codes für bodySites von Vitaldaten sowie Daten aus dem Patientenmonitoring. |
| [ VS MII ICU Code Monitoring und Vitaldaten [ISO11073] ](ValueSet-vs-mii-icu-code-monitoring-und-vitaldaten-iso11073.md) | Dieses ValueSet enthält Codes für Vitaldaten sowie Daten aus dem Patientenmonitoring. |
| [ VS MII ICU Code Monitoring und Vitaldaten [LOINC] ](ValueSet-vs-mii-icu-code-monitoring-und-vitaldaten-loinc.md) | Dieses ValueSet enthält Codes für Vitaldaten sowie Daten aus dem Patientenmonitoring. |
| [ VS MII ICU Code Monitoring und Vitaldaten [sct] ](ValueSet-vs-mii-icu-code-monitoring-und-vitaldaten-snomed.md) | Dieses ValueSet enthaelt Codes fuer Vitaldaten sowie Daten aus dem Patientenmonitoring. |
| [ VS MII ICU Method Observation Blutdruck ](ValueSet-vs-mii-icu-method-observation-blutdruck.md) | Dieses ValueSet enthält Codes zur Angabe, ob ein Blutdruck invasiv oder nicht-invasiv gemessen ist. |

**Tabelle:**Value Sets

#### Code Systems

|
|

**Tabelle:**Code Systems

### Beispiele

**AllergyIntolerance**

* [Example AllergyIntolerance - ISiKAllergieUnvertraeglichkeitBeispiel1](AllergyIntolerance-ISiKAllergieUnvertraeglichkeitBeispiel1.md)

**Bundle**

* [Verlegungsbericht für Patient Herrn Thomas Müller (1234567890) - Intensivstation 0100 (Bundle)](Bundle-BundleExampleIntensivstation.md)

* [Blutdruckmessung vom 3.5.2022 (Bundle)](Bundle-ISiKBundle-Example.md)

**Condition**

* [Example Condition - AltersbedingteKreislaufstoerung](Condition-AltersbedingteKreislaufstoerung.md)

* [Example Condition - BehandlungsDiagnoseFreitext](Condition-BehandlungsDiagnoseFreitext.md)

* [Example Condition - Example-condition-ausrufezeichen-primaer](Condition-Example-condition-ausrufezeichen-primaer.md)

* [Example Condition - Example-condition-ausrufezeichen-sekundaer](Condition-Example-condition-ausrufezeichen-sekundaer.md)

* [Example Condition - Example-condition-kreuz-stern-primaer](Condition-Example-condition-kreuz-stern-primaer.md)

* [Example Condition - Example-condition-kreuz-stern-sekundaer](Condition-Example-condition-kreuz-stern-sekundaer.md)

* [Example Condition - MittelgradigeIntelligenzminderung](Condition-MittelgradigeIntelligenzminderung.md)

* [Example Condition - PrimaereGonarthroseMinimal](Condition-PrimaereGonarthroseMinimal.md)

* [Example Condition - PrimaereGonarthroseNormal](Condition-PrimaereGonarthroseNormal.md)

* [Example Condition - SZ2Primaerdiagnose](Condition-SZ2Primaerdiagnose.md)

* [Example Condition - SZ2Sekundaerdiagnose](Condition-SZ2Sekundaerdiagnose.md)

**Encounter**

* [Example Encounter - Fachabteilungskontakt](Encounter-Fachabteilungskontakt.md)

* [Example Encounter - FachabteilungskontaktBettenverlegung](Encounter-FachabteilungskontaktBettenverlegung.md)

* [Example Encounter - FachabteilungskontaktEntlassung](Encounter-FachabteilungskontaktEntlassung.md)

* [Example Encounter - FachabteilungskontaktFachbereichswechsel1](Encounter-FachabteilungskontaktFachbereichswechsel1.md)

* [Example Encounter - FachabteilungskontaktFachbereichswechsel2](Encounter-FachabteilungskontaktFachbereichswechsel2.md)

* [Example Encounter - FachabteilungskontaktMinimal2](Encounter-FachabteilungskontaktMinimal2.md)

* [Example Encounter - FachabteilungskontaktNormal](Encounter-FachabteilungskontaktNormal.md)

* [Example Encounter - FachabteilungskontaktStationaereAufnahme](Encounter-FachabteilungskontaktStationaereAufnahme.md)

* [Example Encounter - FachabteilungskontaktStationswechsel1](Encounter-FachabteilungskontaktStationswechsel1.md)

* [Example Encounter - FachabteilungskontaktStationswechsel2](Encounter-FachabteilungskontaktStationswechsel2.md)

* [Example Encounter - SZ1Nachstationaer](Encounter-SZ1Nachstationaer.md)

* [Example Encounter - SZ1Stationaer](Encounter-SZ1Stationaer.md)

* [Example Encounter - SZ1Vorstationaer](Encounter-SZ1Vorstationaer.md)

* [Example Encounter - SZ2Encounter](Encounter-SZ2Encounter.md)

**Observation**

* [Example Observation - ExampleISiKLaboruntersuchungCRP1](Observation-ExampleISiKLaboruntersuchungCRP1.md)

* [Example Observation - ExampleISiKLaboruntersuchungGFR1](Observation-ExampleISiKLaboruntersuchungGFR1.md)

* [Example Observation - ExampleISiKLaboruntersuchungHb1](Observation-ExampleISiKLaboruntersuchungHb1.md)

* [Example Observation - ExampleISiKLaboruntersuchungPCT1](Observation-ExampleISiKLaboruntersuchungPCT1.md)

* [Example Observation - ExampleISiKLaboruntersuchungSerumkreatinin1](Observation-ExampleISiKLaboruntersuchungSerumkreatinin1.md)

* [Example Observation - ExampleISiKLaboruntersuchungTSH1](Observation-ExampleISiKLaboruntersuchungTSH1.md)

* [Example Observation - ExampleISiKLaboruntersuchungThrombozyten1](Observation-ExampleISiKLaboruntersuchungThrombozyten1.md)

* [Example Observation - ExampleISiKLaboruntersuchungTroponin1](Observation-ExampleISiKLaboruntersuchungTroponin1.md)

* [Example Observation - ExtractedObservationKoerpergewicht](Observation-ExtractedObservationKoerpergewicht.md)

* [Example Observation - ExtractedObservationKoerpergroesse](Observation-ExtractedObservationKoerpergroesse.md)

* [Example Observation - Herzzeitvolumen](Observation-Herzzeitvolumen.md)

* [Example Observation - ISiKAlkoholAbususBeispiel](Observation-ISiKAlkoholAbususBeispiel.md)

* [Example Observation - ISiKAtemfrequenzExample](Observation-ISiKAtemfrequenzExample.md)

* [Example Observation - ISiKAtemfrequenzMaxExample](Observation-ISiKAtemfrequenzMaxExample.md)

* [Example Observation - ISiKAtemfrequenzMinExample](Observation-ISiKAtemfrequenzMinExample.md)

* [Example Observation - ISiKBlutdruckSystemischArteriellExample](Observation-ISiKBlutdruckSystemischArteriellExample.md)

* [Example Observation - ISiKBlutdruckSystemischArteriellMaxExample](Observation-ISiKBlutdruckSystemischArteriellMaxExample.md)

* [Example Observation - ISiKBlutdruckSystemischArteriellMinExample](Observation-ISiKBlutdruckSystemischArteriellMinExample.md)

* [Example Observation - ISiKEKGExample](Observation-ISiKEKGExample.md)

* [Example Observation - ISiKEKGMaxExample](Observation-ISiKEKGMaxExample.md)

* [Example Observation - ISiKEKGMinExample](Observation-ISiKEKGMinExample.md)

* [Example Observation - ISiKGCSExample](Observation-ISiKGCSExample.md)

* [Example Observation - ISiKGCSMaxExample](Observation-ISiKGCSMaxExample.md)

* [Example Observation - ISiKGCSMinExample](Observation-ISiKGCSMinExample.md)

* [Example Observation - ISiKHerzfrequenzExample](Observation-ISiKHerzfrequenzExample.md)

* [Example Observation - ISiKHerzfrequenzMaxExample](Observation-ISiKHerzfrequenzMaxExample.md)

* [Example Observation - ISiKHerzfrequenzMinExample](Observation-ISiKHerzfrequenzMinExample.md)

* [Example Observation - ISiKKoerpergewichtExample](Observation-ISiKKoerpergewichtExample.md)

* [Example Observation - ISiKKoerpergewichtMaxExample](Observation-ISiKKoerpergewichtMaxExample.md)

* [Example Observation - ISiKKoerpergewichtMinExample](Observation-ISiKKoerpergewichtMinExample.md)

* [Example Observation - ISiKKoerpergroesseExample](Observation-ISiKKoerpergroesseExample.md)

* [Example Observation - ISiKKoerpergroesseMaxExample](Observation-ISiKKoerpergroesseMaxExample.md)

* [Example Observation - ISiKKoerpergroesseMinExample](Observation-ISiKKoerpergroesseMinExample.md)

* [Example Observation - ISiKKoerperkerntemperaturExample](Observation-ISiKKoerperkerntemperaturExample.md)

* [Example Observation - ISiKKoerperkerntemperaturMaxExample](Observation-ISiKKoerperkerntemperaturMaxExample.md)

* [Example Observation - ISiKKoerperkerntemperaturMinExample](Observation-ISiKKoerperkerntemperaturMinExample.md)

* [Example Observation - ISiKKoerpertemperaturExample](Observation-ISiKKoerpertemperaturExample.md)

* [Example Observation - ISiKKoerpertemperaturMaxExample](Observation-ISiKKoerpertemperaturMaxExample.md)

* [Example Observation - ISiKKoerpertemperaturMinExample](Observation-ISiKKoerpertemperaturMinExample.md)

* [Example Observation - ISiKKopfumfangExample](Observation-ISiKKopfumfangExample.md)

* [Example Observation - ISiKKopfumfangMaxExample](Observation-ISiKKopfumfangMaxExample.md)

* [Example Observation - ISiKKopfumfangMinExample](Observation-ISiKKopfumfangMinExample.md)

* [Example Observation - ISiKRaucherStatusBeispiel](Observation-ISiKRaucherStatusBeispiel.md)

* [Example Observation - ISiKSauerstoffsaettigungArteriellExample](Observation-ISiKSauerstoffsaettigungArteriellExample.md)

* [Example Observation - ISiKSauerstoffsaettigungArteriellMaxExample](Observation-ISiKSauerstoffsaettigungArteriellMaxExample.md)

* [Example Observation - ISiKSauerstoffsaettigungArteriellMinExample](Observation-ISiKSauerstoffsaettigungArteriellMinExample.md)

* [Example Observation - ISiKSchwangerschaftErwarteterEntbindungsterminBeispiel](Observation-ISiKSchwangerschaftErwarteterEntbindungsterminBeispiel.md)

* [Example Observation - ISiKSchwangerschaftsstatusBeispiel](Observation-ISiKSchwangerschaftsstatusBeispiel.md)

* [Example Observation - ISiKStillstatusBeispiel](Observation-ISiKStillstatusBeispiel.md)

* [Example Observation - Ideales-Koerpergewicht](Observation-Ideales-Koerpergewicht.md)

* [Example Observation - Intrakranieller-Druck-ICP](Observation-Intrakranieller-Druck-ICP.md)

* [Example Observation - Koerpergewicht-Percentile-altersabhaengig](Observation-Koerpergewicht-Percentile-altersabhaengig.md)

* [Example Observation - Koerpergroesse-Percentil](Observation-Koerpergroesse-Percentil.md)

* [Example Observation - Koerpertemperatur-Achsel](Observation-Koerpertemperatur-Achsel.md)

* [Example Observation - Koerpertemperatur-Atemwege](Observation-Koerpertemperatur-Atemwege.md)

* [Example Observation - Koerpertemperatur-Blut](Observation-Koerpertemperatur-Blut.md)

* [Example Observation - Koerpertemperatur-Brust](Observation-Koerpertemperatur-Brust.md)

* [Example Observation - Koerpertemperatur-Brustwirbelsaeule](Observation-Koerpertemperatur-Brustwirbelsaeule.md)

* [Example Observation - Koerpertemperatur-Gelenk](Observation-Koerpertemperatur-Gelenk.md)

* [Example Observation - Koerpertemperatur-Halswirbelsaeule](Observation-Koerpertemperatur-Halswirbelsaeule.md)

* [Example Observation - Koerpertemperatur-Harnblase](Observation-Koerpertemperatur-Harnblase.md)

* [Example Observation - Koerpertemperatur-Kern](Observation-Koerpertemperatur-Kern.md)

* [Example Observation - Koerpertemperatur-Leiste](Observation-Koerpertemperatur-Leiste.md)

* [Example Observation - Koerpertemperatur-Lendenwirbelsaeule](Observation-Koerpertemperatur-Lendenwirbelsaeule.md)

* [Example Observation - Koerpertemperatur-Myokard](Observation-Koerpertemperatur-Myokard.md)

* [Example Observation - Koerpertemperatur-Nasen-Rachen-Raum](Observation-Koerpertemperatur-Nasen-Rachen-Raum.md)

* [Example Observation - Koerpertemperatur-Oral](Observation-Koerpertemperatur-Oral.md)

* [Example Observation - Koerpertemperatur-Speiseroehre](Observation-Koerpertemperatur-Speiseroehre.md)

* [Example Observation - Koerpertemperatur-Stirn](Observation-Koerpertemperatur-Stirn.md)

* [Example Observation - Koerpertemperatur-Trommelfell](Observation-Koerpertemperatur-Trommelfell.md)

* [Example Observation - Koerpertemperatur-nasal](Observation-Koerpertemperatur-nasal.md)

* [Example Observation - Koerpertemperatur-rektal](Observation-Koerpertemperatur-rektal.md)

* [Example Observation - Koerpertemperatur-vaginal](Observation-Koerpertemperatur-vaginal.md)

* [Example Observation - Linksatrialer-Druck](Observation-Linksatrialer-Druck.md)

* [Example Observation - Linksvent-Schlagvolumenindex-Durch-Indikatorverduennung](Observation-Linksvent-Schlagvolumenindex-Durch-Indikatorverduennung.md)

* [Example Observation - Linksventrikulaerer-Druck](Observation-Linksventrikulaerer-Druck.md)

* [Example Observation - Linksventrikulaerer-Herzindex-Durch-Indikatorverduennung](Observation-Linksventrikulaerer-Herzindex-Durch-Indikatorverduennung.md)

* [Example Observation - Linksventrikulaerer-Herzindex](Observation-Linksventrikulaerer-Herzindex.md)

* [Example Observation - Linksventrikulaeres-Herzzeitvolumen-durch-Indikatorverduennung](Observation-Linksventrikulaeres-Herzzeitvolumen-durch-Indikatorverduennung.md)

* [Example Observation - Linksventrikulaeres-Schlagvolumen-Durch-Indikatorverduennung](Observation-Linksventrikulaeres-Schlagvolumen-Durch-Indikatorverduennung.md)

* [Example Observation - Linksventrikulaeres-Schlagvolumen](Observation-Linksventrikulaeres-Schlagvolumen.md)

* [Example Observation - Linksventrikulaeres-Schlagvolumenindex](Observation-Linksventrikulaeres-Schlagvolumenindex.md)

* [Example Observation - Pulmonalarterieller-Blutdruck](Observation-Pulmonalarterieller-Blutdruck.md)

* [Example Observation - Pulmonalarterieller-wedge-Blutdruck](Observation-Pulmonalarterieller-wedge-Blutdruck.md)

* [Example Observation - Pulmonalvaskulaerer-Widerstandsindex](Observation-Pulmonalvaskulaerer-Widerstandsindex.md)

* [Example Observation - Puls](Observation-Puls.md)

* [Example Observation - Rechtsatrialer-Druck](Observation-Rechtsatrialer-Druck.md)

* [Example Observation - Rechtsventrikulaerer-Druck](Observation-Rechtsventrikulaerer-Druck.md)

* [Example Observation - Sauerstoffsaettigung-im-Arteriellen-Blut-durch-Pulsoxymetrie](Observation-Sauerstoffsaettigung-im-Arteriellen-Blut-durch-Pulsoxymetrie.md)

* [Example Observation - Sauerstoffsaettigung-im-Blut-Postduktal-durch-Pulsoxymetrie](Observation-Sauerstoffsaettigung-im-Blut-Postduktal-durch-Pulsoxymetrie.md)

* [Example Observation - Sauerstoffsaettigung-im-Blut-Preduktal-durch-Pulsoxymetrie](Observation-Sauerstoffsaettigung-im-Blut-Preduktal-durch-Pulsoxymetrie.md)

* [Example Observation - Systemischer-vaskulaerer-Widerstandsindex](Observation-Systemischer-vaskulaerer-Widerstandsindex.md)

* [Example Observation - Zentralvenoeser-Blutdruck](Observation-Zentralvenoeser-Blutdruck.md)

**Patient**

* [Example Patient - DorisQuelle](Patient-DorisQuelle.md)

* [Example Patient - DorisZiel](Patient-DorisZiel.md)

* [Example Patient - IsikPatientTemplate](Patient-IsikPatientTemplate.md)

* [Example Patient - PatientinMinimal](Patient-PatientinMinimal.md)

* [Example Patient - PatientinMusterfrau](Patient-PatientinMusterfrau.md)

* [Example Patient - PatientinNormal](Patient-PatientinNormal.md)

* [Example Patient - SZ1Patient](Patient-SZ1Patient.md)

* [Example Patient - SZ2Patient](Patient-SZ2Patient.md)

**Procedure**

* [Example Procedure - Appendektomie](Procedure-Appendektomie.md)

**Questionnaire**

* [DemoTemplatebasedExtractionQuestionnaire](Questionnaire-DemoTemplatebasedExtractionQuestionnaire.md)

* [Bedingte Fragestellungen](Questionnaire-ExampleConditionalItem.md)

* [Validierung von Dezimalen](Questionnaire-ExampleEntryValidationDecimal.md)

* [Validierung von Texten](Questionnaire-ExampleEntryValidationText.md)

* [Observation Based Extraction bei quantitativen Angaben](Questionnaire-ExampleExtractWithUnit.md)

* [Validierung von Formulareingaben gegen RegExPattern](Questionnaire-ExampleInputPatternValidation.md)

* [Formular aus einem Medizinprodukt](Questionnaire-ExampleMdrRelevant.md)

* [Vorbelegung Demografischer Daten](Questionnaire-ExamplePrePopDemo.md)

* [Vorbelegung Demografischer Daten Encounter](Questionnaire-ExamplePrePopDemoEnc.md)

* [Vorbelegung von Observations](Questionnaire-ExamplePrePopObservation.md)

**QuestionnaireResponse**

* [Example QuestionnaireResponse - ExampleEntryValidationDecimalResponse](QuestionnaireResponse-ExampleEntryValidationDecimalResponse.md)

* [Example QuestionnaireResponse - ExampleExtractWithUnitResponse](QuestionnaireResponse-ExampleExtractWithUnitResponse.md)

* [Example QuestionnaireResponse - TestMaxDecimal0](QuestionnaireResponse-TestMaxDecimal0.md)

* [Example QuestionnaireResponse - TestMaxDecimal1](QuestionnaireResponse-TestMaxDecimal1.md)

* [Example QuestionnaireResponse - TestMaxDecimal2](QuestionnaireResponse-TestMaxDecimal2.md)

* [Example QuestionnaireResponse - TestMaxDecimal3](QuestionnaireResponse-TestMaxDecimal3.md)

**RiskAssessment**

* [Example RiskAssessment - ExampleISiKAMTSBewertung1](RiskAssessment-ExampleISiKAMTSBewertung1.md)

**Tabelle:**Beispiel-Instanzen

