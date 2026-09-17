# Medication Quantity - ISiK Medikation Implementierungsleitfaden v6.0.0-rc

ISiK Medikation Implementierungsleitfaden

Version 6.0.0-rc - release-candidate 

* [**Table of Contents**](toc.md)
* [**Artefakte**](artifacts.md)
* **Medication Quantity**

## Data Type Profile: Medication Quantity 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/MedicationQuantity | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:MedicationQuantity |

 
Quantity Datentyp der die Nutzung von UCUM vorgibt. Bei dimensionslosen Einheiten wie ‘Tablette’ wird ein code von ‘1’ erwartet, ‘Tablette’ kann als String in Unit hinterlegt werden. 

**Usages:**

* Use this DataType Profile: [ISiKMedikament](StructureDefinition-ISiKMedikament.md), [ISiKMedikationsInformation](StructureDefinition-ISiKMedikationsInformation.md), [ISiKMedikationsVerabreichung](StructureDefinition-ISiKMedikationsVerabreichung.md) and [ISiKMedikationsVerordnung](StructureDefinition-ISiKMedikationsVerordnung.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/medikation|current/StructureDefinition/MedicationQuantity)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-MedicationQuantity.csv), [Excel](StructureDefinition-MedicationQuantity.xlsx), [Schematron](StructureDefinition-MedicationQuantity.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "MedicationQuantity",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/MedicationQuantity",
  "version" : "6.0.0-rc",
  "name" : "MedicationQuantity",
  "title" : "Medication Quantity",
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
  "description" : "Quantity Datentyp der die Nutzung von UCUM vorgibt. Bei dimensionslosen Einheiten wie 'Tablette' wird ein code von '1' erwartet, 'Tablette' kann als String in Unit hinterlegt werden.",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 v2 Mapping"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "complex-type",
  "abstract" : false,
  "type" : "Quantity",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/SimpleQuantity",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Quantity.value",
        "path" : "Quantity.value",
        "short" : "Menge der Medikation",
        "comment" : "Begründung des Must-Support: Basisinformation zur Medikation",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Quantity.unit",
        "path" : "Quantity.unit",
        "short" : "Einheit der Medikation als String",
        "comment" : "Begründung des Must-Support: Bereitstellung einer menschenlesbaren Darstellung der Einheit.",
        "mustSupport" : true
      },
      {
        "id" : "Quantity.system",
        "path" : "Quantity.system",
        "short" : "System der Einheit",
        "comment" : "fix: http://unitsofmeasure.org",
        "min" : 1,
        "patternUri" : "http://unitsofmeasure.org",
        "mustSupport" : true
      },
      {
        "id" : "Quantity.code",
        "path" : "Quantity.code",
        "short" : "Code der Einheit",
        "comment" : "Begründung des Must-Support: Zur Interpretation der Menge ist der Code erforderlich.",
        "min" : 1,
        "mustSupport" : true
      }
    ]
  }
}

```
