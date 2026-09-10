# ExampleISiKMedikationsInformationParkinson4 - AMTS ISiK Implementierungsleitfaden v6.0.0

AMTS ISiK Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ExampleISiKMedikationsInformationParkinson4**

## MedicationStatement: ExampleISiKMedikationsInformationParkinson4

Profile: [ISiKMedikationsInformation](StructureDefinition-ISiKMedikationsInformation.md)

**status**: Active

**medication**: Entacapon HEC 200 mg

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**context**: [Encounter/FachabteilungskontaktMinimal](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&canonical=http://fhir.org/packages/de.basisprofil.r4/Encounter/FachabteilungskontaktMinimal)

**effective**: 2024-02-20 --> (ongoing)

**dateAsserted**: 2024-02-20

**reasonReference**: [Condition/DiagnoseParkinson](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&canonical=http://fhir.org/packages/de.basisprofil.r4/Condition/DiagnoseParkinson)

> **dosage****timing**: Once

### DoseAndRates

| | |
| :--- | :--- |
| - | **Dose[x]** |
| * | 1 Tbl. (Details: UCUM code1 = '1') |




## Resource Content

```json
{
  "resourceType" : "MedicationStatement",
  "id" : "ExampleISiKMedikationsInformationParkinson4",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsInformation"]
  },
  "status" : "active",
  "medicationCodeableConcept" : {
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/ifa/pzn",
      "code" : "11119856",
      "display" : "Entacapon HEC 200 mg"
    }]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "context" : {
    "reference" : "Encounter/FachabteilungskontaktMinimal"
  },
  "effectivePeriod" : {
    "start" : "2024-02-20"
  },
  "dateAsserted" : "2024-02-20",
  "reasonReference" : [{
    "reference" : "Condition/DiagnoseParkinson"
  }],
  "dosage" : [{
    "timing" : {
      "repeat" : {
        "timeOfDay" : ["22:00:00"]
      }
    },
    "doseAndRate" : [{
      "doseQuantity" : {
        "value" : 1,
        "unit" : "Tbl.",
        "system" : "http://unitsofmeasure.org",
        "code" : "1"
      }
    }]
  }]
}

```
