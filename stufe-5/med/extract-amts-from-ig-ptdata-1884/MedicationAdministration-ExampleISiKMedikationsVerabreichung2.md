#  - AMTS ISiK Implementation Guide v6.0.0-rc

AMTS ISiK Implementation Guide

Version 6.0.0-rc - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## MedicationAdministration: 

Profile: [ISiKMedikationsVerabreichung](StructureDefinition-ISiKMedikationsVerabreichung.md)

**status**: Completed

**medication**: [Medication](Medication-ExampleISiKMedikament9.md)

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**context**: [Encounter/FachabteilungskontaktMinimal](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Encounter/FachabteilungskontaktMinimal)

**effective**: 2024-01-22

### Dosages

| | |
| :--- | :--- |
| - | **Dose** |
| * | 1 Beutel(Details: UCUM code1 = '1') |



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "ExampleISiKMedikationsVerabreichung2",
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
    "reference" : "Encounter/FachabteilungskontaktMinimal"
  },
  "effectiveDateTime" : "2024-01-22",
  "dosage" : {
    "dose" : {
      "value" : 1,
      "unit" : "Beutel",
      "system" : "http://unitsofmeasure.org",
      "code" : "1"
    }
  }
}

```
