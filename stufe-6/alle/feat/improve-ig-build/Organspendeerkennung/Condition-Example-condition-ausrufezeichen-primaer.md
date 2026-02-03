# Example-condition-ausrufezeichen-primaer - ISiK Organspendeerkennung v0.0.1-rc

ISiK Organspendeerkennung

Version 0.0.1-rc - STU1 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example-condition-ausrufezeichen-primaer**

## Condition: Example-condition-ausrufezeichen-primaer

Profile: [ISiKDiagnose](StructureDefinition-ISiKDiagnose.md)

**clinicalStatus**: Active

**code**: Psychische und Verhaltensstörungen durch Halluzinogene: Schädlicher Gebrauch

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**encounter**: [Encounter: extension = ; identifier = Visit number; status = finished; class = inpatient encounter (ActCode#IMP); type = Abteilungskontakt,Operation; serviceType = Innere Medizin; period = 2021-02-12 --> 2021-02-13](Encounter-Fachabteilungskontakt.md)

**recordedDate**: 2021-05-24

**note**: 

> 

Beispiel für eine Anmerkung




## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Example-condition-ausrufezeichen-primaer",
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
        "code" : "F16.1",
        "display" : "Psychische und Verhaltensstörungen durch Halluzinogene: Schädlicher Gebrauch"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "encounter" : {
    "reference" : "Encounter/Fachabteilungskontakt"
  },
  "recordedDate" : "2021-05-24",
  "note" : [
    {
      "text" : "Beispiel für eine Anmerkung"
    }
  ]
}

```
