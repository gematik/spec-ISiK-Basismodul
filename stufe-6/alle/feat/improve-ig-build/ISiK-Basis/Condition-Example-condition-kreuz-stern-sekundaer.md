# Example-condition-kreuz-stern-sekundaer - ISiK Basis Implementierungsleitfaden v6.0.0-rc

ISiK Basis Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example-condition-kreuz-stern-sekundaer**

## Condition: Example-condition-kreuz-stern-sekundaer

Profile: [ISiKDiagnose](StructureDefinition-ISiKDiagnose.md)

**Condition Related**: [Condition Diabetes mellitus, Typ 1: Mit Augenkomplikationen: Nicht als entgleist bezeichnet](Condition-Example-condition-kreuz-stern-primaer.md)

**clinicalStatus**: Active

**code**: Retinopathia diabetica

**bodySite**: Structure of left eye proper

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
  "id" : "Example-condition-kreuz-stern-sekundaer",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKDiagnose"
    ]
  },
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/condition-related",
      "valueReference" : {
        "reference" : "Condition/Example-condition-kreuz-stern-primaer"
      }
    }
  ],
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
  "bodySite" : [
    {
      "coding" : [
        {
          "system" : "http://snomed.info/sct",
          "version" : "http://snomed.info/sct/11000274103/version/20231115",
          "code" : "1290031003",
          "display" : "Structure of left eye proper"
        }
      ]
    }
  ],
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
