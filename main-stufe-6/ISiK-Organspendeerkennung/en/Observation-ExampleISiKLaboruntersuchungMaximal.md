# ExampleISiKLaboruntersuchungMaximal - ISiK Organspendeerkennung v6.0.0

ISiK Organspendeerkennung

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ExampleISiKLaboruntersuchungMaximal**

## Observation: ExampleISiKLaboruntersuchungMaximal

Profile: [ISiKLaboruntersuchung](StructureDefinition-ISiKLaboruntersuchung.md)

**status**: Final

**category**: Laboratory, Serologie

**code**: Methicillin-resistenter Staphylococcus aureus [Nachweis] in Probenmaterial mittels erregerspezifischer Kultur

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**effective**: 2021-09-01 12:00:00+0000

**performer**: [Practitioner/PractitionerWalterArzt](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&canonical=http://fhir.org/packages/de.basisprofil.r4/Practitioner/PractitionerWalterArzt)

**value**: Positiv

**note**: 

> 

MRSA-Nachweis positiv. Isolat zur weiteren Typisierung eingesandt.


**method**: MALDI-TOF-Massenspektrometrie



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ExampleISiKLaboruntersuchungMaximal",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKLaboruntersuchung"]
  },
  "status" : "final",
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
      "code" : "laboratory"
    }]
  },
  {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "18727-8",
      "display" : "Serologie"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "13317-3",
      "display" : "Methicillin-resistenter Staphylococcus aureus [Nachweis] in Probenmaterial mittels erregerspezifischer Kultur"
    }]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "effectiveDateTime" : "2021-09-01T12:00:00Z",
  "performer" : [{
    "reference" : "Practitioner/PractitionerWalterArzt"
  }],
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "10828004",
      "display" : "Positiv"
    }]
  },
  "note" : [{
    "text" : "MRSA-Nachweis positiv. Isolat zur weiteren Typisierung eingesandt."
  }],
  "method" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "83581000052107",
      "display" : "MALDI-TOF-Massenspektrometrie"
    }]
  }
}

```
