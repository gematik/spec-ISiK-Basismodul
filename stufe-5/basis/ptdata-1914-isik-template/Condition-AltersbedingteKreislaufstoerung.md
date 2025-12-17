#  - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Condition: 

Profile: [ISiKDiagnose](StructureDefinition-ISiKDiagnose.md)

**clinicalStatus**: Active

**code**: Sonstige und nicht näher bezeichnete Krankheiten des Kreislaufsystems

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**encounter**: [Encounter: extension = ; identifier = Visit number; status = finished; class = inpatient encounter (ActCode#IMP); type = Abteilungskontakt,Operation; serviceType = Innere Medizin; period = 2021-02-12 --> 2021-02-13](Encounter-Fachabteilungskontakt.md)

**onset**: 2019-09-02

**recordedDate**: 2021-01-01



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "AltersbedingteKreislaufstoerung",
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
        "code" : "I99",
        "display" : "Sonstige und nicht näher bezeichnete Krankheiten des Kreislaufsystems"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/alpha-id",
        "version" : "2024",
        "code" : "I14432",
        "display" : "Altersbedingte Kreislaufstörung"
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
