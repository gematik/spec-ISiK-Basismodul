# Resource ExampleISiKMedikament4



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "ExampleISiKMedikament4",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikament"
    ]
  },
  "status" : "active",
  "form" : {
    "text" : "Tabletten"
  },
  "ingredient" : [
    {
      "itemCodeableConcept" : {
        "coding" : [
          {
            "system" : "http://fhir.de/CodeSystem/ifa/pzn",
            "code" : "00266040",
            "display" : "IBU-ratiopharm® 400 mg akut Schmerztabletten 20 St."
          }
        ]
      },
      "isActive" : true,
      "strength" : {
        "numerator" : {
          "value" : 400,
          "unit" : "mg",
          "system" : "http://unitsofmeasure.org",
          "code" : "mg"
        },
        "denominator" : {
          "value" : 1,
          "unit" : "Tablette",
          "system" : "http://unitsofmeasure.org",
          "code" : "1"
        }
      }
    },
    {
      "itemCodeableConcept" : {
        "coding" : [
          {
            "system" : "http://fhir.de/CodeSystem/ifa/pzn",
            "code" : "01126111",
            "display" : "Paracetamol-ratiopharm® 500 mg 20 St."
          }
        ]
      },
      "isActive" : true,
      "strength" : {
        "numerator" : {
          "value" : 500,
          "unit" : "mg",
          "system" : "http://unitsofmeasure.org",
          "code" : "mg"
        },
        "denominator" : {
          "value" : 1,
          "unit" : "Tablette",
          "system" : "http://unitsofmeasure.org",
          "code" : "1"
        }
      }
    }
  ]
}

```
