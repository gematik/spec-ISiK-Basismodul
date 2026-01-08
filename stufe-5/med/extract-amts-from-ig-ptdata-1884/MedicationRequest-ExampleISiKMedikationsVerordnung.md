#  - AMTS ISiK Implementation Guide v6.0.0-rc

AMTS ISiK Implementation Guide

Version 6.0.0-rc - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## MedicationRequest: 

Profile: [ISiKMedikationsVerordnung](StructureDefinition-ISiKMedikationsVerordnung.md)

**de/fhir/isik/StructureDefinition/ExtensionISiKAcceptedRisk**: Erhöhtes Blutungsrisiko ist in diesem Fall vertretbar.

**de/fhir/isik/StructureDefinition/ExtensionISiKMedikationsart**: ISiKMedikationsartCS: akut (akut)

**de/fhir/isik/StructureDefinition/ExtensionISiKBehandlungsziel**: Schmerztherapie postoperativ

**status**: Active

**intent**: Order

**medication**: [Medication Acetylcystein](Medication-ExampleISiKMedikament1.md)

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**encounter**: [Encounter: extension = ; identifier = Visit number; status = finished; class = inpatient encounter (ActCode#IMP); type = Abteilungskontakt,Operation; serviceType = Innere Medizin; period = 2021-02-12 --> 2021-02-13](Encounter-Fachabteilungskontakt.md)

**authoredOn**: 2021-07-01

**requester**: [Practitioner Walter Arzt(official)](Practitioner-PractitionerWalterArzt.md)

**reasonReference**: [Condition](Condition-BehandlungsDiagnoseFreitext.md)

> **dosageInstruction****timing**: Morning, Noon, Evening, Once

### DoseAndRates

| | |
| :--- | :--- |
| - | **Dose[x]** |
| * | 1 Brausetablette(Details: UCUM code1 = '1') |




## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "ExampleISiKMedikationsVerordnung",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsVerordnung"
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
      "url" : "https://gematik.de/fhir/isik/StructureDefinition/ExtensionISiKBehandlungsziel",
      "valueString" : "Schmerztherapie postoperativ"
    }
  ],
  "status" : "active",
  "intent" : "order",
  "medicationReference" : {
    "reference" : "Medication/ExampleISiKMedikament1"
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "encounter" : {
    "reference" : "Encounter/Fachabteilungskontakt"
  },
  "authoredOn" : "2021-07-01",
  "requester" : {
    "reference" : "Practitioner/PractitionerWalterArzt"
  },
  "reasonReference" : [
    {
      "reference" : "Condition/BehandlungsDiagnoseFreitext"
    }
  ],
  "dosageInstruction" : [
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
