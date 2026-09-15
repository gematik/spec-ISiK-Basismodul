# MII PR ICU Spontane Atemfrequenz Beatmet - ISiK Organspendeerkennung v6.0.0

ISiK Organspendeerkennung

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **MII PR ICU Spontane Atemfrequenz Beatmet**

## Resource Profile: MII PR ICU Spontane Atemfrequenz Beatmet 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/mii-pr-icu-vent-spontane-atemfrequenz-beatmet | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:MII_PR_ICU_Spontane_Atemfrequenz_Beatmet |

 
Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/profiles/Beatmungswerte - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 16.03.2026 

**Usages:**

* CapabilityStatements using this Profile: [ISiK CapabilityStatement Organspendeerkennung Server (Expanded)](CapabilityStatement-ISiKCapabilityStatementOrganspendeerkennungSourceAkteur-expanded.md) and [ISiK CapabilityStatement Organspendeerkennung Source Rolle](CapabilityStatement-ISiKCapabilityStatementOrganspendeerkennungSourceRolle.md)
* This Profile is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/organspendeerkennung|current/StructureDefinition/StructureDefinition-mii-pr-icu-vent-spontane-atemfrequenz-beatmet.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-mii-pr-icu-vent-spontane-atemfrequenz-beatmet.csv), [Excel](../StructureDefinition-mii-pr-icu-vent-spontane-atemfrequenz-beatmet.xlsx), [Schematron](../StructureDefinition-mii-pr-icu-vent-spontane-atemfrequenz-beatmet.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "mii-pr-icu-vent-spontane-atemfrequenz-beatmet",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/mii-pr-icu-vent-spontane-atemfrequenz-beatmet",
  "version" : "6.0.0",
  "name" : "MII_PR_ICU_Spontane_Atemfrequenz_Beatmet",
  "title" : "MII PR ICU Spontane Atemfrequenz Beatmet",
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
  "description" : "Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/profiles/Beatmungswerte - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 16.03.2026",
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
  "baseDefinition" : "https://gematik.de/fhir/isik/StructureDefinition/mii-pr-vent-icu-parameter-von-beatmung",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Observation",
      "path" : "Observation"
    },
    {
      "id" : "Observation.code.coding",
      "path" : "Observation.code.coding",
      "min" : 2
    },
    {
      "id" : "Observation.code.coding:sct",
      "path" : "Observation.code.coding",
      "sliceName" : "sct",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Observation.code.coding:sct.code",
      "path" : "Observation.code.coding.code",
      "patternCode" : "271625008"
    },
    {
      "id" : "Observation.code.coding:loinc",
      "path" : "Observation.code.coding",
      "sliceName" : "loinc",
      "max" : "0",
      "patternCoding" : {
        "system" : "http://loinc.org"
      }
    },
    {
      "id" : "Observation.code.coding:IEEE-11073",
      "path" : "Observation.code.coding",
      "sliceName" : "IEEE-11073",
      "min" : 1,
      "max" : "1",
      "patternCoding" : {
        "system" : "urn:iso:std:iso:11073:10101",
        "code" : "152498"
      }
    },
    {
      "id" : "Observation.effective[x]",
      "path" : "Observation.effective[x]",
      "min" : 1
    },
    {
      "id" : "Observation.value[x]",
      "path" : "Observation.value[x]",
      "patternQuantity" : {
        "system" : "http://unitsofmeasure.org",
        "code" : "/min"
      }
    }]
  }
}

```
