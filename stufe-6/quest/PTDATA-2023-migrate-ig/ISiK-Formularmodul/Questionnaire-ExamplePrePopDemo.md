# Vorbelegung Demografischer Daten - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Vorbelegung Demografischer Daten**

## Questionnaire: Vorbelegung Demografischer Daten 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/Questionnaire/ExamplePrePopDemo | *Version*:6.0.0-rc |
| Draft as of 2026-02-02 | *Computable Name*:ExamplePrePopDemo |

 

### Beispiel-Questionnaire mit automatischer Vorbelegung von demografischen Patientendaten

 
Der Patientenkontext wird mittels der [SDC-LaunchContexts](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-launchContext.html)-Extension hergestellt.
 Die Vorbelegung erfolgt über die [SDC-InitialExpression](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-initialExpression.html)-Extension 

### Gerendertes Formular

Zur korrekten Darstellung dieses Beispiels wird eine externe Anfrage in Richtung des offiziellen HL7 Deutschland e.V. FHIR-Server (https://fhir.hl7.de/fhir) gestellt. Falls dort kein passender Patient mehr liegen sollte, scheitert die Prepopulation. Wenden Sie sich in diesem Fall bitte an das ISiK Team.

<iframe style="width:100%; height:300px; border:none; display:block;" id="formularIframe"></iframe>



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "ExamplePrePopDemo",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKFormularDefinition"
    ]
  },
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
  "url" : "https://gematik.de/fhir/isik/Questionnaire/ExamplePrePopDemo",
  "version" : "6.0.0-rc",
  "name" : "ExamplePrePopDemo",
  "title" : "Vorbelegung Demografischer Daten",
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
  "description" : "### Beispiel-Questionnaire mit automatischer Vorbelegung von demografischen Patientendaten \nDer Patientenkontext wird mittels der [SDC-LaunchContexts](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-launchContext.html)-Extension hergestellt.  \nDie Vorbelegung erfolgt über die [SDC-InitialExpression](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-initialExpression.html)-Extension",
  "item" : [
    {
      "linkId" : "1",
      "text" : "Demografische Patientendaten",
      "type" : "group",
      "required" : true,
      "item" : [
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression",
              "valueExpression" : {
                "description" : "Selektion des ersten Vornamens des Patienten. Präferiert aus dem offiziellem Namen, alternativ erster gefundener Name",
                "language" : "text/fhirpath",
                "expression" : "(%patient.name.where(use = 'official').given[0] | %patient.name[0].given[0]).first()"
              }
            }
          ],
          "linkId" : "1.1",
          "text" : "Vorname:",
          "type" : "string"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression",
              "valueExpression" : {
                "description" : "Selektion des Nachnamens des Patienten. Präferiert aus dem offiziellem Namen, alternativ erster gefundener Name",
                "language" : "text/fhirpath",
                "expression" : "(%patient.name.where(use = 'official').family | %patient.name[0].family).first()"
              }
            }
          ],
          "linkId" : "1.2",
          "text" : "Nachname:",
          "type" : "string"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression",
              "valueExpression" : {
                "description" : "Versichertennnummer(KVID) des Patienten",
                "language" : "text/fhirpath",
                "expression" : "%patient.identifier.where(system='http://fhir.de/sid/gkv/kvid-10').value"
              }
            }
          ],
          "linkId" : "1.4",
          "text" : "Versichertennummer:",
          "type" : "string"
        }
      ]
    }
  ]
}

```
