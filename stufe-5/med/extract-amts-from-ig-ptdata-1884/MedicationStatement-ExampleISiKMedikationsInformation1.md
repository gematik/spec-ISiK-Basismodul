#  - AMTS ISiK Implementation Guide v0.0.1

AMTS ISiK Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## MedicationStatement: 

Profile: [ISiKMedikationsInformation](StructureDefinition-ISiKMedikationsInformation.md)

**de/fhir/isik/StructureDefinition/ExtensionISiKAcceptedRisk**: Erhöhtes Blutungsrisiko ist in diesem Fall vertretbar.

**de/fhir/isik/StructureDefinition/ExtensionISiKMedikationsart**: ISiKMedikationsartCS: akut (akut)

**de/fhir/isik/StructureDefinition/ExtensionISiKSelbstmedikation**: true

**de/fhir/isik/StructureDefinition/ExtensionISiKBehandlungsziel**: Schmerztherapie postoperativ

**status**: Active

**medication**: [Medication Acetylcystein](Medication-ExampleISiKMedikament1.md)

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**context**: [Encounter/FachabteilungskontaktMinimal](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Encounter/FachabteilungskontaktMinimal)

**effective**: 2021-07-01 --> (ongoing)

**dateAsserted**: 2021-07-01

**reasonReference**: [Condition](Condition-BehandlungsDiagnoseFreitext.md)

> **dosage****timing**: Morning, Noon, Evening, Once

### DoseAndRates

| | |
| :--- | :--- |
| - | **Dose[x]** |
| * | 1 Brausetablette(Details: UCUM code1 = '1') |




## Resource Content

```json
{
  "resourceType" : "MedicationStatement",
  "id" : "ExampleISiKMedikationsInformation1",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsInformation"
    ]
  },
  "extension" : [
    {
      "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKAcceptedRisk",
      "valueString" : "Erhöhtes Blutungsrisiko ist in diesem Fall vertretbar."
    },
    {
      "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKMedikationsart",
      "valueCoding" : {
        "system" : "https://gematik.de/fhir/isik/CodeSystem/ISiKMedikationsartCS",
        "code" : "akut"
      }
    },
    {
      "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKSelbstmedikation",
      "valueBoolean" : true
    },
    {
      "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKBehandlungsziel",
      "valueString" : "Schmerztherapie postoperativ"
    }
  ],
  "status" : "active",
  "medicationReference" : {
    "reference" : "Medication/ExampleISiKMedikament1"
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "context" : {
    "reference" : "Encounter/FachabteilungskontaktMinimal"
  },
  "effectivePeriod" : {
    "start" : "2021-07-01"
  },
  "dateAsserted" : "2021-07-01",
  "reasonReference" : [
    {
      "reference" : "Condition/BehandlungsDiagnoseFreitext"
    }
  ],
  "dosage" : [
    {
      "timing" : {
        "repeat" : {
          "when" : ["MORN", "NOON", "EVE"]
        }
      },
      "doseAndRate" : [
        {
          "doseQuantity" : {
            "value" : 1,
            "unit" : "Brausetablette",
            "system" : "http://unitsofmeasure.org",
            "code" : "1"
          }
        }
      ]
    }
  ]
}

```
