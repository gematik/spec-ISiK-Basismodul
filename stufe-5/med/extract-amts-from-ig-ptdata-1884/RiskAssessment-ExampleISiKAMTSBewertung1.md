#  - AMTS ISiK Implementation Guide v6.0.0-rc

AMTS ISiK Implementation Guide

Version 6.0.0-rc - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## RiskAssessment: 

Beispiel für eine AMTS Risikobewertung.



## Resource Content

```json
{
  "resourceType" : "RiskAssessment",
  "id" : "ExampleISiKAMTSBewertung1",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKAMTSBewertung"
    ]
  },
  "status" : "final",
  "code" : {
    "text" : "AMTS Risikobewertung"
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "encounter" : {
    "reference" : "Encounter/Fachabteilungskontakt"
  },
  "occurrenceDateTime" : "2024-02-20T13:14:32+01:00",
  "condition" : {
    "reference" : "Condition/BehandlungsDiagnoseFreitext"
  },
  "reasonReference" : [
    {
      "reference" : "DocumentReference/AnamnesebogenScan123456"
    }
  ],
  "basis" : [
    {
      "reference" : "Observation/Koerpergewicht7777"
    }
  ],
  "prediction" : [
    {
      "outcome" : {
        "text" : "Niereninsuffizienz"
      },
      "qualitativeRisk" : {
        "coding" : [
          {
            "system" : "http://terminology.hl7.org/CodeSystem/risk-probability",
            "code" : "high"
          }
        ]
      }
    }
  ],
  "mitigation" : "Substitution der Stalevo Dauermedikation",
  "note" : [
    {
      "text" : "Abklärung in der Frühbesprechung am 21.02.2024"
    }
  ]
}

```
