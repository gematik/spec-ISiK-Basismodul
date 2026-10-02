# ExampleISiKMedikationsInformation6 - ISiK Medikation Implementierungsleitfaden v6.0.0

ISiK Medikation Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artefakte**](artifacts.md)
* **ExampleISiKMedikationsInformation6**

## MedicationStatement: ExampleISiKMedikationsInformation6

Beispiel für Dosierung kurzwirksames Insulin nach gemessenen Werten



## Resource Content

```json
{
  "resourceType" : "MedicationStatement",
  "id" : "ExampleISiKMedikationsInformation6",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsInformation"]
  },
  "status" : "active",
  "medicationCodeableConcept" : {
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/ifa/pzn",
      "code" : "06922060",
      "display" : "Huminsulin® Normal KwikPen™"
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
    "reference" : "Condition/DiagnoseDiabetesMellitus"
  }],
  "dosage" : [{
    "patientInstruction" : "Dosierung nach BZ, gemäß Informationsblatt vom 20.02.2024"
  }]
}

```
