# MII PR ICU MUV zerebraler Perfusionsdruck - ISiK Organspendeerkennung v6.0.0

ISiK Organspendeerkennung

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **MII PR ICU MUV zerebraler Perfusionsdruck**

## Resource Profile: MII PR ICU MUV zerebraler Perfusionsdruck 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/mii-pr-icu-muv-zerebraler-perfusionsdruck | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:MII_PR_ICU_MUV_zerebraler_Perfusionsdruck |

 
Dieses Profil dient der spezialisierten Abbildung des zerebralen Perfusionsdrucks (ICP) in der Akutmedizin. 
Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/profiles/Monitoring%20und%20Vitaldaten/MII_PR_ICU_MUV_zerebraler_Perfusionsdruck.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 3.3.2026. 

**Usages:**

* CapabilityStatements using this Profile: [ISiK CapabilityStatement Organspendeerkennung Server (Expanded)](CapabilityStatement-ISiKCapabilityStatementOrganspendeerkennungSourceAkteur-expanded.md) and [ISiK CapabilityStatement Organspendeerkennung Source Rolle](CapabilityStatement-ISiKCapabilityStatementOrganspendeerkennungSourceRolle.md)
* This Profile is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/organspendeerkennung|current/StructureDefinition/StructureDefinition-mii-pr-icu-muv-zerebraler-perfusionsdruck.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-mii-pr-icu-muv-zerebraler-perfusionsdruck.csv), [Excel](../StructureDefinition-mii-pr-icu-muv-zerebraler-perfusionsdruck.xlsx), [Schematron](../StructureDefinition-mii-pr-icu-muv-zerebraler-perfusionsdruck.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-icu-muv-zerebraler-perfusionsdruck",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/mii-pr-icu-muv-zerebraler-perfusionsdruck",
  "version" : "6.0.0",
  "name" : "MII_PR_ICU_MUV_zerebraler_Perfusionsdruck",
  "title" : "MII PR ICU MUV zerebraler Perfusionsdruck",
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
  "description" : "Dieses Profil dient der spezialisierten Abbildung des zerebralen Perfusionsdrucks (ICP) in der Akutmedizin.\n\nDie Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/profiles/Monitoring%20und%20Vitaldaten/MII_PR_ICU_MUV_zerebraler_Perfusionsdruck.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 3.3.2026.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
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
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-monitoring-und-vitaldaten",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Observation",
      "path" : "Observation"
    },
    {
      "id" : "Observation.code.coding:sct",
      "path" : "Observation.code.coding",
      "sliceName" : "sct",
      "patternCoding" : {
        "system" : "http://snomed.info/sct",
        "code" : "250846007"
      }
    },
    {
      "id" : "Observation.code.coding:loinc",
      "path" : "Observation.code.coding",
      "sliceName" : "loinc",
      "patternCoding" : {
        "system" : "http://loinc.org",
        "code" : "61017-0"
      }
    },
    {
      "id" : "Observation.code.coding:IEEE-11073",
      "path" : "Observation.code.coding",
      "sliceName" : "IEEE-11073",
      "patternCoding" : {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "153604"
      }
    },
    {
      "id" : "Observation.value[x]",
      "path" : "Observation.value[x]",
      "patternQuantity" : {
        "unit" : "millimeter Mercury column",
        "system" : "http://unitsofmeasure.org",
        "code" : "mm[Hg]"
      }
    },
    {
      "id" : "Observation.value[x].unit",
      "path" : "Observation.value[x].unit",
      "min" : 1
    },
    {
      "id" : "Observation.bodySite",
      "path" : "Observation.bodySite",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "263353005"
        }]
      }
    }]
  }
}

```
