# Vorbelegung Demografischer Daten Encounter - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Vorbelegung Demografischer Daten Encounter**

## Questionnaire: Vorbelegung Demografischer Daten Encounter 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/Questionnaire/ExamplePrePopDemoEnc | *Version*:6.0.0-rc |
| Draft as of 2026-02-02 | *Computable Name*:ExamplePrePopDemoEnc |

 

### Beispiel-Questionnaire mit automatischer Vorbelegung von demografischen Patientendaten

 
Der Patientenkontext wird mittels der [SDC-LaunchContexts](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-launchContext.html)-Extension hergestellt.
 Die Vorbelegung erfolgt über die [SDC-InitialExpression](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-initialExpression.html)-Extension 



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "ExamplePrePopDemoEnc",
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
    },
    {
      "extension" : [
        {
          "url" : "name",
          "valueCoding" : {
            "system" : "http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext",
            "code" : "encounter"
          }
        },
        {
          "url" : "type",
          "valueCode" : "Encounter"
        },
        {
          "url" : "description",
          "valueString" : "Fallkontext"
        }
      ],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
    }
  ],
  "url" : "https://gematik.de/fhir/isik/Questionnaire/ExamplePrePopDemoEnc",
  "version" : "6.0.0-rc",
  "name" : "ExamplePrePopDemoEnc",
  "title" : "Vorbelegung Demografischer Daten Encounter",
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
    },
    {
      "linkId" : "2",
      "text" : "Fallinformationen",
      "type" : "group",
      "item" : [
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression",
              "valueExpression" : {
                "description" : "Selektion der Fallnummer",
                "language" : "text/fhirpath",
                "expression" : "%encounter.account.identifier.first().value"
              }
            }
          ],
          "linkId" : "2.1",
          "text" : "Fallnummer:",
          "type" : "string"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression",
              "valueExpression" : {
                "description" : "Selektion der Fallart",
                "language" : "text/fhirpath",
                "expression" : "(%encounter.type.coding.where(system = 'http://fhir.de/CodeSystem/kontaktart-de').display | %encounter.type.coding.where(system = 'http://fhir.de/CodeSystem/kontaktart-de').code)"
              }
            }
          ],
          "linkId" : "2.2",
          "text" : "Fallart:",
          "type" : "string"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression",
              "valueExpression" : {
                "description" : "Selektion des Fachabteilungsschlüssel",
                "language" : "text/fhirpath",
                "expression" : "%encounter.serviceType.coding.where(system = 'http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel').display"
              }
            }
          ],
          "linkId" : "2.3",
          "text" : "Fachabteilungsschlüssel §301:",
          "type" : "string"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression",
              "valueExpression" : {
                "description" : "Selektion der Status",
                "language" : "text/fhirpath",
                "expression" : "%encounter.status"
              }
            }
          ],
          "linkId" : "2.4",
          "text" : "Status:",
          "type" : "string"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression",
              "valueExpression" : {
                "description" : "Selektion der Period Start",
                "language" : "text/fhirpath",
                "expression" : "%encounter.period.start"
              }
            }
          ],
          "linkId" : "2.5",
          "text" : "Von:",
          "type" : "string"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression",
              "valueExpression" : {
                "description" : "Selektion der Period End",
                "language" : "text/fhirpath",
                "expression" : "%encounter.period.end"
              }
            }
          ],
          "linkId" : "2.6",
          "text" : "Bis:",
          "type" : "string"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression",
              "valueExpression" : {
                "description" : "Selektion der Station",
                "language" : "text/fhirpath",
                "expression" : "%encounter.location.where(physicalType.coding.first().code = 'wa' and status = 'active').location.display"
              }
            }
          ],
          "linkId" : "2.7",
          "text" : "Aktuelle Station:",
          "type" : "string"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression",
              "valueExpression" : {
                "description" : "Selektion des Bett",
                "language" : "text/fhirpath",
                "expression" : "%encounter.location.where(physicalType.coding.first().code = 'bd' and status = 'active').location.display"
              }
            }
          ],
          "linkId" : "2.8",
          "text" : "Aktuelles Bett:",
          "type" : "string"
        }
      ]
    }
  ]
}

```
