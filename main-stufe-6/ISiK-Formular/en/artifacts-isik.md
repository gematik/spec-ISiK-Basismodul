# FHIR-Artefakte - ISiK Formularmodul Implementation Guide v6.0.0

ISiK Formularmodul Implementation Guide

Version 6.0.0 - ballot 

* [**Table of Contents**](toc.md)
* **FHIR-Artefakte**

## FHIR-Artefakte

Auf dieser Seite befindet sich eine Liste der FHIR-Artefakte, welche im Rahmen dieses Implementation Guide definiert werden.

### CapabilityStatements

#### Akteure

Das CapabilityStatement mit der Kennzeichnung "Expanded" dient der direkten Übersicht aller zu implementierender Interaktionen und Profile.

| | |
| :--- | :--- |
| [ Akteur `ISiKCapabilityStatementFormularDatenQuelleAkteur` (Expanded) ](CapabilityStatement-ISiKCapabilityStatementFormularDatenQuelleAkteur-expanded.md) | CapabilityStatement für den Akteur `ISiKCapabilityStatementFormularDatenQuelleAkteur`. Dieser Akteur aggregiert die Rollen zur Abfrage von ausgefüllten Formularen, zur Datenbereitstellung für die Formularvorbelegung und zur Rückübermittlung von aus Formularen extrahierten Daten. Verpflichtend ist in diesem Kontext nur die Rolle `FormularDatenQuelleRolle` und `CompositionKonsumentenRolle`, die weiteren Rollen sind optional, da sie ggf. auch von anderen Akteuren bereitgestellt werden können. |
| [ Akteur `ISiKCapabilityStatementFormularDatenQuelleAkteur` ](CapabilityStatement-ISiKCapabilityStatementFormularDatenQuelleAkteur.md) | CapabilityStatement für den Akteur `ISiKCapabilityStatementFormularDatenQuelleAkteur`. Dieser Akteur aggregiert die Rollen zur Abfrage von ausgefüllten Formularen, zur Datenbereitstellung für die Formularvorbelegung und zur Rückübermittlung von aus Formularen extrahierten Daten. Verpflichtend ist in diesem Kontext nur die Rolle `FormularDatenQuelleRolle` und `CompositionKonsumentenRolle`, die weiteren Rollen sind optional, da sie ggf. auch von anderen Akteuren bereitgestellt werden können. |
| [ Akteur `ISiKCapabilityStatementFormularExtraktionAkteur` (Expanded) ](CapabilityStatement-ISiKCapabilityStatementFormularExtraktionAkteur-expanded.md) | CapabilityStatement für den Akteur `ISiKCapabilityStatementFormularExtraktionAkteur`. Dieser Akteur ist im Kontext des Moduls optional, da die Extraktion auch vom Akteur des FormularRenderers innerhalb seiner Implementierung bereitgestellt werden kann. Falls die Funktion ausgelagert wird, muss sie über die Operation `extract` auf dem ResourceType `QuestionnaireResponse` abgebildet sein. |
| [ Akteur `ISiKCapabilityStatementFormularExtraktionAkteur` ](CapabilityStatement-ISiKCapabilityStatementFormularExtraktionAkteur.md) | CapabilityStatement für den Akteur `ISiKCapabilityStatementFormularExtraktionAkteur`. Dieser Akteur ist im Kontext des Moduls optional, da die Extraktion auch vom Akteur des FormularRenderers innerhalb seiner Implementierung bereitgestellt werden kann. Falls die Funktion ausgelagert wird, muss sie über die Operation `extract` auf dem ResourceType `QuestionnaireResponse` abgebildet sein. |
| [ Akteur `ISiKCapabilityStatementFormularVorbelegungAkteur` (Expanded) ](CapabilityStatement-ISiKCapabilityStatementFormularVorbelegungAkteur-expanded.md) | CapabilityStatement für den Akteur `ISiKCapabilityStatementFormularVorbelegungAkteur`. Dieser Akteur ist im Kontext des Moduls optional, da die Vorbelegung auch vom Akteur des FormularRenderers innerhalb seiner Implementierung bereitgestellt werden kann. Falls die Funktion ausgelagert wird, muss sie über die Operation `prepopulate` auf dem ResourceType `QuestionnaireResponse` abgebildet sein. |
| [ Akteur `ISiKCapabilityStatementFormularVorbelegungAkteur` ](CapabilityStatement-ISiKCapabilityStatementFormularVorbelegungAkteur.md) | CapabilityStatement für den Akteur `ISiKCapabilityStatementFormularVorbelegungAkteur`. Dieser Akteur ist im Kontext des Moduls optional, da die Vorbelegung auch vom Akteur des FormularRenderers innerhalb seiner Implementierung bereitgestellt werden kann. Falls die Funktion ausgelagert wird, muss sie über die Operation `prepopulate` auf dem ResourceType `QuestionnaireResponse` abgebildet sein. |
| [ Akteur `ISiKCpSFormDefinitionsVerwalterAkteur` (Expanded) ](CapabilityStatement-ISiKCpSFormDefinitionsVerwalterAkteur-expanded.md) | CapabilityStatement für den Akteur `ISiKCpSFormDefinitionsVerwalterAkteur`. Dieser Akteur aggregiert die Rollen zur Abfrage von ausgefüllten Formularen, zur Datenbereitstellung für die Formularvorbelegung und zur Rückübermittlung von aus Formularen extrahierten Daten. Verpflichtend ist in diesem Kontext nur die Rolle `FormularDefinitionsVerwalterRolle` und `CompositionKonsumentenRolle`, die weiteren Rollen sind optional, da sie ggf. auch von anderen Akteuren bereitgestellt werden können. |
| [ Akteur `ISiKCpSFormDefinitionsVerwalterAkteur` ](CapabilityStatement-ISiKCpSFormDefinitionsVerwalterAkteur.md) | CapabilityStatement für den Akteur `ISiKCpSFormDefinitionsVerwalterAkteur`. Dieser Akteur aggregiert die Rollen zur Abfrage von ausgefüllten Formularen, zur Datenbereitstellung für die Formularvorbelegung und zur Rückübermittlung von aus Formularen extrahierten Daten. Verpflichtend ist in diesem Kontext nur die Rolle `FormularDefinitionsVerwalterRolle` und `CompositionKonsumentenRolle`, die weiteren Rollen sind optional, da sie ggf. auch von anderen Akteuren bereitgestellt werden können. |

