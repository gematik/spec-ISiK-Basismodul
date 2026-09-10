# ISiKRolleImKrankenhaus - ISiK Medikation Implementierungsleitfaden v6.0.0

ISiK Medikation Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artefakte**](artifacts.md)
* **ISiKRolleImKrankenhaus**

## Resource Profile: ISiKRolleImKrankenhaus 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKRolleImKrankenhaus | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKRolleImKrankenhaus |

 
Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die Rolle eines Leistungserbringers im Rahmen des Bestätigungsverfahrens der gematik. 

### Motivation

 
Die Rolle von Leistungserbringern innerhalb einer Organisation (z.B. Fachabteilung, Praxis, Krankenhaus) ist eine wichtige Information in Bezug auf die Leistungen, die durch diese Person erbracht werden. 
In FHIR wird die Rolle eines Leistungserbringers mit der PractitionerRole-Ressource repräsentiert und wir ausgehend vom PractitionerRole Profil aus dem EHDS in ISiK aufgenommen. 
**HISTORIE:** 
* Dieses Profil wird vor dem Hintergrund von FHIR-Profilierungen im Kontext des EHDS in Stufe 6 initial eingebracht.
 

**Usages:**

* Examples for this Profile: [PractitionerRole/RolleImKrankenhausAllgemeinchirurgieBeispiel](PractitionerRole-RolleImKrankenhausAllgemeinchirurgieBeispiel.md) and [PractitionerRole/RolleImKrankenhausInnereMedizinBeispiel](PractitionerRole-RolleImKrankenhausInnereMedizinBeispiel.md)
* CapabilityStatements using this Profile: [CapabilityStatement für Rolle LeistungserbringerRolle](CapabilityStatement-ISiKCapabilityStatementLeistungserbringerRolle.md), [ISiK CapabilityStatement Medikationsinformation Server Akteur (Expanded)](CapabilityStatement-ISiKCapabilityStatementMedikationInformationAkteur-expanded.md), [ISiK CapabilityStatement Medikationsverabreichung Server Akteur (Expanded)](CapabilityStatement-ISiKCapabilityStatementMedikationVerabreichungAkteur-expanded.md) and [ISiK CapabilityStatement Medikationsverordnung Server Akteur (Expanded)](CapabilityStatement-ISiKCapabilityStatementMedikationVerordnungAkteur-expanded.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/medikation|current/StructureDefinition/StructureDefinition-ISiKRolleImKrankenhaus.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-ISiKRolleImKrankenhaus.csv), [Excel](../StructureDefinition-ISiKRolleImKrankenhaus.xlsx), [Schematron](../StructureDefinition-ISiKRolleImKrankenhaus.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKRolleImKrankenhaus",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKRolleImKrankenhaus",
  "version" : "6.0.0",
  "name" : "ISiKRolleImKrankenhaus",
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
  "description" : "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen \nüber die Rolle eines Leistungserbringers im Rahmen des Bestätigungsverfahrens der gematik.  \n### Motivation\nDie Rolle von Leistungserbringern innerhalb einer Organisation (z.B. Fachabteilung, Praxis, Krankenhaus) ist eine wichtige Information in Bezug auf die Leistungen, die\ndurch diese Person erbracht werden.\n\nIn FHIR wird die Rolle eines Leistungserbringers mit der PractitionerRole-Ressource repräsentiert und wir\nausgehend vom PractitionerRole Profil aus dem EHDS in ISiK aufgenommen. \n\n**HISTORIE:**\n- Dieses Profil wird vor dem Hintergrund von FHIR-Profilierungen im Kontext des EHDS in Stufe 6 initial eingebracht.\n",
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
  "type" : "PractitionerRole",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/PractitionerRole",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "PractitionerRole",
      "path" : "PractitionerRole"
    },
    {
      "id" : "PractitionerRole.id",
      "path" : "PractitionerRole.id",
      "short" : "serverseitige, interne ID des Datensatzes",
      "comment" : "**bedingtes Pflichtfeld/bedingtes MS:** Alle von einem Server bereitgestellten Ressourcen MÜSSEN über eine `id` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `id`verfügen. ",
      "mustSupport" : true
    },
    {
      "id" : "PractitionerRole.meta.versionId",
      "path" : "PractitionerRole.meta.versionId",
      "short" : "Eindeutiger Name der serverseitigen Version des Datensatzes",
      "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über eine `versionID` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `versionID`verfügen. "
    },
    {
      "id" : "PractitionerRole.meta.lastUpdated",
      "path" : "PractitionerRole.meta.lastUpdated",
      "short" : "Zeitpunkt der letzten Änderung",
      "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über ein `lastUpdate` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über ein `lastUpdate`verfügen. "
    },
    {
      "id" : "PractitionerRole.implicitRules",
      "path" : "PractitionerRole.implicitRules",
      "short" : "Verweis auf die Regeln, nach denen die Ressource erstellt wurde",
      "comment" : "Begründung Constraint: In ISiK existiert kein Use-Case für dieses Element. Da es sich um ein Modifying Element handelt, wird es daher ausgeschlossen.\n  Darüber hinaus werden die Regeln als URI vorgehalten. Dies führt dazu, dass sich hinter der URI eine beliebige Menge an Regeln befinden kann; wodurch  nicht sichergestellt werden kann, dass alle Clients die Regeln korrekt interpretieren können.",
      "max" : "0"
    },
    {
      "id" : "PractitionerRole.active",
      "path" : "PractitionerRole.active",
      "short" : "Aktiv/Inaktiv Status",
      "comment" : "Motivation MS: Ein System muss prüfen können, ob die Rolle eines Leistungserbringers aktiv oder inaktiv ist.\n  **Einschränkung der übergreifenden MS-Definition**:\nVerfügt ein bestätigungsrelevantes System nicht über die Datenstruktur zur Hinterlegung des Aktivitätsstatus einer \nPractitionerRole-Ressource, so MUSS dieses System die Information NICHT abbilden. Das System SOLL jedoch den Aktivitätsstatus hart kodieren\n in der PractitionerRole-Instanz (PractitionerRole.active auf 'true'), \nsodass Clients nicht missverständlich mit einer inaktiven PractitionerRole-Ressource interagieren.\n  ",
      "mustSupport" : true
    },
    {
      "id" : "PractitionerRole.practitioner",
      "path" : "PractitionerRole.practitioner",
      "short" : "Leistungserbringer",
      "comment" : "Motivation MS: Ein System muss die Informationen über den Leistungserbringer, der die Rolle innehat, bereitstellen können.",
      "mustSupport" : true
    },
    {
      "id" : "PractitionerRole.organization",
      "path" : "PractitionerRole.organization",
      "short" : "Organisation",
      "comment" : "Motivation MS: Ein System muss die Informationen über die Organisation, der der Leistungserbringer angehört, bereitstellen können.",
      "mustSupport" : true
    },
    {
      "id" : "PractitionerRole.code",
      "path" : "PractitionerRole.code",
      "short" : "Rolle des Leistungserbringers",
      "comment" : "Motivation MS: Die Rolle in der ein Leistungserbringer innerhalb einer ausübt, muss exponiert und verarbeitet werden können.",
      "mustSupport" : true
    },
    {
      "id" : "PractitionerRole.code.coding",
      "path" : "PractitionerRole.code.coding",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      },
      "mustSupport" : true
    },
    {
      "id" : "PractitionerRole.code.coding:KBVRoleCare",
      "path" : "PractitionerRole.code.coding",
      "sliceName" : "KBVRoleCare",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Coding",
        "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKCoding"]
      }],
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://fhir.kbv.de/ValueSet/KBV_VS_Base_Role_Care"
      }
    },
    {
      "id" : "PractitionerRole.specialty",
      "path" : "PractitionerRole.specialty",
      "short" : "Fachgebiet des Leistungserbringers",
      "comment" : "Motivation MS: Ein System muss die Informationen über das Fachgebiet des Leistungserbringers bereitstellen können, um die Art der erbrachten Leistungen besser zu verstehen.",
      "mustSupport" : true
    },
    {
      "id" : "PractitionerRole.specialty.coding",
      "path" : "PractitionerRole.specialty.coding",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "PractitionerRole.specialty.coding:IHEPracticeSetting",
      "path" : "PractitionerRole.specialty.coding",
      "sliceName" : "IHEPracticeSetting",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Coding",
        "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKCoding"]
      }],
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://ihe-d.de/ValueSets/IHEXDSpracticeSettingCode"
      }
    },
    {
      "id" : "PractitionerRole.specialty.coding:Fachabteilungsschluessel",
      "path" : "PractitionerRole.specialty.coding",
      "sliceName" : "Fachabteilungsschluessel",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Coding",
        "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKCoding"]
      }],
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://fhir.de/ValueSet/dkgev/Fachabteilungsschluessel-erweitert"
      }
    }]
  }
}

```
