# Bedingte Fragestellungen - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Bedingte Fragestellungen**

## Questionnaire: Bedingte Fragestellungen 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/Questionnaire/ExampleConditionalItem | *Version*:6.0.0-rc |
| Draft as of 2026-02-02 | *Computable Name*:ExampleConditionalItem |

 

### Beispiel-Questionnaire mit bedingten Fragestellungen/Items

 
Die zweite Frage "Was ist denn los?" soll nur gestellt werden, wenn die erste Frage "Wie geht’s" mit "muss." beantwortet wurde. 

### Gerendertes Formular

-------

<iframe style="width:100%; height:300px; border:none; display:block;" id="formularIframe"></iframe>



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "ExampleConditionalItem",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKFormularDefinition"
    ]
  },
  "url" : "https://gematik.de/fhir/isik/Questionnaire/ExampleConditionalItem",
  "version" : "6.0.0-rc",
  "name" : "ExampleConditionalItem",
  "title" : "Bedingte Fragestellungen",
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
  "description" : "### Beispiel-Questionnaire mit bedingten Fragestellungen/Items  \nDie zweite Frage &quot;Was ist denn los?&quot; soll nur gestellt werden, \nwenn die erste Frage &quot;Wie geht's&quot; mit &quot;muss.&quot; beantwortet wurde.",
  "item" : [
    {
      "linkId" : "2",
      "text" : "Fragen mit EnableWhen-Bedingung",
      "type" : "group",
      "item" : [
        {
          "linkId" : "2.1",
          "text" : "Wie geht's?",
          "type" : "choice",
          "answerOption" : [
            {
              "valueCoding" : {
                "display" : "gut."
              }
            },
            {
              "valueCoding" : {
                "display" : "geht."
              }
            },
            {
              "valueCoding" : {
                "display" : "muss."
              }
            }
          ]
        },
        {
          "linkId" : "2.2",
          "text" : "Was ist denn los?",
          "type" : "choice",
          "enableWhen" : [
            {
              "question" : "2.1",
              "operator" : "=",
              "answerCoding" : {
                "display" : "muss."
              }
            }
          ],
          "answerOption" : [
            {
              "valueCoding" : {
                "display" : "Nix."
              }
            },
            {
              "valueCoding" : {
                "display" : "Frag nicht!"
              }
            }
          ]
        }
      ]
    }
  ]
}

```
