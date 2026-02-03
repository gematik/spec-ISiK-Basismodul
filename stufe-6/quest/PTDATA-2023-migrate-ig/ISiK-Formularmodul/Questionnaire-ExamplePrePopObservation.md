# Vorbelegung von Observations - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Vorbelegung von Observations**

## Questionnaire: Vorbelegung von Observations 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/Questionnaire/ExamplePrePopObservation | *Version*:6.0.0-rc |
| Draft as of 2026-02-03 | *Computable Name*:ExamplePrePopObservation |

 

### Beispiel-Questionnaire mit automatischer Vorbelegung von Observations

 
Die Suche nach passenden Observations geschieht innerhlab des Patienten-Kontextes anhand des in `item-code`hinterlegten Codes. Die Extension [SDC-ObservationLinkPeriod](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-observationLinkPeriod.html) legt fest, wie alt Observations maximal sein dürfen, um für die Vorbelegung herangezogen zu werden (hier: max. 1 Jahr)
 Die Extension [SDC-ObservationExtract](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-observationExtract.html) legt fest, ob aus den Angaben des Questionnaires eine neue Observation extrahiert werden soll (hier: true) 

### Gerendertes Formular

Zur korrekten Darstellung dieses Beispiels wird eine externe Anfrage in Richtung des offiziellen HL7 Deutschland e.V. FHIR-Server (https://fhir.hl7.de/fhir) gestellt. Falls dort keine passende Observation mehr liegen sollte, scheitert die Prepopulation. Wenden Sie sich in diesem Fall bitte an das ISiK Team.

<iframe style="width:100%; height:300px; border:none; display:block;" id="formularIframe"></iframe>



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "ExamplePrePopObservation",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKFormularDefinition"
    ]
  },
  "contained" : [
    {
      "resourceType" : "ValueSet",
      "id" : "pflegegrad-de",
      "meta" : {
        "profile" : ["http://hl7.org/fhir/StructureDefinition/shareablevalueset"]
      },
      "url" : "http://fhir.de/ValueSet/pflegegrad-de",
      "version" : "1.5.4",
      "name" : "PflegegradDE",
      "title" : "PflegegradDE ValueSet",
      "status" : "active",
      "experimental" : false,
      "date" : "2025-06-16",
      "publisher" : "HL7 Deutschland e.V. (Technisches Komitee FHIR)",
      "contact" : [
        {
          "telecom" : [
            {
              "system" : "url",
              "value" : "http://hl7.de/technische-komitees/fhir/"
            }
          ]
        }
      ],
      "description" : "Codes zur genaueren Differenzierung des Pflegegrads.",
      "compose" : {
        "include" : [
          {
            "system" : "http://fhir.de/CodeSystem/bfarm/ops",
            "filter" : [
              {
                "property" : "parent",
                "op" : "=",
                "value" : "9-984"
              }
            ]
          }
        ]
      },
      "expansion" : {
        "identifier" : "440c50b5-7272-4184-9ddd-95a75d8207f8",
        "timestamp" : "2019-07-06",
        "total" : 6,
        "contains" : [
          {
            "system" : "http://fhir.de/CodeSystem/bfarm/ops",
            "code" : "9-984.6",
            "display" : "Pflegebedürftigkeit: Pflegebedürftig nach Pflegegrad 1"
          },
          {
            "system" : "http://fhir.de/CodeSystem/bfarm/ops",
            "code" : "9-984.7",
            "display" : "Pflegebedürftigkeit: Pflegebedürftig nach Pflegegrad 2"
          },
          {
            "system" : "http://fhir.de/CodeSystem/bfarm/ops",
            "code" : "9-984.8",
            "display" : "Pflegebedürftigkeit: Pflegebedürftig nach Pflegegrad 3"
          },
          {
            "system" : "http://fhir.de/CodeSystem/bfarm/ops",
            "code" : "9-984.9",
            "display" : "Pflegebedürftigkeit: Pflegebedürftig nach Pflegegrad 4"
          },
          {
            "system" : "http://fhir.de/CodeSystem/bfarm/ops",
            "code" : "9-984.a",
            "display" : "Pflegebedürftigkeit: Pflegebedürftig nach Pflegegrad 5"
          },
          {
            "system" : "http://fhir.de/CodeSystem/bfarm/ops",
            "code" : "9-984.b",
            "display" : "Pflegebedürftigkeit: Erfolgter Antrag auf Einstufung in einen Pflegegrad"
          }
        ]
      }
    }
  ],
  "extension" : [
    {
      "extension" : [
        {
          "url" : "name",
          "valueCoding" : {
            "system" : "http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext",
            "code" : "patient"
          }
        },
        {
          "url" : "type",
          "valueCode" : "Patient"
        },
        {
          "url" : "description",
          "valueString" : "Patientenkontext"
        }
      ],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
    }
  ],
  "url" : "https://gematik.de/fhir/isik/Questionnaire/ExamplePrePopObservation",
  "version" : "6.0.0-rc",
  "name" : "ExamplePrePopObservation",
  "title" : "Vorbelegung von Observations",
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
  "description" : "### Beispiel-Questionnaire mit automatischer Vorbelegung von Observations  \nDie Suche nach passenden Observations geschieht innerhlab des Patienten-Kontextes anhand des in `item-code`hinterlegten Codes.\nDie Extension [SDC-ObservationLinkPeriod](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-observationLinkPeriod.html) legt fest, wie alt  Observations maximal sein dürfen, um für die Vorbelegung herangezogen zu werden (hier: max. 1 Jahr)  \nDie Extension [SDC-ObservationExtract](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-observationExtract.html) legt fest, ob aus den Angaben des Questionnaires eine neue Observation extrahiert werden soll (hier: true)",
  "item" : [
    {
      "linkId" : "3",
      "text" : "Pflegegrad",
      "type" : "group",
      "required" : true,
      "item" : [
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationLinkPeriod",
              "valueDuration" : {
                "value" : 1,
                "system" : "http://unitsofmeasure.org",
                "code" : "a"
              }
            },
            {
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract",
              "valueBoolean" : true
            }
          ],
          "linkId" : "3.1",
          "code" : [
            {
              "system" : "http://loinc.org",
              "code" : "80391-6"
            }
          ],
          "text" : "Bitte geben Sie den Pflegegrad an:",
          "type" : "choice",
          "answerValueSet" : "#pflegegrad-de"
        }
      ]
    }
  ]
}

```
