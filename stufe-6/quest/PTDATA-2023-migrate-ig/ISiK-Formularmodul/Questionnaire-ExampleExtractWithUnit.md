# Observation Based Extraction bei quantitativen Angaben - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Observation Based Extraction bei quantitativen Angaben**

## Questionnaire: Observation Based Extraction bei quantitativen Angaben 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/Questionnaire/ExampleExtractWithUnit | *Version*:6.0.0-rc |
| Draft as of 2026-02-02 | *Computable Name*:ExampleExtractWithUnit |

 

### Beispiel-Questionnaire mit Observation Based Extraction von Dezimalwerten mit Maßeinheiten

 
* Vorgabe der anzugebenden Maßeinheit mittels [questionnaire-unit](https://hl7.org/fhir/R4/extension-questionnaire-unit.html)-Extension
* Annotation zur Extraktion mittels [observationExtract](http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract)
* Annotation zum Setzen der category bei Extraktion mittels [observationExtractCategory](http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract-category)
 

### Gerendertes Formular

Beim Klicken auf “Zeige QR + Observations” werden Sie auf eine externe Seite weitergeleitet, auf der die durch Sie in der Demo eingegebenen Werte als QuestionnaireResonse und extragierte Observations dargestellt werden.

<iframe style="width:100%; height:300px; border:none; display:block;" id="formularIframe"></iframe>



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "ExampleExtractWithUnit",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKFormularDefinition"
    ]
  },
  "url" : "https://gematik.de/fhir/isik/Questionnaire/ExampleExtractWithUnit",
  "version" : "6.0.0-rc",
  "name" : "ExampleExtractWithUnit",
  "title" : "Observation Based Extraction bei quantitativen Angaben",
  "status" : "draft",
  "experimental" : false,
  "subjectType" : ["Patient"],
  "date" : "2026-02-02T13:44:41+00:00",
  "publisher" : "gematik GmbH",
  "contact" : [
    {
      "name" : "gematik GmbH",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://gematik.de"
        }
      ]
    }
  ],
  "description" : "### Beispiel-Questionnaire mit Observation Based Extraction von Dezimalwerten mit Maßeinheiten  \n  * Vorgabe der anzugebenden Maßeinheit mittels [questionnaire-unit](https://hl7.org/fhir/R4/extension-questionnaire-unit.html)-Extension\n  * Annotation zur Extraktion mittels [observationExtract](http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract)\n  * Annotation zum Setzen der category bei Extraktion mittels [observationExtractCategory](http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract-category)",
  "item" : [
    {
      "linkId" : "4",
      "text" : "Körpermaße",
      "type" : "group",
      "required" : false,
      "item" : [
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/questionnaire-unit",
              "valueCoding" : {
                "system" : "http://unitsofmeasure.org",
                "code" : "kg"
              }
            },
            {
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract",
              "valueBoolean" : true
            },
            {
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observation-extract-category",
              "valueCodeableConcept" : {
                "coding" : [
                  {
                    "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
                    "code" : "vital-signs"
                  }
                ]
              }
            }
          ],
          "linkId" : "4.1",
          "code" : [
            {
              "system" : "http://loinc.org",
              "code" : "29463-7"
            }
          ],
          "text" : "Körpergewicht in kg",
          "type" : "decimal"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/questionnaire-unit",
              "valueCoding" : {
                "system" : "http://unitsofmeasure.org",
                "code" : "cm"
              }
            },
            {
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract",
              "valueBoolean" : true
            },
            {
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observation-extract-category",
              "valueCodeableConcept" : {
                "coding" : [
                  {
                    "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
                    "code" : "vital-signs"
                  }
                ]
              }
            }
          ],
          "linkId" : "4.2",
          "code" : [
            {
              "system" : "http://loinc.org",
              "code" : "8302-2"
            }
          ],
          "text" : "Körpergröße in cm",
          "type" : "decimal"
        }
      ]
    }
  ]
}

```
