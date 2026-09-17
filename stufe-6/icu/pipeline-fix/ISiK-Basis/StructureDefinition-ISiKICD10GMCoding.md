# ISiKICD10GMCoding - ISiK Basis Implementierungsleitfaden v6.0.0-rc

ISiK Basis Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiKICD10GMCoding**

## Data Type Profile: ISiKICD10GMCoding 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKICD10GMCoding | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKICD10GMCoding |

 
Data Type profile for ICD10-GM Codings in ISiK 

**Usages:**

* Use this DataType Profile: [ISiKDiagnose](StructureDefinition-ISiKDiagnose.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/basis|current/StructureDefinition/ISiKICD10GMCoding)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKICD10GMCoding.csv), [Excel](StructureDefinition-ISiKICD10GMCoding.xlsx), [Schematron](StructureDefinition-ISiKICD10GMCoding.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKICD10GMCoding",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKICD10GMCoding",
  "version" : "6.0.0-rc",
  "name" : "ISiKICD10GMCoding",
  "title" : "ISiKICD10GMCoding",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "publisher" : "gematik GmbH",
  "contact" : [
    {
      "name" : "gematik GmbH",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://gematik.de"
        }
      ]
    }
  ],
  "description" : "Data Type profile for ICD10-GM Codings in ISiK",
  "fhirVersion" : "4.0.1",
  "kind" : "complex-type",
  "abstract" : false,
  "type" : "Coding",
  "baseDefinition" : "http://fhir.de/StructureDefinition/CodingICD10GM",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
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
      }
    ]
  }
}

```
