# FHIR-Artefakte - ISiK Organspendeerkennung v6.0.0

ISiK Organspendeerkennung

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* **FHIR-Artefakte**

## FHIR-Artefakte

Auf dieser Seite befindet sich eine Liste der FHIR-Artefakte, welche im Rahmen dieses Implementation Guide definiert werden.

### CapabilityStatements

#### Akteure

| | |
| :--- | :--- |
| [ ISiK CapabilityStatement Organspendeerkennung Server (Expanded) ](CapabilityStatement-ISiKCapabilityStatementOrganspendeerkennungSourceAkteur-expanded.md) | Das vorliegende CapabilityStatement fasst die Rollen (und entsprechende Interaktionen) zusammen, die ein Akteur für die Organspendeerkennung zur Unterstützung des Organspendeerkennungs-Workflows implementieren muss.Zur Implementierung der Interaktionen sind insbesondere die zu implementierenden Rollen (siehe 'imports' in der CapabilityStatement-Ressource) zu beachten.**HISTORIE:****Historie**: mit der Version 6.0.0-rc des IG Organspendeerkennung wurde das vorliegende CapabilityStatement im Sinne eines eigenständigen Akteurs erstellt und damit ein eigenständiger Schnittstellen-Akteur für die Bereitstellung von Vitalparametern im Kontext der Organspendeerkennung etabliert - samt neuer Funktionalität in der Abfrage. |
| [ ISiK CapabilityStatement Organspendeerkennung Server ](CapabilityStatement-ISiKCapabilityStatementOrganspendeerkennungSourceAkteur.md) | Das vorliegende CapabilityStatement fasst die Rollen (und entsprechende Interaktionen) zusammen, die ein Akteur für die Organspendeerkennung zur Unterstützung des Organspendeerkennungs-Workflows implementieren muss.Zur Implementierung der Interaktionen sind insbesondere die zu implementierenden Rollen (siehe 'imports' in der CapabilityStatement-Ressource) zu beachten.**HISTORIE:****Historie**: mit der Version 6.0.0-rc des IG Organspendeerkennung wurde das vorliegende CapabilityStatement im Sinne eines eigenständigen Akteurs erstellt und damit ein eigenständiger Schnittstellen-Akteur für die Bereitstellung von Vitalparametern im Kontext der Organspendeerkennung etabliert - samt neuer Funktionalität in der Abfrage. |

**Tabelle:**Capability Statements - Akteure

#### Rollen

| | |
| :--- | :--- |
| [ CapabilityStatement für Rolle ISiKCapabilityStatementErweiterteStammdatenRolle ](CapabilityStatement-ISiKCapabilityStatementErweiterteStammdatenRolle.md) | CapabilityStatement für die Rolle ISiKCapabilityStatementErweiterteStammdatenRolle. Diese Rolle stellt erweiterte Interaktionen zur Abfrage von Stammdaten bereit. |
| [ ISiK CapabilityStatement Organspendeerkennung Source Rolle ](CapabilityStatement-ISiKCapabilityStatementOrganspendeerkennungSourceRolle.md) | Das vorliegende CapabilityStatement beschreibt verpflichtende Interaktionen, die ein ISiK-konformes System oder eine Systemkomponenten in der Rolle 'Organspendeerkennung Source Minimal' zur Unterstützung des Organspendeerkennungs-Workflows implementieren muss.Die Interaktionen umfassen die Bereitstellung von Vitalparametern, die für eine IHA-Diagnostik wesentlich sind.**HISTORIE:****Historie**: mit der Version 6.0.0-rc des IG Organspendeerkennung wurde das vorliegende CapabilityStatement im Sinne einer eigenständigen Rolle erstellt. |
| [ CapabilityStatement für Rolle StammdatenRolle ](CapabilityStatement-ISiKCapabilityStatementStammdatenRolle.md) | CapabilityStatement für die Rolle ISiKCapabilityStatementStammdatenRolle. Diese Rolle beschreibt Interaktionen zum Abruf und der Verarbeitung grundlegender Stammdaten. |

**Tabelle:**Capability Statements - Rollen

### Profile

#### Datentyp-Profile