**Tabelle:**Capability Statements - Akteure

#### Rollen

| | |
| :--- | :--- |
| [ CapabilityStatement für Rolle ISiKCapabilityStatementCompositionKonsumentenRolle ](CapabilityStatement-ISiKCapabilityStatementCompositionKonsumentenRolle.md) | CapabilityStatement für die Rolle ISiKCapabilityStatementCompositionKonsumentenRolle. Diese Rolle beschreibt verpflichtende Interaktionen zum Abruf und der Verarbeitung von ISiKBerichtBundles. |
| [ CapabilityStatement für Rolle `FormularDatenQuelleRolle` ](CapabilityStatement-ISiKCapabilityStatementFormularDatenQuelleRolle.md) | CapabilityStatement für die Rolle `ISiKCapabilityStatementFormularDatenQuelleRolle`. Diese Rolle stellt Interaktionen zur Abfrage von FormularenDaten bereit. Hierbei liegt der Fokus auf der Bereitstellung von ausgefüllten Formularen und nicht aus den Extrahierten Ressourcen. Diese sind in Rollen der anderen Module bereitgestellt. |
| [ CapabilityStatement für Rolle `FormularDefinitionsVerwalterRolle` ](CapabilityStatement-ISiKCapabilityStatementFormularDefinitionsVerwalterRolle.md) | CapabilityStatement für die Rolle `ISiKCapabilityStatementFormularDefinitionsVerwalterRolle`. Diese Rolle stellt Interaktionen zur Abfrage von Formularen bereit. |
| [ CapabilityStatement für Rolle `FormularExtraktionRolle` ](CapabilityStatement-ISiKCapabilityStatementFormularExtraktionRolle.md) | CapabilityStatement für Rolle `FormularExtraktionRolle` Diese Rolle stellt die Operation zur Extraktion von FormularenDaten bereit. |
| [ CapabilityStatement für Rolle `FormularVorbelegungRolle` ](CapabilityStatement-ISiKCapabilityStatementFormularVorbelegungRolle.md) | CapabilityStatement für die Rolle `FormularVorbelegungRolle`. Diese Rolle stellt die Operation zur Vorbelegung (Prepopulation) von Formularen bereit. |

