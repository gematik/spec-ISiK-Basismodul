# Resource ExampleISiKMedikament8



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "ExampleISiKMedikament8",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikament"
    ]
  },
  "code" : {
    "text" : "Infusion bestehend aus 80 mg/m² KOF Paclitaxel aufgelöst zur Verabreichung in 5-%iger (50 mg/ml) Glucose-Infusionslösung"
  },
  "status" : "active",
  "form" : {
    "coding" : [
      {
        "system" : "http://standardterms.edqm.eu",
        "code" : "11210000",
        "display" : "Solution for infusion"
      }
    ]
  },
  "ingredient" : [
    {
      "itemCodeableConcept" : {
        "coding" : [
          {
            "system" : "http://fhir.de/CodeSystem/bfarm/atc",
            "version" : "2024",
            "code" : "L01CD01",
            "display" : "Paclitaxel"
          }
        ]
      },
      "isActive" : true,
      "strength" : {
        "numerator" : {
          "value" : 80,
          "unit" : "mg",
          "system" : "http://unitsofmeasure.org",
          "code" : "mg"
        },
        "denominator" : {
          "value" : 1,
          "unit" : "m² KOF",
          "system" : "http://unitsofmeasure.org",
          "code" : "m2"
        }
      }
    },
    {
      "itemCodeableConcept" : {
        "coding" : [
          {
            "system" : "http://fhir.de/CodeSystem/bfarm/atc",
            "version" : "2024",
            "code" : "B05BA11",
            "display" : "Glucose"
          }
        ]
      },
      "isActive" : false,
      "strength" : {
        "numerator" : {
          "value" : 50,
          "unit" : "mg",
          "system" : "http://unitsofmeasure.org",
          "code" : "mg"
        },
        "denominator" : {
          "value" : 1,
          "unit" : "Milliliter",
          "system" : "http://unitsofmeasure.org",
          "code" : "mL"
        }
      }
    }
  ]
}

```
