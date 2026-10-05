# Resource ParacetamolInfusion



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "ParacetamolInfusion",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikament"
    ]
  },
  "code" : {
    "text" : "Paracetamol 10 mg/ml in Glukose 5 %"
  },
  "status" : "active",
  "form" : {
    "coding" : [
      {
        "system" : "http://standardterms.edqm.eu",
        "code" : "11210000",
        "display" : "Solution for infusion"
      }
    ],
    "text" : "Infusionslösung"
  },
  "amount" : {
    "numerator" : {
      "value" : 100,
      "unit" : "mL",
      "system" : "http://unitsofmeasure.org",
      "code" : "mL"
    },
    "denominator" : {
      "value" : 1,
      "unit" : "Beutel",
      "system" : "http://unitsofmeasure.org",
      "code" : "1"
    }
  },
  "ingredient" : [
    {
      "extension" : [
        {
          "url" : "http://fhir.de/StructureDefinition/WirkstofftypEX",
          "valueCoding" : {
            "system" : "http://fhir.de/CodeSystem/WirkstofftypCS",
            "code" : "IN"
          }
        }
      ],
      "itemCodeableConcept" : {
        "coding" : [
          {
            "system" : "http://fhir.de/CodeSystem/bfarm/atc",
            "version" : "2024",
            "code" : "N02BE01",
            "display" : "Paracetamol"
          }
        ],
        "text" : "Paracetamol"
      },
      "isActive" : true,
      "strength" : {
        "numerator" : {
          "value" : 10,
          "unit" : "mg",
          "system" : "http://unitsofmeasure.org",
          "code" : "mg"
        },
        "denominator" : {
          "value" : 1,
          "unit" : "mL",
          "system" : "http://unitsofmeasure.org",
          "code" : "mL"
        }
      }
    },
    {
      "itemCodeableConcept" : {
        "coding" : [
          {
            "system" : "http://fhir.de/CodeSystem/ifa/pzn",
            "code" : "03710676",
            "display" : "Ecoflac® plus Glucose 5 % (100 ml)"
          }
        ]
      },
      "isActive" : false
    }
  ]
}

```
