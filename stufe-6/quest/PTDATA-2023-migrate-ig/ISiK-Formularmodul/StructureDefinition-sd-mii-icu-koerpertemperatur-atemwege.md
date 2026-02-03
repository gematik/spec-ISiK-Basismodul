# SD MII ICU Koerpertemperatur Atemwege - ISiK Formularmodul Implementation Guide v6.0.0-rc

ISiK Formularmodul Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **SD MII ICU Koerpertemperatur Atemwege**

## Resource Profile: SD MII ICU Koerpertemperatur Atemwege 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-atemwege | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:SD_MII_ICU_Koerpertemperatur_Atemwege |

 
Dieses Profil dient der spezialisierten Abbildung der Körpertemperaturmessung in den Atemwegen in der Akutmedizin. Es dient nicht der Abbildung der KörperKERNtemperatur (siehe dafür Profile zu Körperkerntemperatur im generischen Modul Vitalparameter bzw. abgeleitete Profile im ICU-Bereich). 

**Usages:**

* Examples for this Profile: [Observation/Koerpertemperatur-Atemwege](Observation-Koerpertemperatur-Atemwege.md)
* CapabilityStatements using this Profile: [Akteur "ISiKCapabilityStatementFormularDatenQuelleAkteur" (Expanded)](CapabilityStatement-ISiKCapabilityStatementFormularDatenQuelleAkteur-expanded.md) and [ISiK CapabilityStatement VitalSign ICU Source Extended](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceExtendedRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/formular|current/StructureDefinition/sd-mii-icu-koerpertemperatur-atemwege)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-sd-mii-icu-koerpertemperatur-atemwege.csv), [Excel](StructureDefinition-sd-mii-icu-koerpertemperatur-atemwege.xlsx), [Schematron](StructureDefinition-sd-mii-icu-koerpertemperatur-atemwege.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "sd-mii-icu-koerpertemperatur-atemwege",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-atemwege",
  "version" : "6.0.0-rc",
  "name" : "SD_MII_ICU_Koerpertemperatur_Atemwege",
  "title" : "SD MII ICU Koerpertemperatur Atemwege",
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
  "description" : "Dieses Profil dient der spezialisierten Abbildung der Körpertemperaturmessung in den Atemwegen in der Akutmedizin. Es dient nicht der Abbildung der KörperKERNtemperatur (siehe dafür Profile zu Körperkerntemperatur im generischen Modul Vitalparameter bzw. abgeleitete Profile im ICU-Bereich).",
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
          "code" : "150356"
        }
      },
      {
        "id" : "Observation.code.coding:specific-loinc",
        "path" : "Observation.code.coding",
        "sliceName" : "specific-loinc",
        "min" : 1,
        "patternCoding" : {
          "system" : "http://loinc.org",
          "code" : "60955-2"
        }
      },
      {
        "id" : "Observation.bodySite",
        "path" : "Observation.bodySite",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://snomed.info/sct",
              "code" : "89187006"
            }
          ]
        }
      }
    ]
  }
}

```
