# Resource ExampleISiKMedikationsVerabreichung3



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "ExampleISiKMedikationsVerabreichung3",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsVerabreichung"
    ]
  },
  "status" : "completed",
  "medicationReference" : {
    "reference" : "Medication/ExampleISiKMedikament9"
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "context" : {
    "reference" : "Encounter/FachabteilungskontaktMinimal",
    "identifier" : {
      "value" : "0123456789"
    }
  },
  "effectiveDateTime" : "2021-07-01",
  "note" : [
    {
      "text" : "Testnotiz"
    }
  ],
  "dosage" : {
    "text" : "1L Infusion mit Rate 50ml/h",
    "site" : {
      "coding" : [
        {
          "system" : "http://snomed.info/sct",
          "code" : "6073002",
          "display" : "Structure of ligament of left superior vena cava"
        }
      ]
    },
    "route" : {
      "coding" : [
        {
          "system" : "http://standardterms.edqm.eu",
          "code" : "20045000",
          "display" : "Intravenous use"
        }
      ]
    },
    "dose" : {
      "value" : 1000,
      "unit" : "mL",
      "system" : "http://unitsofmeasure.org",
      "code" : "mL"
    },
    "rateQuantity" : {
      "value" : 50,
      "unit" : "mL/h",
      "system" : "http://unitsofmeasure.org",
      "code" : "mL/h"
    }
  }
}

```
