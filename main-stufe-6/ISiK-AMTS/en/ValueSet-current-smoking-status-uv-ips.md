# Current Smoking Status - IPS - AMTS ISiK Implementierungsleitfaden v6.0.0

AMTS ISiK Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Current Smoking Status - IPS**

## ValueSet: Current Smoking Status - IPS 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/current-smoking-status-uv-ips | *Version*:6.0.0 |
| Active as of 2026-09-02 | *Computable Name*:CurrentSmokingStatusUvIps |
| *Other Identifiers:*http://art-decor.org/ns/oids/vs#2.16.840.1.113883.11.22.59 (use: official, ) | |
| **Copyright/Legal**: This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc | |

 
HL7 LOINC value set for smoking status. Based on the HL7 Vocab and Structured Doc WG (formerly TC) consensus - per US CDC submission 7/12/2012 for smoking status terms. 

 **References** 

* [ISiK Raucherstatus](StructureDefinition-ISiKRaucherStatus.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "current-smoking-status-uv-ips",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/StructureDefinition/shareablevalueset"]
  },
  "url" : "https://gematik.de/fhir/isik/ValueSet/current-smoking-status-uv-ips",
  "identifier" : [{
    "use" : "official",
    "system" : "http://art-decor.org/ns/oids/vs",
    "value" : "2.16.840.1.113883.11.22.59"
  }],
  "version" : "6.0.0",
  "name" : "CurrentSmokingStatusUvIps",
  "title" : "Current Smoking Status - IPS",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-09-02T11:31:41+00:00",
  "publisher" : "gematik GmbH",
  "contact" : [{
    "name" : "gematik GmbH",
    "telecom" : [{
      "system" : "url",
      "value" : "https://gematik.de"
    }]
  }],
  "description" : "HL7 LOINC value set for smoking status.  Based on the HL7 Vocab and Structured Doc WG (formerly TC) consensus - per US CDC submission 7/12/2012 for smoking status terms.",
  "immutable" : false,
  "copyright" : "This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc",
  "compose" : {
    "include" : [{
      "system" : "http://loinc.org",
      "concept" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/ordinalValue",
          "valueDecimal" : 1
        }],
        "code" : "LA18976-3",
        "display" : "Current every day smoker"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/ordinalValue",
          "valueDecimal" : 2
        }],
        "code" : "LA18977-1",
        "display" : "Current some day smoker"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/ordinalValue",
          "valueDecimal" : 3
        }],
        "code" : "LA15920-4",
        "display" : "Former smoker"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/ordinalValue",
          "valueDecimal" : 4
        }],
        "code" : "LA18978-9",
        "display" : "Never smoker"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/ordinalValue",
          "valueDecimal" : 5
        }],
        "code" : "LA18979-7",
        "display" : "Smoker, current status unknown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/ordinalValue",
          "valueDecimal" : 6
        }],
        "code" : "LA18980-5",
        "display" : "Unknown if ever smoked"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/ordinalValue",
          "valueDecimal" : 7
        }],
        "code" : "LA18981-3",
        "display" : "Heavy tobacco smoker"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/ordinalValue",
          "valueDecimal" : 8
        }],
        "code" : "LA18982-1",
        "display" : "Light tobacco smoker"
      }]
    }]
  }
}

```