| | | |
| :--- | :--- | :--- |
| [ ISiKCoding (Coding) ](StructureDefinition-ISiKCoding.md) | Coding | Data Type profile for Codings in ISiK |
| [ ISiKLoincCoding (ISiKCoding) ](StructureDefinition-ISiKLoincCoding.md) | Coding | Data Type profile for LOINC Codings in ISiK |
| [ ISiKSnomedCTCoding (ISiKCoding) ](StructureDefinition-ISiKSnomedCTCoding.md) | Coding | Data Type profile for Snomed-CT Codings in ISiK |

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
| [ ISiKGCS (ScoreDE_GCS) ](StructureDefinition-ISiKGCS.md) | Observation | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über den Glasgow Coma Scale (GCS) Score eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK.**Motivation**Die Erfassung und Überwachung des Bewusstseinszustands anhand des GCS ist essenziell für die Beurteilung neurologischer Funktionen, die Überwachung von Patienten mit Schädel-Hirn-Trauma oder anderen neurologischen Erkrankungen sowie die Unterstützung klinischer Entscheidungen.In FHIR wird der GCS-Score mit der Observation-Ressource repräsentiert, wobei die einzelnen Komponenten der Skala - Augenöffnung, verbale Reaktion und motorische Reaktion - als Component-Elemente abgebildet werden.**Kompatibilität**Das Profil ISiKGCS ist vom Profil [ScoreDE_GCS](http://fhir.de/StructureDefinition/observation-de-score-gcs) aus den deutschen Basisprofilen abgeleitet. |
| [ ISiKLaboruntersuchung (Observation) ](StructureDefinition-ISiKLaboruntersuchung.md) | Observation | Dieses Profil ermöglicht die Abbildung von Informationen zur Laboruntersuchungen eines Patienten in ISiK Szenarien. Es dient primär als Vorlage, von der spezifische Laboruntersuchungs-Profile abgeleitet werden, kann aber grundsätzlich auch zur Repräsentation von nicht weiter ausspezifizierten Laboruntersuchungen genutzt werden.Viele medizinischen Entscheidungen benötigen Informationen zu den Laboruntersuchungen eines Patienten. Hierzu gehören z.B. aktuelle Nierenfunktionswerte, Leberwerte, Blutbildwerte oder Hormone aus Schilddrüse. Jede dieser Untersuchungen wird durch bestimmte [[https://loinc.org/ LOINC]] oder [[http://snomed.info/sct SNOMED CT]] Codes bezeichnet. Der angegebene Wert ist durch genaue Einheitenangaben in [[http://unitsofmeasure.org UCUM]] zu konkretitiseren. Motivierender Use-Case zur Einführung dieser Profile ist die [Arzneitmitteltherapiesicherheit im Krankenhaus - AMTS](https://gemspec.gematik.de/ig/fhir/isik/amts/6.0.0-rc1/UseCases.html).In FHIR werden Untersuchungen, bzw. Beobachtungen als [`Observation`](https://hl7.org/fhir/R4/observation.html)-Ressource repräsentiert. Zugehörige Codes und Einheiten sind den entsprechenden Valuessets zu entnehmen. |
| [ ISiKLaboruntersuchungSerumnatrium (ISiKLaboruntersuchung) ](StructureDefinition-ISiKLaboruntersuchungSerumnatrium.md) | Observation | Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Serumnatrium eines Patienten in ISiK Szenarien. Das Profil wird u. A. im Use Case zur Unterstützung von Transplantationsbeauftragten bei der Organspendeerkennung eingesetzt; besonders in diesem Kontext muss es auch Werte abbilden, die im Rahmen von Messungen mittels Point-of-Care-Testing erhoben wurden. Das Profil ist auch geeignet, um Serumnatrium Werte abzubilden, die mittels Laboruntersuchung erhoben wurden.Eine eindeutige Kennzeichnung für die Differenzierung hinsichtlich der Erhebungsmethode ist derzeit über dieses Profil nicht vorgesehen. Es kann jedoch das Element .method verwendet werden. Die Differenzierung aufgrund der Methode kann unter Umständen sinnvoll sein, wenn im Falle einer Laboruntersuchung ein Arzt die Werte zuerst sichten und bestätigen müsste, bevor sie im PDMS als 'final' für den Patienten hinterlegt werden. |
| [ MII PR ICU MUV zerebraler Perfusionsdruck (SD_MII_ICU_Monitoring_Und_Vitaldaten) ](StructureDefinition-mii-pr-icu-muv-zerebraler-perfusionsdruck.md) | Observation | Dieses Profil dient der spezialisierten Abbildung des zerebralen Perfusionsdrucks (ICP) in der Akutmedizin.Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/profiles/Monitoring%20und%20Vitaldaten/MII_PR_ICU_MUV_zerebraler_Perfusionsdruck.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 3.3.2026. |
| [ MII PR ICU Score RASS (Observation) ](StructureDefinition-mii-pr-icu-score-rass.md) | Observation | Dieses Profil dient der spezialisierten Abbildung des Richmond Agitation Sedation Scale (RASS) Scores in der Akutmedizin.In ISiK wird das Profil verwendet im Kontext des Implementierungsleitfadens zur Organspendeerkennung.Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/profiles/Scores/MII_PR_ICU_Score_RASS.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 13.3.2026. |
| [ MII PR ICU Untersuchung Pupillenbefund (Observation) ](StructureDefinition-mii-pr-icu-untersuchung-pupillenbefund.md) | Observation | Dieses Profil dient der Abbildung eines Pupillenbefunds, der als Panel die einzelnen Befunde zur Pupillenuntersuchung bündelt (Pupillengröße, Pupillenform, Pupillenlichtreaktion direkt/indirekt, Pupillensymmetrie).In ISiK wird das Profil verwendet im Kontext des Implementierungsleitfadens zur Organspendeerkennung.Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/profiles/Untersuchung/ - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 16.3.2026. |
| [ MII PR ICU Untersuchung Pupillenform (Observation) ](StructureDefinition-mii-pr-icu-untersuchung-pupillenform.md) | Observation | Dieses Profil dient der Abbildung der Pupillenform.In ISiK wird das Profil verwendet im Kontext des Implementierungsleitfadens zur Organspendeerkennung.Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/profiles/Untersuchung/ - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 16.3.2026. |
| [ MII PR ICU Untersuchung Pupillengroesse (Observation) ](StructureDefinition-mii-pr-icu-untersuchung-pupillengroesse.md) | Observation | Dieses Profil dient der Abbildung der Pupillengröße.In ISiK wird das Profil verwendet im Kontext des Implementierungsleitfadens zur Organspendeerkennung.Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/profiles/Untersuchung/ - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 16.3.2026. |
| [ MII PR ICU Untersuchung Pupillenlichtreaktion Direkt (Observation) ](StructureDefinition-mii-pr-icu-untersuchung-pupillenlichtreaktion-direkt.md) | Observation | Dieses Profil dient der Abbildung der direkten Pupillenlichtreaktion.In ISiK wird das Profil verwendet im Kontext des Implementierungsleitfadens zur Organspendeerkennung.Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/profiles/Untersuchung/MII_PR_ICU_Untersuchung_Pupillenlichtreaktion_Direkt.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 13.3.2026. |
| [ MII PR ICU Untersuchung Pupillenlichtreaktion Indirekt (Observation) ](StructureDefinition-mii-pr-icu-untersuchung-pupillenlichtreaktion-indirekt.md) | Observation | Dieses Profil dient der Abbildung der indirekten Pupillenlichtreaktion.In ISiK wird das Profil verwendet im Kontext des Implementierungsleitfadens zur Organspendeerkennung.Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/profiles/Untersuchung/ - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 16.3.2026. |
| [ MII PR ICU Untersuchung Pupillensymmetrie (Observation) ](StructureDefinition-mii-pr-icu-untersuchung-pupillensymmetrie.md) | Observation | Dieses Profil dient der Abbildung der Pupillensymmetrie.In ISiK wird das Profil verwendet im Kontext des Implementierungsleitfadens zur Organspendeerkennung.Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/profiles/Untersuchung/ - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 16.3.2026. |
| [ MII PR ICU Spontane Atemfrequenz Beatmet (MII_PR_ICU_Parameter_Von_Beatmung) ](StructureDefinition-mii-pr-icu-vent-spontane-atemfrequenz-beatmet.md) | Observation | Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/profiles/Beatmungswerte - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 16.03.2026 |
| [ MII PR ICU Spontanes Atemzugvolumen (MII_PR_ICU_Parameter_Von_Beatmung) ](StructureDefinition-mii-pr-icu-vent-spontanes-atemzugvolumen.md) | Observation | Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/profiles/Beatmungswerte - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 16.03.2026 |
| [ MII PR ICU Unterstuezungsdruck Beatmung (MII_PR_ICU_Parameter_Von_Beatmung) ](StructureDefinition-mii-pr-icu-vent-unterstuezungsdruck-beatmung.md) | Observation | Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/profiles/Beatmungswerte - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 16.03.2026 |
| [ MII PR ICU Parameter von Beatmung (Observation) ](StructureDefinition-mii-pr-vent-icu-parameter-von-beatmung.md) | Observation | Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/profiles/Beatmungswerte - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 16.03.2026 |
| [ SD MII ICU Intrakranieller Druck ICP (SD_MII_ICU_Monitoring_Und_Vitaldaten) ](StructureDefinition-sd-mii-icu-intrakranieller-druck-icp.md) | Observation | Dieses Profil dient der spezialisierten Abbildung des intrakraniellen Drucks (ICP) in der Akutmedizin. |
| [ SD MII ICU Monitoring und Vitaldaten (Observation) ](StructureDefinition-sd-mii-icu-monitoring-und-vitaldaten.md) | Observation | Dieses Profil dient als Abstraktionsprofil für verschiedene spezialisierte Beobachtungen in der Akutmedizin zur Abbildung von Monitoring- und Vitaldaten. |
| [ ISiKPatient (Patient) ](StructureDefinition-ISiKPatient.md) | Patient | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von administrativen Patientendaten im Rahmen des Bestätigungsverfahrens der gematik. **Motivation**: Der Austausch administrativer Patientendaten ist eine der grundlegenden Funktionalitäten beim Datenaustausch in der klinischen Versorgung. In FHIR werden sämtliche klinischen Ressourcen durch Verlinkung auf die Ressource 'Patient' in einen Patientenkontext gestellt. Die Herstellung des korrekten Patientenkontextes durch Suchen der Patientenressource anhand von Eigenschaften wie Aufnahmenummer, Name oder Geburtsdatum, die Anzeige der zutreffenden Suchergebnisse und der Auswahl bzw. Bestätigung des richtigen Datensatzes durch den Anwender steht am Beginn der meisten klinischen Workflows.**Kompatibilität**: Für das Profil ISIKPatient wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKPatient valide sind, auch valide sind gegen:* [Profil KBV_PR_Base_Patient der KBV Basisprofile](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Patient)
* [Profil Patient im International Patient Summary (IPS)](https://hl7.org/fhir/uv/ips/StructureDefinition-Patient-uv-ips.html)
* [Profil Patient der MI-Initiative](https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient)
Gegen folgende Profile ist das Profil ISiKPatient unmittelbar kompatibel:* [Profil TIPatient der gematik](https://gematik.de/fhir/ti/StructureDefinition/ti-patient)
Es ist zu beachten, dass das Profil ISiKPatient NICHT unmittelbar kompatibel mit folgenden Profilen ist:* [Profil EPAPatient der gematik](https://gematik.de/fhir/epa/StructureDefinition/epa-patient): In ISiK ist die Angabe einer KVNR nicht verpflichtend, da in vielen Use Cases bereits eine PID ausreichend ist. Außerdem ist in ISiK keine verpflichtende Versionierung über meta.versionId vorgesehen.
 |
| [ ISiKProzedur (Procedure) ](StructureDefinition-ISiKProzedur.md) | Procedure | Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Behandlungen/Prozeduren eines Patienten im Rahmen des Bestätigungsverfahrens der gematik.**Motivation**Die Möglichkeit auf eine Übersicht der Prozeduren eines Patienten zuzugreifen, Patienten anhand durchgeführter oder geplanter Prozeduren zu suchen, oder zu prüfen, ob eine konkrete Prozedur bei einem Patienten durchgeführt wurde, sind wichtige Funktionen im klinischen Behandlungsablauf.In FHIR werden Prozeduren mit der Procedure-Ressource repräsentiert.Da die Prozeduren in klinischen Primärsystemen, in der Regel, in OPS-codierter Form vorliegen, fordert ISiK in erster Linie diese Form des Austausches. Falls eine Prozedur zwar dokumentiert aber noch nicht codiert wurde (z.B. wenn die Kodierung erst nach der Entlassung erfolgt), ist alternativ eine Repräsentation als Freitext-Prozedur möglich.**Kompatibilität**Für das Profil ISIKProzedur wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKProzedur valide sind, auch valide sind gegen:* [Profil Prozedur](https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure) der Medizininformatik Initiative
 Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden.
 |
| [ ISiK Prozedur Beatmung (ISiKProzedur) ](StructureDefinition-ISiKProzedurBeatmung.md) | Procedure | Dieses Profil dient der Abbildung von Beatmungsmaßnahmen in der Akutmedizin.Die verwendeten ValueSets in diesem Profil wurden dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/profiles/Beatmungswerte/MII_PR_ICU_Beatmung.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Als Parent wurde der letzte Stand des Prozedur-Profils der MII gewählt. Stand 4.3.2026. |
| [ ISiK Prozedur Reanimation (ISiKProzedur) ](StructureDefinition-ISiKProzedurReanimation.md) | Procedure | Dieses Profil dient der Abbildung von Reanimationsmaßnahmen - insbesondere in der Akutmedizin. |

**Tabelle:**Ressourcen-Profile

### Terminologien

#### Value Sets

| | |
| :--- | :--- |
| [ ISiKBehandlungsergebnisRehaVS ](ValueSet-ISiKBehandlungsergebnisReha.md) | Behandlungsergebnis Reha gemäß §301(4 UND 4A) SGB V. Diagnosenbezogene Bewertung des Behandlungsergebnisses für einen Versicherten/Berechtigten bei Entlassung aus der Reha-Maßnahme bzw. Stellung eines Antrags auf Verlängerung. Vgl. Schlüsseltabelle 2.71 Diagnose - Behandlungsergebnis. |
| [ ISiKBesondereBehandlungsformRehaVS ](ValueSet-ISiKBesondereBehandlungsformReha.md) | Besondere Behandlungsform der Reha gemäß §301(4 UND 4A) SGB V. Vgl. Schlüsseltabelle 2.51 Besondere Behandlungsformen. |
| [ ISiKEncounterClassDE ](ValueSet-ISiKEncounterClassDE.md) | Erweitert das ValueSet EncounterClassDE der Deutschen Basisprofile um die Codes ACUTE, NONAC und OBSENC aus dem HL7 v3 ActCode System zur Harmonisierung mit dem HL7 Europe Hospital Discharge Report (HDR). Ein Issue zur Aufnahme dieser Codes in EncounterClassDE wurde bei den Deutschen Basisprofilen eingereicht. |
| [ ISiKEncounterTypeErweiterungVS ](ValueSet-ISiKEncounterTypeErweiterungVS.md) | ISiK vereint hierbei das ValueSet [KontaktArtDe](http://fhir.de/CodeSystem/kontaktart-de) aus dem deutschen Basisprofil und die übergangsweise hinzugefügten Codes für den ambulanten Kontakt im Krankenhaus. Dieses ValueSet ist als Übergangslösung zu verstehen, da die Inhalte beim TC Terminologien von HL7 eingebracht sind und sobald sie dort publiziert sind, wird eine Migration auf die dortigen Codes erfolgen. |
| [ ISiKEntlassformRehaVS ](ValueSet-ISiKEntlassformReha.md) | ISiK Entlassform Reha. Beschreibt Form und ggf. Weiterbehandlung der Entlassung eines Versicherten/Berechtigten aus verwaltungs- und medizinischer Sicht. Vgl. Schlüsseltabelle 2.107 Entlassungsform. |
| [ ISiK Labor Methode ](ValueSet-ISiKLaborMethodeVS.md) | SNOMED-CT-Codes für Untersuchungsmethoden im Labor (alle Konzepte unterhalb von #272394005 'Technique (qualifier value)'). |
| [ ISiK Laborbereich ](ValueSet-ISiKLaborbereichVS.md) | LOINC-Codes zur Kategorisierung von Laboruntersuchungen nach Fachbereichen. |
| [ ISiKUnterbrechungRehaVS ](ValueSet-ISiKUnterbrechungReha.md) | ISiK Unterbrechung Reha. Dokumentiert die relevanten Gründe einer Unterbrechung einer Rehabilitationsmaßnahme im Einzelfall. Vgl. Schlüsseltabelle 2.111 Erläuterung zur Unterbrechung. |
| [ ObservationCodesSerumnatrium ](ValueSet-ObservationCodesSerumnatrium.md) | Enthält LOINC-Codes für die Observation Serumnatrium |
| [ ObservationUnitsSerumnatrium ](ValueSet-ObservationUnitsSerumnatrium.md) | Enthält UCUM-Einheiten für die Observation Serumnatrium |
| [ ProzedurenCodesSCT ](ValueSet-ProzedurenCodesSCT.md) | Enthaelt alle SNOMED Procedure Codes |
| [ ProzedurenKategorieSCT ](ValueSet-ProzedurenKategorieSCT.md) | Enthaelt alle SNOMED Codes für ein Mapping der OPS Klassentitel |
| [ ProzedurenReanimationCodesOPS ](ValueSet-ProzedurenReanimationCodesOPS.md) | Enthaelt alle OPS Procedure Codes für Reanimationsmaßnahmen |
| [ ProzedurenReanimationCodesSCT ](ValueSet-ProzedurenReanimationCodesSCT.md) | Enthaelt alle SNOMED Procedure Codes für Reanimationsmaßnahmen |
| [ MII VS ICU BodySite Observation Beatmung ](ValueSet-mii-vs-icu-body-site-observation-beatmung.md) | Dieses ValueSet enthält Codes für bodySites für die im Kontext einer Beatmung eingestellten oder gemessenen Parametern. Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 16.03.2026 |
| [ MII VS ICU BodySite Observation Pupillenbefund ](ValueSet-mii-vs-icu-bodysite-observation-pupillenbefund.md) |  Zulaessige Koerperstellen fuer lateralisierte Pupillenbefunde: linke oder rechte Pupille. Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets/MII_VS_ICU_BodySite_Observation_Pupillenbefund.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 04.03.2026 |
| [ MII VS ICU Category Procedure Beatmung SNOMED ](ValueSet-mii-vs-icu-category-procedure-beatmung-snomed.md) | Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets/MII_VS_ICU_Category_Beatmung_SNOMED.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 04.03.2026 |
| [ MII VS ICU Code Observation Beatmung ISO11073 ](ValueSet-mii-vs-icu-code-observation-beatmung-loinc-iso11073.md) | Dieses ValueSet enthält Codes für die im Kontext einer Beatmung verwendeten Parameter. Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 16.03.2026 |
| [ MII VS ICU Code Observation Beatmung LOINC ](ValueSet-mii-vs-icu-code-observation-beatmung-loinc.md) | Dieses ValueSet enthält Codes für die im Kontext einer Beatmung verwendeten Parameter. Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 16.03.2026 |
| [ MII VS ICU Code Observation Beatmung SNOMED ](ValueSet-mii-vs-icu-code-observation-beatmung-snomed.md) | Dieses ValueSet enthält Codes für die im Kontext einer Beatmung verwendeten Parameter. Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 16.03.2026 |
| [ MII VS ICU Code Observation Pupillengroesse ](ValueSet-mii-vs-icu-code-observation-pupillengroesse.md) | Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets/ - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 16.03.2026 |
| [ MII VS ICU Code Observation Pupillenlichtreaktion ](ValueSet-mii-vs-icu-code-observation-pupillenlichtreaktion.md) | Subset der LOINC AnswerList LL3762-3 fuer die Pupillen-Lichtreaktion: reaktiv, traege reaktiv, nicht reaktiv. Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets/MII_VS_ICU_Code_Observation_Pupillenlichtreaktion.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 04.03.2026 |
| [ MII VS ICU Code Observation Pupillensymmetrie ](ValueSet-mii-vs-icu-code-observation-pupillensymmetrie.md) | Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets/MII_VS_ICU_Code_Observation_Pupillenlichtreaktion.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 04.03.2026 |
| [ MII VS ICU Code Observation Pupillenform LOINC ](ValueSet-mii-vs-icu-code-oservation-pupillenform-loinc.md) | Kategoriale Beurteilung der Pupillenform/Regularitaet: regelmaessig (rund) oder unregelmaessig. Zulaessig sind SNOMED-Findings und/oder LOINC-Antwortcodes. Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets/ - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 16.03.2026 |
| [ MII VS ICU Code Procedure Beatmung SNOMED ](ValueSet-mii-vs-icu-code-procedure-beatmung-snomed.md) | Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets/MII_VS_ICU_Code_Procedure_Beatmung_SNOMED.fsh# - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 04.03.2026 |
| [ MII VS ICU Score RASS ](ValueSet-mii-vs-icu-score-rass.md) | Value set for RASS Score Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets/MII_VS_ICU_Score_RASS.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 3.3.2026 |
| [ VS MII ICU BodySite Observation Monitoring und Vitaldaten ](ValueSet-vs-mii-icu-bodysite-observation-monitoring-und-vitaldaten.md) | Dieses ValueSet enthält Codes für bodySites von Vitaldaten sowie Daten aus dem Patientenmonitoring. |
| [ VS MII ICU Code Monitoring und Vitaldaten [ISO11073] ](ValueSet-vs-mii-icu-code-monitoring-und-vitaldaten-iso11073.md) | Dieses ValueSet enthält Codes für Vitaldaten sowie Daten aus dem Patientenmonitoring. |
| [ VS MII ICU Code Monitoring und Vitaldaten [LOINC] ](ValueSet-vs-mii-icu-code-monitoring-und-vitaldaten-loinc.md) | Dieses ValueSet enthält Codes für Vitaldaten sowie Daten aus dem Patientenmonitoring. |
| [ VS MII ICU Code Monitoring und Vitaldaten [sct] ](ValueSet-vs-mii-icu-code-monitoring-und-vitaldaten-snomed.md) | Dieses ValueSet enthaelt Codes fuer Vitaldaten sowie Daten aus dem Patientenmonitoring. |

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

* [KrankenhausStandortBeispiel](Location-KrankenhausStandortBeispiel.md)
* [StationICUStandortBeispiel](Location-StationICUStandortBeispiel.md)
* [StationPediaICUStandortBeispiel](Location-StationPediaICUStandortBeispiel.md)
* [StationStandortBeispiel](Location-StationStandortBeispiel.md)
* [isik-station-anaesthesie](Location-isik-station-anaesthesie.md)

**Observation**

* [ExampleISiKLaboruntersuchungMaximal](Observation-ExampleISiKLaboruntersuchungMaximal.md)
* [ExampleISiKLaboruntersuchungSerumnatrium1](Observation-ExampleISiKLaboruntersuchungSerumnatrium1.md)
* [ExampleOrganPupilLightReactionLeft20200311](Observation-ExampleOrganPupilLightReactionLeft20200311.md)
* [ExampleOrganPupilLightReactionLeftPrompt20200311](Observation-ExampleOrganPupilLightReactionLeftPrompt20200311.md)
* [ExampleOrganPupilLightReactionLeftVerzogert20200311](Observation-ExampleOrganPupilLightReactionLeftVerzogert20200311.md)
* [ExampleOrganPupilLightReactionRight20200311](Observation-ExampleOrganPupilLightReactionRight20200311.md)
* [ExampleOrganPupilLightReactionRightKeine20200311](Observation-ExampleOrganPupilLightReactionRightKeine20200311.md)
* [ExampleOrganRASS20200311](Observation-ExampleOrganRASS20200311.md)
* [ExampleOrganSerumNatrium202003110104](Observation-ExampleOrganSerumNatrium202003110104.md)
* [ExampleOrganSerumNatrium202003110159](Observation-ExampleOrganSerumNatrium202003110159.md)
* [ExampleOrganSerumNatrium202003110306](Observation-ExampleOrganSerumNatrium202003110306.md)
* [ISiKGCSExample](Observation-ISiKGCSExample.md)
* [ISiKGCSMaxExample](Observation-ISiKGCSMaxExample.md)
* [ISiKGCSMinExample](Observation-ISiKGCSMinExample.md)
* [Intrakranieller-Druck-ICP](Observation-Intrakranieller-Druck-ICP.md)

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

**Procedure**

* [Appendektomie](Procedure-Appendektomie.md)
* [ExampleOrganVentilationMode20200311](Procedure-ExampleOrganVentilationMode20200311.md)
* [ExampleOrganVentilationModeASV](Procedure-ExampleOrganVentilationModeASV.md)
* [ExampleOrganVentilationModeBiLev](Procedure-ExampleOrganVentilationModeBiLev.md)
* [ExampleOrganVentilationModeNIV](Procedure-ExampleOrganVentilationModeNIV.md)
* [ExampleOrganVentilationModePCMod](Procedure-ExampleOrganVentilationModePCMod.md)
* [ExampleOrganVentilationModePSIMV](Procedure-ExampleOrganVentilationModePSIMV.md)
* [ExampleOrganVentilationModeSPNMod](Procedure-ExampleOrganVentilationModeSPNMod.md)
* [ExampleOrganVentilationModeStMod](Procedure-ExampleOrganVentilationModeStMod.md)
* [ExampleOrganVentilationModenC](Procedure-ExampleOrganVentilationModenC.md)
* [ReanimationBeispiel](Procedure-ReanimationBeispiel.md)

**Tabelle:**Beispiel-Instanzen

