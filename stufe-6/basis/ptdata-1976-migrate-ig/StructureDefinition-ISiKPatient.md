# ISiKPatient - Basis Implementation Guide v6.0.0-rc

Basis Implementation Guide

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiKPatient**

## Resource Profile: ISiKPatient 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKPatient |

 
Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von administrativen Patientendaten im Rahmen des Bestätigungsverfahrens der gematik. 

### Motivation

 
Der Austausch administrativer Patientendaten ist eine der grundlegenden Funktionalitäten beim Datenaustausch in der klinischen Versorgung.
 In FHIR werden sämtliche klinischen Ressourcen durch Verlinkung auf die Ressource ‘Patient’ in einen Patientenkontext gestellt.
 Die Herstellung des korrekten Patientenkontextes durch Suchen der Patientenressource anhand von Eigenschaften wie Aufnahmenummer, Name oder Geburtsdatum, die Anzeige der zutreffenden Suchergebnisse und der Auswahl bzw. Bestätigung des richtigen Datensatzes durch den Anwender steht am Beginn der meisten klinischen Workflows. 

### Kompatibilität

 
Für das Profil ISIKPatient wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKPatient valide sind, auch valide sind gegen: 
* [Profil KBV_PR_Base_Patient der KBV Basisprofile](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Patient)
* [Profil Patient im International Patient Summary (IPS)](https://hl7.org/fhir/uv/ips/StructureDefinition-Patient-uv-ips.html)
* [Profil Patient der MI-Initiative](https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient)
* [Profil TIPatient der gematik](https://gematik.de/fhir/ti/StructureDefinition/ti-patient)
 
Es ist zu beachten, dass das Profil ISiKPatient NICHT unmittelbar kompatibel mit folgenden Profilen ist: 
* [Profil EPAPatient der gematik](https://gematik.de/fhir/epa/StructureDefinition/epa-patient): In ISiK ist die Angabe einer KVNR nicht verpflichtend, da in vielen Use Cases bereits eine PID ausreichend ist. Außerdem ist in ISiK keine verpflichtende Versionierung über meta.versionId vorgesehen.
 

**Usages:**

* Examples for this Profile: [Patient/DorisQuelle](Patient-DorisQuelle.md), [Patient/DorisZiel](Patient-DorisZiel.md), [Patient/PatientinMinimal](Patient-PatientinMinimal.md), [Patient/PatientinMusterfrau](Patient-PatientinMusterfrau.md)... Show 3 more, [Patient/PatientinNormal](Patient-PatientinNormal.md), [Patient/SZ1Patient](Patient-SZ1Patient.md) and [Patient/SZ2Patient](Patient-SZ2Patient.md)
* CapabilityStatements using this Profile: [Akteur "ISiKCapabilityStatementBasisServerAkteur" (Expanded)](CapabilityStatement-ISiKCapabilityStatementBasisServerAkteur-expanded.md), [CapabilityStatement für Rolle "ISiKCapabilityStatementErweiterteStammdatenRolle"](CapabilityStatement-ISiKCapabilityStatementErweiterteStammdatenRolle.md) and [CapabilityStatement für Rolle "StammdatenRolle"](CapabilityStatement-ISiKCapabilityStatementStammdatenRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/basis|current/StructureDefinition/ISiKPatient)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKPatient.csv), [Excel](StructureDefinition-ISiKPatient.xlsx), [Schematron](StructureDefinition-ISiKPatient.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKPatient",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-imposeProfile",
      "valueCanonical" : "https://gematik.de/fhir/ti/StructureDefinition/ti-patient|1.1.1"
    }
  ],
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient",
  "version" : "6.0.0-rc",
  "name" : "ISiKPatient",
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
  "description" : "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von administrativen Patientendaten im Rahmen des Bestätigungsverfahrens der gematik.\n### Motivation  \nDer Austausch administrativer Patientendaten ist eine der grundlegenden Funktionalitäten beim Datenaustausch in der klinischen Versorgung.  \nIn FHIR werden sämtliche klinischen Ressourcen durch Verlinkung auf die Ressource 'Patient' in einen Patientenkontext gestellt.  \nDie Herstellung des korrekten Patientenkontextes durch Suchen der Patientenressource anhand von Eigenschaften wie Aufnahmenummer, Name oder Geburtsdatum, \ndie Anzeige der zutreffenden Suchergebnisse und der Auswahl bzw. Bestätigung des richtigen Datensatzes durch den Anwender steht am Beginn der meisten klinischen Workflows.  \n\n### Kompatibilität\nFür das Profil ISIKPatient wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKPatient valide sind, auch valide sind gegen:\n\n* [Profil KBV_PR_Base_Patient der KBV Basisprofile](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Patient)\n* [Profil Patient im International Patient Summary (IPS)](https://hl7.org/fhir/uv/ips/StructureDefinition-Patient-uv-ips.html)\n* [Profil Patient der MI-Initiative](https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Patient)\n* [Profil TIPatient der gematik](https://gematik.de/fhir/ti/StructureDefinition/ti-patient)\n\nEs ist zu beachten, dass das Profil ISiKPatient NICHT unmittelbar kompatibel mit folgenden Profilen ist:\n\n* [Profil EPAPatient der gematik](https://gematik.de/fhir/epa/StructureDefinition/epa-patient): In ISiK ist die Angabe einer KVNR nicht verpflichtend, da in vielen Use Cases bereits eine PID ausreichend ist. Außerdem ist in ISiK keine verpflichtende Versionierung über meta.versionId vorgesehen.",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "cda",
      "uri" : "http://hl7.org/v3/cda",
      "name" : "CDA (R2)"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 v2 Mapping"
    },
    {
      "identity" : "loinc",
      "uri" : "http://loinc.org",
      "name" : "LOINC code for the element"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Patient",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Patient",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Patient",
        "path" : "Patient",
        "constraint" : [
          {
            "key" : "isik-pat-1",
            "severity" : "error",
            "human" : "Falls die Geschlechtsangabe 'other' gewählt wird, muss die amtliche Differenzierung per Extension angegeben werden",
            "expression" : "gender.exists() and gender='other' implies gender.extension('http://fhir.de/StructureDefinition/gender-amtlich-de').exists()",
            "source" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient"
          }
        ]
      },
      {
        "id" : "Patient.id",
        "path" : "Patient.id",
        "short" : "serverseitige, interne ID des Datensatzes",
        "comment" : "**bedingtes Pflichtfeld/bedingtes MS:** Alle von einem Server bereitgestellten Ressourcen MÜSSEN über eine `id` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `id`verfügen. ",
        "mustSupport" : true
      },
      {
        "id" : "Patient.meta.versionId",
        "path" : "Patient.meta.versionId",
        "short" : "Eindeutiger Name der serverseitigen Version des Datensatzes",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über eine `versionID` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `versionID`verfügen. "
      },
      {
        "id" : "Patient.meta.lastUpdated",
        "path" : "Patient.meta.lastUpdated",
        "short" : "Zeitpunkt der letzten Änderung",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über ein `lastUpdate` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über ein `lastUpdate`verfügen. "
      },
      {
        "id" : "Patient.identifier",
        "path" : "Patient.identifier",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        },
        "comment" : "Eindeutiger Identifier des Patienten",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:VersichertenId",
        "path" : "Patient.identifier",
        "sliceName" : "VersichertenId",
        "short" : "Lebenslange Krankenversichertennummer",
        "comment" : "Die als 'KVZ10' kodierte Versichertennummer ist der 10-stellige, \n    unveränderbare Teil der Versichertennummer, \n    der lesbar auf die Elektronische Gesundheitskarte aufgedruckt ist.\n    Er gilt für alle Krankenversichertennummern, \n    unabhängig davon, ob es sich um GKV, PKV oder Sonderkostenträger handelt. Für eine Weiterverarbeitung einer Patient-Ressource in der ePA ist dieser Identifier im EPAPatient-Profil ein Pflichtfeld.  \n    **Weitere Hinweise:** siehe [Deutschen Basisprofile](https://simplifier.net/guide/leitfaden-de-basis-r4/ig-markdown-LebenslangeKrankenversichertennummer10-stelligeKVID-Identifier?version=current)",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Identifier",
            "profile" : ["http://fhir.de/StructureDefinition/identifier-kvid-10"]
          }
        ],
        "patternIdentifier" : {
          "type" : {
            "coding" : [
              {
                "system" : "http://fhir.de/CodeSystem/identifier-type-de-basis",
                "code" : "KVZ10"
              }
            ]
          }
        },
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:VersichertenId.type",
        "path" : "Patient.identifier.type",
        "short" : "Art des Identifiers",
        "comment" : "Hier ist stets der Code `KVZ10` \n    aus dem CodeSystem `http://fhir.de/CodeSystem/identifier-type-de-basis` anzugeben.  \n    **Begründung Pflichtfeld:** `type` dient der Unterscheidung verschiedener Identifier-Typen",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:VersichertenId.system",
        "path" : "Patient.identifier.system",
        "short" : "Namensraum der Versichertennummer",
        "comment" : "Hier ist stets der Wert `http://fhir.de/sid/gkv/kvid-10` anzugeben.  \n    **Begründung Pflichtfeld:** `system` stellt in Kombination mit `value` die Eindeutigkeit eines Identifiers sicher.",
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:VersichertenId.value",
        "path" : "Patient.identifier.value",
        "short" : "Lebenslange Krankenversichertennummer",
        "comment" : "Der 10-stellige, unveränderbare Teil der Versichertennummer.",
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:VersichertenId-GKV",
        "path" : "Patient.identifier",
        "sliceName" : "VersichertenId-GKV",
        "short" : "Gesetzliche Krankenversichertennummer",
        "comment" : "**WARNUNG**: Die Verwendung der 'GKV'-Kodierung einer Versichertennummer ist abgekündigt,\n  da die lebenslangen Versichertennummer ab 2024 auch für PKV oder Sonderkostenträger eingeführt wird. \n  Bitte statt dessen künftig den 'VersichertenId'-Slice verwenden.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Identifier",
            "profile" : ["http://fhir.de/StructureDefinition/identifier-kvid-10"]
          }
        ],
        "patternIdentifier" : {
          "type" : {
            "coding" : [
              {
                "system" : "http://fhir.de/CodeSystem/identifier-type-de-basis",
                "code" : "GKV"
              }
            ]
          }
        },
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:VersichertenId-GKV.type",
        "path" : "Patient.identifier.type",
        "short" : "Art des Identifiers",
        "comment" : "Hier ist stets der Code `GKV` \n    aus dem CodeSystem `http://fhir.de/CodeSystem/identifier-type-de-basis` anzugeben.  \n    **Begründung Pflichtfeld:** `type` dient der Unterscheidung verschiedener Identifier-Typen",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:VersichertenId-GKV.system",
        "path" : "Patient.identifier.system",
        "short" : "Namensraum der Versichertennummer",
        "comment" : "Hier ist stets der Wert `http://fhir.de/sid/gkv/kvid-10` anzugeben.  \n    **Begründung Pflichtfeld:** `system` stellt in Kombination mit `value` die Eindeutigkeit eines Identifiers sicher.",
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:VersichertenId-GKV.value",
        "path" : "Patient.identifier.value",
        "comment" : "Enthält den eigentlichen Wert des Identifiers.  \n    **Begründung Pflichtfeld:** Ist der Wert nicht bekannt, sollte der gesamte Slice weggelassen werden.",
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:Patientennummer",
        "path" : "Patient.identifier",
        "sliceName" : "Patientennummer",
        "short" : "Organisationsinterner Patienten-Identifier (PID)",
        "comment" : "Organisationsintere Patienten-Identifier werden von z.B. von KIS-Systemen vergeben \n  und dienen innerhalb einer Einreichtung meist als primäres Identifikationsmerkmal für Patienten, \n  u.A. in der HL7 V2-Kommunikation.  \n  **Weitere Hinweise:** siehe [Deutschen Basisprofile](https://simplifier.net/guide/leitfaden-de-basis-r4/ig-markdown-OrganisationsinternerPatienten-Identifier?version=current)",
        "min" : 1,
        "max" : "*",
        "type" : [
          {
            "code" : "Identifier",
            "profile" : ["http://fhir.de/StructureDefinition/identifier-pid"]
          }
        ],
        "patternIdentifier" : {
          "type" : {
            "coding" : [
              {
                "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
                "code" : "MR"
              }
            ]
          }
        },
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:Patientennummer.type",
        "path" : "Patient.identifier.type",
        "short" : "Art des Identifiers",
        "comment" : "Hier ist stets der Code `MR` \n    aus dem CodeSystem `http://terminology.hl7.org/CodeSystem/v2-0203` anzugeben.  \n    **Begründung Pflichtfeld:** `type` dient der Unterscheidung verschiedener Identifier-Typen",
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:Patientennummer.system",
        "path" : "Patient.identifier.system",
        "short" : "Namensraum des Identifiers",
        "comment" : "Hier ist stets der eindeutige Name (URL) des Namensraums anzugeben, \n    aus dem der Identifier stammt. \n    Hinweise zur Festlegung der URLs für lokale Namensräume sind in den \n    [Deutschen Basisprofilen](https://simplifier.net/guide/leitfaden-de-basis-r4/ig-markdown-Terminologie-Namensraeume?version=current) beschrieben.  \n    **Begründung Pflichtfeld:** `system` stellt in Kombination mit `value` die Eindeutigkeit eines Identifiers sicher.",
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:Patientennummer.value",
        "path" : "Patient.identifier.value",
        "comment" : "Enthält den eigentlichen Wert des Identifiers.  \n    **Begründung Pflichtfeld:** Ist der Wert nicht bekannt, sollte der gesamte Slice weggelassen werden.",
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:Versichertennummer_PKV",
        "path" : "Patient.identifier",
        "sliceName" : "Versichertennummer_PKV",
        "short" : "Private Krankenversichertennummer",
        "comment" : "Für Privatpatienten, die noch nicht über eine lebenslange, unveränderliche Krankenversichertennummer (KVNR) verfügen,\n  können bis auf weiteres noch die versicherungsspezifischen PKV-Nummern angegeben werden. \n  Da bei diesen der Bezeichner des vom Kostenträger verwendeten Namensraums meist nicht ermittelt werden kann,\n  ist statt dessen der Name des Kostenträgers in `assigner` anzugeben.\n  **Achtung:**  Dieser Slice dient NICHT zur Abbildung einer 10-stelligen PKV-VersichertenId nach § 362 SGB V. Diese sind durch den Slice 'VersichertenId' abzubilden, da die Nummernkreise dieser Identifier identisch sind.\n  **Weitere Hinweise:** siehe [Deutsche Basisprofile](https://simplifier.net/guide/leitfaden-de-basis-r4/ig-markdown-PrivateKrankenversichertennummer-Identifier?version=current)\n  Der Identifier kann jedoch zusätzlich zur KVNR verwendet werden, wenn für eine Zusatzversicherung eine separate, versicherungsspezifische PKV-Nummer vorliegt.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Identifier",
            "profile" : ["http://fhir.de/StructureDefinition/identifier-pkv"]
          }
        ],
        "patternIdentifier" : {
          "type" : {
            "coding" : [
              {
                "system" : "http://fhir.de/CodeSystem/identifier-type-de-basis",
                "code" : "PKV"
              }
            ]
          }
        },
        "mustSupport" : false
      },
      {
        "id" : "Patient.identifier:Versichertennummer_PKV.use",
        "path" : "Patient.identifier.use",
        "short" : "Verwendungszeck des Identifiers",
        "comment" : "Hier ist stets der Wert `secondary` anzugeben.",
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:Versichertennummer_PKV.type",
        "path" : "Patient.identifier.type",
        "short" : "Art des Identifiers",
        "comment" : "Hier ist stets der Code `PKV` \n    aus dem CodeSystem `http://fhir.de/CodeSystem/identifier-type-de-basis` anzugeben.  \n    **Begründung Pflichtfeld:** `type` dient der Unterscheidung verschiedener Identifier-Typen",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:Versichertennummer_PKV.value",
        "path" : "Patient.identifier.value",
        "short" : "Private Krankenversichertennummer",
        "comment" : "Enthält den eigentlichen Wert des Identifiers.  \n    **Begründung Pflichtfeld:** Ist der Wert nicht bekannt, sollte der gesamte Slice weggelassen werden.",
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:Versichertennummer_PKV.assigner",
        "path" : "Patient.identifier.assigner",
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:Versichertennummer_PKV.assigner.identifier.system",
        "path" : "Patient.identifier.assigner.identifier.system",
        "short" : "Namensraum des Identifiers",
        "comment" : "Hier ist stets der Wert `http://fhir.de/sid/arge-ik/iknr` anzugeben.",
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:Versichertennummer_PKV.assigner.identifier.value",
        "path" : "Patient.identifier.assigner.identifier.value",
        "short" : "IK-Nummer des Kostenträgers",
        "comment" : "IK-Nummer des Kostenträgers, aus dessen Nummernkreis die PKV-Nummer stammt.",
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:Versichertennummer_PKV.assigner.display",
        "path" : "Patient.identifier.assigner.display",
        "short" : "Name des Kostenträgers",
        "comment" : "Name des Kostenträgers, aus dessen Nummernkreis die PKV-Nummer stammt.",
        "mustSupport" : true
      },
      {
        "id" : "Patient.active",
        "path" : "Patient.active",
        "short" : "Status des Datensatzes",
        "comment" : "\n  `true` = Der Datensatz befindet sich in Verwendung/kann verwendet werden  \n  `false`= Der Datensatz wurde storniert (z.B. bei Dubletten, Merge) oder archiviert  \n  **Einschränkung der übergreifenden MS-Definition:**  \n  Verfügt ein bestätigungsrelevantes System nicht über die Datenstruktur zur Hinterlegung des Aktivitätsstatus einer Patienten-Ressource, \n  so MUSS dieses System die Information NICHT abbilden. \n  Das System SOLL jedoch den Aktivitätsstatus hart kodieren in der Patienteninstanz \n  (Patient.active auf 'true'), sodass Clients nicht missverständlich mit einer inaktiven \n  Patient-Ressource interagieren.",
        "mustSupport" : true
      },
      {
        "id" : "Patient.name",
        "path" : "Patient.name",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        },
        "comment" : "Angabe der Namen",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:Name",
        "path" : "Patient.name",
        "sliceName" : "Name",
        "short" : "Offizieller Name",
        "comment" : "Offizieller Name des Patienten, wie er z.B. in Ausweis oder Versicherungsdokumenten erscheint. \n  **Begründung Pflichtfeld:** Der offizielle Name des Patienten ist unerlässlich, um Verwechlungen zu vermeiden und den Patienten im Versorgungskontext korrekt anzusprechen.\n  Wenn kein Name vorliegt, MUSS die [data-absent-reason-Extension](https://www.hl7.org/fhir/R4/extension-data-absent-reason.html) eingesetzt werden.   \n  **Weitere Hinweise:** siehe [Deutsche Basisprofile](https://simplifier.net/guide/leitfaden-de-basis-r4/ig-markdown-Ressourcen-Patient?version=current#ig-markdown-Ressourcen-Patient-Name)",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "HumanName",
            "profile" : ["http://fhir.de/StructureDefinition/humanname-de-basis"]
          }
        ],
        "patternHumanName" : {
          "use" : "official"
        },
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:Name.use",
        "path" : "Patient.name.use",
        "short" : "Verwendungszweck",
        "comment" : "Hier ist stets der Wert `official` anzugeben.  \n      **Begründung Pflichtfeld:** Dient als Unterscheidungs- und Auswahlkriterium",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:Name.family",
        "path" : "Patient.name.family",
        "short" : "Nachname",
        "comment" : "Vollständiger Nachname bzw. Familienname der Person, einschließlich Vor- und Zusätze.  \n      **Begründung Pflichtfeld:** Ein offizieller Name ist nur zulässig, wenn der Nachname und mindestens ein Vorname angegeben sind.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:Name.family.extension:namenszusatz",
        "path" : "Patient.name.family.extension",
        "sliceName" : "namenszusatz",
        "short" : "Namenszusatz",
        "comment" : "Enthält ehem. Adelstitel wie z.B. 'Graf', 'Baronesse', 'Freiherr'...  \n        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten.",
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:Name.family.extension:nachname",
        "path" : "Patient.name.family.extension",
        "sliceName" : "nachname",
        "short" : "Nachname",
        "comment" : "Nachname ohne Vor- und Zusätze.  \n        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten.",
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:Name.family.extension:vorsatzwort",
        "path" : "Patient.name.family.extension",
        "sliceName" : "vorsatzwort",
        "comment" : "Enthält Vorsätze, die vor dem Nachnamen stehen, z.B. 'von', 'van', 'zu'...  \n        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten.",
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:Name.given",
        "path" : "Patient.name.given",
        "comment" : "Kann mehrfach verwendet werden, um den Rufnamen sowie weitere Vornamen, Mittelnamen oder Mittel-Initialen abzubilden.\n      **Begründung Pflichtfeld:** Ein offizieller Name ist nur zulässig, wenn der Nachname und mindestens ein Vorname angegeben sind.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:Name.prefix",
        "path" : "Patient.name.prefix",
        "short" : "Präfix",
        "comment" : "Präfix, z.B. akademischer Titel od. militärischer Rang",
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:Name.prefix.extension:prefix-qualifier",
        "path" : "Patient.name.prefix.extension",
        "sliceName" : "prefix-qualifier",
        "short" : "Extension, um das Präfix als akademischen Titel zu qualifizieren",
        "comment" : "Hier ist stets der Wert `AC` anzugeben.  \n        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten.",
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:Name.prefix.extension:prefix-qualifier.value[x]",
        "path" : "Patient.name.prefix.extension.value[x]",
        "fixedCode" : "AC"
      },
      {
        "id" : "Patient.name:Geburtsname",
        "path" : "Patient.name",
        "sliceName" : "Geburtsname",
        "short" : "Geburtsname",
        "comment" : "Familienname zum Zeitpunkt der Geburt, sofern abweichend vom offiziellen Namen.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "HumanName",
            "profile" : ["http://fhir.de/StructureDefinition/humanname-de-basis"]
          }
        ],
        "patternHumanName" : {
          "use" : "maiden"
        },
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:Geburtsname.use",
        "path" : "Patient.name.use",
        "short" : "Verwendungszweck",
        "comment" : "Hier ist stets der Wert `maiden` anzugeben.  \n      **Begründung Pflichtfeld:** Dient als Unterscheidungs- und Auswahlkriterium",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:Geburtsname.family",
        "path" : "Patient.name.family",
        "short" : "Nachname",
        "comment" : "Vollständiger Nachname bzw. Familienname des Patienten, einschließlich Vor- und Zusätze.  \n      **Begründung Pflichtfeld:** Ist der Nachname zum Zeitpunkt der Geburt nicht bekannt, sollte der gesamte Slice weggelassen werden.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:Geburtsname.family.extension:namenszusatz",
        "path" : "Patient.name.family.extension",
        "sliceName" : "namenszusatz",
        "short" : "Namenszusatz",
        "comment" : "Enthält ehem. Adelstitel wie z.B. 'Graf', 'Baronesse', 'Freiherr'...  \n        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten.",
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:Geburtsname.family.extension:nachname",
        "path" : "Patient.name.family.extension",
        "sliceName" : "nachname",
        "short" : "Nachname",
        "comment" : "Nachname ohne Vor- und Zusätze.  \n        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten.",
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:Geburtsname.family.extension:vorsatzwort",
        "path" : "Patient.name.family.extension",
        "sliceName" : "vorsatzwort",
        "comment" : "Enthält Vorsätze, die vor dem Nachnamen stehen, z.B. 'von', 'van', 'zu'...  \n        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten.",
        "mustSupport" : true
      },
      {
        "id" : "Patient.name:Geburtsname.given",
        "path" : "Patient.name.given",
        "max" : "0"
      },
      {
        "id" : "Patient.name:Geburtsname.prefix",
        "path" : "Patient.name.prefix",
        "max" : "0"
      },
      {
        "id" : "Patient.telecom",
        "path" : "Patient.telecom",
        "short" : "Angabe der Kontaktdaten",
        "comment" : "Angabe der Kontaktdaten des Patienten, z.B. Telefonnummer oder E-Mail-Adresse.\n  **Bedingtes MS:** Kontaktdaten sind im Kontext der Terminplanung unerlässlich, z.B. für Terminvereinbarungen oder Rückfragen. Das Must-Support gilt ausschließlich für Systeme, die\n  Kontaktdaten persistieren.",
        "mustSupport" : true
      },
      {
        "id" : "Patient.telecom.system",
        "path" : "Patient.telecom.system",
        "short" : "Art der Kontaktdaten",
        "comment" : "Hier ist der Art der Kontaktdaten anzugeben, z.B. `phone` für Telefonnummer oder `email` für E-Mail-Adresse.  \n      **Begründung Pflichtfeld:** Dient der Unterscheidung verschiedener Kontaktarten",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.telecom.value",
        "path" : "Patient.telecom.value",
        "short" : "Wert der Kontaktdaten",
        "comment" : "Enthält den eigentlichen Wert der Kontaktdaten, z.B. die Telefonnummer oder E-Mail-Adresse.  \n      **Begründung Pflichtfeld:** Ohne diese Angabe sind die Kontaktdaten nicht nutzbar.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.gender",
        "path" : "Patient.gender",
        "short" : "Administratives Geschlecht",
        "comment" : "Für die Geschlechtskennzeichen 'unbestimmt' und 'divers' ist der international vereinbarte code `other` zu verwenden.\n    Zur weiteren Differenzierung kann dann die Extension `Geschlecht-Admnistrativ` verwendet werden.\n    **Begründung Pflichtfeld:** Die Geschlechtsangabe ist für viele Versorgungsprozesse unerlässlich, z.B.  \n* Bettendisposition\n* Ermittlung von Referenzwerten\n* korrekte Anrede des Patienten  \n    **Weitere Hinweise:** siehe [Deutsche Basisprofile](https://simplifier.net/guide/leitfaden-de-basis-r4/ig-markdown-Ressourcen-Patient?version=current#ig-markdown-Ressourcen-Patient-Geschlecht)",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.gender.extension",
        "path" : "Patient.gender.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        }
      },
      {
        "id" : "Patient.gender.extension:Geschlecht-Administrativ",
        "path" : "Patient.gender.extension",
        "sliceName" : "Geschlecht-Administrativ",
        "short" : "Extension zur Differenzierung des Geschlechtskennzeichens",
        "comment" : "Diese Extension darf nur in Verbindung mit dem Geschlechtskennzeichen `other` verwendet werden\n      und dient der Differenzierung zwischen den in Deutschland möglichen Geschlechtskennzeichen `D` (divers) und `X`(unbestimmt)",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : ["http://fhir.de/StructureDefinition/gender-amtlich-de"]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Patient.birthDate",
        "path" : "Patient.birthDate",
        "short" : "Geburtsdatum",
        "comment" : "Tages-, monats- oder jahresgenaues Geburtsdatum.  \n    **Begründung Pflichtfeld:** Das Geburstdatum dient - in Verbindung mit dem Namen - als wichtiges Such- und Unterscheidungskriterium.  \n    **Weitere Hinweise:** siehe [Deutsche Basisprofile](https://simplifier.net/guide/leitfaden-de-basis-r4/ig-markdown-Ressourcen-Patient?version=current#ig-markdown-Ressourcen-Patient-Geburtsdatum)",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.birthDate.extension",
        "path" : "Patient.birthDate.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        }
      },
      {
        "id" : "Patient.birthDate.extension:Data-Absent-Reason",
        "path" : "Patient.birthDate.extension",
        "sliceName" : "Data-Absent-Reason",
        "short" : "Begründung für fehlende Information",
        "comment" : "ToDo",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : ["http://hl7.org/fhir/StructureDefinition/data-absent-reason"]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Patient.birthDate.extension:Data-Absent-Reason.value[x]",
        "path" : "Patient.birthDate.extension.value[x]",
        "fixedCode" : "unknown",
        "mustSupport" : true
      },
      {
        "id" : "Patient.deceased[x]",
        "path" : "Patient.deceased[x]",
        "comment" : "**Einschränkung der übergreifenden MS-Definition:** Die Implementierung dieses Elements ist für Server optional. Die Kennzeichnung als Must-Support erfolgt, da es sich um ein als Modifier-Element markiertes Feld in der Kernspezifikation handelt. \n  \n    **WICHTIGER Hinweis für Implementierer:**  \n  * Alle server-seitigen Implementierungen SOLLEN in der Lage sein, die systemintern möglichen Statuswerte korrekt in FHIR abzubilden.\n  * Alle client-seitigen Implementierungen SOLLEN in der Lage sein, sämtliche Status-Codes zu interpretieren und dem Anwender in angemessener Form darstellen zu können.",
        "mustSupport" : true
      },
      {
        "id" : "Patient.address",
        "path" : "Patient.address",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        },
        "comment" : "Angabe der Adressen",
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Strassenanschrift",
        "path" : "Patient.address",
        "sliceName" : "Strassenanschrift",
        "short" : "Straßenanschrift",
        "comment" : "Wohn- oder Aufenthaltsort des Patienten",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Address",
            "profile" : ["http://fhir.de/StructureDefinition/address-de-basis"]
          }
        ],
        "patternAddress" : {
          "type" : "both"
        },
        "constraint" : [
          {
            "key" : "address-cnt-2or3-char",
            "severity" : "warning",
            "human" : "The content of the country element (if present) SHALL be selected EITHER from ValueSet ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2 OR MAY be selected from ISO Country Alpha-3 Value Set http://hl7.org/fhir/ValueSet/iso3166-1-3, IF the country is not specified in value Set ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2.",
            "expression" : "country.empty() or (country.memberOf('http://hl7.org/fhir/ValueSet/iso3166-1-2') or country.memberOf('http://hl7.org/fhir/ValueSet/iso3166-1-3'))",
            "source" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Strassenanschrift.extension:Stadtteil",
        "path" : "Patient.address.extension",
        "sliceName" : "Stadtteil",
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Strassenanschrift.type",
        "path" : "Patient.address.type",
        "short" : "Adresstyp",
        "comment" : "Hier ist stets der Wert `both` anzugeben.  \n    **Begründung Pflichtfeld:** Dient als Unterscheidungs- und Auswahlkriterium",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Strassenanschrift.line",
        "path" : "Patient.address.line",
        "short" : "Adresszeile",
        "comment" : "Diese Komponente kann Straßennamen, Hausnummer, Appartmentnummer, c/o \n    sowie weitere Zustellungshinweise enthalten. \n    Die Informationen können in mehrere line-Komponenten aufgeteilt werden. \n    Bei Verwendung der Extensions, um Straße, Hausnnummer und Postleitzahl strukturiert zu übermitteln, \n    müssen diese Informationen stets vollständig auch in der line-Komponente, \n    die sie erweitern, enthalten sein, um es Systemen, die diese Extensions nicht verwenden zu ermöglichen, \n    auf diese Informationen zugreifen zu können.  \n    **Begründung Pflichtfeld:** Ohne diese Angabe ist die Adresse nicht zustellbar.  \n    **Begründung für Reduktion der max. Kardinalität:** Die maximale Kardinalität wurde in Übereinstimmung mit der \n    DIN-Norm 5008 (Schreib- und Gestaltungsregeln für die Text- und Informationsverarbeitung) auf 3 beschränkt.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Strassenanschrift.line.extension:Strasse",
        "path" : "Patient.address.line.extension",
        "sliceName" : "Strasse",
        "short" : "Strassenname",
        "comment" : "Strassenname (ohne Hausnummer).\n        Bei Angabe einer Strasse in dieser Extension muss diese auch in Address.line angegeben werden,\n        um die Interoperabilität mit Systemen zu gewährleisten, die diese Extension nicht verwenden.  \n        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten.",
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Strassenanschrift.line.extension:Hausnummer",
        "path" : "Patient.address.line.extension",
        "sliceName" : "Hausnummer",
        "comment" : "Hausnummer, sowie Zusätze (Appartmentnummer, Etage...). \n        Bei Angabe einer Hausnummer in dieser Extension muss diese auch in Address.line angegeben werden,\n        um die Interoperabilität mit Systemen zu gewährleisten, die diese Extension nicht verwenden.   \n        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten.",
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Strassenanschrift.line.extension:Adresszusatz",
        "path" : "Patient.address.line.extension",
        "sliceName" : "Adresszusatz",
        "comment" : "Zusätzliche Informationen, wie z.B. '3. Etage', 'Appartment C'.\n        Bei Angabe einer Zusatzinformation in dieser Extension muss diese auch in Address.line angegeben werden,\n        um die Interoperabilität mit Systemen zu gewährleisten, die diese Extension nicht verwenden.  \n        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten.",
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Strassenanschrift.line.extension:Postfach",
        "path" : "Patient.address.line.extension",
        "sliceName" : "Postfach",
        "short" : "Postfachnummer",
        "comment" : "Postfach-Adresse. Bei Angabe eines Postfaches in dieser Extension muss das Postfach auch in Address.line angegeben werden,\n        um die Interoperabilität mit Systemen zu gewährleisten, die diese Extension nicht verwenden. \n        Eine Postfach-Adresse darf nicht in Verbindung mit Address.type `physical` oder `both` verwendet werden.  \n        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten.",
        "max" : "0"
      },
      {
        "id" : "Patient.address:Strassenanschrift.city",
        "path" : "Patient.address.city",
        "short" : "Stadt",
        "comment" : "**Begründung Pflichtfeld:** Ohne diese Angabe ist die Adresse nicht zustellbar.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Strassenanschrift.postalCode",
        "path" : "Patient.address.postalCode",
        "comment" : "**Begründung Pflichtfeld:** Ohne diese Angabe ist die Adresse nicht zustellbar.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Strassenanschrift.country",
        "path" : "Patient.address.country",
        "short" : "Land",
        "comment" : "**Begründung Pflichtfeld:** Ohne diese Angabe ist die Adresse nicht zustellbar.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Postfach",
        "path" : "Patient.address",
        "sliceName" : "Postfach",
        "short" : "Postfachadresse",
        "comment" : "Adresse, die nur für postalische Zustellung genutzt werden kann.",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Address",
            "profile" : ["http://fhir.de/StructureDefinition/address-de-basis"]
          }
        ],
        "patternAddress" : {
          "type" : "postal"
        },
        "constraint" : [
          {
            "key" : "address-cnt-2or3-char",
            "severity" : "warning",
            "human" : "The content of the country element (if present) SHALL be selected EITHER from ValueSet ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2 OR MAY be selected from ISO Country Alpha-3 Value Set http://hl7.org/fhir/ValueSet/iso3166-1-3, IF the country is not specified in value Set ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2.",
            "expression" : "country.empty() or (country.memberOf('http://hl7.org/fhir/ValueSet/iso3166-1-2') or country.memberOf('http://hl7.org/fhir/ValueSet/iso3166-1-3'))",
            "source" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Postfach.type",
        "path" : "Patient.address.type",
        "short" : "Adresstyp",
        "comment" : "Hier ist stets der Wert `postal` anzugeben.  \n    **Begründung Pflichtfeld:** Dient als Unterscheidungs- und Auswahlkriterium",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Postfach.line",
        "path" : "Patient.address.line",
        "short" : "Adresszeile",
        "comment" : "Diese Komponente enthält die Postfachadresse als String der Form 'Postfach: 12345'.\n    Bei Verwendung der Postfach-Extension, um die Postfachnummer strukturiert zu übermitteln, \n    müssen diese Informationen stets vollständig auch in der line-Komponente, \n    die sie erweitern, enthalten sein, um es Systemen, die diese Extensions nicht verwenden zu ermöglichen, \n    auf diese Informationen zugreifen zu können.  \n    **Begründung Pflichtfeld:** Ohne diese Angabe ist die Adresse nicht zustellbar.  \n    **Begründung für Reduktion der max. Kardinalität:** Die maximale Kardinalität wurde in Übereinstimmung mit der \n    DIN-Norm 5008 (Schreib- und Gestaltungsregeln für die Text- und Informationsverarbeitung) auf 3 beschränkt.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Postfach.line.extension:Strasse",
        "path" : "Patient.address.line.extension",
        "sliceName" : "Strasse",
        "max" : "0"
      },
      {
        "id" : "Patient.address:Postfach.line.extension:Hausnummer",
        "path" : "Patient.address.line.extension",
        "sliceName" : "Hausnummer",
        "max" : "0"
      },
      {
        "id" : "Patient.address:Postfach.line.extension:Adresszusatz",
        "path" : "Patient.address.line.extension",
        "sliceName" : "Adresszusatz",
        "max" : "0"
      },
      {
        "id" : "Patient.address:Postfach.line.extension:Postfach",
        "path" : "Patient.address.line.extension",
        "sliceName" : "Postfach",
        "short" : "Postfachnummer",
        "comment" : "Postfach-Adresse. Bei Angabe eines Postfaches in dieser Extension muss das Postfach auch in Address.line angegeben werden,\n        um die Interoperabilität mit Systemen zu gewährleisten, die diese Extension nicht verwenden. \n        Eine Postfach-Adresse darf nicht in Verbindung mit Address.type `physical` oder `both` verwendet werden.  \n        **Begründung MS:** Erforderlich für die verlustfreie Kommunikation von VSDM-Daten.",
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Postfach.city",
        "path" : "Patient.address.city",
        "short" : "Stadt",
        "comment" : "**Begründung Pflichtfeld:** Ohne diese Angabe ist die Adresse nicht zustellbar.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Postfach.postalCode",
        "path" : "Patient.address.postalCode",
        "comment" : "**Begründung Pflichtfeld:** Ohne diese Angabe ist die Adresse nicht zustellbar.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.address:Postfach.country",
        "path" : "Patient.address.country",
        "short" : "Land",
        "comment" : "**Begründung Pflichtfeld:** Ohne diese Angabe ist die Adresse nicht zustellbar.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Patient.link",
        "path" : "Patient.link",
        "short" : "Link",
        "comment" : "Dieses und untergeordnete Elemente KÖNNEN bei einem erfolgten Patient merge entsprechend der Festlegungen unter {{pagelink:Patient-merge}} befüllt werden. \n  Da das Element der Unterstützung der Patient merge Notification dient, \n  MUSS es im Rahmen des Bestätigungsverfahrens NICHT unterstützt werden (Stand: Stufe 4).",
        "mustSupport" : true
      },
      {
        "id" : "Patient.link.other",
        "path" : "Patient.link.other",
        "mustSupport" : true
      },
      {
        "id" : "Patient.link.other.identifier",
        "path" : "Patient.link.other.identifier",
        "comment" : "Logischer Verweis auf Identifier[Patientennummer]",
        "mustSupport" : true
      },
      {
        "id" : "Patient.link.type",
        "path" : "Patient.link.type",
        "mustSupport" : true
      }
    ]
  }
}

```
