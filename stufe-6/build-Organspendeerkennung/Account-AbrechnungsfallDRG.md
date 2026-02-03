# Resource AbrechnungsfallDRG



## Resource Content

```json
{
  "resourceType" : "Account",
  "id" : "AbrechnungsfallDRG",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKAbrechnungsfall"
    ]
  },
  "extension" : [
    {
      "extension" : [
        {
          "url" : "Use",
          "valueCoding" : {
            "system" : "http://fhir.de/CodeSystem/KontaktDiagnoseProzedur",
            "code" : "hospital-main-diagnosis",
            "display" : "Krankenhaus Hauptdiagnose"
          }
        },
        {
          "url" : "Referenz",
          "valueReference" : {
            "reference" : "Condition/DiagnoseSelteneErkrankung"
          }
        }
      ],
      "url" : "http://fhir.de/StructureDefinition/ExtensionAbrechnungsDiagnoseProzedur"
    }
  ],
  "identifier" : [
    {
      "type" : {
        "coding" : [
          {
            "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
            "code" : "AN"
          }
        ]
      },
      "system" : "https://test.krankenhaus.de/fhir/sid/abrechnungsnummer",
      "value" : "0123456789"
    }
  ],
  "status" : "active",
  "type" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
        "code" : "IMP"
      }
    ]
  },
  "subject" : [
    {
      "reference" : "Patient/PatientinMusterfrau"
    }
  ],
  "coverage" : [
    {
      "extension" : [
        {
          "url" : "http://fhir.de/StructureDefinition/ExtensionAbrechnungsart",
          "valueCoding" : {
            "system" : "http://fhir.de/CodeSystem/dkgev/Abrechnungsart",
            "code" : "DRG",
            "display" : "Diagnosebezogene Fallgruppen"
          }
        }
      ],
      "coverage" : {
        "reference" : "Coverage/CoverageGesetzlich"
      }
    }
  ]
}

```
