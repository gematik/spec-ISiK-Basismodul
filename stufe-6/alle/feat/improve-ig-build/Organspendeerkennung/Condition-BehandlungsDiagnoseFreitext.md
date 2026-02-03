# BehandlungsDiagnoseFreitext - ISiK Organspendeerkennung v0.0.1-rc

ISiK Organspendeerkennung

Version 0.0.1-rc - STU1 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **BehandlungsDiagnoseFreitext**

## Condition: BehandlungsDiagnoseFreitext

Profile: [ISiKDiagnose](StructureDefinition-ISiKDiagnose.md)

**clinicalStatus**: Active

**code**: Behandlungsdiagnose

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**onset**: 2019-09-02

**recordedDate**: 2021-01-01



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "BehandlungsDiagnoseFreitext",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKDiagnose"
    ]
  },
  "clinicalStatus" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/condition-clinical",
        "code" : "active"
      }
    ]
  },
  "code" : {
    "text" : "Behandlungsdiagnose"
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "onsetDateTime" : "2019-09-02",
  "recordedDate" : "2021-01-01"
}

```
