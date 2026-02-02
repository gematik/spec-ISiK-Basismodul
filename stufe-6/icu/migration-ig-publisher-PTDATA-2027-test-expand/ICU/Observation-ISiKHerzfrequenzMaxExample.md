# ISiKHerzfrequenzMaxExample - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKHerzfrequenzMaxExample**

## Observation: ISiKHerzfrequenzMaxExample

Profile: [ISiKHerzfrequenz](StructureDefinition-ISiKHerzfrequenz.md)

**status**: Final

**category**: Vital Signs

**code**: Herzfrequenz - EKG-Monitoring

**subject**: [Anna Müller (official) Female, DoB: 1957-08-12 ( Medical record number)](Patient-PatientinNormal.md)

**effective**: 2024-01-15 14:30:00+0100

**performer**: [Practitioner/PractitionerWalterArzt](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Practitioner/PractitionerWalterArzt)

**value**: 180 per minute (Details: UCUM code/min = '/min')

**interpretation**: High

**note**: 

> 

Supraventrikuläre Tachykardie bei akuter Belastung


**bodySite**: Heart structure

**method**: 12 lead electrocardiogram

**device**: [Device/ExampleDevice](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Device/ExampleDevice)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKHerzfrequenzMaxExample",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKHerzfrequenz"
    ]
  },
  "status" : "final",
  "category" : [
    {
      "coding" : [
        {
          "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
          "code" : "vital-signs",
          "display" : "Vital Signs"
        }
      ]
    }
  ],
  "code" : {
    "coding" : [
      {
        "system" : "http://loinc.org",
        "code" : "8867-4",
        "display" : "Heart rate"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "364075005",
        "display" : "Heart rate"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "147842",
        "display" : "MDC_ECG_HEART_RATE"
      }
    ],
    "text" : "Herzfrequenz - EKG-Monitoring"
  },
  "subject" : {
    "reference" : "Patient/PatientinNormal"
  },
  "effectiveDateTime" : "2024-01-15T14:30:00+01:00",
  "performer" : [
    {
      "reference" : "Practitioner/PractitionerWalterArzt"
    }
  ],
  "valueQuantity" : {
    "value" : 180,
    "unit" : "per minute",
    "system" : "http://unitsofmeasure.org",
    "code" : "/min"
  },
  "interpretation" : [
    {
      "coding" : [
        {
          "system" : "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation",
          "code" : "H",
          "display" : "High"
        }
      ]
    }
  ],
  "note" : [
    {
      "text" : "Supraventrikuläre Tachykardie bei akuter Belastung"
    }
  ],
  "bodySite" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "80891009",
        "display" : "Heart structure"
      }
    ]
  },
  "method" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "268400002",
        "display" : "12 lead electrocardiogram"
      }
    ]
  },
  "device" : {
    "reference" : "Device/ExampleDevice"
  }
}

```
