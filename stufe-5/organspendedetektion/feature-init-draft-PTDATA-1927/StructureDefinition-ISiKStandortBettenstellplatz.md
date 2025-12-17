# ISiKStandortBettenstellplatz - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKStandortBettenstellplatz**

## Resource Profile: ISiKStandortBettenstellplatz 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKStandortBettenstellplatz | *Version*:0.0.1 |
| Active as of 2025-12-11 | *Computable Name*:ISiKStandortBettenstellplatz |

 
Dieses Profil dient der strukturierten Erfassung von Bettenstellplätzen (als Standorten) eines Krankenhauses. 

### Hinweis

 
Ein einzelnes Bett als Gegenstand kann als FHIR-Ressource ‘Device’ abgebildet werden, das einen Bettenstellplatz referenziert. 

**Usages:**

* Examples for this Profile: [Location/BettenstellplatzStandortBeispiel](Location-BettenstellplatzStandortBeispiel.md)
* CapabilityStatements using this Profile: [CapabilityStatement für Rolle "AufbaustrukturRolle"](CapabilityStatement-ISiKCapabilityStatementAufbaustrukturRolle.md) and [Akteur "ISiKCapabilityStatementBasisServerAkteur" (Expanded)](CapabilityStatement-ISiKCapabilityStatementBasisServerAkteur-expanded.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/Organspendeerkennung.test.ig|current/StructureDefinition/ISiKStandortBettenstellplatz)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKStandortBettenstellplatz.csv), [Excel](StructureDefinition-ISiKStandortBettenstellplatz.xlsx), [Schematron](StructureDefinition-ISiKStandortBettenstellplatz.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKStandortBettenstellplatz",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKStandortBettenstellplatz",
  "version" : "0.0.1",
  "name" : "ISiKStandortBettenstellplatz",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-11",
  "description" : "Dieses Profil dient der strukturierten Erfassung von Bettenstellplätzen (als Standorten) \neines Krankenhauses.  \n### Hinweis  \nEin einzelnes Bett als Gegenstand kann als FHIR-Ressource 'Device' abgebildet werden, \ndas einen Bettenstellplatz referenziert.\n",
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
        "short" : "Belegungsstatus eines Bettenstellplatz",
        "comment" : "Motivation: Entsprechend der Bedarfsmeldung im Rahmen der AG zur Ausbaustufe 4 muss ein System den Belegungsstatus eines Bettenstellplatz zum Abruf bereitstellen, sofern diese Information verfügbar ist. Dies dient z.B. der Markierung als 'Isoliert'. Im Sinne der Interoperabilität ist das ValueSet verpflichtend.",
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
              "code" : "bd",
              "display" : "Bed"
            }
          ]
        }
      }
    ]
  }
}

```
