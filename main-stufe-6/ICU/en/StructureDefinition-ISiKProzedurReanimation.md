# ISiK Prozedur Reanimation - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiK Prozedur Reanimation**

## Resource Profile: ISiK Prozedur Reanimation 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKProzedurReanimation | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKProzedurReanimation |

 
Dieses Profil dient der Abbildung von Reanimationsmaßnahmen - insbesondere in der Akutmedizin. 

**Usages:**

* Examples for this Profile: [Procedure/ReanimationBeispiel](Procedure-ReanimationBeispiel.md)
* CapabilityStatements using this Profile: [ISiK CapabilityStatement Organspendeerkennung Source Rolle](CapabilityStatement-ISiKCapabilityStatementOrganspendeerkennungSourceRolle.md), [ISiK CapabilityStatement Vitalparameter Server Extended (Expanded)](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceExtendedAkteur-expanded.md) and [ISiK CapabilityStatement VitalSign ICU Source Extended](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceExtendedRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/icu|current/StructureDefinition/StructureDefinition-ISiKProzedurReanimation.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-ISiKProzedurReanimation.csv), [Excel](../StructureDefinition-ISiKProzedurReanimation.xlsx), [Schematron](../StructureDefinition-ISiKProzedurReanimation.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKProzedurReanimation",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKProzedurReanimation",
  "version" : "6.0.0",
  "name" : "ISiKProzedurReanimation",
  "title" : "ISiK Prozedur Reanimation",
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
  "description" : "Dieses Profil dient der Abbildung von Reanimationsmaßnahmen - insbesondere in der Akutmedizin.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
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
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Procedure",
  "baseDefinition" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKProzedur",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Procedure",
      "path" : "Procedure"
    },
    {
      "id" : "Procedure.category.coding:SNOMED-CT",
      "path" : "Procedure.category.coding",
      "sliceName" : "SNOMED-CT",
      "patternCoding" : {
        "system" : "http://snomed.info/sct",
        "code" : "439569004",
        "display" : "Resuscitation"
      }
    },
    {
      "id" : "Procedure.code.coding:OPS",
      "path" : "Procedure.code.coding",
      "sliceName" : "OPS",
      "patternCoding" : {
        "system" : "http://fhir.de/CodeSystem/bfarm/ops"
      },
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/isik/ValueSet/ProzedurenReanimationCodesOPS"
      }
    },
    {
      "id" : "Procedure.code.coding:SNOMED-CT",
      "path" : "Procedure.code.coding",
      "sliceName" : "SNOMED-CT",
      "patternCoding" : {
        "system" : "http://snomed.info/sct"
      },
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/isik/ValueSet/ProzedurenReanimationCodesSCT"
      }
    }]
  }
}

```
