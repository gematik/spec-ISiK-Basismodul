# ExampleISiKMedikationsInformation2 - ISiK Medikation Implementierungsleitfaden v6.0.0

ISiK Medikation Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artefakte**](artifacts.md)
* **ExampleISiKMedikationsInformation2**

## MedicationStatement: ExampleISiKMedikationsInformation2

Profile: [ISiKMedikationsInformation](StructureDefinition-ISiKMedikationsInformation.md)

**status**: Active

**medication**: [Medication ](Medication-ExampleISiKMedikament2.md)

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**context**: [Encounter/FachabteilungskontaktMinimal](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&canonical=http://fhir.org/packages/de.basisprofil.r4/Encounter/FachabteilungskontaktMinimal)

**effective**: 2021-07-04 --> (ongoing)

**dateAsserted**: 2021-07-03

> **dosage****timing**: Count 6 times, Once per 3 weeks

### DoseAndRates

| | |
| :--- | :--- |
| - | **Dose[x]** |
| * | 100 mg (Details: UCUM codemg = 'mg') |




## Resource Content

```json
{
  "resourceType" : "MedicationStatement",
  "id" : "ExampleISiKMedikationsInformation2",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsInformation"]
  },
  "status" : "active",
  "medicationReference" : {
    "reference" : "Medication/ExampleISiKMedikament2"
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "context" : {
    "reference" : "Encounter/FachabteilungskontaktMinimal"
  },
  "effectivePeriod" : {
    "start" : "2021-07-04"
  },
  "dateAsserted" : "2021-07-03",
  "dosage" : [{
    "timing" : {
      "repeat" : {
        "count" : 6,
        "frequency" : 1,
        "period" : 3,
        "periodUnit" : "wk"
      }
    },
    "doseAndRate" : [{
      "doseQuantity" : {
        "value" : 100,
        "unit" : "mg",
        "system" : "http://unitsofmeasure.org",
        "code" : "mg"
      }
    }]
  }]
}

```
