# Example Condition - SZ2Primaerdiagnose - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Condition - SZ2Primaerdiagnose**

## Example Condition: Example Condition - SZ2Primaerdiagnose

Profile: [ISiKDiagnose](StructureDefinition-ISiKDiagnose.md)

**code**: Diabetes mellitus, Typ 1: Mit Augenkomplikationen: Nicht als entgleist bezeichnet

**subject**: [Friedlinde Musterfrau (official) Female, DoB: 1924-01-01 ( Medical record number)](Patient-SZ2Patient.md)

**encounter**: [Encounter: identifier = Visit number; status = finished; class = inpatient encounter (ActCode#IMP); type = Abteilungskontakt,Normalstationär; period = 2024-10-07 --> 2024-10-10](Encounter-SZ2Encounter.md)

**recordedDate**: 2024-11-05



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "SZ2Primaerdiagnose",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKDiagnose"
    ]
  },
  "code" : {
    "coding" : [
      {
        "extension" : [
          {
            "url" : "http://fhir.de/StructureDefinition/icd-10-gm-mehrfachcodierungs-kennzeichen",
            "valueCoding" : {
              "system" : "http://fhir.de/CodeSystem/icd-10-gm-mehrfachcodierungs-kennzeichen",
              "code" : "†"
            }
          }
        ],
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2024",
        "code" : "E10.30",
        "display" : "Diabetes mellitus, Typ 1: Mit Augenkomplikationen: Nicht als entgleist bezeichnet"
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
