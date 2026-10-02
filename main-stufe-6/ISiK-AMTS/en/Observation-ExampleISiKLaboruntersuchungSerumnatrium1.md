# ExampleISiKLaboruntersuchungSerumnatrium1 - AMTS ISiK Implementierungsleitfaden v6.0.0

AMTS ISiK Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ExampleISiKLaboruntersuchungSerumnatrium1**

## Observation: ExampleISiKLaboruntersuchungSerumnatrium1

Profile: [ISiKLaboruntersuchungSerumnatrium](StructureDefinition-ISiKLaboruntersuchungSerumnatrium.md)

**status**: Final

**category**: Laboratory

**code**: Natrium [Mol/Volumen] in Serum oder Plasma

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2021-09-01 12:00:00+0000

**performer**: [Practitioner Walter Arzt(official)](Practitioner-PractitionerWalterArzt.md)

**value**: 140 mmol/L (Details: UCUM codemmol/L = 'mmol/L')

### ReferenceRanges

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Low** | **High** | **AppliesTo** |
| * | 135 mmol/L (Details: UCUM codemmol/L = 'mmol/L') | 145 mmol/L (Details: UCUM codemmol/L = 'mmol/L') | Weiblich |



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ExampleISiKLaboruntersuchungSerumnatrium1",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKLaboruntersuchungSerumnatrium"]
  },
  "status" : "final",
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
      "code" : "laboratory"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "2951-2"
    }]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "effectiveDateTime" : "2021-09-01T12:00:00Z",
  "performer" : [{
    "reference" : "Practitioner/PractitionerWalterArzt"
  }],
  "valueQuantity" : {
    "value" : 140,
    "system" : "http://unitsofmeasure.org",
    "code" : "mmol/L"
  },
  "referenceRange" : [{
    "low" : {
      "value" : 135,
      "system" : "http://unitsofmeasure.org",
      "code" : "mmol/L"
    },
    "high" : {
      "value" : 145,
      "system" : "http://unitsofmeasure.org",
      "code" : "mmol/L"
    },
    "appliesTo" : [{
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "248152002",
        "display" : "Weiblich"
      }]
    }]
  }]
}

```
