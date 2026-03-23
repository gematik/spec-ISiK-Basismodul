---
topic: Extensions
---

Für die verschiedenen [Interaktionen](FunktionenInteraktionen.html) werden verschiedene Extensions unterstützt. Im Folgenden sind pro Interaktion  alle Extensions aufgelistet, die in der aktuellen Ausbaustufen des ISiK-Formular-Moduls zum Einsatz kommen.

### Core Extensions (Questionnaire)

| Rolle | Extension Name | Context | Beschreibung | Relevanz |
|--------|---------------|---------|--------------|---|
| FormularRendering | [entryFormat](https://hl7.org/fhir/R4/extension-entryformat.html) | Questionnaire.item | Definiert das Eingabeformat für ein Item | SOLL |
| FormularDatenValidierung | [maxDecimalPlaces](https://hl7.org/fhir/R4/extension-maxdecimalplaces.html) | Questionnaire.item | Begrenzt die Anzahl der Dezimalstellen | SOLL |
| FormularDatenValidierung | [maxValue](https://hl7.org/fhir/R4/extension-maxvalue.html) | Questionnaire.item | Setzt einen maximalen Wert für numerische Eingaben | SOLL |
| FormularDatenValidierung | [minLength](https://hl7.org/fhir/R4/extension-minlength.html) | Questionnaire.item | Definiert die Mindestlänge für Texteingaben | SOLL |
| FormularDatenValidierung | [minValue](https://hl7.org/fhir/R4/extension-minvalue.html) | Questionnaire.item | Setzt einen minimalen Wert für numerische Eingaben | SOLL |
| FormularRendering | [questionnaire-maxOccurs](https://hl7.org/fhir/R4/extension-questionnaire-maxoccurs.html) | Questionnaire.item, Questionnaire.item.item | Definiert das maximale Vorkommen eines Items | SOLL |
| FormularRendering | [questionnaire-minOccurs](https://hl7.org/fhir/R4/extension-questionnaire-minoccurs.html) | Questionnaire.item, Questionnaire.item.item | Definiert das minimale Vorkommen eines Items | SOLL |
| FormularRendering | [questionnaire-unit](https://hl7.org/fhir/R4/extension-questionnaire-unit.html) | Questionnaire.item, Questionnaire.item.item | Definiert die Einheit für numerische Werte | SOLL |
| FormularRendering | [questionnaire-hidden](https://hl7.org/fhir/R4/extension-questionnaire-hidden.html) | Questionnaire.item, Questionnaire.item.item | Ermöglicht das Ausblenden von Items | SOLL |
| FormularDatenValidierung | [regex](https://hl7.org/fhir/R4/extension-regex.html) | Questionnaire.item | Fügt reguläre Ausdrücke für Validierung hinzu <br> Die Extension ist in zukünftigen Versionen deprecated. Aus dem Grund wird die Extension targetConstraint empfohlen zu nutzen. | KANN |
| FormularDatenValidierung | [targetConstraint](http://hl7.org/fhir/StructureDefinition/targetConstraint) | Questionnaire.item | Fügt reguläre Ausdrücke für Validierung hinzu | SOLL |

### Core Extensions (QuestionnaireResponse)

| Rolle | Extension Name | Context | Beschreibung | Relevanz |
|--------|--------|---------|------------------|---|
| FormularRendering | [Name des Questionnaire](http://hl7.org/fhir/StructureDefinition/display) | QuestionnaireResponse.questionnaire | Gibt den Namen des Questionnaire an, damit dieser im Falle des fehlenden Zugriff auf die Questionnaire Ressource mit angegeben werden kann | SOLL |

### Core Extensions (Questionnaire und QuestionnaireResponse)

| Rolle | Extension Name | Context | Beschreibung | Relevanz |
|--------|--------|---------|------------------|---|
| FormularRendering | [Medizin-produkt Kontext](https://gematik.de/fhir/isik/StructureDefinition/ISiKMpFormularExtension) | QuestionnaireResponse, Questionnaire | Mit dieser Extension besteht die Möglichkeit anzugeben, dass das Formular innerhalb eines Medizinproduktes eingesetzt wird und eine Zweckbestimmung anzugeben ist. Die Interpretation der Zweckbestimmung und der daraus folgenden Konsequenzen für die eingesetzte Software liegt im Verantwortungsbereich des Software-Hersteller! | SOLL |

### SDC Extensions (Questionnaire)

| Rolle | SDC-Modul | Extension Name | Context | Beschreibung | Relevanz |
|--------|-------|---------------|---------|--------------|---|
| FormularDatenExtraktion | Data Extraction | [Extract Observation](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-observationExtract.html) | Questionnaire.item | Gibt an, dass der beobachtungsbasierte Ansatz verwendet werden soll | SOLL |
| FormularDatenExtraktion | Data Extraction | [Extract Observation - Category](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-observation-extract-category.html) | Questionnaire.item | Gibt die Observation.category-Werte an, die in extrahierten Beobachtungen erscheinen sollen | SOLL |
| FormularDatenExtraktion | Data Extraction | [Extract Template - Bundle](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-templateExtractBundle.html) | Questionnaire.item | Gibt einen Verweis auf eine enthaltene Transaktionsbündel-Ressourcenvorlage an | SOLL |
| FormularDatenExtraktion | Data Extraction | [Extract Template - Context](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-templateExtractContext.html) | Questionnaire.item | Erstellt Mapping-Kontext für das Ersetzen von Vorlageninhalt basierend auf einem FHIRPath-Ausdruck | SOLL |
| FormularDatenExtraktion | Data Extraction | [Extract Template - Extract value](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-templateExtractValue.html) | Questionnaire.item | Stellt einen Ausdruck bereit, um Werte zu evaluieren, die im gegebenen Vorlagenextraktionskontext ersetzt werden sollen | SOLL |
| FormularDatenExtraktion | Data Extraction | [Extract Template - Resource](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-templateExtract.html) | Questionnaire.item | Gibt einen Verweis auf eine enthaltene Ressourcenvorlage an | SOLL |
| FormularDatenVorbelegung | Form Behavior | [Initial Expression](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-initialExpression.html) | Questionnaire.item | Anfangswert für eine Frageantwort, der durch einen ausgewerteten Ausdruck bestimmt wird | SOLL |
| FormularRendering | Form Control | [Launch Contexts](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-launchContext.html) | Questionnaire | Ressourcen, die Kontext für die Formularverarbeitungslogik bereitstellen | SOLL |
| FormularDatenVorbelegung | Form Population | [Obervation link period](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-observationLinkPeriod.html) | Questionnaire.item | Gibt den Zeitraum an, in dem nach passenden Beobachtungen gesucht werden soll | SOLL |

### Extensions Out-of-scope

| Hinweis | Out-Of-Scope Extensions |
|---------|---------------------|
| <img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Terminplanung/c604c61a3887bd5532d2c7392eb20d8c79403028/Material/images/piktogramme/Betriebskoordination_Gruen_gematik.svg" width="40"/> | Die folgenden Extensions sind im Rahmen des Moduls out-of-scope und sollten nicht genutzt werden. Falls Extensions für einen bestimmten Use Case benötigt werden, soll bitte im [Chat](https://chat.fhir.org/#narrow/channel/287581-german.2Fisik/topic/.5BDOK.2C.20VITAL.2C.20MED.5D.20Herstellung.20von.20Patienten-.20und.20Fallkontext) ein Feedback zu hinterlassen werden. Abhängig von der Rückmeldung kann diese Extension in späteren Releases verbindlich gemacht werden. |


#### Core Extensions (Questionnaire)
| Extension Name | Context | Beschreibung |
|---------------|---------|--------------|
| [11179-permitted-value-conceptmap](https://hl7.org/fhir/R4/extension-11179-permitted-value-conceptmap.html) | Questionnaire.item.answerValueSet | Verknüpft erlaubte Werte mit einer ConceptMap |
| [11179-permitted-value-valueset](https://hl7.org/fhir/R4/extension-11179-permitted-value-valueset.html) | Questionnaire.item.answerValueSet | Verknüpft erlaubte Werte mit einem ValueSet |
| [designNote](https://hl7.org/fhir/R4/extension-designnote.html) | Questionnaire, Questionnaire.item, Questionnaire.item.item | Fügt Designnotizen für Entwickler hinzu |
| [maxSize](https://hl7.org/fhir/R4/extension-maxsize.html) | Questionnaire.item | Definiert die maximale Größe für Dateianhänge |
| [mimeType](https://hl7.org/fhir/R4/extension-mimetype.html) | Questionnaire.item | Spezifiziert den MIME-Typ für Dateianhänge |
| [ordinalValue](https://hl7.org/fhir/R4/extension-ordinalvalue.html) | Questionnaire.item.answerOption | Fügt ordinale Werte zu Antwortoptionen hinzu |
| [questionnaire-baseType](https://hl7.org/fhir/R4/extension-questionnaire-basetype.html) | Questionnaire.item, Questionnaire.item.item | Definiert den Basistyp für ein Item |
| [questionnaire-choiceOrientation](https://hl7.org/fhir/R4/extension-questionnaire-choiceorientation.html) | Questionnaire.item, Questionnaire.item.item | Bestimmt die Ausrichtung von Auswahlmöglichkeiten |
| [questionnaire-constraint](https://hl7.org/fhir/R4/extension-questionnaire-constraint.html) | Questionnaire, Questionnaire.item, Questionnaire.item.item | Fügt Einschränkungen für Antworten hinzu |
| [questionnaire-displayCategory](https://hl7.org/fhir/R4/extension-questionnaire-displaycategory.html) | Questionnaire.item, Questionnaire.item.item | Definiert die Anzeigekategorie eines Items |
| [questionnaire-fhirType](https://hl7.org/fhir/R4/extension-questionnaire-fhirtype.html) | Questionnaire.item, Questionnaire.item.item | Spezifiziert den FHIR-Datentyp |
| [questionnaire-itemControl](https://hl7.org/fhir/R4/extension-questionnaire-itemcontrol.html) | Questionnaire.item, Questionnaire.item.item | Kontrolliert die Darstellung von Items |
| [questionnaire-optionExclusive](https://hl7.org/fhir/R4/extension-questionnaire-optionexclusive.html) | Questionnaire.item.answerOption | Markiert eine Antwortoption als exklusiv |
| [questionnaire-optionPrefix](https://hl7.org/fhir/R4/extension-questionnaire-optionprefix.html) | Questionnaire.item.answerOption | Fügt Präfixe zu Antwortoptionen hinzu |
| [questionnaire-referenceFilter](https://hl7.org/fhir/R4/extension-questionnaire-referencefilter.html) | Questionnaire.item, Questionnaire.item.item | Filtert Referenzauswahlmöglichkeiten |
| [questionnaire-referenceProfile](https://hl7.org/fhir/R4/extension-questionnaire-referenceprofile.html) | Questionnaire.item, Questionnaire.item.item | Definiert das Profil für Referenzen |
| [questionnaire-referenceResource](https://hl7.org/fhir/R4/extension-questionnaire-referenceresource.html) | Questionnaire.item, Questionnaire.item.item | Spezifiziert den Ressourcentyp für Referenzen |
| [questionnaire-signatureRequired](https://hl7.org/fhir/R4/extension-questionnaire-signaturerequired.html) | Questionnaire, Questionnaire.item, Questionnaire.item.item | Erfordert eine elektronische Unterschrift |
| [questionnaire-sliderStepValue](https://hl7.org/fhir/R4/extension-questionnaire-sliderstepvalue.html) | Questionnaire.item, Questionnaire.item.item | Definiert Schrittwerte für Slider |
| [questionnaire-supportLink](https://hl7.org/fhir/R4/extension-questionnaire-supportlink.html) | Questionnaire.item, Questionnaire.item.item | Fügt Hilfelinks zu Items hinzu |
| [questionnaire-unitOption](https://hl7.org/fhir/R4/extension-questionnaire-unitoption.html) | Questionnaire.item, Questionnaire.item.item | Bietet Einheitenauswahlmöglichkeiten |
| [questionnaire-unitValueSet](https://hl7.org/fhir/R4/extension-questionnaire-unitvalueset.html) | Questionnaire.item, Questionnaire.item.item | Verknüpft Einheiten mit einem ValueSet |
| [questionnaire-usageMode](https://hl7.org/fhir/R4/extension-questionnaire-usagemode.html) | Questionnaire.item, Questionnaire.item.item | Definiert den Verwendungsmodus eines Items |
| [replaces](https://hl7.org/fhir/R4/extension-replaces.html) | Questionnaire | Gibt an, welche Ressource diese ersetzt |
| [variable](https://hl7.org/fhir/R4/extension-variable.html) | Questionnaire, Questionnaire.item, Questionnaire.item.item | Definiert Variablen für dynamische Inhalte | 

#### Core Extension (QuestionnaireResponse)

| Extension Name | Context | Beschreibung |
|---------------|---------|--------------|
| [questionnaireresponse-author](https://hl7.org/fhir/R4/extension-questionnaireresponse-author.html) | QuestionnaireResponse.item, QuestionnaireResponse.item.item | Gibt den Autor einer Antwort oder eines Antwort-Elements an |
| [questionnaireresponse-completionMode](https://hl7.org/fhir/R4/extension-questionnaireresponse-completionmode.html) | QuestionnaireResponse | Definiert den Modus, in dem der Fragebogen abgeschlossen wurde |
| [questionnaireresponse-reason](https://hl7.org/fhir/R4/extension-questionnaireresponse-reason.html) | QuestionnaireResponse | Gibt den Grund für die Erstellung oder Änderung der Antwort an |
| [questionnaireresponse-reviewer](https://hl7.org/fhir/R4/extension-questionnaireresponse-reviewer.html) | QuestionnaireResponse | Identifiziert die Person, die die Antwort überprüft hat |
| [questionnaireresponse-signature](https://hl7.org/fhir/R4/extension-questionnaireresponse-signature.html) | QuestionnaireResponse, QuestionnaireResponse.item, QuestionnaireResponse.item.item | Enthält die digitale Signatur für die Antwort oder ein Antwort-Element |
| [workflow-episodeOfCare](https://hl7.org/fhir/R4/extension-workflow-episodeofcare.html) | QuestionnaireResponse | Verknüpft die Antwort mit einer Episode der Versorgung |
| [workflow-researchStudy](https://hl7.org/fhir/R4/extension-workflow-researchstudy.html) | QuestionnaireResponse | Verknüpft die Antwort mit einer Forschungsstudie |
| [resource-pertainsToGoal](https://hl7.org/fhir/R4/extension-resource-pertainstogoal.html) | pertainsToGoal | Zeigt an, dass die Antwort mit einem bestimmten Ziel verbunden ist |

#### SDC Extensions

| Modul | Extension Name | Context | Beschreibung |
|-------|---------------|---------|--------------|
| Answer Control | [Answer Context Expression](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-contextExpression.html) | Questionnaire.item | Eine FHIR-Abfrage, die ein oder mehrere Ressourcen zurückgibt, die dem Benutzer als Kontext für die Beantwortung einer Frage angezeigt werden können |
| Answer Control | [Answer Expression](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-answerExpression.html) | Questionnaire.item | Ein Ausdruck (FHIRPath, CQL oder FHIR-Abfrage), der eine Liste zulässiger Antworten für ein Frageelement liefert |
| Answer Control | [Answer Options Toggle Expression](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-answerOptionsToggleExpression.html) | Questionnaire.item | Ein komplexer Ausdruck, der eine Liste der erlaubten Optionen bereitstellt, die basierend auf der Auswertung eines bereitgestellten Ausdrucks aktiviert oder deaktiviert werden sollen |
| Answer Control | [Candidate Answers Expression](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-candidateExpression.html) | Questionnaire.item | Ein FHIRPath- oder CQL-Ausdruck oder eine FHIR-Abfrage, die eine Liste von Antwortvorschlägen liefert |
| Data Extraction | [Extract - Allocate new uuid](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-extractAllocateId.html) | Questionnaire.item | Weist eine neue UUID in einer benannten Variable für die Extraktion zu |
| Data Extraction | [Extract Definition](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-definitionExtract.html) | Questionnaire.item | Gibt den Ressourcentyp/das Profil für die definitionsbasierte Extraktion einer Ressource an |
| Data Extraction | [Extract Definition - Extract value](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-definitionExtractValue.html) | Questionnaire.item | Stellt einen festen Wert oder einen auszuwertenden Ausdruck bereit |
| Data Extraction | [Extract Definition - Resource (legacy)](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-itemExtractionContext.html) | Questionnaire.item | Gibt eine Abfrage oder einen anderen Ausdruck an, der die zu extrahierende Ressource identifiziert (veraltet) |
| Data Extraction | [Extract StructureMap - Target structure map](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-targetStructureMap.html) | Questionnaire | StructureMaps, die QuestionnaireResponses dieses Fragebogens als 'Quelle' haben |
| Display Control | [Choice column](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-choiceColumn.html) | Questionnaire.item | Bietet Richtlinien für die Darstellung von mehrspaltige Auswahlmöglichkeiten |
| Display Control | [Collapsible](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-collapsible.html) | Questionnaire.item | Zeigt an, dass die untergeordneten Elemente eines Elements in zusammenklappbarer Form angezeigt werden |
| Display Control | [Entry mode](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-entryMode.html) | Questionnaire.item | Eine Angabe, wie der Benutzer bei der Vervollständigung einer QuestionnaireResponse zur Eingabe von Antworten aufgefordert werden soll |
| Display Control | [Item Answer Media](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-itemAnswerMedia.html) | Questionnaire.item | Medien, die als Begleitung zu einer bestimmten Antwortoption gerendert/verfügbar gemacht werden sollen |
| Display Control | [Item Media](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-itemMedia.html) | Questionnaire.item | Medien, die begleitend zur gestellten Frage oder Gruppe gerendert/verfügbar gemacht werden sollen |
| Display Control | [Keyboard Type Extension](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-keyboard.html) | Questionnaire.item | Gibt für String- oder Text-Elemente den 'Tastaturtyp' an, der von der Benutzeroberfläche verwendet werden soll |
| Display Control | [Label for 'open' items](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-openLabel.html) | Questionnaire.item | Der Beschriftungstext, der neben Freitext- und/oder nicht eingeschränkten Typwerten für ein 'offenes' Auswahlelement angezeigt werden soll |
| Display Control | [Number of columns for child item layout](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-columnCount.html) | Questionnaire.item | Gibt die Anzahl der Spalten an, über die die Auswahlmöglichkeiten organisiert werden sollen |
| Display Control | [Optional Display?](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-optionalDisplay.html) | Questionnaire.item | Wenn auf true gesetzt, kann das System das Element optional anzeigen |
| Display Control | [Rendering Critical Extension](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-rendering-criticalExtension.html) | Questionnaire | Zeigt eine Extension an, die vom darstellenden System unterstützt werden muss |
| Display Control | [Short Text](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-shortText.html) | Questionnaire.item | Stellt einen kurzen Text für ein Element bereit |
| Display Control | [Width of column](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-width.html) | Questionnaire.item | Gibt die Breite der Spalte für diese Frage an |
| Form Behavior | [Calculated Expression](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-calculatedExpression.html) | Questionnaire.item | Berechneter Wert für eine Frageantwort, der durch einen ausgewerteten Ausdruck bestimmt wird |
| Form Behavior | [Enable when expression](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-enableWhenExpression.html) | Questionnaire.item | Ein Ausdruck, der einen booleschen Wert zurückgibt, ob das Element aktiviert werden soll |
| Form Control | [Code system for other units](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-unitSupplementalSystem.html) | Questionnaire.item | Gibt das Codesystem an, aus dem zusätzliche Einheiten stammen sollen |
| Form Control | [Endpoint](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-endpoint.html) | Questionnaire | Die Basis-URL für den/die Server, an die mit diesem Fragebogen verbundene Antworten gesendet werden sollen |
| Form Control | [Is subject (response)?](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaireresponse-isSubject.html) | QuestionnaireResponse.item | Zeigt an, dass das Element ein anderes Subjekt für diese Gruppe angibt |
| Form Control | [Is subject?](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-isSubject.html) | Questionnaire.item | Zeigt an, dass das Element ein anderes Subjekt für die Gruppe in einer Antwort festlegt |
| Form Control | [Lookup questionnaire](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-lookupQuestionnaire.html) | Questionnaire.item | Für Referenz-Elemente kann der Fragebogen angegeben werden, der bei der Erstellung der Zielinstanz verwendet werden soll |
| Form Control | [Performer type](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-performerType.html) | Questionnaire | Gibt die Arten von Ressourcen an, die Antworten auf einen Fragebogen aufzeichnen können |
| Form Control | [Preferred Terminology Server](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-preferredTerminologyServer.html) | Questionnaire | Gibt die Terminologieserver an, die die Wertesets verarbeiten können |
| Form Control | [Questionnaire Adaptive](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-questionnaireAdaptive.html) | Questionnaire | Zeigt an, ob ein Fragebogen adaptiv ist |
| Form Control | [ServiceRequest Questionnaire](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-servicerequest-questionnaire.html) | ServiceRequest | Identifiziert einen Fragebogen, der ausgefüllt werden soll |
| Form Control | [Units open?](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-unitOpen.html) | Questionnaire.item | Gibt an, ob die Liste der unterstützten Einheiten erschöpfend ist |
| Form Population | [Item population context](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-itemPopulationContext.html) | Questionnaire.item | Gibt eine Abfrage an, die die Ressource identifiziert, die zur Vorausfüllung verwendet werden soll |
| Form Population | [Source queries for population mapping](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-sourceQueries.html) | Questionnaire | Ein Batch-Bundle mit Abfragen zur Bereitstellung von Quelldaten |
| Form Population | [Source structure map](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-sourceStructureMap.html) | Questionnaire | StructureMaps, die QuestionnaireResponses für diesen Fragebogen als 'Ziel' produzieren |
| Form Validation | [Max quantity](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-maxQuantity.html) | Questionnaire.item | Die inklusive obere Grenze für den Bereich der zulässigen Werte für eine Frage vom Typ 'quantity' |
| Form Validation | [Min quantity](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-minQuantity.html) | Questionnaire.item | Die inklusive untere Grenze für den Bereich der zulässigen Werte für eine Frage vom Typ 'quantity' |
| Modular Forms | [Assemble Context extension](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-assembleContext.html) | Questionnaire | Diese Extension, die in einem Unter-Fragebogen verwendet wird, gibt eine FHIRPath-Variable an, die im Kontext vorhanden sein muss, wenn auf den Unter-Fragebogen verwiesen wird |
| Modular Forms | [Assembled From Questionnaire](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-assembledFrom.html) | Questionnaire | Diese Extension erscheint im Root eines zusammengestellten Fragebogens und identifiziert die Unter-Fragebögen (einschließlich Version), die im Rahmen des Assembly-Prozesses verwendet wurden |
| Modular Forms | [Assembly Expectations for Questionnaire](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-assemble-expectation.html) | Questionnaire | Gibt an, dass dieser Fragebogen Erwartungen in Bezug auf die Zusammenstellung hat |
| Modular Forms | [Sub-questionnaire](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-subQuestionnaire.html) | Questionnaire.item | Zeigt an, dass das Anzeigelement durch den referenzierten Fragebogen ersetzt werden soll |
