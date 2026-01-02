#  - AMTS ISiK Implementation Guide v0.0.1

AMTS ISiK Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Condition: 

Profile: [ISiKDiagnose](StructureDefinition-ISiKDiagnose.md)

**Condition Related**: [Condition Psychische und Verhaltensstörungen durch Halluzinogene: Schädlicher Gebrauch](Condition-Example-condition-ausrufezeichen-primaer.md)

**clinicalStatus**: Recurrence

**code**: Sekundäre Schlüsselnummern für die Art des Konsums psychotroper Substanzen bei durch diese verursachten psychischen und Verhaltensstörungen:Intravenöser Konsum sonstiger psychotroper Substanzen

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
  "id" : "Example-condition-ausrufezeichen-sekundaer",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKDiagnose"
    ]
  },
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/condition-related",
      "valueReference" : {
        "reference" : "Condition/Example-condition-ausrufezeichen-primaer"
      }
    }
  ],
  "clinicalStatus" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/condition-clinical",
        "code" : "recurrence"
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
              "code" : "!"
            }
          }
        ],
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
        "version" : "2024",
        "code" : "U69.32",
        "display" : "Sekundäre Schlüsselnummern für die Art des Konsums psychotroper Substanzen bei durch diese verursachten psychischen und Verhaltensstörungen:Intravenöser Konsum sonstiger psychotroper Substanzen"
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
