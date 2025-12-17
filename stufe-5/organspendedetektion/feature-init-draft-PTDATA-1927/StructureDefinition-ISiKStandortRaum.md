# ISiKStandortRaum - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKStandortRaum**

## Resource Profile: ISiKStandortRaum 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKStandortRaum | *Version*:0.0.1 |
| Active as of 2025-12-11 | *Computable Name*:ISiKStandortRaum |

 
Dieses Profil dient der strukturierten Erfassung von Räumen (als Standorten) eines Krankenhauses. 

**Usages:**

* Examples for this Profile: [Location/RaumStandortBeispiel](Location-RaumStandortBeispiel.md)
* CapabilityStatements using this Profile: [CapabilityStatement für Rolle "AufbaustrukturRolle"](CapabilityStatement-ISiKCapabilityStatementAufbaustrukturRolle.md) and [Akteur "ISiKCapabilityStatementBasisServerAkteur" (Expanded)](CapabilityStatement-ISiKCapabilityStatementBasisServerAkteur-expanded.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/Organspendeerkennung.test.ig|current/StructureDefinition/ISiKStandortRaum)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKStandortRaum.csv), [Excel](StructureDefinition-ISiKStandortRaum.xlsx), [Schematron](StructureDefinition-ISiKStandortRaum.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKStandortRaum",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKStandortRaum",
  "version" : "0.0.1",
  "name" : "ISiKStandortRaum",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-11",
  "description" : "Dieses Profil dient der strukturierten Erfassung von Räumen (als Standorten) eines Krankenhauses.",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Location",
  "baseDefinition" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKStandort",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Location",
        "path" : "Location"
      },
      {
        "id" : "Location.operationalStatus",
        "path" : "Location.operationalStatus",
        "comment" : "Motivation: Entsprechend der Bedarfsmeldung im Rahmen der AG zur Ausbaustufe 4 muss ein System den Belegungsstatus eines Raums zum Abruf bereitstellen, sofern diese Information verfügbar ist. Dies dient z.B. der Markierung als 'Isoliert'.",
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://terminology.hl7.org/ValueSet/v2-0116"
        }
      },
      {
        "id" : "Location.physicalType",
        "path" : "Location.physicalType",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://terminology.hl7.org/CodeSystem/location-physical-type",
              "code" : "ro",
              "display" : "Room"
            }
          ]
        }
      }
    ]
  }
}

```
