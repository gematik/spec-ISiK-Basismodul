# Artefakte - ISiK Medikation Implementierungsleitfaden v6.0.0-rc

ISiK Medikation Implementierungsleitfaden

Version 6.0.0-rc - release-candidate 

* [**Table of Contents**](toc.md)
* **Artefakte**

## Artefakte

Auf dieser Seite befindet sich eine Liste der FHIR-Artefakte, welche im Rahmen dieses Implementation Guide definiert werden.

Folgende Datenobjekte aus dem Modul ISiK Basis werden in diesem Modul verwendet:

* [Patient]()
* [Kontakt/Fall (Encounter)]()
* [Binary]()

Die Verwendung der genannten Ressourcen in diesem Modul bedeutet: Wenn ein Profil aus diesem Modul auf die genannten Datenobjekte aus dem Basismodul referenziert, dann MÜSSEN die referenzierten FHIR-Ressourcen im ISiK-Kontext konform zu Vorgaben an diese Ressourcen aus dem Basismodul sein (Profilkonformität). Die konkreten Vorgaben zu Interaktionen und Abhängigkeiten zwischen Modulen werden noch präzisiert.

### CapabilityStatements

#### Akteure

Das CapabilityStatement mit der Kennzeichnung “Expanded” dient der direkten Übersicht aller zu implementierender Interaktionen und Profile.

| | |
| :--- | :--- |
| [ ISiK CapabilityStatement Medikationsinformation Server Akteur (Expanded) ](CapabilityStatement-ISiKCapabilityStatementMedikationInformationAkteur-expanded.md) | Das vorliegende CapabilityStatement bündelt alle Rollen die ein ISiK-konformes System unterstützen muss, um das Bestätigungsverfahren des Moduls ‘Medikation’, Bereich ‘Medikationsinformation’ zu bestehen.**HISTORIE:*** 5.0.0 - Erzeugung des Akteurs-CapabilityStatement zur Bündelung der Rollen.
 |
| [ ISiK CapabilityStatement Medikationsinformation Server Akteur ](CapabilityStatement-ISiKCapabilityStatementMedikationInformationAkteur.md) | Das vorliegende CapabilityStatement bündelt alle Rollen die ein ISiK-konformes System unterstützen muss, um das Bestätigungsverfahren des Moduls ‘Medikation’, Bereich ‘Medikationsinformation’ zu bestehen.**HISTORIE:*** 5.0.0 - Erzeugung des Akteurs-CapabilityStatement zur Bündelung der Rollen.
 |
| [ ISiK CapabilityStatement Medikationsverabreichung Server Akteur (Expanded) ](CapabilityStatement-ISiKCapabilityStatementMedikationVerabreichungAkteur-expanded.md) | Das vorliegende CapabilityStatement bündelt alle Rollen die ein ISiK-konformes System unterstützen muss, um das Bestätigungsverfahren des Moduls ‘Medikation’, Bereich ‘Medikationsverabreichung’ zu bestehen.**HISTORIE:*** 5.0.0 - Erzeugung des Akteurs-CapabilityStatement zur Bündelung der Rollen.
 |
| [ ISiK CapabilityStatement Medikationsverabreichung Server Akteur ](CapabilityStatement-ISiKCapabilityStatementMedikationVerabreichungAkteur.md) | Das vorliegende CapabilityStatement bündelt alle Rollen die ein ISiK-konformes System unterstützen muss, um das Bestätigungsverfahren des Moduls ‘Medikation’, Bereich ‘Medikationsverabreichung’ zu bestehen.**HISTORIE:*** 5.0.0 - Erzeugung des Akteurs-CapabilityStatement zur Bündelung der Rollen.
 |
| [ ISiK CapabilityStatement Medikationsverordnung Server Akteur (Expanded) ](CapabilityStatement-ISiKCapabilityStatementMedikationVerordnungAkteur-expanded.md) | Das vorliegende CapabilityStatement bündelt alle Rollen die ein ISiK-konformes System unterstützen muss, um das Bestätigungsverfahren des Moduls ‘Medikation’, Bereich ‘Medikationsverordnung’ zu bestehen.**HISTORIE:*** 5.0.0 - Erzeugung des Akteurs-CapabilityStatement zur Bündelung der Rollen.
 |
| [ ISiK CapabilityStatement Medikationsverordnung Server Akteur ](CapabilityStatement-ISiKCapabilityStatementMedikationVerordnungAkteur.md) | Das vorliegende CapabilityStatement bündelt alle Rollen die ein ISiK-konformes System unterstützen muss, um das Bestätigungsverfahren des Moduls ‘Medikation’, Bereich ‘Medikationsverordnung’ zu bestehen.**HISTORIE:*** 5.0.0 - Erzeugung des Akteurs-CapabilityStatement zur Bündelung der Rollen.
 |

**Tabelle:**Capability Statements - Akteure

#### Rollen

