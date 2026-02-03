# Example Observation - ISiKKoerpergroesseMaxExample - ISiK Vitalparameter Implementierungsleitfaden v6.0.0-rc

ISiK Vitalparameter Implementierungsleitfaden

Version 6.0.0-rc - 6.0.0-rc 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Observation - ISiKKoerpergroesseMaxExample**

## Example Observation: Example Observation - ISiKKoerpergroesseMaxExample

Profile: [ISiKKoerpergroesse](StructureDefinition-ISiKKoerpergroesse.md)

**status**: Final

**category**: Vital Signs

**code**: Körpergröße - Klinische Messung

**subject**: [Anna Müller (official) Female, DoB: 1957-08-12 ( Medical record number)](Patient-PatientinNormal.md)

**effective**: 2024-01-15 09:00:00+0100

**performer**: [Practitioner/PractitionerWalterArzt](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Practitioner/PractitionerWalterArzt)

**value**: 205 centimeter (Details: UCUM codecm = 'cm')

**note**: 

> 

Körpergröße geschätzt aufgrund der Bettlägerigkeit des Patienten


**bodySite**: Entire body as a whole

**method**: Estimated



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ISiKKoerpergroesseMaxExample",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKKoerpergroesse"
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
        "code" : "8302-2",
        "display" : "Body height"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "1153637007",
        "display" : "Body height"
      },
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "188740",
        "display" : "MDC_LEN_BODY_ACTUAL"
      }
    ],
    "text" : "Körpergröße - Klinische Messung"
  },
  "subject" : {
    "reference" : "Patient/PatientinNormal"
  },
  "effectiveDateTime" : "2024-01-15T09:00:00+01:00",
  "performer" : [
    {
      "reference" : "Practitioner/PractitionerWalterArzt"
    }
  ],
  "valueQuantity" : {
    "value" : 205,
    "unit" : "centimeter",
    "system" : "http://unitsofmeasure.org",
    "code" : "cm"
  },
  "note" : [
    {
      "text" : "Körpergröße geschätzt aufgrund der Bettlägerigkeit des Patienten"
    }
  ],
  "bodySite" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "38266002",
        "display" : "Entire body as a whole"
      }
    ]
  },
  "method" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "414135002",
        "display" : "Estimated"
      }
    ]
  }
}

```
