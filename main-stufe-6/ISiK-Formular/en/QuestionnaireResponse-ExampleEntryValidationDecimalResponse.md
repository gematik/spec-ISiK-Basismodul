# ExampleEntryValidationDecimalResponse - ISiK Formularmodul Implementation Guide v6.0.0

ISiK Formularmodul Implementation Guide

Version 6.0.0 - ballot 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ExampleEntryValidationDecimalResponse**

## QuestionnaireResponse: ExampleEntryValidationDecimalResponse



## Resource Content

```json
{
  "resourceType" : "QuestionnaireResponse",
  "id" : "ExampleEntryValidationDecimalResponse",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKFormularDaten"]
  },
  "language" : "de-DE",
  "questionnaire" : "https://gematik.de/fhir/isik/Questionnaire/ExampleEntryValidationDecimal",
  "_questionnaire" : {
    "extension" : [{
      "url" : "http://hl7.org/fhir/StructureDefinition/display",
      "valueString" : "Validierung von Dezimalen"
    }]
  },
  "status" : "completed",
  "subject" : {
    "reference" : "Patient/PatientinMinimal"
  },
  "authored" : "2025-01-01",
  "author" : {
    "reference" : "Patient/PatientinMinimal"
  },
  "item" : [{
    "linkId" : "4",
    "text" : "Körpermaße",
    "item" : [{
      "linkId" : "4.1",
      "text" : "Körpergewicht in kg (muss zwischen 20 und 300kg liegen)",
      "answer" : [{
        "valueDecimal" : 66
      }]
    },
    {
      "linkId" : "4.2",
      "text" : "Körpergröße in m (muss zwischen 1m und 2.50m liegen)",
      "answer" : [{
        "valueDecimal" : 1.66
      }]
    }]
  }]
}

```
