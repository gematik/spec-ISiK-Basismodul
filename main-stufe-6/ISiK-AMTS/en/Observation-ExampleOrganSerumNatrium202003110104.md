# ExampleOrganSerumNatrium202003110104 - AMTS ISiK Implementierungsleitfaden v6.0.0

AMTS ISiK Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ExampleOrganSerumNatrium202003110104**

## Observation: ExampleOrganSerumNatrium202003110104

Profile: [ISiKLaboruntersuchungSerumnatrium](StructureDefinition-ISiKLaboruntersuchungSerumnatrium.md)

**status**: Final

**category**: Laboratory

**code**: Natrium [Mol/Volumen] in Serum oder Plasma

**subject**: [Aelin Sternenfall (official) Unknown, DoB: ( Medical record number)](Patient-isik-patient-156722.md)

**effective**: 2020-03-11 01:04:00+0100

**performer**: [Practitioner Walter Arzt(official)](Practitioner-PractitionerWalterArzt.md)

**value**: 130 mmol/L (Details: UCUM codemmol/L = 'mmol/L')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ExampleOrganSerumNatrium202003110104",
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
    "reference" : "Patient/isik-patient-156722"
  },
  "effectiveDateTime" : "2020-03-11T01:04:00+01:00",
  "performer" : [{
    "reference" : "Practitioner/PractitionerWalterArzt"
  }],
  "valueQuantity" : {
    "value" : 130,
    "system" : "http://unitsofmeasure.org",
    "code" : "mmol/L"
  }
}

```
