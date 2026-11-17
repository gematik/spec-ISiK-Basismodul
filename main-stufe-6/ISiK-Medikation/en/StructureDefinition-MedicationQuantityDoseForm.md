# Medication Quantity Dose Form - ISiK Medikation Implementierungsleitfaden v6.0.0

ISiK Medikation Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artefakte**](artifacts.md)
* **Medication Quantity Dose Form**

## Data Type Profile: Medication Quantity Dose Form 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/MedicationQuantityDoseForm | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:MedicationQuantityDoseForm |

 
Quantity Datentyp für Dosage Informationen, der die Nutzung des VS DosageDoseQuantityDE vorgibt. 

**Usages:**

* Use this DataType Profile: [ISiKMedikationsInformation](StructureDefinition-ISiKMedikationsInformation.md), [ISiKMedikationsVerabreichung](StructureDefinition-ISiKMedikationsVerabreichung.md) and [ISiKMedikationsVerordnung](StructureDefinition-ISiKMedikationsVerordnung.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/medikation|current/StructureDefinition/StructureDefinition-MedicationQuantityDoseForm.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-MedicationQuantityDoseForm.csv), [Excel](../StructureDefinition-MedicationQuantityDoseForm.xlsx), [Schematron](../StructureDefinition-MedicationQuantityDoseForm.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "MedicationQuantityDoseForm",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/MedicationQuantityDoseForm",
  "version" : "6.0.0",
  "name" : "MedicationQuantityDoseForm",
  "title" : "Medication Quantity Dose Form",
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
  "description" : "Quantity Datentyp für Dosage Informationen, der die Nutzung des VS DosageDoseQuantityDE vorgibt.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "type" : "Quantity",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/SimpleQuantity",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Quantity",
      "path" : "Quantity",
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://ig.fhir.de/igs/medication/ValueSet/DosageDoseQuantityDE"
      }
    },
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
      "comment" : "Begründung des Must-Support: Zur Interpretation des Codes ist die Angabe des Systems erforderlich.",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Quantity.code",
      "path" : "Quantity.code",
      "short" : "Code der Einheit",
      "comment" : "Begründung des Must-Support: Zur Interpretation der Menge ist der Code erforderlich.",
      "min" : 1,
      "mustSupport" : true
    }]
  }
}

```
