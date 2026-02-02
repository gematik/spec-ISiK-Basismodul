# ISiKStandort - ISiK Organspendeerkennung v0.0.1-rc

ISiK Organspendeerkennung

Version 0.0.1-rc - STU1 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiKStandort**

## Resource Profile: ISiKStandort 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKStandort | *Version*:0.0.1-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKStandort |

 
Dieses Profil dient der strukturierten Erfassung von Standortangaben eines Krankenhauses oder von Organisationseinheiten innerhalb eines Krankenhauses in ISiK-Szenarien. 

### Motivation

 
In FHIR wird die Organisation (Organization) vom Standort (Location) eindeutig abgegrenzt. 
Die Abbildung von Standorten in einem Krankenhaus unterstützt u.a. die Raum- und Bettenbelegung in strukturierter Form. 
Die Erfassung des Standortes in strukturierter Form soll u.a. ermöglichen: 
* Zuweisungen von Diensten an bestimmte Standorte im Rahmen des Terminmanagements
* Die Raum- und Betten-Belegung in strukturierter Form (interdisziplinär) - u.a. für 
* Patientenportale im Rahmen der Terminbuchung, z.B. um den Wunsch nach Einzelbett, bzw. 1 oder 2 Betten abzubilden
* KIS und weitere Subsysteme: 
* zur Patientenabholung und Information für den Transportdienst
* Abbildung der Verfügbarkeit eines spezifischen Bettenstellplatzes (z.B. mit spezifischem Monitoring-Device)
 
 
* Im Rahmen der Versorgung kann eine der folgenden Beispiel-Fragen beantworten werden: 
* Handelt es sich um ein Isolationszimmer?
* Gibt es bestimmte Ausstattung, z.B. Beatmungsgeräte?
* etc.
 
 
Dafür werden Standort-Profile in unterschiedlicher Granularität definiert. 

### Kompatibilität

 
Für das Profil ISiKStandort wurde bis zum Zeitpunkt der Veröffentlichung kein Abgleich der Kompatibilität zu anderen Profilen (der KBV und der Medizininformatik-Initiative) durchgeführt.
 Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. 

**Usages:**