| | |
| :--- | :--- |
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
| [ ISiKASKCoding ](StructureDefinition-ISiKASKCoding.md) | Data Type profile for ASK Codings in ISiK |
| [ ISiKATCCoding ](StructureDefinition-ISiKATCCoding.md) | Data Type profile for ATC Codings in ISiK |
| [ ISiKCoding ](StructureDefinition-ISiKCoding.md) | Data Type profile for Codings in ISiK |
| [ ISiKKontaktGesundheitseinrichtung ](StructureDefinition-ISiKKontaktGesundheitseinrichtung.md) | Dieses Profil ermöglicht die Abbildung von Besuchen/Aufenthalten eines Patienten in einer Gesundheitseinrichtung. Motivation Informationen über die Besuche des Patienten entlang seines Behandlungspfades im Krankenhaus sind ein wichtiger Bestandteil des einrichtungsinternen Datenaustausches. Sie ermöglichen die Unterscheidung von stationären und ambulanten sowie aufgenommenen und entlassenen Patienten. Weiterhin ist aus den Besuchsinformationen der aktuelle Aufenthaltsort des Patienten (Fachabteilung, Station, Bettplatz) ermittelbar. Klinische Ressourcen werden in FHIR durch Verlinkung auf die Encounter-Ressource in einen Kontext zum Besuch gestellt. Dieser Kontext ist wichtig für die Steuerung von Zugriffsberechtigungen und Abrechnungsprozessen.Zu Beginn der meisten klinischen Workflows steht die Auswahl des Besuchskontextes. Dies geschieht bspw. durch das Suchen der Encounter-Ressource anhand von Eigenschaften wie Aufnahmenummer, Fallart oder Aufnahmedatum. Daraufhin werden die zutreffenden Suchergebnisse angezeigt und der gewünschte Besuch ausgewählt.In FHIR werden Besuche, Aufenthalte, aber auch virtuelle Kontakte mit der `Encounter`-Ressource repräsentiert.Weitere Hinweise zu den Abgrenzungen der Begrifflichkeiten Fall und Kontakt finden sie unter {{pagelink: Fall, text: Fall-Begriff in ISiK}}Kompatibilität Für das Profil ISiKKontaktGesundheitseinrichtung wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISiKKontaktGesundheitseinrichtung valide sind, auch valide sind gegen:* Profil [Kontakt mit einer Gesundheitseinrichtung der Medizininformatik-Initiative](https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung)
Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. |
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
| [ ISiKSnomedCTCoding ](StructureDefinition-ISiKSnomedCTCoding.md) | Data Type profile for Snomed-CT Codings in ISiK |
| [ Medication Quantity ](StructureDefinition-MedicationQuantity.md) | Quantity Datentyp der die Nutzung von UCUM vorgibt. Bei dimensionslosen Einheiten wie ‘Tablette’ wird ein code von ‘1’ erwartet, ‘Tablette’ kann als String in Unit hinterlegt werden. |
| [ PlannedEndDate ](StructureDefinition-PlannedEndDate.md) | Diese Erweiterung dokumentiert das geplante Enddatum bzw. den geplanten Endzeitpunkt eines Encounters. Sie unterstützt die Vorausplanung von Aufenthalten oder Behandlungen, beispielsweise für die Ressourcenplanung, Terminverwaltung und für die Kommunikation mit nachfolgenden Einrichtungen. |
| [ PlannedStartDate ](StructureDefinition-PlannedStartDate.md) | Diese Extension dient der Erfassung des geplanten Startzeitpunkts (dateTime) eines Encounters, z. B. einer stationären Aufnahme, Operation oder eines Termins. Sie ermöglicht eine strukturierte Terminplanung, erleichtert die Koordination verschiedener Versorgungsprozesse und verbessert die Kommunikation zwischen Systemen und Leistungserbringern. |

**Tabelle:**Ressourcenprofile

### Terminologien

#### Value Sets

Die folgenden Value Sets sind für die Audit-Event-Service-Funktionalitäten festgelegt.

| | |
| :--- | :--- |
| [ ISiKBehandlungsergebnisRehaVS ](ValueSet-ISiKBehandlungsergebnisReha.md) | Behandlungsergebnis Reha gemäß §301(4 UND 4A) SGB V. Diagnosenbezogene Bewertung des Behandlungsergebnisses für einen Versicherten/Berechtigten bei Entlassung aus der Reha-Maßnahme bzw. Stellung eines Antrags auf Verlängerung. Vgl. Schlüsseltabelle 2.71 Diagnose - Behandlungsergebnis. |
| [ ISiKBesondereBehandlungsformRehaVS ](ValueSet-ISiKBesondereBehandlungsformReha.md) | Besondere Behandlungsform der Reha gemäß §301(4 UND 4A) SGB V. Vgl. Schlüsseltabelle 2.51 Besondere Behandlungsformen. |
| [ ISiKEntlassformRehaVS ](ValueSet-ISiKEntlassformReha.md) | ISiK Entlassform Reha. Beschreibt Form und ggf. Weiterbehandlung der Entlassung eines Versicherten/Berechtigten aus verwaltungs- und medizinischer Sicht. Vgl. Schlüsseltabelle 2.107 Entlassungsform. |
| [ ISiKLocationPhysicalType ](ValueSet-ISiKLocationPhysicalType.md) | Dieses Valueset beinhaltet die für ISiK Kodierbaren Standort-Typen |
| [ ISiKMedikationsartVS ](ValueSet-ISiKMedikationsartVS.md) | ISiK Therapiearten für Medikation |
| [ ISiKUnterbrechungRehaVS ](ValueSet-ISiKUnterbrechungReha.md) | ISiK Unterbrechung Reha. Dokumentiert die relevanten Gründe einer Unterbrechung einer Rehabilitationsmaßnahme im Einzelfall. Vgl. Schlüsseltabelle 2.111 Erläuterung zur Unterbrechung. |
| [ Medikationslisten-Modes ](ValueSet-MedikationsListeListModeVS.md) | Erlaubte ListModes der ISiK MedikationsListe |
| [ SctRouteOfAdministration ](ValueSet-SctRouteOfAdministration.md) | Enthaelt alle SNOMED CT Administrationsarten |

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

