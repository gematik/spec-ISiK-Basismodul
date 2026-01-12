#  - Organspendeerkennung v0.0.1-rc

Organspendeerkennung

Version 0.0.1-rc - STU1

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* ****

## Condition: 

Profile: [ISiKDiagnose](StructureDefinition-ISiKDiagnose.md)

**Condition Related**: [Condition Diabetes mellitus, Typ 1: Mit Augenkomplikationen: Nicht als entgleist bezeichnet](Condition-SZ2Primaerdiagnose.md)

**code**: Retinopathia diabetica

**subject**: [Friedlinde Musterfrau (official) Female, DoB: 1924-01-01 ( Medical record number)](Patient-SZ2Patient.md)

**encounter**: [Encounter: identifier = Visit number; status = finished; class = inpatient encounter (ActCode#IMP); type = Abteilungskontakt,Normalstationär; period = 2024-10-07 --> 2024-10-10](Encounter-SZ2Encounter.md)

**recordedDate**: 2024-11-05



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "SZ2Sekundaerdiagnose",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKDiagnose"
    ]
  },
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/condition-related",
      "valueReference" : {
        "reference" : "Condition/SZ2Primaerdiagnose"
      }
    }
  ],
  "code" : {
    "coding" : [
      {
        "extension" : [
          {
            "url" : "http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen",
            "valueCoding" : {
              "system" : "http://fhir.de/CodeSystem/icd-10-gm-mehrfachcodierungs-kennzeichen",
              "code" : "*"
            }
          }
        ],
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2024",
        "code" : "H36.0",
        "display" : "Retinopathia diabetica"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/SZ2Patient"
  },
  "encounter" : {
    "reference" : "Encounter/SZ2Encounter"
  },
  "recordedDate" : "2024-11-05"
}

```
