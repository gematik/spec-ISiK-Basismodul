# ISiK Labor Methode - ISiK Organspendeerkennung v6.0.0

ISiK Organspendeerkennung

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiK Labor Methode**

## ValueSet: ISiK Labor Methode 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ISiKLaborMethodeVS | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKLaborMethodeVS |

 
SNOMED-CT-Codes für Untersuchungsmethoden im Labor (alle Konzepte unterhalb von #272394005 'Technique (qualifier value)'). 

 **References** 

* [ISiKLaboruntersuchung](StructureDefinition-ISiKLaboruntersuchung.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ISiKLaborMethodeVS",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ISiKLaborMethodeVS",
  "version" : "6.0.0",
  "name" : "ISiKLaborMethodeVS",
  "title" : "ISiK Labor Methode",
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
  "description" : "SNOMED-CT-Codes für Untersuchungsmethoden im Labor (alle Konzepte unterhalb von #272394005 'Technique (qualifier value)').",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "filter" : [{
        "property" : "concept",
        "op" : "descendent-of",
        "value" : "272394005"
      }]
    }]
  }
}

```
