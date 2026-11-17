# ProzedurenKategorieSCT - ISiK Basis Implementierungsleitfaden v6.0.0

ISiK Basis Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ProzedurenKategorieSCT**

## ValueSet: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ProzedurenKategorieSCT | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ProzedurenKategorieSCT |

 
Enthaelt alle SNOMED Codes für ein Mapping der OPS Klassentitel 

 **References** 

* [ISiKProzedur](StructureDefinition-ISiKProzedur.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ProzedurenKategorieSCT",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ProzedurenKategorieSCT",
  "version" : "6.0.0",
  "name" : "ProzedurenKategorieSCT",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-07-01",
  "publisher" : "gematik GmbH",
  "contact" : [{
    "name" : "gematik GmbH",
    "telecom" : [{
      "system" : "url",
      "value" : "https://gematik.de"
    }]
  }],
  "description" : "Enthaelt alle SNOMED Codes für ein Mapping der OPS Klassentitel",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "165197003",
        "display" : "Diagnostic assessment"
      },
      {
        "code" : "363679005",
        "display" : "Imaging"
      },
      {
        "code" : "387713003",
        "display" : "Surgical procedure"
      },
      {
        "code" : "18629005",
        "display" : "Administration of medicine"
      },
      {
        "code" : "277132007",
        "display" : "Therapeutic procedure"
      },
      {
        "code" : "439569004",
        "display" : "Resuscitation (procedure)"
      },
      {
        "code" : "394841004",
        "display" : "Other category"
      }]
    }]
  }
}

```
