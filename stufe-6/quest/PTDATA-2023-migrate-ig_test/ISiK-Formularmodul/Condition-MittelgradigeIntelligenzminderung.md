# Example Condition - MittelgradigeIntelligenzminderung - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Condition - MittelgradigeIntelligenzminderung**

## Example Condition: Example Condition - MittelgradigeIntelligenzminderung

Profile: [ISiKDiagnose](StructureDefinition-ISiKDiagnose.md)

**clinicalStatus**: Active

**code**: Mittelgradige Intelligenzminderung

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**encounter**: [Encounter: extension = ; identifier = Visit number; status = finished; class = inpatient encounter (ActCode#IMP); type = Abteilungskontakt,Operation; serviceType = Innere Medizin; period = 2021-02-12 --> 2021-02-13](Encounter-Fachabteilungskontakt.md)

**onset**: 2019-09-02

**recordedDate**: 2021-01-01



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "MittelgradigeIntelligenzminderung",
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
    "coding" : [
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2024",
        "code" : "F71",
        "display" : "Mittelgradige Intelligenzminderung"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "encounter" : {
    "reference" : "Encounter/Fachabteilungskontakt"
  },
  "onsetDateTime" : "2019-09-02",
  "recordedDate" : "2021-01-01"
}

```
