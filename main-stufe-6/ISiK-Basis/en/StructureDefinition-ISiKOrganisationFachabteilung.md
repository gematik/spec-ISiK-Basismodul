# ISiKOrganisationFachabteilung - ISiK Basis Implementierungsleitfaden v6.0.0

ISiK Basis Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiKOrganisationFachabteilung**

## Resource Profile: ISiKOrganisationFachabteilung 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKOrganisationFachabteilung | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKOrganisationFachabteilung |

 
Dieses Profil beschreibt die Organisationseinheit Fachabteilung innerhalb eines Krankenhauses. 
**Motivation** 
Die Abbildung der Aufbauorganisation eines Krankenhauses dient der Festlegung von Zuständigkeiten und (Entscheidungs-)Verantwortungen von Organisationseinheiten (z.B. Fachkliniken, Fachabteilungen und -bereichen etc.) in strukturierter Form. 
In FHIR wird die Organisation (Organization) vom Standort (Location) eindeutig abgegrenzt. 
Die Erfassung der Organisation in strukturierter Form ermöglicht u.a.: 
* Zuweisungen von Diensten an bestimmte Bereiche der Aufbauorganisation im Rahmen des Terminmanagements
* Die Raum- und Betten-Belegung in strukturierter Form (interdisziplinär)
 
