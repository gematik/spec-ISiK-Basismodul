# ISiKASKCoding - AMTS ISiK Implementierungsleitfaden v6.0.0

AMTS ISiK Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKASKCoding**

## Data Type Profile: ISiKASKCoding 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKASKCoding | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKASKCoding |

 
Data Type profile for ASK Codings in ISiK 

**Usages:**

* Use this DataType Profile: [ISiKAllergieUnvertraeglichkeit](StructureDefinition-ISiKAllergieUnvertraeglichkeit.md) and [ISiKMedikament](StructureDefinition-ISiKMedikament.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/amts|current/StructureDefinition/StructureDefinition-ISiKASKCoding.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-ISiKASKCoding.csv), [Excel](../StructureDefinition-ISiKASKCoding.xlsx), [Schematron](../StructureDefinition-ISiKASKCoding.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKASKCoding",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKASKCoding",
  "version" : "6.0.0",
  "name" : "ISiKASKCoding",
  "title" : "ISiKASKCoding",
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
  "description" : "Data Type profile for ASK Codings in ISiK",
  "fhirVersion" : "4.0.1",
  "kind" : "complex-type",
  "abstract" : false,
  "type" : "Coding",
  "baseDefinition" : "http://fhir.de/StructureDefinition/CodingASK",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Coding",
      "path" : "Coding"
    },
    {
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
