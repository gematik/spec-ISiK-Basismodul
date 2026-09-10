# Artifacts Summary - ISiK Labor Implementierungsleitfaden v6.0.0

ISiK Labor Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Behavior: Capability Statements 

The following artifacts define the specific capabilities that different types of systems are expected to have in order to comply with this implementation guide. Systems conforming to this implementation guide are expected to declare conformance to one or more of the following capability statements.

| | |
| :--- | :--- |
| [ ISiK CapabilityStatement Labor Minimal Rolle  ](CapabilityStatement-ISiKCapabilityStatementLaborMinimalRolle.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die [CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) mit den möglichen Werten `SHALL` (=MUSS) und `MAY` (=KANN) verwendet. |
| [ ISiK CapabilityStatement Labor Minimal Rolle (Expanded)  ](CapabilityStatement-ISiKCapabilityStatementLaborMinimalRolle-expanded.md) | Dieses CapabilityStatement beschreibt alle Interaktionen, die ein System unterstützen MUSS, welches diese Rolle implementiert.Die CapabilityStatements in dieser Spezifikation stellen die Anforderungen seitens der gematik dar (`kind = requirements`). Zur Unterscheidung von Anforderungen, die erfüllt werden MÜSSEN gegenüber jenen, die erfüllt werden KÖNNEN, wird die [CapabilityStatement-Expectation-Extension](https://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) mit den möglichen Werten `SHALL` (=MUSS) und `MAY` (=KANN) verwendet. |

### Structures: Resource Profiles 

These define constraints on FHIR resources for systems conforming to this implementation guide.

| | |
| :--- | :--- |
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

### Structures: Data Type Profiles 

These define constraints on FHIR data types for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [ ISiKCoding  ](StructureDefinition-ISiKCoding.md) | Data Type profile for Codings in ISiK |
| [ ISiKLoincCoding  ](StructureDefinition-ISiKLoincCoding.md) | Data Type profile for LOINC Codings in ISiK |

### Terminology: Value Sets 

These define sets of codes used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [ ISiK Labor Methode  ](ValueSet-ISiKLaborMethodeVS.md) | SNOMED-CT-Codes für Untersuchungsmethoden im Labor (alle Konzepte unterhalb von #272394005 'Technique (qualifier value)'). |
| [ ISiK Laborbereich  ](ValueSet-ISiKLaborbereichVS.md) | LOINC-Codes zur Kategorisierung von Laboruntersuchungen nach Fachbereichen. |
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

### Other 

These are resources that are used within this implementation guide that do not fit into one of the other categories.

| |
| :--- |
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
| [ exp-params  ](Parameters-exp-params.md) |

