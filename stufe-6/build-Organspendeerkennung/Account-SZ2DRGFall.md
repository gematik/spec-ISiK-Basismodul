# Resource SZ2DRGFall



## Resource Content

```json
{
  "resourceType" : "Account",
  "id" : "SZ2DRGFall",
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
            "code" : "hospital-main-diagnosis"
          }
        },
        {
          "url" : "Referenz",
          "valueReference" : {
            "reference" : "Condition/SZ2Primaerdiagnose"
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
      "system" : "http://beispiel-krankenhaus.de/sid/fallnummern",
      "value" : "22222222222"
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
      "reference" : "Patient/SZ2Patient"
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
        "reference" : "Coverage/SZ2VersicherungGesetzlich"
      }
    }
  ]
}

```
