# Validierung von Texten - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Validierung von Texten**

## Questionnaire: Validierung von Texten 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/Questionnaire/ExampleEntryValidationText | *Version*:6.0.0-rc |
| Draft as of 2026-02-03 | *Computable Name*:ExampleEntryValidationText |

 

### Beispiel-Questionnaire Validierung von Textfeldern

 
* Limitierung der Mindest- und Maximalvorkommen einer wiederholbaren Gruppe mittels [questionnaire-minOccurs](https://hl7.org/fhir/R4/extension-questionnaire-minoccurs.html)-Extension und [questionnaire-maxOccurs](https://hl7.org/fhir/R4/extension-questionnaire-maxoccurs.html)-Extension
* Limitierung der Eingabelänge mittels [minLength](https://hl7.org/fhir/R4/extension-minlength.html)-Extension
 

### Gerendertes Formular

<iframe style="width:100%; height:300px; border:none; display:block;" id="formularIframe"></iframe>



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "ExampleEntryValidationText",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKFormularDefinition"
    ]
  },
  "url" : "https://gematik.de/fhir/isik/Questionnaire/ExampleEntryValidationText",
  "version" : "6.0.0-rc",
  "name" : "ExampleEntryValidationText",
  "title" : "Validierung von Texten",
  "status" : "draft",
  "experimental" : false,
  "subjectType" : ["Patient"],
  "date" : "2026-02-03T13:26:37+00:00",
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
  "description" : "### Beispiel-Questionnaire Validierung von Textfeldern\n* Limitierung der Mindest- und Maximalvorkommen einer wiederholbaren Gruppe mittels [questionnaire-minOccurs](https://hl7.org/fhir/R4/extension-questionnaire-minoccurs.html)-Extension und [questionnaire-maxOccurs](https://hl7.org/fhir/R4/extension-questionnaire-maxoccurs.html)-Extension\n* Limitierung der Eingabelänge mittels [minLength](https://hl7.org/fhir/R4/extension-minlength.html)-Extension",
  "item" : [
    {
      "extension" : [
        {
          "url" : "http://hl7.org/fhir/StructureDefinition/questionnaire-minOccurs",
          "valueInteger" : 1
        },
        {
          "url" : "http://hl7.org/fhir/StructureDefinition/questionnaire-maxOccurs",
          "valueInteger" : 2
        }
      ],
      "linkId" : "1",
      "text" : "Ausweisdaten",
      "type" : "group",
      "required" : true,
      "repeats" : true,
      "item" : [
        {
          "linkId" : "1.1",
          "text" : "Ausweistyp",
          "type" : "choice",
          "answerOption" : [
            {
              "valueString" : "Personalausweis"
            },
            {
              "valueString" : "Reisepass"
            }
          ]
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/minLength",
              "valueInteger" : 9
            }
          ],
          "linkId" : "1.2",
          "text" : "Ausweisnummer",
          "type" : "string",
          "maxLength" : 9
        }
      ]
    }
  ]
}

```
