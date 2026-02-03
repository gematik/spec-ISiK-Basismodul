# Example Condition - PrimaereGonarthroseNormal - ISiK Basis Implementierungsleitfaden v6.0.0-rc

ISiK Basis Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Condition - PrimaereGonarthroseNormal**

## Example Condition: Example Condition - PrimaereGonarthroseNormal

Profile: [ISiKDiagnose](StructureDefinition-ISiKDiagnose.md)

**clinicalStatus**: Remission

**code**: Primäre Gonarthrose, beidseitig

**bodySite**: Knee joint

**subject**: [Anna Müller (official) Female, DoB: 1957-08-12 ( Medical record number)](Patient-PatientinNormal.md)

**encounter**: [Encounter: extension = ,2025-01-02,2025-01-04; identifier = Visit number; status = finished; class = inpatient encounter (ActCode#IMP); type = Abteilungskontakt,Operation; serviceType = Orthopädie; period = 2024-10-21 --> 2025-01-01](Encounter-FachabteilungskontaktNormal.md)

**onset**: 2020-09-02

**abatement**: 2025-01-01

**recordedDate**: 2024-10-21

**note**: 

> 

Patientin mit primärer Gonarthrose beidseitig (ICD M17.0), seit mehreren Jahren bestehend, in Remission seit 01.01.2025




## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "PrimaereGonarthroseNormal",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKDiagnose"
    ]
  },
  "clinicalStatus" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/condition-clinical",
        "code" : "remission"
      }
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
  "bodySite" : [
    {
      "coding" : [
        {
          "system" : "http://snomed.info/sct",
          "code" : "49076000"
        }
      ]
    }
  ],
  "subject" : {
    "reference" : "Patient/PatientinNormal"
  },
  "encounter" : {
    "reference" : "Encounter/FachabteilungskontaktNormal"
  },
  "onsetDateTime" : "2020-09-02",
  "abatementDateTime" : "2025-01-01",
  "recordedDate" : "2024-10-21",
  "note" : [
    {
      "text" : "Patientin mit primärer Gonarthrose beidseitig (ICD M17.0), seit mehreren Jahren bestehend, in Remission seit 01.01.2025"
    }
  ]
}

```
