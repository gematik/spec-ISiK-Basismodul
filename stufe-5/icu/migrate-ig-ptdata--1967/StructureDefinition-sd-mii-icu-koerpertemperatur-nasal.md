# SD MII ICU Koerpertemperatur nasal - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SD MII ICU Koerpertemperatur nasal**

## Resource Profile: SD MII ICU Koerpertemperatur nasal 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-nasal | *Version*:0.0.1 |
| Active as of 2025-10-23 | *Computable Name*:SD_MII_ICU_Koerpertemperatur_Nasal |

 
Dieses Profil dient der spezialisierten Abbildung der Körpertemperaturmessung im Nasenbereich in der Akutmedizin. Es dient nicht der Abbildung der KörperKERNtemperatur (siehe dafür Profile zu Körperkerntemperatur im generischen Modul Vitalparameter bzw. abgeleitete Profile im ICU-Bereich). 

**Usages:**

* Examples for this Profile: [Observation/Koerpertemperatur-nasal](Observation-Koerpertemperatur-nasal.md)
* CapabilityStatements using this Profile: [ISiK CapabilityStatement VitalSign ICU Source Minimal Akteur (Expanded)](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceMinimalAkteur-expanded.md) and [ISiK CapabilityStatement VitalSign ICU Source Minimal Rolle](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceMinimalRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/icu.test.ig|current/StructureDefinition/sd-mii-icu-koerpertemperatur-nasal)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-sd-mii-icu-koerpertemperatur-nasal.csv), [Excel](StructureDefinition-sd-mii-icu-koerpertemperatur-nasal.xlsx), [Schematron](StructureDefinition-sd-mii-icu-koerpertemperatur-nasal.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "sd-mii-icu-koerpertemperatur-nasal",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-nasal",
  "version" : "0.0.1",
  "name" : "SD_MII_ICU_Koerpertemperatur_Nasal",
  "title" : "SD MII ICU Koerpertemperatur nasal",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-10-23",
  "description" : "Dieses Profil dient der spezialisierten Abbildung der Körpertemperaturmessung im Nasenbereich in der Akutmedizin. Es dient nicht der Abbildung der KörperKERNtemperatur (siehe dafür Profile zu Körperkerntemperatur im generischen Modul Vitalparameter bzw. abgeleitete Profile im ICU-Bereich).",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "workflow",
      "uri" : "http://hl7.org/fhir/workflow",
      "name" : "Workflow Pattern"
    },
    {
      "identity" : "sct-concept",
      "uri" : "http://snomed.info/conceptdomain",
      "name" : "SNOMED CT Concept Domain Binding"
    },
    {
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 v2 Mapping"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "sct-attr",
      "uri" : "http://snomed.org/attributebinding",
      "name" : "SNOMED CT Attribute Binding"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-generisch",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Observation",
        "path" : "Observation"
      },
      {
        "id" : "Observation.code.coding",
        "path" : "Observation.code.coding",
        "min" : 3
      },
      {
        "id" : "Observation.code.coding:sct",
        "path" : "Observation.code.coding",
        "sliceName" : "sct",
        "max" : "0"
      },
      {
        "id" : "Observation.code.coding:IEEE-11073",
        "path" : "Observation.code.coding",
        "sliceName" : "IEEE-11073",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "urn:iso:std:iso:11073:10101",
          "code" : "188504"
        }
      },
      {
        "id" : "Observation.code.coding:specific-loinc",
        "path" : "Observation.code.coding",
        "sliceName" : "specific-loinc",
        "min" : 1,
        "patternCoding" : {
          "system" : "http://loinc.org",
          "code" : "76010-8"
        }
      },
      {
        "id" : "Observation.bodySite",
        "path" : "Observation.bodySite",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://snomed.info/sct",
              "code" : "45206002"
            }
          ]
        }
      }
    ]
  }
}

```
