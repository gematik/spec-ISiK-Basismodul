# ISiKConfidentialityCodes - ISiK Dokumentenaustausch Implementierungsleitfaden v6.0.0-rc

ISiK Dokumentenaustausch Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiKConfidentialityCodes**

## ValueSet: ISiKConfidentialityCodes 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ISiKConfidentialityCodes | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKConfidentialityCodes |

 
Vertraulichkeitsstufen 

 **References** 

* [Erforderliche Metadaten für Dokumentenaustausch in ISiK](StructureDefinition-ISiKDokumentenMetadaten.md)

### Logical Definition (CLD)

 

### Expansion

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ISiKConfidentialityCodes",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ISiKConfidentialityCodes",
  "version" : "6.0.0-rc",
  "name" : "ISiKConfidentialityCodes",
  "title" : "ISiKConfidentialityCodes",
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
          "value" : "https://www.gematik.de"
        }
      ]
    }
  ],
  "description" : "Vertraulichkeitsstufen",
  "compose" : {
    "include" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/v3-Confidentiality",
        "concept" : [
          {
            "code" : "N",
            "display" : "normal"
          },
          {
            "code" : "R",
            "display" : "restricted"
          },
          {
            "code" : "V",
            "display" : "very restricted"
          }
        ]
      }
    ]
  }
}

```
