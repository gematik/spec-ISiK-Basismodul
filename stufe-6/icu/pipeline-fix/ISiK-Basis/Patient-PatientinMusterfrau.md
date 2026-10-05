# PatientinMusterfrau - ISiK Basis Implementierungsleitfaden v6.0.0-rc

ISiK Basis Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **PatientinMusterfrau**

## Patient: PatientinMusterfrau

Profile: [ISiKPatient](StructureDefinition-ISiKPatient.md)

Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))

-------

| | |
| :--- | :--- |
| Active: | true |
| Other Ids: | * Medical record number/TestPID
* Krankenversichertennummer/A123456789
 |
| Alt. Name: | Gabler (Name changed for Marriage) |
| Contact Detail | * Musterweg 2 3. Etage Musterhausen 98764 DE 
* Postfach 8 15 Musterhausen 98764 DE 
 |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "PatientinMusterfrau",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient"
    ]
  },
  "identifier" : [
    {
      "type" : {
        "coding" : [
          {
            "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
            "code" : "MR"
          }
        ]
      },
      "system" : "https://fhir.krankenhaus.example/sid/PID",
      "value" : "TestPID"
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
      "value" : "A123456789"
    },
    {
      "use" : "secondary",
      "type" : {
        "coding" : [
          {
            "system" : "http://fhir.de/CodeSystem/identifier-type-de-basis",
            "code" : "PKV"
          }
        ]
      },
      "value" : "1234567890",
      "assigner" : {
        "display" : "Test PKV AG"
      }
    }
  ],
  "active" : true,
  "name" : [
    {
      "use" : "official",
      "family" : "Fürstin von Musterfrau",
      "_family" : {
        "extension" : [
          {
            "url" : "http://fhir.de/StructureDefinition/humanname-namenszusatz",
            "valueString" : "Fürstin"
          },
          {
            "url" : "http://hl7.org/fhir/StructureDefinition/humanname-own-name",
            "valueString" : "Musterfrau"
          },
          {
            "url" : "http://hl7.org/fhir/StructureDefinition/humanname-own-prefix",
            "valueString" : "von"
          }
        ]
      },
      "given" : ["Erika"],
      "prefix" : ["Dr."],
      "_prefix" : [
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier",
              "valueCode" : "AC"
            }
          ]
        }
      ]
    },
    {
      "use" : "maiden",
      "family" : "Gabler",
      "_family" : {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/StructureDefinition/humanname-own-name",
            "valueString" : "Gabler"
          }
        ]
      }
    }
  ],
  "gender" : "female",
  "birthDate" : "1964-08-12",
  "address" : [
    {
      "type" : "both",
      "line" : ["Musterweg 2", "3. Etage"],
      "_line" : [
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName",
              "valueString" : "Musterweg"
            },
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber",
              "valueString" : "2"
            }
          ]
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator",
              "valueString" : "3. Etage"
            }
          ]
        }
      ],
      "city" : "Musterhausen",
      "postalCode" : "98764",
      "country" : "DE"
    },
    {
      "type" : "postal",
      "line" : ["Postfach 8 15"],
      "_line" : [
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-postBox",
              "valueString" : "Postfach 8 15"
            }
          ]
        }
      ],
      "city" : "Musterhausen",
      "postalCode" : "98764",
      "country" : "DE"
    }
  ]
}

```
