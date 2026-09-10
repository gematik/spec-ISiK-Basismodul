# ISiKICD10GMCoding - AMTS ISiK Implementierungsleitfaden v6.0.0

AMTS ISiK Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKICD10GMCoding**

## Data Type Profile: ISiKICD10GMCoding 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKICD10GMCoding | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKICD10GMCoding |

 
Data Type profile for ICD10-GM Codings in ISiK 

**Usages:**

* Use this DataType Profile: [ISiKDiagnose](StructureDefinition-ISiKDiagnose.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/amts|current/StructureDefinition/StructureDefinition-ISiKICD10GMCoding.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-ISiKICD10GMCoding.csv), [Excel](../StructureDefinition-ISiKICD10GMCoding.xlsx), [Schematron](../StructureDefinition-ISiKICD10GMCoding.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKICD10GMCoding",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKICD10GMCoding",
  "version" : "6.0.0",
  "name" : "ISiKICD10GMCoding",
  "title" : "ISiKICD10GMCoding",
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
  "description" : "Data Type profile for ICD10-GM Codings in ISiK",
  "fhirVersion" : "4.0.1",
  "kind" : "complex-type",
  "abstract" : false,
  "type" : "Coding",
  "baseDefinition" : "http://fhir.de/StructureDefinition/CodingICD10GM",
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
      "id" : "Coding.version",
      "path" : "Coding.version",
      "short" : "Version",
      "comment" : "Motivation MS: Version des kodierten Wertes.",
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
