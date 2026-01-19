---
topic: FormularDatenExtraktion
---
## Interaktion: FormularDatenExtraktion

Bei der Formulardatenextraktion handelt es sich formal nicht um eine *Inter*aktion, da diese derzeit als eine Aktion angenommen wird, die vom {{pagelink:FormularRenderer}} eigenständig ausgeführt wird.
Gemäß SDC-Spezifikation ist die FormularDaten-Extraktion jedoch auch als ein Service mittels der $extract-Operation implementierbar.

In künftigen Ausbaustufen des ISiK-Formular-Moduls ist auch eine Einbindung [externer Extractions-Services](https://build.fhir.org/ig/HL7/sdc/extraction.html#extraction-service) denkbar. 
Daher wird diese Funktion bereits in dieser Stufe als *potentielle* Interaktion betrachtet.

Die Datenextraktion wird in dieser Stufe zunächst ausschließlich von {{pagelink:FormularRenderer}} implementiert und beschränkt sich auf die Methoden
- [Observation based extraction](https://build.fhir.org/ig/HL7/sdc/extraction.html#observation-based-extraction)
- [Template based extraction](https://build.fhir.org/ig/HL7/sdc/en/extraction.html#template-based-extraction)

Die folgenden Core und SDC Extensions sind für die Extraktion in dieser Stufe relevant. Unter {{pagelink:Extensions}} sind mehr Informationen dazu zu finden.

- [Launch Contexts](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-launchContext.html)
- [Extract Observation](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-observationExtract.html)
- [Extract Observation - Category](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-observation-extract-category.html)
- [Extract Template - Bundle](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-templateExtractBundle.html)
- [Extract Template - Resource](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-templateExtract.html)
- [Extract Template - Context](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-templateExtractContext.html)
- [Extract Template - Extract value](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-templateExtractValue.html)