# ExampleISiKMedikationsVerabreichung2 - ISiK Medikation Implementierungsleitfaden v6.0.0

ISiK Medikation Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artefakte**](artifacts.md)
* **ExampleISiKMedikationsVerabreichung2**

## MedicationAdministration: ExampleISiKMedikationsVerabreichung2

Profile: [ISiKMedikationsVerabreichung](StructureDefinition-ISiKMedikationsVerabreichung.md)

**status**: Completed

**medication**: [Medication ](Medication-ExampleISiKMedikament9.md)

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**context**: [Encounter/FachabteilungskontaktMinimal](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&canonical=http://fhir.org/packages/de.basisprofil.r4/Encounter/FachabteilungskontaktMinimal)

**effective**: 2024-01-22

### Dosages

| | |
| :--- | :--- |
| - | **Dose** |
| * | 1 Beutel (Details: UCUM code1 = '1') |



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "ExampleISiKMedikationsVerabreichung2",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsVerabreichung"]
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
