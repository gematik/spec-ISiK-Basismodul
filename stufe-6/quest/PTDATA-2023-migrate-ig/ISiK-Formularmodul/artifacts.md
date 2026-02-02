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
| [ CapabilityStatement für Rolle "ISiKCapabilityStatementCompositionKonsumentenRolle" ](CapabilityStatement-ISiKCapabilityStatementCompositionKonsumentenRolle.md) | CapabilityStatement für die Rolle "ISiKCapabilityStatementCompositionKonsumentenRolle". Diese Rolle beschreibt verpflichtende Interaktionen zum Abruf und der Verarbeitung von ISiKBerichtBundles. |
| [ CapabilityStatement für Rolle "FormularDatenQuelleRolle" ](CapabilityStatement-ISiKCapabilityStatementFormularDatenQuelleRolle.md) | CapabilityStatement für die Rolle "ISiKCapabilityStatementFormularDatenQuelleRolle". Diese Rolle stellt Interaktionen zur Abfrage von FormularenDaten bereit. Hierbei liegt der Fokus auf der Bereitstellung von ausgefüllten Formularen und nicht aus den Extrahierten Ressourcen. Diese sind in Rollen der anderen Module bereitgestellt. |
| [ CapabilityStatement für Rolle "FormularDefinitionsVerwalterRolle" ](CapabilityStatement-ISiKCapabilityStatementFormularDefinitionsVerwalterRolle.md) | CapabilityStatement für die Rolle "ISiKCapabilityStatementFormularDefinitionsVerwalterRolle". Diese Rolle stellt Interaktionen zur Abfrage von Formularen bereit. |

**Tabelle:**Capability Statements - Rollen

### Ressourcenprofile

| | |
| :--- | :--- |
| [ ISiK CapabilityStatement Imports Expectation ](StructureDefinition-ExtensionISiKCapabilityStatementImportsExpectation.md) | Defines the level of expectation associated with a given system capability. See the capabilitystatement-prohibited modifier extension to set expectations to **not** support a feature. |
| [ ISiKBerichtBundle ](StructureDefinition-ISiKBerichtBundle.md) | Das Document-Bundle dient dem Transport von Berichten zwischen Subsystemen im Krankenhaus. Das Bundle entspricht den Anforderungen an ein [FHIR Document Bundle](https://hl7.org/fhir/R4/documents.html) : Alle referenzierten Ressourcen müssen als Einträge im Bundle enthalten sein. Das Bundle unterstützt die Übermittlung einer menschenlesbaren Dokumentation (Narrative) und erlaubt zudem die Übernahme wichtiger Ressourcen (z. B. Diagnosen und Prozeduren), die einem Patienten und Fall (Patient, Encounter) zugeordnet sind. |
| [ Ausgefülltes ISiK-Formular ](StructureDefinition-ISiKFormularDaten.md) | Im Profil `ISiKFormularDaten` sind Mindestanforderungen an ISiK kompatible, ausgefüllte Formulare definiert. Die verwendbaren Extensions sind nicht mit profiliert, sondern im IG unter Spezifikationen->Extensions beschrieben. |
| [ ISiKFormularDefinition ](StructureDefinition-ISiKFormularDefinition.md) | Im Profil `ISiKFormularDefinition` sind Mindestanforderungen an ISiK kompatible Formulare definiert. Die verwendbaren Extensions sind nicht mit profiliert, sondern im IG unter Spezifikationen->Extensions beschrieben. |
| [ ISiKTerminPriorityExtension ](StructureDefinition-ISiKTerminPriorityExtension.md) | Diese Extension ermöglicht die strukturierte Angabe der Dringlichkeit (Priorität) eines Termins. Dies ist wichtig, um Notfälle oder besonders dringliche Termine im Buchungs- und Verwaltungssystem deutlich zu kennzeichnen und eine priorisierte Bearbeitung zu ermöglichen. |

**Tabelle:**Ressourcenprofile

### Terminologien

#### Value Sets

Die folgenden Value Sets sind für die Audit-Event-Service-Funktionalitäten festgelegt.

| | |
| :--- | :--- |
| [ PflegegradDE ValueSet ](ValueSet-ExamplePrePopObservation_pflegegrad-de.md) | Codes zur genaueren Differenzierung des Pflegegrads. |
| [ ISiKTerminPriority ](ValueSet-ISiKTerminPriority.md) | Enthaelt alle SNOMED Codes, die eine valide Priorität für den ISiKTermin sind |

**Tabelle:**Value Sets

#### Code Systems

|
|

**Tabelle:**Code Systems

### Beispiele

**Bundle**

* [Verlegungsbericht für Patient Herrn Thomas Müller (1234567890) - Intensivstation 0100 (Bundle)](Bundle-BundleExampleIntensivstation.md)

* [Blutdruckmessung vom 3.5.2022 (Bundle)](Bundle-ISiKBundle-Example.md)

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

**Tabelle:**Beispiel-Instanzen

