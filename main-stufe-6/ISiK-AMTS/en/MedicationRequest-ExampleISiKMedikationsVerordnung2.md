# ExampleISiKMedikationsVerordnung2 - AMTS ISiK Implementierungsleitfaden v6.0.0

AMTS ISiK Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ExampleISiKMedikationsVerordnung2**

## MedicationRequest: ExampleISiKMedikationsVerordnung2

Profile: [ISiKMedikationsVerordnung](StructureDefinition-ISiKMedikationsVerordnung.md)

**status**: Active

**intent**: Order

**medication**: [Medication ](Medication-ExampleISiKMedikament8.md)

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**encounter**: [Encounter: extension = ; identifier = Visit number; status = finished; class = inpatient encounter (ActCode#IMP); type = Abteilungskontakt,Operation; serviceType = Innere Medizin; period = 2021-02-12 --> 2021-02-13](Encounter-Fachabteilungskontakt.md)

**authoredOn**: 2024-01-17

**requester**: [Practitioner Walter Arzt(official)](Practitioner-PractitionerWalterArzt.md)

> **dosageInstruction****timing**: Count 6 times, Duration 6weeks , Once per 1 week

### DoseAndRates

| | |
| :--- | :--- |
| - | **Dose[x]** |
| * | 500 ml Infusionslösung (Details: UCUM codemL = 'mL') |


**priorPrescription**: [MedicationRequest: extension = Erhöhtes Blutungsrisiko ist in diesem Fall vertretbar.,Akutmedikation (ISiK Medikationsart#akut),Schmerztherapie postoperativ; status = active; intent = order; medication[x] = ->Medication Acetylcystein; authoredOn = 2021-07-01](MedicationRequest-ExampleISiKMedikationsVerordnung.md)



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "ExampleISiKMedikationsVerordnung2",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsVerordnung"]
  },
  "status" : "active",
  "intent" : "order",
  "medicationReference" : {
    "reference" : "Medication/ExampleISiKMedikament8"
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "encounter" : {
    "reference" : "Encounter/Fachabteilungskontakt"
  },
  "authoredOn" : "2024-01-17",
  "requester" : {
    "reference" : "Practitioner/PractitionerWalterArzt"
  },
  "dosageInstruction" : [{
    "timing" : {
      "repeat" : {
        "count" : 6,
        "duration" : 6,
        "durationUnit" : "wk",
        "frequency" : 1,
        "period" : 1,
        "periodUnit" : "wk"
      }
    },
    "doseAndRate" : [{
      "doseQuantity" : {
        "value" : 500,
        "unit" : "ml Infusionslösung",
        "system" : "http://unitsofmeasure.org",
        "code" : "mL"
      }
    }]
  }],
  "priorPrescription" : {
    "reference" : "MedicationRequest/ExampleISiKMedikationsVerordnung"
  }
}

```