* Derived from this Profile: [ISiKStandortBettenstellplatz](StructureDefinition-ISiKStandortBettenstellplatz.md) and [ISiKStandortRaum](StructureDefinition-ISiKStandortRaum.md)
* Examples for this Profile: [Station A](Location-StationStandortBeispiel.md)
* CapabilityStatements using this Profile: [CapabilityStatement für Rolle "AufbaustrukturRolle"](CapabilityStatement-ISiKCapabilityStatementAufbaustrukturRolle.md) and [Akteur "ISiKCapabilityStatementBasisServerAkteur" (Expanded)](CapabilityStatement-ISiKCapabilityStatementBasisServerAkteur-expanded.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/Organspendeerkennung|current/StructureDefinition/ISiKStandort)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKStandort.csv), [Excel](StructureDefinition-ISiKStandort.xlsx), [Schematron](StructureDefinition-ISiKStandort.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKStandort",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKStandort",
  "version" : "0.0.1-rc",
  "name" : "ISiKStandort",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "description" : "Dieses Profil dient der strukturierten Erfassung von Standortangaben eines \nKrankenhauses oder von Organisationseinheiten innerhalb eines Krankenhauses in ISiK-Szenarien.  \n### Motivation\nIn FHIR wird die Organisation (Organization) vom Standort (Location) eindeutig abgegrenzt.\n\nDie Abbildung von Standorten in einem Krankenhaus unterstützt u.a. die Raum- und Bettenbelegung in strukturierter Form. \n\nDie Erfassung des Standortes in strukturierter Form soll u.a. ermöglichen:\n- Zuweisungen von Diensten an bestimmte Standorte im Rahmen des Terminmanagements\n- Die Raum- und Betten-Belegung in strukturierter Form (interdisziplinär) - u.a. für \n    - Patientenportale im Rahmen der Terminbuchung, z.B. um den Wunsch nach Einzelbett, bzw. 1 oder 2 Betten abzubilden\n    - KIS und weitere Subsysteme:\n      - zur Patientenabholung und Information für den Transportdienst\n      - Abbildung der Verfügbarkeit eines spezifischen Bettenstellplatzes (z.B. mit spezifischem Monitoring-Device) \n- Im Rahmen der Versorgung kann eine der folgenden Beispiel-Fragen beantworten werden:\n    - Handelt es sich um ein Isolationszimmer?\n    - Gibt es bestimmte Ausstattung, z.B. Beatmungsgeräte?\n    - etc.\n\nDafür werden Standort-Profile in unterschiedlicher Granularität definiert. \n\n### Kompatibilität\nFür das Profil ISiKStandort wurde bis zum Zeitpunkt der Veröffentlichung kein Abgleich der \nKompatibilität zu anderen Profilen (der KBV und der Medizininformatik-Initiative) durchgeführt.  \nHinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden.\n",
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
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Location",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Location",
        "path" : "Location"
      },
      {
        "id" : "Location.id",
        "path" : "Location.id",
        "short" : "serverseitige, interne ID des Datensatzes",
        "comment" : "**bedingtes Pflichtfeld/bedingtes MS:** Alle von einem Server bereitgestellten Ressourcen MÜSSEN über eine `id` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `id`verfügen. ",
        "mustSupport" : true
      },
      {
        "id" : "Location.meta.versionId",
        "path" : "Location.meta.versionId",
        "short" : "Eindeutiger Name der serverseitigen Version des Datensatzes",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über eine `versionID` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `versionID`verfügen. "
      },
      {
        "id" : "Location.meta.lastUpdated",
        "path" : "Location.meta.lastUpdated",
        "short" : "Zeitpunkt der letzten Änderung",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über ein `lastUpdate` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über ein `lastUpdate`verfügen. "
      },
      {
        "id" : "Location.identifier",
        "path" : "Location.identifier",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        },
        "short" : "Eindeutiger Identifier des Standorts",
        "comment" : "Motivation: entspricht https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/sd_mii_struktur_location",
        "mustSupport" : true
      },
      {
        "id" : "Location.identifier:standortnummer-dkg",
        "path" : "Location.identifier",
        "sliceName" : "standortnummer-dkg",
        "short" : "Standortnummer nach DKG",
        "comment" : "Motivation : Entsprechend der Festlegung der DKG laut Basisprofile-DE 1.5.0 (https://simplifier.net/packages/de.basisprofil.r4/) ",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Identifier",
            "profile" : [
              "http://fhir.de/StructureDefinition/identifier-standortnummer"
            ]
          }
        ],
        "patternIdentifier" : {
          "system" : "http://fhir.de/sid/dkgev/standortnummer"
        },
        "mustSupport" : true
      },
      {
        "id" : "Location.name",
        "path" : "Location.name",
        "short" : "Name des Standort",
        "comment" : "Motivation: Kein Name zwingend notwendig (z.B. für ein Zimmer), wenn über .identifier identifizierbar; weicht daher ab von https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/sd_mii_struktur_location",
        "mustSupport" : true
      },
      {
        "id" : "Location.mode",
        "path" : "Location.mode",
        "short" : "Modus des Standorts",
        "comment" : "Motivation: Die Einschränkung auf \"instance\" erfolgt, da im  ISiK-Kontext ausschließlich konkrete Standorte übertragen werden sollen. Hiermit wird zusätzlich die Kompatibilität zur MII-Spezifikation eines Standortes gewahrt https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/sd_mii_struktur_location",
        "patternCode" : "instance",
        "mustSupport" : true
      },
      {
        "id" : "Location.type",
        "path" : "Location.type",
        "short" : "Typ des Standorts",
        "comment" : "Motivation: Ein System muss den Typ eines Standorts zum Abruf bereitstellen, sofern diese Information verfügbar ist.",
        "mustSupport" : true
      },
      {
        "id" : "Location.address",
        "path" : "Location.address",
        "short" : "Adresse des Standorts",
        "comment" : "Motivation: Bei Verfügbarkeit einer Adresse muss ein System diese Information bereitstellen. Darüber hinaus muss das abrufende System diese Information verarbeiten können.",
        "type" : [
          {
            "code" : "Address",
            "profile" : ["http://fhir.de/StructureDefinition/address-de-basis"]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Location.physicalType",
        "path" : "Location.physicalType",
        "short" : "Physikalischer Typ des Standorts",
        "comment" : "Motivation: entspricht der MII Vorgabe -  siehe https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/sd_mii_struktur_location. Ein System muss den physikalischen Typ eines Standorts zum Abruf bereitstellen, da ansonsten der Typus des Standorts nicht maschinenlesbar definiert ist.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Location.position",
        "path" : "Location.position",
        "short" : "Geodaten eines Standorts",
        "comment" : "Motivation: Ein System muss die Geodaten eines Standorts zum Abruf bereitstellen, sofern diese Information verfügbar ist.",
        "mustSupport" : true
      },
      {
        "id" : "Location.managingOrganization",
        "path" : "Location.managingOrganization",
        "short" : "Verwaltende Organisation des Standorts",
        "comment" : "Motivation: entspricht https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/sd_mii_struktur_location",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Location.partOf",
        "path" : "Location.partOf",
        "short" : "Organisationale Zugehörigkeit",
        "comment" : "Motivation: Ein System muss die organisationale Zugehörigkeit eines Standorts zum Abruf bereitstellen, sofern diese Information verfügbar ist.",
        "mustSupport" : true
      },
      {
        "id" : "Location.hoursOfOperation",
        "path" : "Location.hoursOfOperation",
        "short" : "Betriebszeiten des Standorts",
        "comment" : "Motivation: Ein System muss die Betriebszeiten eines Standorts zum Abruf bereitstellen, sofern diese Information verfügbar ist.",
        "mustSupport" : true
      }
    ]
  }
}

```
