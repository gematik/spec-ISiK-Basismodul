# PrimaereGonarthroseMinimal - ISiK Basis Implementierungsleitfaden v6.0.0-rc

ISiK Basis Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **PrimaereGonarthroseMinimal**

## Condition: PrimaereGonarthroseMinimal

Profile: [ISiKDiagnose](StructureDefinition-ISiKDiagnose.md)

**code**: Primäre Gonarthrose, beidseitig

**subject**: [Anna Müller (official) Female, DoB: 1957-08-12 ( Medical record number)](Patient-PatientinNormal.md)

**encounter**: [Encounter: extension = ,2025-01-02,2025-01-04; identifier = Visit number; status = finished; class = inpatient encounter (ActCode#IMP); type = Abteilungskontakt,Operation; serviceType = Orthopädie; period = 2024-10-21 --> 2025-01-01](Encounter-FachabteilungskontaktNormal.md)

**recordedDate**: 2024-10-21



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "PrimaereGonarthroseMinimal",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKDiagnose"
    ]
  },
  "code" : {
    "coding" : [
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2025",
        "code" : "M17.0",
        "display" : "Primäre Gonarthrose, beidseitig"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinNormal"
  },
  "encounter" : {
    "reference" : "Encounter/FachabteilungskontaktNormal"
  },
  "recordedDate" : "2024-10-21"
}

```
