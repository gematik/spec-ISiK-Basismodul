# MII VS ICU Code Observation Bilanzen LOINC - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII VS ICU Code Observation Bilanzen LOINC**

## ValueSet: MII VS ICU Code Observation Bilanzen LOINC 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-code-observation-bilanzen-loinc | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:MII_VS_ICU_Code_Observation_Bilanzen_LOINC |

 
Dieses ValueSet enthaelt Codes fuer die im Kontext einer Bilanz verwendeten LOINC-Parameter. 

 **References** 

* [MII PR ICU Bilanz](StructureDefinition-mii-pr-icu-bilanz.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "mii-vs-icu-code-observation-bilanzen-loinc",
  "url" : "https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-code-observation-bilanzen-loinc",
  "version" : "6.0.0",
  "name" : "MII_VS_ICU_Code_Observation_Bilanzen_LOINC",
  "title" : "MII VS ICU Code Observation Bilanzen LOINC",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-07-01",
  "publisher" : "gematik GmbH",
  "contact" : [{
    "name" : "gematik GmbH",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.gematik.de"
    }]
  }],
  "description" : "Dieses ValueSet enthaelt Codes fuer die im Kontext einer Bilanz verwendeten LOINC-Parameter.",
  "compose" : {
    "include" : [{
      "system" : "http://loinc.org",
      "concept" : [{
        "code" : "79561-7",
        "display" : "Fluid output enteral tube [Volume] Measured"
      },
      {
        "code" : "81661-1",
        "display" : "Blood loss [Volume] Measured"
      },
      {
        "code" : "8953-2",
        "display" : "Fluid intake enteral tube Measured"
      },
      {
        "code" : "9000-1",
        "display" : "Fluid intake oral Measured"
      },
      {
        "code" : "9097-7",
        "display" : "Fluid balance 24 hour"
      },
      {
        "code" : "9103-3",
        "display" : "Fluid intake total Measured"
      },
      {
        "code" : "9113-2",
        "display" : "Fluid output biliary drain"
      },
      {
        "code" : "9187-6",
        "display" : "Urine output"
      },
      {
        "code" : "9203-1",
        "display" : "Fluid output wound drain"
      },
      {
        "code" : "9217-1",
        "display" : "Output.stool [Volume]"
      },
      {
        "code" : "9257-7",
        "display" : "Fluid output total Measured"
      },
      {
        "code" : "99741-1",
        "display" : "Ultrafiltrate volume removed"
      }]
    }]
  }
}

```
