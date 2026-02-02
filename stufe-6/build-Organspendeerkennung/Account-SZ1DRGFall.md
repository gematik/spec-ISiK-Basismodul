# Resource SZ1DRGFall



## Resource Content

```json
{
  "resourceType" : "Account",
  "id" : "SZ1DRGFall",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKAbrechnungsfall"
    ]
  },
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
      "reference" : "Patient/SZ1Patient"
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
        "reference" : "Coverage/SZ1VersicherungGesetzlich"
      }
    },
    {
      "extension" : [
        {
          "url" : "http://fhir.de/StructureDefinition/ExtensionAbrechnungsart",
          "valueCoding" : {
            "system" : "http://fhir.de/CodeSystem/dkgev/Abrechnungsart",
            "code" : "SZ",
            "display" : "Selbstzahlerrechnung"
          }
        }
      ],
      "coverage" : {
        "reference" : "Coverage/SZ1VersicherungSelbstzahler"
      }
    }
  ]
}

```
