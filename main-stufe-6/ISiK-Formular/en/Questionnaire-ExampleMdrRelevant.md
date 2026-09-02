# Formular aus einem Medizinprodukt - ISiK Formularmodul Implementation Guide v6.0.0

ISiK Formularmodul Implementation Guide

Version 6.0.0 - ballot 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Formular aus einem Medizinprodukt**

## Questionnaire: Formular aus einem Medizinprodukt 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/Questionnaire/ExampleMdrRelevant | *Version*:6.0.0 |
| Draft as of 2026-09-02 | *Computable Name*:ExampleMdrRelevant |

 

### Beispiel-Questionnaire, welches eine MDR-Relevanz ausweist

 
* Angabe der MDR-Relevanz mittels [ISiKMDRRelevanzFormular](https://simplifier.net/isik-stufe-5/isikmdrrelevanzformularextension)-Extension Disclaimer: Dies ist ein simples fantasie Beispiel und hat keine medizinische Aussagekraft. Das erwartete Verhalten von Systemen, die mit diesem Questionnaire testen wäre, dass das Formular mit einer Fehlermeldung **nicht** rendert!
 

### Gerendertes Formular

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
  "id" : "ExampleMdrRelevant",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKFormularDefinition"]
  },
  "language" : "de-DE",
  "modifierExtension" : [{
    "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKMpFormularExtension",
    "valueString" : "SINNVOLLE ZWECKBESTIMMUNG HIER EINFÜGEN!"
  }],
  "url" : "https://gematik.de/fhir/isik/Questionnaire/ExampleMdrRelevant",
  "version" : "6.0.0",
  "name" : "ExampleMdrRelevant",
  "title" : "Formular aus einem Medizinprodukt",
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
  "description" : "### Beispiel-Questionnaire, welches eine MDR-Relevanz ausweist\n* Angabe der MDR-Relevanz mittels [ISiKMDRRelevanzFormular](https://simplifier.net/isik-stufe-5/isikmdrrelevanzformularextension)-Extension\nDisclaimer: Dies ist ein simples fantasie Beispiel und hat keine medizinische Aussagekraft. Das erwartete Verhalten von Systemen, die mit diesem Questionnaire testen wäre, dass das Formular mit einer Fehlermeldung *nicht* rendert!",
  "item" : [{
    "linkId" : "1",
    "text" : "Fragen mit Entscheidungspfad, der MDR-relevant ist",
    "type" : "group",
    "item" : [{
      "linkId" : "1.1",
      "text" : "Wie hoch ist dein systolischer Blutdruck (oberer Wert)?",
      "type" : "integer"
    },
    {
      "linkId" : "1.1-Krank",
      "text" : "Du sollst zum Arzt!",
      "type" : "display",
      "enableWhen" : [{
        "question" : "1.1",
        "operator" : ">=",
        "answerInteger" : 90
      }]
    },
    {
      "linkId" : "1.1-Gesund",
      "text" : "Du sollst nicht zum Arzt!",
      "type" : "display",
      "enableWhen" : [{
        "question" : "1.1",
        "operator" : "<",
        "answerInteger" : 90
      }]
    }]
  }]
}

```
