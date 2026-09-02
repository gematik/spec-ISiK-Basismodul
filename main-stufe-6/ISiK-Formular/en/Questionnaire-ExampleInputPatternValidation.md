# Validierung von Formulareingaben gegen RegExPattern - ISiK Formularmodul Implementation Guide v6.0.0

ISiK Formularmodul Implementation Guide

Version 6.0.0 - ballot 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Validierung von Formulareingaben gegen RegExPattern**

## Questionnaire: Validierung von Formulareingaben gegen RegExPattern 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/Questionnaire/ExampleInputPatternValidation | *Version*:6.0.0 |
| Draft as of 2026-09-02 | *Computable Name*:ExampleInputPatternValidation |

 

### Beispiel-Questionnaire mit Validierung von Benutzereingaben mittels einer FHIRPath-Expression

 
Die Validierung erfolgt über die [targetConstraint](https://hl7.org/fhir/extensions/StructureDefinition-targetConstraint.html)-Extension 

### Gerendertes Formular

Das Feature wird von LHC-Forms zum aktuellen Zeitpunkt noch nicht unterstützt. Aus dem Grund wird im gerenderten Formular die Validierung noch nicht korrekt ausgeführt.

<iframe style="width:100%; height:300px; border:none; display:block;" id="formularIframe"></iframe>

*  [Tree view](#tabs-tree) 
*  [Sample Rendering](#tabs-sample) 
*  [Form Logic](#tabs-logic) 

### Test this Questionnaire

### Responses for this Questionnaire

There are currently no QuestionnaireResponse instances for this Questionnaire defined in this IG.



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "ExampleInputPatternValidation",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKFormularDefinition"]
  },
  "language" : "de-DE",
  "url" : "https://gematik.de/fhir/isik/Questionnaire/ExampleInputPatternValidation",
  "version" : "6.0.0",
  "name" : "ExampleInputPatternValidation",
  "title" : "Validierung von Formulareingaben gegen RegExPattern",
  "status" : "draft",
  "experimental" : false,
  "subjectType" : ["Patient"],
  "date" : "2026-09-02T11:31:15+00:00",
  "publisher" : "gematik GmbH",
  "contact" : [{
    "name" : "gematik GmbH",
    "telecom" : [{
      "system" : "url",
      "value" : "https://gematik.de"
    }]
  }],
  "description" : "### Beispiel-Questionnaire mit Validierung von Benutzereingaben mittels einer FHIRPath-Expression  \nDie Validierung erfolgt über die [targetConstraint](https://hl7.org/fhir/extensions/StructureDefinition-targetConstraint.html)-Extension",
  "item" : [{
    "extension" : [{
      "extension" : [{
        "url" : "key",
        "valueId" : "kvid-1"
      },
      {
        "url" : "severity",
        "valueCode" : "warning"
      },
      {
        "url" : "expression",
        "valueExpression" : {
          "language" : "text/fhirpath",
          "expression" : "matches(^[A-Z][0-9]{9}$)"
        }
      },
      {
        "url" : "human",
        "valueString" : "Eine Versichertennummer muss mit einem Großbuchstaben beginnen, gefolgt von 9 Zahlen!"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/targetConstraint"
    }],
    "linkId" : "1.4",
    "text" : "Versichertennummer:",
    "type" : "string"
  }]
}

```