**Tabelle:**Capability Statements - Rollen

### Profile

#### Datentyp-Profile

| | | |
| :--- | :--- | :--- |
| [ ISiKCoding (Coding) ](StructureDefinition-ISiKCoding.md) | Coding | Data Type profile for Codings in ISiK |
| [ ISiKLoincCoding (ISiKCoding) ](StructureDefinition-ISiKLoincCoding.md) | Coding | Data Type profile for LOINC Codings in ISiK |

**Tabelle:**Datentyp-Profile

#### Extensions

| | |
| :--- | :--- |
| [ ISiK CapabilityStatement Imports Expectation (Extension) ](StructureDefinition-ExtensionISiKCapabilityStatementImportsExpectation.md) | Defines the level of expectation associated with a given system capability. See the capabilitystatement-prohibited modifier extension to set expectations to **not** support a feature. |
| [ ISiKMpFormularExtension (Extension) ](StructureDefinition-ISiKMpFormularExtension.md) | Mit dieser Extension besteht die Möglichkeit anzugeben, dass das Formular innerhalb eines Medizinproduktes eingesetzt wird und eine Zweckbestimmung anzugeben ist. Die Interpretation der Zweckbestimmung und der daraus folgenden Konsequenzen für die eingesetzte Software liegt im Verantwortungsbereich des Software-Hersteller! |

**Tabelle:**Extensions

#### Ressourcen-Profile

