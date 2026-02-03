#  - Organspendeerkennung v0.0.1-rc

Organspendeerkennung

Version 0.0.1-rc - STU1 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* ****

## Procedure: 

Profile: [ISiKProzedur](StructureDefinition-ISiKProzedur.md)

**ExtensionProzedurDokumentationsdatum**: 2020-04-23

**status**: Completed

**category**: Surgical procedure (procedure)

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
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKProzedur"
    ]
  },
  "extension" : [
    {
      "url" : "http://fhir.de/StructureDefinition/ProzedurDokumentationsdatum",
      "valueDateTime" : "2020-04-23"
    }
  ],
  "status" : "completed",
  "category" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "387713003",
        "display" : "Surgical procedure (procedure)"
      }
    ]
  },
  "code" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "80146002",
        "display" : "Excision of appendix (procedure)"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/ops",
        "version" : "2020",
        "code" : "5-470",
        "display" : "Appendektomie"
      },
      {
        "version" : "2024"
      }
    ],
    "text" : "Entfernung des Blinddarms"
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "performedDateTime" : "2020-04-23",
  "note" : [
    {
      "text" : "Testnotiz"
    }
  ]
}

```
