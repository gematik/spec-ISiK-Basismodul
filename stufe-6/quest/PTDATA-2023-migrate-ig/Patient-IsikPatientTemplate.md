#  - Organspendeerkennung v0.0.1-rc

Organspendeerkennung

Version 0.0.1-rc - STU1 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* ****

## Patient: 

Profile: [ISiKPatient](StructureDefinition-ISiKPatient.md)

null(official) Unknown, DoB: ( Medical record number)

-------

| | |
| :--- | :--- |
| Active: | true |
| Other Id: | Krankenversichertennummer/?ngen-9? |
| Contact Detail | * ph: -unknown-
* null null null DE 
 |



## Resource Content

```json
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

```
