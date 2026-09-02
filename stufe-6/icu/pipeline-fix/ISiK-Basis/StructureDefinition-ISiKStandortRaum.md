# ISiKStandortRaum - ISiK Basis Implementierungsleitfaden v6.0.0-rc

ISiK Basis Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiKStandortRaum**

## Resource Profile: ISiKStandortRaum 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKStandortRaum | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKStandortRaum |

 
Dieses Profil dient der strukturierten Erfassung von Räumen (als Standorten) eines Krankenhauses. 

**Usages:**

* Examples for this Profile: [Location/RaumStandortBeispiel](Location-RaumStandortBeispiel.md)
* CapabilityStatements using this Profile: [CapabilityStatement für Rolle AufbaustrukturRolle](CapabilityStatement-ISiKCapabilityStatementAufbaustrukturRolle.md) and [Akteur ISiKCapabilityStatementBasisServerAkteur (Expanded)](CapabilityStatement-ISiKCapabilityStatementBasisServerAkteur-expanded.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/basis|current/StructureDefinition/ISiKStandortRaum)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKStandortRaum.csv), [Excel](StructureDefinition-ISiKStandortRaum.xlsx), [Schematron](StructureDefinition-ISiKStandortRaum.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKStandortRaum",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKStandortRaum",
  "version" : "6.0.0-rc",
  "name" : "ISiKStandortRaum",
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