| | | |
| :--- | :--- | :--- |
| [ ISiKBerichtBundle (Bundle) ](StructureDefinition-ISiKBerichtBundle.md) | Bundle | Das Document-Bundle dient dem Transport von Berichten zwischen Subsystemen im Krankenhaus. Das Bundle entspricht den Anforderungen an ein [FHIR Document Bundle](https://hl7.org/fhir/R4/documents.html) : Alle referenzierten Ressourcen müssen als Einträge im Bundle enthalten sein. Das Bundle unterstützt die Übermittlung einer menschenlesbaren Dokumentation (Narrative) und erlaubt zudem die Übernahme wichtiger Ressourcen (z. B. Diagnosen und Prozeduren), die einem Patienten und Fall (Patient, Encounter) zugeordnet sind. |
| [ ISiKBerichtSubSysteme (Composition) ](StructureDefinition-ISiKBerichtSubSysteme.md) | Composition | Dieses Profil ermöglicht die krankenhaus-interne Übermittlung eines Berichtes bestehend aus beliebigen strukturierten FHIR-Ressourcen sowie einer textuellen HTML-Repräsentation (Narrative) an einen ISiK-Basis-kompatiblen Server.**Motivation**In der heterogenen Systemlandschaft im Krankenhaus sind eine Vielzahl spezialisierter Subsysteme im Einsatz. Die Ergebnisse aus diesen Subsystemen sind aktuell jedoch häufig nicht in den Primärsystemen des Krankenhauses verfügbar, denn es bestehen folgende Herausforderungen:Die Daten in Subsystemen sind sehr heterogen und können hochspezialisiert sein. Bei der Nutzung dieser Subsysteme besteht häufig ein Interesse, auf die menschenlesbare Repräsentation der strukturierten Daten einwirken zu können. Künftig ist mit Szenarien zu rechnen, bei denen Befunde aus Subsystemen in eine elektronische Patientenakte übertragen werden sollen. Aktuell werden Befunde, obwohl diese in den Subsystemen in hochstrukturierter Form vorliegen, nur als PDF an das Primärsystem übermittelt. Oft weil kein strukturiertes Format spezifiziert ist, das sowohl versendendes Subsystem als auch empfangendes Primärsystem implementiert haben. Der Umfang, in dem eine Datenübernahme in ein Primärsystem möglich ist, variiert stark zwischen den Systemen oder Installationen, z.B. abhängig davon, ob ein Modul für Vitalparameter installiert ist. Die ISiK-Spezifikation begegnet diesen Herausforderungen, indem sie die Übermittlung von Ergebnissen aus Subsystemen an die Primärsysteme in Form von strukturierten Dokumenten erfordert, die über eine menschenlesbare Repräsentation verfügen. Diese strukturierten Dokumente werden im ISiK-Kontext als Berichte bezeichnet. Dabei sind die strukturierten Inhalte der Berichte harmonisiert mit den verbreiteten Formaten für Primärsysteme.(Semi-)Strukturierte Dokumente werden in FHIR mit der `Composition`-Ressource repräsentiert, die die Dokumentenmetadaten sowie die textuelle Repräsentation des Dokumentes enthält. Die Composition referenziert auf beliebige weitere FHIR-Ressourcen, die die strukturierten Komponenten des Dokumentes darstellen.Für den Transport wird die Composition zusammen mit allen direkt oder indirekt referenzierten Ressourcen in eine `Bundle`-Ressource vom Typ `document` aggregiert. Das Document-Bundle trägt alle Eigenschaften eines Dokumentes: Abgeschlossenheit, Unveränderbarkeit, Signierbarkeit.Es obliegt dem empfangenden System, ob dieses Dokument lediglich in seiner Gesamtheit persistiert wird, oder ob darüber hinaus einzelne Bestandteile (Ressourcen) als strukturierte Daten automatisch oder auf Veranlassung eines Benutzers in die Patientenakte übernommen werden.In der aktuellen Ausbaustufe von ISiK ist lediglich die Übernahme und Anzeige der Dokument-Metadaten (z.B. Dokumenttyp, Dokumentdatum, Quelle) und der menschenlesbaren HTML-Repräsentation in die Primärsysteme erforderlich.In weiteren Ausbaustufen von ISiK soll darüber hinaus eine Übernahme der strukturierten Anteile der Dokumente möglich sein, die den ISiK-Spezifikationen entsprechen, z.B. Diagnosen und Prozeduren.**Kompatibilität**Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. |
| [ ISiKFormularDefinition (Questionnaire) ](StructureDefinition-ISiKFormularDefinition.md) | Questionnaire | Im Profil `ISiKFormularDefinition` sind Mindestanforderungen an ISiK kompatible Formulare definiert. Die verwendbaren Extensions sind nicht mit profiliert, sondern im IG unter Spezifikationen->Extensions beschrieben. |
| [ Ausgefülltes ISiK-Formular (QuestionnaireResponse) ](StructureDefinition-ISiKFormularDaten.md) | QuestionnaireResponse | Im Profil `ISiKFormularDaten` sind Mindestanforderungen an ISiK kompatible, ausgefüllte Formulare definiert. Die verwendbaren Extensions sind nicht mit profiliert, sondern im IG unter Spezifikationen->Extensions beschrieben. |

**Tabelle:**Ressourcen-Profile

### Terminologien

#### Value Sets

| | |
| :--- | :--- |
| [ PflegegradDE ValueSet ](ValueSet-ExamplePrePopObservation_pflegegrad-de.md) | Dieses ValueSet enthält OPS-Codes zur Differenzierung des dokumentierten Pflegegrads. Es ist für die strukturierte Angabe pflegebezogener Einstufungen im deutschen Versorgungskontext vorgesehen. |

**Tabelle:**Value Sets

#### Code Systems

|
|

**Tabelle:**Code Systems

### Beispiele

**Bundle**

* [BundleExampleIntensivstation](Bundle-BundleExampleIntensivstation.md)
* [ISiKBundle-Example](Bundle-ISiKBundle-Example.md)

**Composition**

* [CompositionExampleBlutdruck](Composition-CompositionExampleBlutdruck.md)

**Parameters**

* [exp-params](Parameters-exp-params.md)

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

* [ExampleEntryValidationDecimalResponse](QuestionnaireResponse-ExampleEntryValidationDecimalResponse.md)
* [ExampleExtractWithUnitResponse](QuestionnaireResponse-ExampleExtractWithUnitResponse.md)

**Tabelle:**Beispiel-Instanzen

