# Appendektomie - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Appendektomie**

## Procedure: Appendektomie

Profile: [ISiKProzedur](StructureDefinition-ISiKProzedur.md)

**ExtensionProzedurDokumentationsdatum**: 2020-04-23

**status**: Completed

**category**: Chirurgische Prozedur

**code**: Entfernung des Blinddarms

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**performed**: 2020-04-23

**note**: 

> 

Testnotiz




## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Appendektomie",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKProzedur"]
  },
  "extension" : [{
    "url" : "http://fhir.de/StructureDefinition/ProzedurDokumentationsdatum",
    "valueDateTime" : "2020-04-23"
  }],
  "status" : "completed",
  "category" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "387713003",
      "display" : "Chirurgische Prozedur"
    }]
  },
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "80146002",
      "display" : "Appendektomie"
    },
    {
      "system" : "http://fhir.de/CodeSystem/bfarm/ops",
      "version" : "2024",
      "code" : "5-470",
      "display" : "Appendektomie"
    }],
    "text" : "Entfernung des Blinddarms"
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "performedDateTime" : "2020-04-23",
  "note" : [{
    "text" : "Testnotiz"
  }]
}

```
