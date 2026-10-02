# ISiKPZNCoding - AMTS ISiK Implementierungsleitfaden v6.0.0

AMTS ISiK Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKPZNCoding**

## Data Type Profile: ISiKPZNCoding 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKPZNCoding | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKPZNCoding |

 
Data Type profile for ATC Codings in ISiK 

**Usages:**

* Use this DataType Profile: [ISiKMedikament](StructureDefinition-ISiKMedikament.md), [ISiKMedikationsInformation](StructureDefinition-ISiKMedikationsInformation.md), [ISiKMedikationsVerabreichung](StructureDefinition-ISiKMedikationsVerabreichung.md) and [ISiKMedikationsVerordnung](StructureDefinition-ISiKMedikationsVerordnung.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/amts|current/StructureDefinition/StructureDefinition-ISiKPZNCoding.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-ISiKPZNCoding.csv), [Excel](../StructureDefinition-ISiKPZNCoding.xlsx), [Schematron](../StructureDefinition-ISiKPZNCoding.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKPZNCoding",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKPZNCoding",
  "version" : "6.0.0",
  "name" : "ISiKPZNCoding",
  "title" : "ISiKPZNCoding",
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
  "description" : "Data Type profile for ATC Codings in ISiK",
  "fhirVersion" : "4.0.1",
  "kind" : "complex-type",
  "abstract" : false,
  "type" : "Coding",
  "baseDefinition" : "http://fhir.de/StructureDefinition/CodingPZN",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Coding.system",
      "path" : "Coding.system",
      "short" : "System",
      "comment" : "Motivation MS: URL des CodeSystems des kodierten Wertes.",
      "mustSupport" : true
    },
    {
      "id" : "Coding.code",
      "path" : "Coding.code",
      "short" : "Code",
      "comment" : "Motivation MS: Kodierter Wert aus einem CodeSystem.",
      "mustSupport" : true
    },
    {
      "id" : "Coding.display",
      "path" : "Coding.display",
      "short" : "Display",
      "comment" : "Motivation MS: Anzeigename des kodierten Wertes.",
      "mustSupport" : true
    }]
  }
}

```
