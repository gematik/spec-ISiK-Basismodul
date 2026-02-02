# SD MII ICU Linksventrikulaeres Schlagvolumen Durch Indikatorverduennung - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SD MII ICU Linksventrikulaeres Schlagvolumen Durch Indikatorverduennung**

## Resource Profile: SD MII ICU Linksventrikulaeres Schlagvolumen Durch Indikatorverduennung 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-linksventri-schlagvolumen-durch-indikatorverduennung | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:SD_MII_ICU_Linksventrikulaeres_Schlagvolumen_Durch_Indikatorverduennung |

 
Dieses Profil dient der spezialisierten Abbildung des linksventrikulären Schlagvolumens durch Indikatorverdünnung in der Akutmedizin. 

**Usages:**

* Examples for this Profile: [Observation/Linksventrikulaeres-Schlagvolumen-Durch-Indikatorverduennung](Observation-Linksventrikulaeres-Schlagvolumen-Durch-Indikatorverduennung.md)
* CapabilityStatements using this Profile: [ISiK CapabilityStatement Vitalparameter Server Extended (Expanded)](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceExtendedAkteur-expanded.md) and [ISiK CapabilityStatement VitalSign ICU Source Extended](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceExtendedRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ICU|current/StructureDefinition/sd-mii-icu-linksventri-schlagvolumen-durch-indikatorverduennung)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-sd-mii-icu-linksventri-schlagvolumen-durch-indikatorverduennung.csv), [Excel](StructureDefinition-sd-mii-icu-linksventri-schlagvolumen-durch-indikatorverduennung.xlsx), [Schematron](StructureDefinition-sd-mii-icu-linksventri-schlagvolumen-durch-indikatorverduennung.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "sd-mii-icu-linksventri-schlagvolumen-durch-indikatorverduennung",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-linksventri-schlagvolumen-durch-indikatorverduennung",
  "version" : "6.0.0-rc",
  "name" : "SD_MII_ICU_Linksventrikulaeres_Schlagvolumen_Durch_Indikatorverduennung",
  "title" : "SD MII ICU Linksventrikulaeres Schlagvolumen Durch Indikatorverduennung",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "description" : "Dieses Profil dient der spezialisierten Abbildung des linksventrikulären Schlagvolumens durch Indikatorverdünnung in der Akutmedizin.",
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
  "baseDefinition" : "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-monitoring-und-vitaldaten",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Observation",
        "path" : "Observation"
      },
      {
        "id" : "Observation.code.coding:sct",
        "path" : "Observation.code.coding",
        "sliceName" : "sct",
        "max" : "0"
      },
      {
        "id" : "Observation.code.coding:loinc",
        "path" : "Observation.code.coding",
        "sliceName" : "loinc",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://loinc.org",
          "code" : "8771-8"
        }
      },
      {
        "id" : "Observation.code.coding:IEEE-11073",
        "path" : "Observation.code.coding",
        "sliceName" : "IEEE-11073",
        "max" : "0"
      },
      {
        "id" : "Observation.value[x]",
        "path" : "Observation.value[x]",
        "patternQuantity" : {
          "unit" : "milliliter",
          "system" : "http://unitsofmeasure.org",
          "code" : "mL"
        }
      },
      {
        "id" : "Observation.value[x].unit",
        "path" : "Observation.value[x].unit",
        "min" : 1
      }
    ]
  }
}

```
