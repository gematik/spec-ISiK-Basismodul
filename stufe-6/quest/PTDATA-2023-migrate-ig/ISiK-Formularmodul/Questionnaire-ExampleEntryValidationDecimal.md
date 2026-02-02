# Validierung von Dezimalen - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Validierung von Dezimalen**

## Questionnaire: Validierung von Dezimalen 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/Questionnaire/ExampleEntryValidationDecimal | *Version*:6.0.0-rc |
| Draft as of 2026-02-02 | *Computable Name*:ExampleEntryValidationDecimal |

 

### Beispiel-Questionnaire Validierung von Dezimalwerten

 
* Vorgabe des Eingabeformates mittels [entryFormat](https://hl7.org/fhir/R4/extension-entryformat.html)-Extension
* Limitierung der Dezimalstellen mittels [maxDecimalPlaces](https://hl7.org/fhir/R4/extension-maxdecimalplaces.html)-Extension
* Limitierung des Wertebereiches mittels [minValue](https://hl7.org/fhir/R4/extension-minvalue.html) und [maxValue](https://hl7.org/fhir/R4/extension-maxvalue.html)-Extension
* Vorgabe der anzugebenden Maßeinheit mittels [questionnaire-unit](https://hl7.org/fhir/R4/extension-questionnaire-unit.html)-Extension
 

### Gerendertes Formular

<iframe style="width:100%; height:300px; border:none; display:block;" id="formularIframe"></iframe>



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "ExampleEntryValidationDecimal",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKFormularDefinition"
    ]
  },
  "url" : "https://gematik.de/fhir/isik/Questionnaire/ExampleEntryValidationDecimal",
  "version" : "6.0.0-rc",
  "name" : "ExampleEntryValidationDecimal",
  "title" : "Validierung von Dezimalen",
  "status" : "draft",
  "experimental" : false,
  "subjectType" : ["Patient"],
  "date" : "2026-02-02T09:10:40+00:00",
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
  "description" : "### Beispiel-Questionnaire Validierung von Dezimalwerten  \n* Vorgabe des Eingabeformates mittels [entryFormat](https://hl7.org/fhir/R4/extension-entryformat.html)-Extension\n* Limitierung der Dezimalstellen mittels [maxDecimalPlaces](https://hl7.org/fhir/R4/extension-maxdecimalplaces.html)-Extension\n* Limitierung des Wertebereiches mittels [minValue](https://hl7.org/fhir/R4/extension-minvalue.html) \n   und [maxValue](https://hl7.org/fhir/R4/extension-maxvalue.html)-Extension\n* Vorgabe der anzugebenden Maßeinheit mittels [questionnaire-unit](https://hl7.org/fhir/R4/extension-questionnaire-unit.html)-Extension",
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
              "url" : "http://hl7.org/fhir/StructureDefinition/maxValue",
              "valueDecimal" : 300
            },
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/minValue",
              "valueDecimal" : 20
            },
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/maxDecimalPlaces",
              "valueInteger" : 1
            }
          ],
          "linkId" : "4.1",
          "text" : "Körpergewicht in kg (muss zwischen 20 und 300kg liegen)",
          "type" : "decimal"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/questionnaire-unit",
              "valueCoding" : {
                "system" : "http://unitsofmeasure.org",
                "code" : "m"
              }
            },
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/entryFormat",
              "valueString" : "x.xx"
            },
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/maxValue",
              "valueDecimal" : 2.5
            },
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/minValue",
              "valueDecimal" : 1
            },
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/maxDecimalPlaces",
              "valueInteger" : 3
            }
          ],
          "linkId" : "4.2",
          "text" : "Körpergröße in m (muss zwischen 1m und 2.50m liegen)",
          "type" : "decimal"
        }
      ]
    }
  ]
}

```
