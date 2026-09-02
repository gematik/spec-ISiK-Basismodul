# ISiKATCCoding - AMTS ISiK Implementierungsleitfaden v6.0.0-rc

AMTS ISiK Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKATCCoding**

## Data Type Profile: ISiKATCCoding 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKATCCoding | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKATCCoding |

 
Data Type profile for ATC Codings in ISiK 

**Usages:**

* Use this DataType Profile: [ISiKMedikament](StructureDefinition-ISiKMedikament.md), [ISiKMedikationsInformation](StructureDefinition-ISiKMedikationsInformation.md), [ISiKMedikationsVerabreichung](StructureDefinition-ISiKMedikationsVerabreichung.md) and [ISiKMedikationsVerordnung](StructureDefinition-ISiKMedikationsVerordnung.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/amts|current/StructureDefinition/ISiKATCCoding)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKATCCoding.csv), [Excel](StructureDefinition-ISiKATCCoding.xlsx), [Schematron](StructureDefinition-ISiKATCCoding.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKATCCoding",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKATCCoding",
  "version" : "6.0.0-rc",
  "name" : "ISiKATCCoding",
  "title" : "ISiKATCCoding",
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
  "description" : "Data Type profile for ATC Codings in ISiK",
  "fhirVersion" : "4.0.1",
  "kind" : "complex-type",
  "abstract" : false,
  "type" : "Coding",
  "baseDefinition" : "http://fhir.de/StructureDefinition/CodingATC",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
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
      }
    ]
  }
}

```