Auch die Erfassung des Krankenhauses als Ganzes ist relevant. Entsprechend fokussieren die folgenden Profile zur Organisation auf das Krankenhaus als Ganzes und die Fachabteilung als Organisation. 
**Kompatibilität** 
Für das Profil ISiKOrganisationFachabteilung wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen das ISIK Profil valide sind, auch valide sind gegen: 
* [Profil TIOrganization der gematik](https://gematik.de/fhir/ti/StructureDefinition/ti-organization)
 
Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. 

**Usages:**

* Examples for this Profile: [Allgemeinchirurgie](Organization-AbteilungAllgemeinchirurgieOrganisationBeispiel.md)
* CapabilityStatements using this Profile: [CapabilityStatement für Rolle AufbaustrukturRolle](CapabilityStatement-ISiKCapabilityStatementAufbaustrukturRolle.md) and [Akteur ISiKCapabilityStatementBasisServerAkteur (Expanded)](CapabilityStatement-ISiKCapabilityStatementBasisServerAkteur-expanded.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/basis|current/StructureDefinition/StructureDefinition-ISiKOrganisationFachabteilung.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-ISiKOrganisationFachabteilung.csv), [Excel](../StructureDefinition-ISiKOrganisationFachabteilung.xlsx), [Schematron](../StructureDefinition-ISiKOrganisationFachabteilung.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKOrganisationFachabteilung",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKOrganisationFachabteilung",
  "version" : "6.0.0",
  "name" : "ISiKOrganisationFachabteilung",
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
  "description" : "Dieses Profil beschreibt die Organisationseinheit Fachabteilung innerhalb eines Krankenhauses.\n\n**Motivation**\n\nDie Abbildung der Aufbauorganisation eines Krankenhauses dient der Festlegung von Zuständigkeiten und (Entscheidungs-)Verantwortungen von Organisationseinheiten (z.B. Fachkliniken, Fachabteilungen und -bereichen etc.) in strukturierter Form. \n\nIn FHIR wird die Organisation (Organization) vom Standort (Location) eindeutig abgegrenzt.\n\nDie Erfassung der Organisation in strukturierter Form ermöglicht u.a.:\n- Zuweisungen von Diensten an bestimmte Bereiche der Aufbauorganisation im Rahmen des Terminmanagements\n- Die Raum- und Betten-Belegung in strukturierter Form (interdisziplinär)\n\nAuch die Erfassung des Krankenhauses als Ganzes ist relevant.\nEntsprechend fokussieren die folgenden Profile zur Organisation auf das Krankenhaus als Ganzes und die Fachabteilung als Organisation.  \n\n**Kompatibilität**\n\nFür das Profil ISiKOrganisationFachabteilung wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen das ISIK Profil valide sind, auch valide sind gegen:\n* [Profil TIOrganization der gematik](https://gematik.de/fhir/ti/StructureDefinition/ti-organization)  \n\nHinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden.\n\n",
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
  },
  {
    "identity" : "servd",
    "uri" : "http://www.omg.org/spec/ServD/1.0/",
    "name" : "ServD"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Organization",
  "baseDefinition" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKOrganisation",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Organization",
      "path" : "Organization"
    },
    {
      "id" : "Organization.id",
      "path" : "Organization.id",
      "short" : "serverseitige, interne ID des Datensatzes",
      "comment" : "**bedingtes Pflichtfeld/bedingtes MS:** Alle von einem Server bereitgestellten Ressourcen MÜSSEN über eine `id` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `id`verfügen. ",
      "mustSupport" : true
    },
    {
      "id" : "Organization.meta.versionId",
      "path" : "Organization.meta.versionId",
      "short" : "Eindeutiger Name der serverseitigen Version des Datensatzes",
      "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über eine `versionID` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `versionID`verfügen. "
    },
    {
      "id" : "Organization.meta.lastUpdated",
      "path" : "Organization.meta.lastUpdated",
      "short" : "Zeitpunkt der letzten Änderung",
      "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über ein `lastUpdate` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über ein `lastUpdate`verfügen. "
    },
    {
      "id" : "Organization.implicitRules",
      "path" : "Organization.implicitRules",
      "short" : "Verweis auf die Regeln, nach denen die Ressource erstellt wurde",
      "comment" : "Begründung Constraint: In ISiK existiert kein Use-Case für dieses Element. Da es sich um ein Modifying Element handelt, wird es daher ausgeschlossen.\n  Darüber hinaus werden die Regeln als URI vorgehalten. Dies führt dazu, dass sich hinter der URI eine beliebige Menge an Regeln befinden kann; wodurch  nicht sichergestellt werden kann, dass alle Clients die Regeln korrekt interpretieren können.",
      "max" : "0"
    },
    {
      "id" : "Organization.identifier",
      "path" : "Organization.identifier",
      "short" : "Identifikatoren der Fachabteilung",
      "comment" : "Mindestens ein Identifikator muss für die Fachabteilung angegeben werden."
    },
    {
      "id" : "Organization.identifier:Abteilungsidentifikator",
      "path" : "Organization.identifier",
      "sliceName" : "Abteilungsidentifikator",
      "short" : "Krankenhausinterner Abteilungsidentifikator",
      "comment" : "Motivation: Für IDs, die Krankhausintern spezifischen Fachabteilungen vergeben werden, ist diese Identifier zu nutzen - analog zu Slice Abteilungsidentifikator in https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/mii_pr_struktur_abteilung.",
      "min" : 1,
      "max" : "1",
      "patternIdentifier" : {
        "type" : {
          "coding" : [{
            "system" : "http://snomed.info/sct",
            "code" : "225746001"
          }]
        }
      },
      "mustSupport" : true
    },
    {
      "id" : "Organization.identifier:Abteilungsidentifikator.system",
      "path" : "Organization.identifier.system",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Organization.identifier:Abteilungsidentifikator.value",
      "path" : "Organization.identifier.value",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Organization.type:Fachbereich",
      "path" : "Organization.type",
      "sliceName" : "Fachbereich",
      "short" : "Angabe des IHE-PracticeSetting Code",
      "comment" : "Motivation: Ein Fachbereich muss als solcher hinsichtlich des Typs kodiert werden.",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://ihe-d.de/ValueSets/IHEXDSpracticeSettingCode"
      }
    },
    {
      "id" : "Organization.type:Fachbereich.coding.system",
      "path" : "Organization.type.coding.system",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Organization.type:Fachbereich.coding.code",
      "path" : "Organization.type.coding.code",
      "min" : 1,
      "mustSupport" : true
    }]
  }
}

```
