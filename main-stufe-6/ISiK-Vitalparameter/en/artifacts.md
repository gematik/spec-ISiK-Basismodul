# Artifacts Summary - ISiK Vitalparameter Implementierungsleitfaden v6.0.0

ISiK Vitalparameter Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Behavior: Capability Statements 

The following artifacts define the specific capabilities that different types of systems are expected to have in order to comply with this implementation guide. Systems conforming to this implementation guide are expected to declare conformance to one or more of the following capability statements.

| | |
| :--- | :--- |
| [ CapabilityStatement für Rolle StammdatenRolle  ](CapabilityStatement-ISiKCapabilityStatementStammdatenRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die [CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) mit den möglichen Werten `SHALL` (=MUSS) und `MAY` (=KANN) verwendet. |
| [ ISiK CapabilityStatement Labor Minimal Rolle  ](CapabilityStatement-ISiKCapabilityStatementLaborMinimalRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die [CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) mit den möglichen Werten `SHALL` (=MUSS) und `MAY` (=KANN) verwendet. |
| [ ISiK CapabilityStatement Vital Sign Standard Source Akteur  ](CapabilityStatement-ISiKCapabilityStatementVitalSignStandardSourceAkteur.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diesen Akteur implementiert.Jede Instanz eines bestätigungsrelevanten Systems MUSS an ihrem Endpunkt eine CapabilityStatement-Ressource bereitstellen. Hierzu MUSS die [capabilities-Interaktion gemäß FHIR-Kernspezifikation](https://hl7.org/fhir/R4/http.html#capabilities) unterstützt werden. Der `MODE`-Parameter kann ignoriert werden. Das CapabilityStatement in dieser Spezifikation stellt die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Rollen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die [CapabilityStatement-Imports-Expectation-Extension](https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation) mit den möglichen Werten 'SHALL' (=MUSS) 'SHOULD' (=SOLL) 'MAY' (=KANN) 'SHOULD-NOT' (=SOLL NICHT) verwendet.Eine Server-Instanz MUSS ihrerseits ein CapabilityStatement vom `kind = instance` liefern und im Element `software` den Namen und die Versionsnummer angeben.  Darüber hinaus MÜSSEN in `CapabilityStatement.instantiates` sämtliche Canonical URLs der implementierten Rollen angegeben werden. Die mindestens zu implementierenden Profile für einen Akteur und Interaktionen entsprechen daher den aggregierten Anforderungen der einzelnen Rolle (per 'imports'). In den CapabilityStatements zu den Rollen sind die Anforderungen tabellarisch gelistet und weisen so die zu implementierenden Profile aus.Das CapabilityStatement der Instanz MUSS alle Funktionalitäten auflisten, die im folgenden CapabilityStatement (bzw. der in ihm importierten Rollen - siehe 'imports') mit `SHALL` gekennzeichnet sind. Das CapabilityStatement KANN darüber hinaus die mit `MAY` gekennzeichneten Funktionalitäten, sowie weitere Funktionalitäten auflisten, sofern diese in der Instanz implementiert wurden.Die Verwendung der CapabilityStatement-Expectation-Extension ist im CapabilityStatement der Server-Instanz nicht erforderlich. |
| [ ISiK CapabilityStatement Vital Sign Standard Source Akteur (Expanded)  ](CapabilityStatement-ISiKCapabilityStatementVitalSignStandardSourceAkteur-expanded.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diesen Akteur implementiert.Jede Instanz eines bestätigungsrelevanten Systems MUSS an ihrem Endpunkt eine CapabilityStatement-Ressource bereitstellen. Hierzu MUSS die [capabilities-Interaktion gemäß FHIR-Kernspezifikation](https://hl7.org/fhir/R4/http.html#capabilities) unterstützt werden. Der `MODE`-Parameter kann ignoriert werden. Das CapabilityStatement in dieser Spezifikation stellt die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Rollen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die [CapabilityStatement-Imports-Expectation-Extension](https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKCapabilityStatementImportsExpectation) mit den möglichen Werten 'SHALL' (=MUSS) 'SHOULD' (=SOLL) 'MAY' (=KANN) 'SHOULD-NOT' (=SOLL NICHT) verwendet.Eine Server-Instanz MUSS ihrerseits ein CapabilityStatement vom `kind = instance` liefern und im Element `software` den Namen und die Versionsnummer angeben.  Darüber hinaus MÜSSEN in `CapabilityStatement.instantiates` sämtliche Canonical URLs der implementierten Rollen angegeben werden. Die mindestens zu implementierenden Profile für einen Akteur und Interaktionen entsprechen daher den aggregierten Anforderungen der einzelnen Rolle (per 'imports'). In den CapabilityStatements zu den Rollen sind die Anforderungen tabellarisch gelistet und weisen so die zu implementierenden Profile aus.Das CapabilityStatement der Instanz MUSS alle Funktionalitäten auflisten, die im folgenden CapabilityStatement (bzw. der in ihm importierten Rollen - siehe 'imports') mit `SHALL` gekennzeichnet sind. Das CapabilityStatement KANN darüber hinaus die mit `MAY` gekennzeichneten Funktionalitäten, sowie weitere Funktionalitäten auflisten, sofern diese in der Instanz implementiert wurden.Die Verwendung der CapabilityStatement-Expectation-Extension ist im CapabilityStatement der Server-Instanz nicht erforderlich. |
| [ ISiK CapabilityStatement VitalSign Standard Source Rolle  ](CapabilityStatement-ISiKCapabilityStatementVitalSignStandardSourceRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die [CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) mit den möglichen Werten `SHALL` (=MUSS) und `MAY` (=KANN) verwendet. |

### Behavior: Search Parameters 

These define the properties by which a RESTful server can be searched. They can also be used for sorting and including related resources.

| | |
| :--- | :--- |
| [ DateStart  ](SearchParameter-Encounter-date-start.md) | The actual start date of the Encounter (Backport from R5). The parameter cannot repeat or have multiple values. |
| [ EndDate  ](SearchParameter-Encounter-end-date.md) | The actual end date of the Encounter (Backport from R5). The parameter cannot repeat or have multiple values. |

### Structures: Resource Profiles 

These define constraints on FHIR resources for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [ ISiKAtemfrequenz  ](StructureDefinition-ISiKAtemfrequenz.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Atemfrequenz eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK.**Motivation**Die Erfassung und Überwachung der Atemfrequenz ist essenziell für die frühzeitige Erkennung von Gesundheitsveränderungen, die Behandlungsbewertung und die Unterstützung klinischer Entscheidungen.In FHIR wird die Atemfrequenz mit der Observation-Ressource repräsentiert.**Kompatibilität**Das Profil ISiKAtemfrequenz ist vom Profil [VitalSignDE_Atemfrequenz](http://fhir.de/StructureDefinition/observation-de-vitalsign-atemfrequenz) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Respiratory Rate Profile](http://hl7.org/fhir/StructureDefinition/resprate) aus der FHIR R4 Spezifikation. |
| [ ISiKBlutdruckSystemischArteriell  ](StructureDefinition-ISiKBlutdruckSystemischArteriell.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über den Blutdruck eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK.**Motivation**Die Erfassung und Überwachung des Blutdrucks ist essenziell für die frühzeitige Erkennung von Gesundheitsveränderungen, die Behandlungsbewertung und die Unterstützung klinischer Entscheidungen.In FHIR wird der Blutdruck mit der Observation-Ressource repräsentiert, die einzelnen Komponenten des Blutdrucks werden als Component-Elemente abgebildet.Hinweis: In Fällen, in denen fachlich motiviert ausschließlich ein systolischer Blutdruck erhoben wird (z.B. in der Intensivmedizin), kann für den Slice zur Diastole (DiastolicBP) das Element .dataAbsentReason (mit dem Code 'not-performed') verwendet werden.**Kompatibilität**Das Profil ISiKBlutdruckSystemischArteriell ist vom Profil [VitalSignDE_Blutdruck](http://fhir.de/StructureDefinition/observation-de-vitalsign-blutdruck) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Blood Pressure Profile](http://hl7.org/fhir/StructureDefinition/bp) aus der FHIR R4 Spezifikation. |
| [ ISiKEKG  ](StructureDefinition-ISiKEKG.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über kurze, relevante EKG-Ausschnitte eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK. Es wurde entwickelt, um spezifische klinische Fragestellungen zu unterstützen, bei denen prägnante und gezielte EKG-Daten im Vordergrund stehen. Für vollständige und längere EKG-Aufzeichnungen sind alternative Formate vorgesehen, die für umfangreiche Daten besser geeignet sind.**Motivation**Die Bereitstellung kurzer EKG-Ausschnitte ermöglicht eine präzise und effiziente Unterstützung bei der Diagnose akuter kardiologischer Fragestellungen, der Überwachung von Arrhythmien oder der Beurteilung bestimmter Ereignisse wie ST-Strecken-Veränderungen. Diese fokussierte Darstellung dient der Optimierung klinischer Entscheidungen und der schnellen Verarbeitung relevanter Daten.In FHIR wird das EKG durch die Observation-Ressource repräsentiert, wobei spezifische Anforderungen für die Darstellung und Kodierung der Daten in diesem Profil berücksichtigt werden.**Kompatibilität**Das Profil ISiKEKG ist vom Profil [EkgDE](http://fhir.de/StructureDefinition/observation-de-ekg) aus den deutschen Basisprofilen abgeleitet. |
| [ ISiKGCS  ](StructureDefinition-ISiKGCS.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über den Glasgow Coma Scale (GCS) Score eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK.**Motivation**Die Erfassung und Überwachung des Bewusstseinszustands anhand des GCS ist essenziell für die Beurteilung neurologischer Funktionen, die Überwachung von Patienten mit Schädel-Hirn-Trauma oder anderen neurologischen Erkrankungen sowie die Unterstützung klinischer Entscheidungen.In FHIR wird der GCS-Score mit der Observation-Ressource repräsentiert, wobei die einzelnen Komponenten der Skala - Augenöffnung, verbale Reaktion und motorische Reaktion - als Component-Elemente abgebildet werden.**Kompatibilität**Das Profil ISiKGCS ist vom Profil [ScoreDE_GCS](http://fhir.de/StructureDefinition/observation-de-score-gcs) aus den deutschen Basisprofilen abgeleitet. |
| [ ISiKHerzfrequenz  ](StructureDefinition-ISiKHerzfrequenz.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Herzfrequenz eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK.**Motivation**Die Erfassung und Überwachung der Herzfrequenz ist essenziell für die frühzeitige Erkennung von Herz-Kreislauf-Problemen, die Beurteilung des Gesundheitszustands sowie die Unterstützung klinischer Entscheidungen in der Patientenversorgung.In FHIR wird die Herzfrequenz mit der Observation-Ressource repräsentiert.**Kompatibilität**Das Profil ISiKHerzfrequenz ist vom Profil [VitalSignDE_Herzfrequenz](http://fhir.de/StructureDefinition/observation-de-vitalsign-herzfrequenz) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Respiratory Rate Profile](http://hl7.org/fhir/StructureDefinition/heartrate) aus der FHIR R4 Spezifikation. |
| [ ISiKKoerpergewicht  ](StructureDefinition-ISiKKoerpergewicht.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über das Körpergewicht eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK.**Motivation**Die Erfassung und Überwachung des Körpergewichts ist essenziell für die Beurteilung des Ernährungszustands, die Überwachung von Veränderungen im Rahmen der Therapie sowie die Unterstützung klinischer Entscheidungen in der Patientenversorgung.In FHIR wird das Körpergewicht mit der Observation-Ressource repräsentiert.**Kompatibilität**Das Profil ISiKKoerpergewicht ist vom Profil [VitalSignDE_Koerpergewicht](http://fhir.de/StructureDefinition/observation-de-vitalsign-koerpergewicht) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Body Weight Profile](http://hl7.org/fhir/StructureDefinition/bodyweight) aus der FHIR R4 Spezifikation. |
| [ ISiKKoerpergroesse  ](StructureDefinition-ISiKKoerpergroesse.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Körpergröße eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK.**Motivation**Die Erfassung und Überwachung der Körpergröße ist essenziell für die Beurteilung von Wachstumsprozessen, die Berechnung wichtiger Indizes wie des Body-Mass-Index (BMI) sowie die Unterstützung klinischer Entscheidungen in der Patientenversorgung.In FHIR wird die Körpergröße mit der Observation-Ressource repräsentiert.**Kompatibilität**Das Profil ISiKKoerpergroesse ist vom Profil [VitalSignDE_Koerpergroesse](http://fhir.de/StructureDefinition/observation-de-vitalsign-koerpergroesse) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Body Height Profile](http://hl7.org/fhir/StructureDefinition/bodyheight) aus der FHIR R4 Spezifikation. |
| [ ISiKKoerperkerntemperatur  ](StructureDefinition-ISiKKoerperkerntemperatur.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Körperkerntemperatur eines Patienten im Rahmen der interoperablen Kommunikation gemäß den ISiK Vorgaben. Dieses Profil repräsentiert sowohl direkte als auch indirekte Messungen der Körperkerntemperatur.**Motivation**Die Erfassung und Überwachung der Körpertemperatur ist essenziell für die frühzeitige Erkennung von Infektionen, die Beurteilung des Gesundheitszustands sowie die Unterstützung klinischer Entscheidungen in der Patientenversorgung. In FHIR wird die Körpertemperatur mit der Observation-Ressource repräsentiert.**Kompatibilität**Das Profil ISiKKoerperkerntemperatur ist vom Profil [VitalSignDE_Koerperkerntemperatur](http://fhir.de/StructureDefinition/observation-de-vitalsign-koerpertemperatur) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Body Temperature Profile](http://hl7.org/fhir/StructureDefinition/bodytemp) aus der FHIR R4 Spezifikation. |
| [ ISiKKontaktGesundheitseinrichtung  ](StructureDefinition-ISiKKontaktGesundheitseinrichtung.md) | Dieses Profil ermöglicht die Abbildung von Besuchen/Aufenthalten eines Patienten in einer Gesundheitseinrichtung.**Motivation**Informationen über die Besuche des Patienten entlang seines Behandlungspfades im Krankenhaus sind ein wichtiger Bestandteil des einrichtungsinternen Datenaustausches. Sie ermöglichen die Unterscheidung von stationären und ambulanten sowie aufgenommenen und entlassenen Patienten. Weiterhin ist aus den Besuchsinformationen der aktuelle Aufenthaltsort des Patienten (Fachabteilung, Station, Bettplatz) ermittelbar. Klinische Ressourcen werden in FHIR durch Verlinkung auf die Encounter-Ressource in einen Kontext zum Besuch gestellt. Dieser Kontext ist wichtig für die Steuerung von Zugriffsberechtigungen und Abrechnungsprozessen.Zu Beginn der meisten klinischen Workflows steht die Auswahl des Besuchskontextes. Dies geschieht bspw. durch das Suchen der Encounter-Ressource anhand von Eigenschaften wie Aufnahmenummer, Fallart oder Aufnahmedatum. Daraufhin werden die zutreffenden Suchergebnisse angezeigt und der gewünschte Besuch ausgewählt.In FHIR werden Besuche, Aufenthalte, aber auch virtuelle Kontakte mit der `Encounter`-Ressource repräsentiert.Weitere Hinweise zu den Abgrenzungen der Begrifflichkeiten Fall und Kontakt finden sie unter [Fall-Begriff in ISiK](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc1/Abbildung-des-Konstrukts-Fall.html).**Kompatibilität**Für das Profil ISiKKontaktGesundheitseinrichtung wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISiKKontaktGesundheitseinrichtung valide sind, auch valide sind gegen:* Profil [Kontakt mit einer Gesundheitseinrichtung der Medizininformatik-Initiative](https://www.medizininformatik-initiative.de/fhir/core/modul-fall/StructureDefinition/KontaktGesundheitseinrichtung)
Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. |
| [ ISiKKopfumfang  ](StructureDefinition-ISiKKopfumfang.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über den Kopfumfang eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK.**Motivation**Die Erfassung und Überwachung des Kopfumfangs ist essenziell für die Beurteilung von Wachstumsprozessen, insbesondere bei Säuglingen und Kleinkindern, sowie für die frühzeitige Erkennung von Entwicklungsauffälligkeiten oder neurologischen Erkrankungen.In FHIR wird der Kopfumfang mit der Observation-Ressource repräsentiert.**Kompatibilität**Das Profil ISiKKopfumfang ist vom Profil [VitalSignDE_Kopfumfang](http://fhir.de/StructureDefinition/observation-de-vitalsign-kopfumfang) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Head Circumference Profile](http://hl7.org/fhir/StructureDefinition/headcircum) aus der FHIR R4 Spezifikation. |
| [ ISiKLaboruntersuchung  ](StructureDefinition-ISiKLaboruntersuchung.md) | Dieses Profil ermöglicht die Abbildung von Informationen zur Laboruntersuchungen eines Patienten in ISiK Szenarien. Es dient primär als Vorlage, von der spezifische Laboruntersuchungs-Profile abgeleitet werden, kann aber grundsätzlich auch zur Repräsentation von nicht weiter ausspezifizierten Laboruntersuchungen genutzt werden.Viele medizinischen Entscheidungen benötigen Informationen zu den Laboruntersuchungen eines Patienten. Hierzu gehören z.B. aktuelle Nierenfunktionswerte, Leberwerte, Blutbildwerte oder Hormone aus Schilddrüse. Jede dieser Untersuchungen wird durch bestimmte [[https://loinc.org/ LOINC]] oder [[http://snomed.info/sct SNOMED CT]] Codes bezeichnet. Der angegebene Wert ist durch genaue Einheitenangaben in [[http://unitsofmeasure.org UCUM]] zu konkretitiseren. Motivierender Use-Case zur Einführung dieser Profile ist die [Arzneitmitteltherapiesicherheit im Krankenhaus - AMTS](https://gemspec.gematik.de/ig/fhir/isik/amts/6.0.0-rc1/UseCases.html).In FHIR werden Untersuchungen, bzw. Beobachtungen als [`Observation`](https://hl7.org/fhir/R4/observation.html)-Ressource repräsentiert. Zugehörige Codes und Einheiten sind den entsprechenden Valuessets zu entnehmen. |
| [ ISiKLaboruntersuchungCRP  ](StructureDefinition-ISiKLaboruntersuchungCRP.md) | Dieses Profil ermöglicht die Abbildung der Laboruntersuchung des C-reaktiven Proteins (CRP) eines Patienten in ISiK Szenarien. |
| [ ISiKLaboruntersuchungGFR  ](StructureDefinition-ISiKLaboruntersuchungGFR.md) | Dieses Profil ermöglicht die Abbildung der Laboruntersuchung der Glomerulären Filtrationsrate (GFR) eines Patienten in ISiK Szenarien. |
| [ ISiKLaboruntersuchungHb  ](StructureDefinition-ISiKLaboruntersuchungHb.md) | Dieses Profil ermöglicht die Abbildung der Laboruntersuchung des Hämoglobin-Wertes (Hb) eines Patienten in ISiK Szenarien. |
| [ ISiKLaboruntersuchungPCT  ](StructureDefinition-ISiKLaboruntersuchungPCT.md) | Dieses Profil ermöglicht die Abbildung der Laboruntersuchung des Procalcitonin (PCT) eines Patienten in ISiK Szenarien. |
| [ ISiKLaboruntersuchungSerumkreatinin  ](StructureDefinition-ISiKLaboruntersuchungSerumkreatinin.md) | Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Serumkreatinin eines Patienten in ISiK Szenarien. |
| [ ISiKLaboruntersuchungSerumnatrium  ](StructureDefinition-ISiKLaboruntersuchungSerumnatrium.md) | Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Serumnatrium eines Patienten in ISiK Szenarien. Das Profil wird u. A. im Use Case zur Unterstützung von Transplantationsbeauftragten bei der Organspendeerkennung eingesetzt; besonders in diesem Kontext muss es auch Werte abbilden, die im Rahmen von Messungen mittels Point-of-Care-Testing erhoben wurden. Das Profil ist auch geeignet, um Serumnatrium Werte abzubilden, die mittels Laboruntersuchung erhoben wurden.Eine eindeutige Kennzeichnung für die Differenzierung hinsichtlich der Erhebungsmethode ist derzeit über dieses Profil nicht vorgesehen. Es kann jedoch das Element .method verwendet werden. Die Differenzierung aufgrund der Methode kann unter Umständen sinnvoll sein, wenn im Falle einer Laboruntersuchung ein Arzt die Werte zuerst sichten und bestätigen müsste, bevor sie im PDMS als 'final' für den Patienten hinterlegt werden. |
| [ ISiKLaboruntersuchungTSH  ](StructureDefinition-ISiKLaboruntersuchungTSH.md) | Dieses Profil ermöglicht die Abbildung der Laboruntersuchung des Thyreoidea-stimulierenden Hormons (TSH) eines Patienten in ISiK Szenarien. |
| [ ISiKLaboruntersuchungThrombozyten  ](StructureDefinition-ISiKLaboruntersuchungThrombozyten.md) | Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Thrombozyten eines Patienten in ISiK Szenarien. |
| [ ISiKLaboruntersuchungTroponin  ](StructureDefinition-ISiKLaboruntersuchungTroponin.md) | Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Troponin eines Patienten in ISiK Szenarien. |
| [ ISiKPatient  ](StructureDefinition-ISiKPatient.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von administrativen Patientendaten im Rahmen des Bestätigungsverfahrens der gematik. **Motivation**: Der Austausch administrativer Patientendaten ist eine der grundlegenden Funktionalitäten beim Datenaustausch in der klinischen Versorgung. In FHIR werden sämtliche klinischen Ressourcen durch Verlinkung auf die Ressource 'Patient' in einen Patientenkontext gestellt. Die Herstellung des korrekten Patientenkontextes durch Suchen der Patientenressource anhand von Eigenschaften wie Aufnahmenummer, Name oder Geburtsdatum, die Anzeige der zutreffenden Suchergebnisse und der Auswahl bzw. Bestätigung des richtigen Datensatzes durch den Anwender steht am Beginn der meisten klinischen Workflows.**Kompatibilität**: Für das Profil ISIKPatient wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKPatient valide sind, auch valide sind gegen:* [Profil KBV_PR_Base_Patient der KBV Basisprofile](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Patient)
* [Profil Patient im International Patient Summary (IPS)](https://hl7.org/fhir/uv/ips/StructureDefinition-Patient-uv-ips.html)
* [Profil Patient der MI-Initiative](https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient)
Gegen folgende Profile ist das Profil ISiKPatient unmittelbar kompatibel:* [Profil TIPatient der gematik](https://gematik.de/fhir/ti/StructureDefinition/ti-patient)
Es ist zu beachten, dass das Profil ISiKPatient NICHT unmittelbar kompatibel mit folgenden Profilen ist:* [Profil EPAPatient der gematik](https://gematik.de/fhir/epa/StructureDefinition/epa-patient): In ISiK ist die Angabe einer KVNR nicht verpflichtend, da in vielen Use Cases bereits eine PID ausreichend ist. Außerdem ist in ISiK keine verpflichtende Versionierung über meta.versionId vorgesehen.
 |
| [ ISiKSauerstoffsaettigungArteriell  ](StructureDefinition-ISiKSauerstoffsaettigungArteriell.md) | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die arterielle Sauerstoffsättigung eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK.**Motivation**Die Erfassung und Überwachung der arteriellen Sauerstoffsättigung ist essenziell für die Beurteilung der respiratorischen Funktion, die Überwachung von Patienten mit Atemwegserkrankungen sowie die Unterstützung klinischer Entscheidungen, insbesondere in kritischen Versorgungssituationen.In FHIR wird die arterielle Sauerstoffsättigung mit der Observation-Ressource repräsentiert.**Kompatibilität**Das Profil ISiKSauerstoffsaettigungArteriell ist vom Profil [VitalSignDE_Arterielle_Sauerstoffsaettigung_Pulsoximetrie](http://fhir.de/StructureDefinition/observation-de-vitalsign-sauerstoffsaettigung-pulsoximetrie) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Oxygen Saturation Profile](http://hl7.org/fhir/StructureDefinition/oxygensat) aus der FHIR R4 Spezifikation. |

### Structures: Data Type Profiles 

These define constraints on FHIR data types for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [ ISiKCoding  ](StructureDefinition-ISiKCoding.md) | Data Type profile for Codings in ISiK |
| [ ISiKLoincCoding  ](StructureDefinition-ISiKLoincCoding.md) | Data Type profile for LOINC Codings in ISiK |
| [ ISiKSnomedCTCoding  ](StructureDefinition-ISiKSnomedCTCoding.md) | Data Type profile for Snomed-CT Codings in ISiK |

### Structures: Extension Definitions 

These define constraints on FHIR data types for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [ ExtensionISiKRehaEntlassung  ](StructureDefinition-ExtensionISiKRehaEntlassung.md) | Extension zur Dokumentation von Informationen nach §301 (4 und 4a) SGB V, entsprechend dem ärztliche Reha-Entlassungsbericht. Mit dieser Extension können spezifische Entlassungsinformationen im Kontext einer Rehabilitationsmaßnahme angegeben werden. Dies ist besonders relevant für Einrichtungen, die Leistungen im Bereich Rehabilitation erbringen, und unterstützt die strukturierte Kommunikation im Entlassmanagement. |
| [ ISiK CapabilityStatement Imports Expectation  ](StructureDefinition-ExtensionISiKCapabilityStatementImportsExpectation.md) | Defines the level of expectation associated with a given system capability. See the capabilitystatement-prohibited modifier extension to set expectations to **not** support a feature. |

### Terminology: Value Sets 

These define sets of codes used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [ ISiK Kerntemperatur SnomedCT ValueSet  ](ValueSet-ISiKKernTempSctVS.md) | ValueSet der Körperkerntemperatur SnomedCT Konzepte |
| [ ISiK Labor Methode  ](ValueSet-ISiKLaborMethodeVS.md) | SNOMED-CT-Codes für Untersuchungsmethoden im Labor (alle Konzepte unterhalb von #272394005 'Technique (qualifier value)'). |
| [ ISiK Laborbereich  ](ValueSet-ISiKLaborbereichVS.md) | LOINC-Codes zur Kategorisierung von Laboruntersuchungen nach Fachbereichen. |
| [ ISiK Specific Kerntemperatur LOINC ValueSet  ](ValueSet-ISiKSpecificKernTempLoincVS.md) | ValueSet der spezifischen Körperkerntemperatur LOINC Konzepte |
| [ ISiKBehandlungsergebnisRehaVS  ](ValueSet-ISiKBehandlungsergebnisReha.md) | Behandlungsergebnis Reha gemäß §301(4 UND 4A) SGB V. Diagnosenbezogene Bewertung des Behandlungsergebnisses für einen Versicherten/Berechtigten bei Entlassung aus der Reha-Maßnahme bzw. Stellung eines Antrags auf Verlängerung. Vgl. Schlüsseltabelle 2.71 Diagnose - Behandlungsergebnis. |
| [ ISiKBesondereBehandlungsformRehaVS  ](ValueSet-ISiKBesondereBehandlungsformReha.md) | Besondere Behandlungsform der Reha gemäß §301(4 UND 4A) SGB V. Vgl. Schlüsseltabelle 2.51 Besondere Behandlungsformen. |
| [ ISiKEncounterClassDE  ](ValueSet-ISiKEncounterClassDE.md) | Erweitert das ValueSet EncounterClassDE der Deutschen Basisprofile um die Codes ACUTE, NONAC und OBSENC aus dem HL7 v3 ActCode System zur Harmonisierung mit dem HL7 Europe Hospital Discharge Report (HDR). Ein Issue zur Aufnahme dieser Codes in EncounterClassDE wurde bei den Deutschen Basisprofilen eingereicht. |
| [ ISiKEncounterTypeErweiterungVS  ](ValueSet-ISiKEncounterTypeErweiterungVS.md) | ISiK vereint hierbei das ValueSet [KontaktArtDe](http://fhir.de/CodeSystem/kontaktart-de) aus dem deutschen Basisprofil und die übergangsweise hinzugefügten Codes für den ambulanten Kontakt im Krankenhaus. Dieses ValueSet ist als Übergangslösung zu verstehen, da die Inhalte beim TC Terminologien von HL7 eingebracht sind und sobald sie dort publiziert sind, wird eine Migration auf die dortigen Codes erfolgen. |
| [ ISiKEntlassformRehaVS  ](ValueSet-ISiKEntlassformReha.md) | ISiK Entlassform Reha. Beschreibt Form und ggf. Weiterbehandlung der Entlassung eines Versicherten/Berechtigten aus verwaltungs- und medizinischer Sicht. Vgl. Schlüsseltabelle 2.107 Entlassungsform. |
| [ ISiKUnterbrechungRehaVS  ](ValueSet-ISiKUnterbrechungReha.md) | ISiK Unterbrechung Reha. Dokumentiert die relevanten Gründe einer Unterbrechung einer Rehabilitationsmaßnahme im Einzelfall. Vgl. Schlüsseltabelle 2.111 Erläuterung zur Unterbrechung. |
| [ ObservationCodesCRP  ](ValueSet-ObservationCodesCRP.md) | Enthält LOINC-Codes für die Observation CRP |
| [ ObservationCodesGFR  ](ValueSet-ObservationCodesGFR.md) | Enthält LOINC-Codes für die Observation GFR |
| [ ObservationCodesHb  ](ValueSet-ObservationCodesHb.md) | Enthält LOINC-Codes für die Observation Hb |
| [ ObservationCodesPCT  ](ValueSet-ObservationCodesPCT.md) | Enthält LOINC-Codes für die Observation PCT |
| [ ObservationCodesSerumkreatinin  ](ValueSet-ObservationCodesSerumkreatinin.md) | Enthält LOINC-Codes für die Observation Serumkreatinin |
| [ ObservationCodesSerumnatrium  ](ValueSet-ObservationCodesSerumnatrium.md) | Enthält LOINC-Codes für die Observation Serumnatrium |
| [ ObservationCodesTSH  ](ValueSet-ObservationCodesTSH.md) | Enthält LOINC-Codes für die Observation TSH |
| [ ObservationCodesThrombozyten  ](ValueSet-ObservationCodesThrombozyten.md) | Enthält LOINC-Codes für die Observation Thrombozyten |
| [ ObservationCodesTroponin  ](ValueSet-ObservationCodesTroponin.md) | Enthält LOINC-Codes für die Observation Troponin |
| [ ObservationUnitsCRP  ](ValueSet-ObservationUnitsCRP.md) | Enthält UCUM-Einheiten für die Observation CRP |
| [ ObservationUnitsGFR  ](ValueSet-ObservationUnitsGFR.md) | Enthält UCUM-Einheiten für die Observation GFR |
| [ ObservationUnitsHb  ](ValueSet-ObservationUnitsHb.md) | Enthält UCUM-Einheiten für die Observation Hb |
| [ ObservationUnitsPCT  ](ValueSet-ObservationUnitsPCT.md) | Enthält UCUM-Einheiten für die Observation PCT |
| [ ObservationUnitsSerumkreatinin  ](ValueSet-ObservationUnitsSerumkreatinin.md) | Enthält UCUM-Einheiten für die Observation Serumkreatinin |
| [ ObservationUnitsSerumnatrium  ](ValueSet-ObservationUnitsSerumnatrium.md) | Enthält UCUM-Einheiten für die Observation Serumnatrium |
| [ ObservationUnitsTSH  ](ValueSet-ObservationUnitsTSH.md) | Enthält UCUM-Einheiten für die Observation TSH |
| [ ObservationUnitsThrombozyten  ](ValueSet-ObservationUnitsThrombozyten.md) | Enthält UCUM-Einheiten für die Observation Thrombozyten |
| [ ObservationUnitsTroponin  ](ValueSet-ObservationUnitsTroponin.md) | Enthält UCUM-Einheiten für die Observation Troponin |

### Terminology: Code Systems 

These define new code systems used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [ Erweiterung von Encounter.type in ISiK  ](CodeSystem-ISiKEncounterTypeErweiterungCS.md) | ISiK definiert an dieser Stelle eigene Encounter Typen. Dieses CodeSystem ist als Übergangslösung zu verstehen, da die Inhalte beim TC Terminologien von HL7 eingebracht sind und sobald sie dort publiziert sind, wird eine Migration auf die dortigen Codes erfolgen. |
| [ ISiKBehandlungsergebnisReha  ](CodeSystem-ISiKBehandlungsergebnisRehaCS.md) | Behandlungsergebnis Reha gemäß §301(4 UND 4A) SGB V. Diagnosenbezogene Bewertung des Behandlungsergebnisses für einen Versicherten/Berechtigten bei Entlassung aus der Reha-Maßnahme bzw. Stellung eines Antrags auf Verlängerung. Vgl. Schlüsseltabelle 2.71 Diagnose - Behandlungsergebnis. |
| [ ISiKBesondereBehandlungsformReha  ](CodeSystem-ISiKBesondereBehandlungsformRehaCS.md) | Besondere Behandlungsform der Reha gemäß §301(4 UND 4A) SGB V. Vgl. Schlüsseltabelle 2.51 Besondere Behandlungsformen. |
| [ ISiKEntlassformReha  ](CodeSystem-ISiKEntlassformRehaCS.md) | ISiK Entlassform Reha. Beschreibt Form und ggf. Weiterbehandlung der Entlassung eines Versicherten/Berechtigten aus verwaltungs- und medizinischer Sicht. Vgl. Schlüsseltabelle 2.107 Entlassungsform. |
| [ ISiKUnterbrechungReha  ](CodeSystem-ISiKUnterbrechungRehaCS.md) | ISiK Unterbrechung Reha. Dokumentiert die relevanten Gründe einer Unterbrechung einer Rehabilitationsmaßnahme im Einzelfall. Vgl. Schlüsseltabelle 2.111 Erläuterung zur Unterbrechung. |

### Other 

These are resources that are used within this implementation guide that do not fit into one of the other categories.

| |
| :--- |
| [ DorisQuelle  ](Patient-DorisQuelle.md) |
| [ DorisZiel  ](Patient-DorisZiel.md) |
| [ ExampleISiKLaboruntersuchungCRP1  ](Observation-ExampleISiKLaboruntersuchungCRP1.md) |
| [ ExampleISiKLaboruntersuchungGFR1  ](Observation-ExampleISiKLaboruntersuchungGFR1.md) |
| [ ExampleISiKLaboruntersuchungHb1  ](Observation-ExampleISiKLaboruntersuchungHb1.md) |
| [ ExampleISiKLaboruntersuchungMaximal  ](Observation-ExampleISiKLaboruntersuchungMaximal.md) |
| [ ExampleISiKLaboruntersuchungPCT1  ](Observation-ExampleISiKLaboruntersuchungPCT1.md) |
| [ ExampleISiKLaboruntersuchungSerumkreatinin1  ](Observation-ExampleISiKLaboruntersuchungSerumkreatinin1.md) |
| [ ExampleISiKLaboruntersuchungSerumnatrium1  ](Observation-ExampleISiKLaboruntersuchungSerumnatrium1.md) |
| [ ExampleISiKLaboruntersuchungTSH1  ](Observation-ExampleISiKLaboruntersuchungTSH1.md) |
| [ ExampleISiKLaboruntersuchungThrombozyten1  ](Observation-ExampleISiKLaboruntersuchungThrombozyten1.md) |
| [ ExampleISiKLaboruntersuchungTroponin1  ](Observation-ExampleISiKLaboruntersuchungTroponin1.md) |
| [ ExampleOrganSerumNatrium202003110104  ](Observation-ExampleOrganSerumNatrium202003110104.md) |
| [ ExampleOrganSerumNatrium202003110159  ](Observation-ExampleOrganSerumNatrium202003110159.md) |
| [ ExampleOrganSerumNatrium202003110306  ](Observation-ExampleOrganSerumNatrium202003110306.md) |
| [ ExtractedObservationKoerpergewicht  ](Observation-ExtractedObservationKoerpergewicht.md) |
| [ ExtractedObservationKoerpergroesse  ](Observation-ExtractedObservationKoerpergroesse.md) |
| [ Fachabteilungskontakt  ](Encounter-Fachabteilungskontakt.md) |
| [ FachabteilungskontaktBettenverlegung  ](Encounter-FachabteilungskontaktBettenverlegung.md) |
| [ FachabteilungskontaktEntlassung  ](Encounter-FachabteilungskontaktEntlassung.md) |
| [ FachabteilungskontaktFachbereichswechsel1  ](Encounter-FachabteilungskontaktFachbereichswechsel1.md) |
| [ FachabteilungskontaktFachbereichswechsel2  ](Encounter-FachabteilungskontaktFachbereichswechsel2.md) |
| [ FachabteilungskontaktMinimal2  ](Encounter-FachabteilungskontaktMinimal2.md) |
| [ FachabteilungskontaktNormal  ](Encounter-FachabteilungskontaktNormal.md) |
| [ FachabteilungskontaktStationaereAufnahme  ](Encounter-FachabteilungskontaktStationaereAufnahme.md) |
| [ FachabteilungskontaktStationswechsel1  ](Encounter-FachabteilungskontaktStationswechsel1.md) |
| [ FachabteilungskontaktStationswechsel2  ](Encounter-FachabteilungskontaktStationswechsel2.md) |
| [ ISiKAtemfrequenzExample  ](Observation-ISiKAtemfrequenzExample.md) |
| [ ISiKAtemfrequenzMaxExample  ](Observation-ISiKAtemfrequenzMaxExample.md) |
| [ ISiKAtemfrequenzMinExample  ](Observation-ISiKAtemfrequenzMinExample.md) |
| [ ISiKBlutdruckSystemischArteriellExample  ](Observation-ISiKBlutdruckSystemischArteriellExample.md) |
| [ ISiKBlutdruckSystemischArteriellMaxExample  ](Observation-ISiKBlutdruckSystemischArteriellMaxExample.md) |
| [ ISiKBlutdruckSystemischArteriellMinExample  ](Observation-ISiKBlutdruckSystemischArteriellMinExample.md) |
| [ ISiKEKGExample  ](Observation-ISiKEKGExample.md) |
| [ ISiKEKGMinExample  ](Observation-ISiKEKGMinExample.md) |
| [ ISiKGCSExample  ](Observation-ISiKGCSExample.md) |
| [ ISiKGCSMaxExample  ](Observation-ISiKGCSMaxExample.md) |
| [ ISiKGCSMinExample  ](Observation-ISiKGCSMinExample.md) |
| [ ISiKHerzfrequenzExample  ](Observation-ISiKHerzfrequenzExample.md) |
| [ ISiKHerzfrequenzMaxExample  ](Observation-ISiKHerzfrequenzMaxExample.md) |
| [ ISiKHerzfrequenzMinExample  ](Observation-ISiKHerzfrequenzMinExample.md) |
| [ ISiKKoerpergewichtExample  ](Observation-ISiKKoerpergewichtExample.md) |
| [ ISiKKoerpergewichtMaxExample  ](Observation-ISiKKoerpergewichtMaxExample.md) |
| [ ISiKKoerpergewichtMinExample  ](Observation-ISiKKoerpergewichtMinExample.md) |
| [ ISiKKoerpergroesseExample  ](Observation-ISiKKoerpergroesseExample.md) |
| [ ISiKKoerpergroesseMaxExample  ](Observation-ISiKKoerpergroesseMaxExample.md) |
| [ ISiKKoerpergroesseMinExample  ](Observation-ISiKKoerpergroesseMinExample.md) |
| [ ISiKKoerperkerntemperaturExample  ](Observation-ISiKKoerperkerntemperaturExample.md) |
| [ ISiKKoerperkerntemperaturMaxExample  ](Observation-ISiKKoerperkerntemperaturMaxExample.md) |
| [ ISiKKoerperkerntemperaturMinExample  ](Observation-ISiKKoerperkerntemperaturMinExample.md) |
| [ ISiKKopfumfangExample  ](Observation-ISiKKopfumfangExample.md) |
| [ ISiKKopfumfangMaxExample  ](Observation-ISiKKopfumfangMaxExample.md) |
| [ ISiKKopfumfangMinExample  ](Observation-ISiKKopfumfangMinExample.md) |
| [ ISiKSauerstoffsaettigungArteriellExample  ](Observation-ISiKSauerstoffsaettigungArteriellExample.md) |
| [ ISiKSauerstoffsaettigungArteriellMaxExample  ](Observation-ISiKSauerstoffsaettigungArteriellMaxExample.md) |
| [ ISiKSauerstoffsaettigungArteriellMinExample  ](Observation-ISiKSauerstoffsaettigungArteriellMinExample.md) |
| [ IsikPatientTemplate  ](Patient-IsikPatientTemplate.md) |
| [ PatientinMinimal  ](Patient-PatientinMinimal.md) |
| [ PatientinMusterfrau  ](Patient-PatientinMusterfrau.md) |
| [ PatientinNormal  ](Patient-PatientinNormal.md) |
| [ SZ1Nachstationaer  ](Encounter-SZ1Nachstationaer.md) |
| [ SZ1Patient  ](Patient-SZ1Patient.md) |
| [ SZ1Stationaer  ](Encounter-SZ1Stationaer.md) |
| [ SZ1Vorstationaer  ](Encounter-SZ1Vorstationaer.md) |
| [ SZ2Encounter  ](Encounter-SZ2Encounter.md) |
| [ SZ2Patient  ](Patient-SZ2Patient.md) |
| [ exp-params  ](Parameters-exp-params.md) |
| [ isik-encounter-Sternenfall  ](Encounter-isik-encounter-Sternenfall.md) |
| [ isik-patient-156722  ](Patient-isik-patient-156722.md) |

