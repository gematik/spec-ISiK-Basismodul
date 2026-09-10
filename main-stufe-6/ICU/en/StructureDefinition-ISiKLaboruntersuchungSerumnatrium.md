# ISiKLaboruntersuchungSerumnatrium - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKLaboruntersuchungSerumnatrium**

## Resource Profile: ISiKLaboruntersuchungSerumnatrium 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKLaboruntersuchungSerumnatrium | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKLaboruntersuchungSerumnatrium |

 
Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Serumnatrium eines Patienten in ISiK Szenarien. Das Profil wird u. A. im Use Case zur Unterstützung von Transplantationsbeauftragten bei der Organspendeerkennung eingesetzt; besonders in diesem Kontext muss es auch Werte abbilden, die im Rahmen von Messungen mittels Point-of-Care-Testing erhoben wurden. Das Profil ist auch geeignet, um Serumnatrium Werte abzubilden, die mittels Laboruntersuchung erhoben wurden. 
Eine eindeutige Kennzeichnung für die Differenzierung hinsichtlich der Erhebungsmethode ist derzeit über dieses Profil nicht vorgesehen. Es kann jedoch das Element .method verwendet werden. Die Differenzierung aufgrund der Methode kann unter Umständen sinnvoll sein, wenn im Falle einer Laboruntersuchung ein Arzt die Werte zuerst sichten und bestätigen müsste, bevor sie im PDMS als 'final' für den Patienten hinterlegt werden. 

**Usages:**

* Examples for this Profile: [Observation/ExampleISiKLaboruntersuchungSerumnatrium1](Observation-ExampleISiKLaboruntersuchungSerumnatrium1.md), [Observation/ExampleOrganSerumNatrium202003110104](Observation-ExampleOrganSerumNatrium202003110104.md), [Observation/ExampleOrganSerumNatrium202003110159](Observation-ExampleOrganSerumNatrium202003110159.md) and [Observation/ExampleOrganSerumNatrium202003110306](Observation-ExampleOrganSerumNatrium202003110306.md)
* CapabilityStatements using this Profile: [ISiK CapabilityStatement Labor Minimal Rolle](CapabilityStatement-ISiKCapabilityStatementLaborMinimalRolle.md), [ISiK CapabilityStatement Organspendeerkennung Source Rolle](CapabilityStatement-ISiKCapabilityStatementOrganspendeerkennungSourceRolle.md), [ISiK CapabilityStatement Vitalparameter Server Extended (Expanded)](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceExtendedAkteur-expanded.md) and [ISiK CapabilityStatement VitalSign ICU Source Minimal Akteur (Expanded)](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceMinimalAkteur-expanded.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/icu|current/StructureDefinition/StructureDefinition-ISiKLaboruntersuchungSerumnatrium.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-ISiKLaboruntersuchungSerumnatrium.csv), [Excel](../StructureDefinition-ISiKLaboruntersuchungSerumnatrium.xlsx), [Schematron](../StructureDefinition-ISiKLaboruntersuchungSerumnatrium.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKLaboruntersuchungSerumnatrium",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKLaboruntersuchungSerumnatrium",
  "version" : "6.0.0",
  "name" : "ISiKLaboruntersuchungSerumnatrium",
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
  "description" : "Dieses Profil ermöglicht die Abbildung der Laboruntersuchung Serumnatrium eines Patienten in ISiK Szenarien. Das Profil wird u. A. im Use Case zur Unterstützung von Transplantationsbeauftragten bei der Organspendeerkennung eingesetzt; besonders in diesem Kontext muss es auch Werte abbilden, die im Rahmen von Messungen mittels Point-of-Care-Testing erhoben wurden. Das Profil ist auch geeignet, um Serumnatrium Werte abzubilden, die mittels Laboruntersuchung erhoben wurden.\n\nEine eindeutige Kennzeichnung für die Differenzierung hinsichtlich der Erhebungsmethode ist derzeit über dieses Profil nicht vorgesehen. Es kann jedoch das Element .method verwendet werden. Die Differenzierung aufgrund der Methode kann unter Umständen sinnvoll sein, wenn im Falle einer Laboruntersuchung ein Arzt die Werte zuerst sichten und bestätigen müsste, bevor sie im PDMS als 'final' für den Patienten hinterlegt werden. ",
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
  "baseDefinition" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKLaboruntersuchung",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Observation",
      "path" : "Observation"
    },
    {
      "id" : "Observation.code.coding:loinc",
      "path" : "Observation.code.coding",
      "sliceName" : "loinc",
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/isik/ValueSet/ObservationCodesSerumnatrium"
      }
    },
    {
      "id" : "Observation.value[x]:valueQuantity",
      "path" : "Observation.value[x]",
      "sliceName" : "valueQuantity",
      "type" : [{
        "code" : "Quantity"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/isik/ValueSet/ObservationUnitsSerumnatrium"
      }
    },
    {
      "id" : "Observation.referenceRange.low",
      "path" : "Observation.referenceRange.low",
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/isik/ValueSet/ObservationUnitsSerumnatrium"
      }
    },
    {
      "id" : "Observation.referenceRange.high",
      "path" : "Observation.referenceRange.high",
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/isik/ValueSet/ObservationUnitsSerumnatrium"
      }
    }]
  }
}

```
