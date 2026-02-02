# DemoTemplatebasedExtractionQuestionnaire - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **DemoTemplatebasedExtractionQuestionnaire**

## Questionnaire: DemoTemplatebasedExtractionQuestionnaire 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/Questionnaire/DemoTemplatebasedExtractionQuestionnaire | *Version*:6.0.0-rc |
| Draft as of 2026-02-02 | *Computable Name*:DemoTemplatebasedExtractionQuestionnaire |

 

### Beispiel-Questionnaire zur Demonstration der Template-basierten Extraktion von Patientendaten

 



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "DemoTemplatebasedExtractionQuestionnaire",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKFormularDefinition"
    ]
  },
  "contained" : [
    {
      "resourceType" : "Patient",
      "id" : "IsikPatientTemplate",
      "_id" : {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "item.where(linkId = 'resourceId').answer.value"
          }
        ]
      },
      "meta" : {
        "profile" : [
          "https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient"
        ]
      },
      "identifier" : [
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractContext",
              "valueString" : "item.where(linkId = 'patientId')"
            }
          ],
          "type" : {
            "coding" : [
              {
                "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
                "code" : "MR"
              }
            ]
          },
          "_system" : {
            "extension" : [
              {
                "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
                "valueString" : "item.where(linkId = 'patientId-system').answer.value"
              }
            ]
          },
          "_value" : {
            "extension" : [
              {
                "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
                "valueString" : "item.where(linkId = 'patientId-value').answer.value"
              }
            ]
          }
        },
        {
          "type" : {
            "coding" : [
              {
                "system" : "http://fhir.de/CodeSystem/identifier-type-de-basis",
                "code" : "KVZ10"
              }
            ]
          },
          "system" : "http://fhir.de/sid/gkv/kvid-10",
          "_value" : {
            "extension" : [
              {
                "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
                "valueString" : "item.where(linkId = 'versichertenId').answer.value"
              }
            ]
          }
        }
      ],
      "active" : true,
      "name" : [
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractContext",
              "valueString" : "item.where(linkId = 'name')"
            }
          ],
          "use" : "official",
          "_text" : {
            "extension" : [
              {
                "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
                "valueString" : "item.where(linkId = 'given' or linkId = 'family').answer.value.join(' ')"
              }
            ]
          },
          "_family" : {
            "extension" : [
              {
                "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
                "valueString" : "item.where(linkId = 'family').answer.value.first()"
              }
            ]
          },
          "_given" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
                  "valueString" : "item.where(linkId = 'given').answer.value.first()"
                }
              ]
            }
          ]
        }
      ],
      "telecom" : [
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractContext",
              "valueString" : "item.where(linkId = 'telecom')"
            }
          ],
          "system" : "phone",
          "_system" : {
            "extension" : [
              {
                "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
                "valueString" : "item.where(linkId = 'telecom-system').answer.value"
              }
            ]
          },
          "_value" : {
            "extension" : [
              {
                "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
                "valueString" : "item.where(linkId = 'telecom-value').answer.value"
              }
            ]
          }
        }
      ],
      "gender" : "unknown",
      "_gender" : {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "item.where(linkId = 'gender').answer.value.first().code"
          }
        ]
      },
      "_birthDate" : {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "item.where(linkId = 'birthDate').answer.value.first()"
          }
        ]
      },
      "address" : [
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractContext",
              "valueString" : "item.where(linkId = 'address')"
            }
          ],
          "type" : "both",
          "_line" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
                  "valueString" : "item.where(linkId = 'address-line').answer.value"
                }
              ]
            }
          ],
          "_city" : {
            "extension" : [
              {
                "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
                "valueString" : "item.where(linkId = 'address-city').answer.value.first()"
              }
            ]
          },
          "_postalCode" : {
            "extension" : [
              {
                "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
                "valueString" : "item.where(linkId = 'address-postalCode').answer.value.first()"
              }
            ]
          },
          "country" : "DE",
          "_country" : {
            "extension" : [
              {
                "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
                "valueString" : "item.where(linkId = 'address-country').answer.value.first()"
              }
            ]
          }
        }
      ]
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
  "url" : "https://gematik.de/fhir/isik/Questionnaire/DemoTemplatebasedExtractionQuestionnaire",
  "version" : "6.0.0-rc",
  "name" : "DemoTemplatebasedExtractionQuestionnaire",
  "title" : "DemoTemplatebasedExtractionQuestionnaire",
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
  "description" : "### Beispiel-Questionnaire zur Demonstration der Template-basierten Extraktion von Patientendaten",
  "item" : [
    {
      "extension" : [
        {
          "extension" : [
            {
              "url" : "template",
              "valueReference" : {
                "reference" : "#IsikPatientTemplate"
              }
            },
            {
              "url" : "fullUrl",
              "valueString" : "('Patient/' + item.where(linkId = 'resourceId').answer.value)"
            }
          ],
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
        }
      ],
      "linkId" : "patient",
      "text" : "Patient Informationen",
      "type" : "group",
      "item" : [
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/questionnaire-hidden",
              "valueBoolean" : true
            },
            {
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression",
              "valueExpression" : {
                "description" : "Selektion der Ressourcen-ID des Patienten",
                "language" : "text/fhirpath",
                "expression" : "%patient.id"
              }
            }
          ],
          "linkId" : "resourceId",
          "text" : "Ressourcen-ID",
          "type" : "string"
        },
        {
          "linkId" : "name",
          "text" : "Name",
          "type" : "group",
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
              "linkId" : "given",
              "text" : "Vorname",
              "type" : "string",
              "repeats" : true
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
              "linkId" : "family",
              "text" : "Nachname",
              "type" : "string"
            }
          ]
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression",
              "valueExpression" : {
                "description" : "Selektion des Geschlechts des Patienten",
                "language" : "text/fhirpath",
                "expression" : "%questionnaire.repeat(item).where(linkId='gender').answerOption.valueCoding.where(code=%patient.gender)"
              }
            }
          ],
          "linkId" : "gender",
          "text" : "Geschlecht",
          "type" : "choice",
          "answerOption" : [
            {
              "valueCoding" : {
                "system" : "http://hl7.org/fhir/administrative-gender",
                "code" : "unknown",
                "display" : "Unbekannt"
              },
              "initialSelected" : true
            },
            {
              "valueCoding" : {
                "system" : "http://hl7.org/fhir/administrative-gender",
                "code" : "male",
                "display" : "Männlich"
              }
            },
            {
              "valueCoding" : {
                "system" : "http://hl7.org/fhir/administrative-gender",
                "code" : "female",
                "display" : "Weiblich"
              }
            },
            {
              "valueCoding" : {
                "system" : "http://hl7.org/fhir/administrative-gender",
                "code" : "other",
                "display" : "Anderes"
              }
            }
          ]
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression",
              "valueExpression" : {
                "description" : "Selektion des Geburtsdatums des Patienten",
                "language" : "text/fhirpath",
                "expression" : "%patient.birthDate"
              }
            }
          ],
          "linkId" : "birthDate",
          "text" : "Geburtsdatum",
          "type" : "date"
        },
        {
          "linkId" : "patientId",
          "text" : "Patienten-ID",
          "type" : "group",
          "item" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression",
                  "valueExpression" : {
                    "description" : "Selektion des Systems der Patienten-ID.",
                    "language" : "text/fhirpath",
                    "expression" : "%patient.identifier.where(type.coding.first().code = 'MR').system"
                  }
                }
              ],
              "linkId" : "patientId-system",
              "text" : "System der Patienten-ID",
              "type" : "string"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression",
                  "valueExpression" : {
                    "description" : "Selektion des Value der Patienten-ID.",
                    "language" : "text/fhirpath",
                    "expression" : "%patient.identifier.where(type.coding.first().code = 'MR').value"
                  }
                }
              ],
              "linkId" : "patientId-value",
              "text" : "Wert der Patienten-ID",
              "type" : "string"
            }
          ]
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression",
              "valueExpression" : {
                "description" : "Versichertennnummer(KVID) des Patienten",
                "language" : "text/fhirpath",
                "expression" : "%patient.identifier.where(system = 'http://fhir.de/sid/gkv/kvid-10').value"
              }
            }
          ],
          "linkId" : "versichertenId",
          "text" : "Versichertennummer",
          "type" : "string"
        },
        {
          "linkId" : "telecom",
          "text" : "Kontaktmöglichkeit",
          "type" : "group",
          "item" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/questionnaire-hidden",
                  "valueBoolean" : true
                }
              ],
              "linkId" : "telecom-system",
              "type" : "string",
              "initial" : [
                {
                  "valueString" : "phone"
                }
              ]
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression",
                  "valueExpression" : {
                    "description" : "Selektion des Value der Patienten-ID.",
                    "language" : "text/fhirpath",
                    "expression" : "%patient.telecom.where(system = 'phone').first().value"
                  }
                }
              ],
              "linkId" : "telecom-value",
              "text" : "Telefonnummer",
              "type" : "string"
            }
          ]
        }
      ]
    }
  ]
}

```
