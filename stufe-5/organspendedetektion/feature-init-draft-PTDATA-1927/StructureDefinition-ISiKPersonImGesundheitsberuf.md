# ISiKPersonImGesundheitsberuf - Organspendeerkennung v0.0.1-rc

Organspendeerkennung

Version 0.0.1-rc - STU1

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiKPersonImGesundheitsberuf**

## Resource Profile: ISiKPersonImGesundheitsberuf 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKPersonImGesundheitsberuf | *Version*:0.0.1-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKPersonImGesundheitsberuf |

 
Dieses Profil ermöglicht die Nutzung von in Gesundheitsberufen tätigen Personen in ISiK Szenarien. 

### Motivation

 
Das Profil ISIKPersonImGesundheitsberuf bildet alle denkbaren medizinischen Leistungserbringer und Fachexperten ab. In den ISiK-FHIR-Profilen können PersonImGesundheitsberuf bspw. als Ausführende einer Prozedur auftreten, im Element`performer`der Procedure Ressource, oder als die Person, die eine Diagnose stellt, im Element`asserter`der Condition Ressource. 
In FHIR werden PersonImGesundheitsberuf mit der[`Practitioner`](https://hl7.org/fhir/R4/practitioner.html)-Ressource repräsentiert.
Für das Profil ISIKPersonImGesundheitsberuf wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKPatient valide sind, auch valide sind gegen: 
* [Profil KBV_PR_Base_Practitioner der KBV Basisprofile](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Practitioner).
* [Profil HiGHmed_IC_Practitioner, MI Initiative - HiGHmed Use Case Infection Control der Medizininformatik Initiative](https://simplifier.net/medizininformatikinitiative-highmed-ic/highmed-ic-practitioner)
* [Profil TIPractitioner der gematik](https://gematik.de/fhir/ti/StructureDefinition/ti-practitioner)
 
Hinweise zu Inkompatibilitäten können über die[Portalseite](https://service.gematik.de/servicedesk/customer/portal/16)gemeldet werden. 

**Usages:**

* Examples for this Profile: [Practitioner/PractitionerWalterArzt](Practitioner-PractitionerWalterArzt.md)
* CapabilityStatements using this Profile: [Akteur "ISiKCapabilityStatementBasisServerAkteur" (Expanded)](CapabilityStatement-ISiKCapabilityStatementBasisServerAkteur-expanded.md) and [CapabilityStatement für Rolle "LeistungserbringerRolle"](CapabilityStatement-ISiKCapabilityStatementLeistungserbringerRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/Organspendeerkennung.test.ig|current/StructureDefinition/ISiKPersonImGesundheitsberuf)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKPersonImGesundheitsberuf.csv), [Excel](StructureDefinition-ISiKPersonImGesundheitsberuf.xlsx), [Schematron](StructureDefinition-ISiKPersonImGesundheitsberuf.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKPersonImGesundheitsberuf",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-imposeProfile",
      "valueCanonical" : "https://gematik.de/fhir/ti/StructureDefinition/ti-practitioner|1.1.1"
    }
  ],
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKPersonImGesundheitsberuf",
  "version" : "0.0.1-rc",
  "name" : "ISiKPersonImGesundheitsberuf",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "description" : "Dieses Profil ermöglicht die Nutzung von in Gesundheitsberufen tätigen Personen in ISiK Szenarien.\n### Motivation\n\nDas Profil ISIKPersonImGesundheitsberuf bildet alle denkbaren medizinischen Leistungserbringer und Fachexperten  ab. In den ISiK-FHIR-Profilen können PersonImGesundheitsberuf bspw. als Ausführende einer Prozedur auftreten, im Element `performer` der Procedure Ressource, oder als die Person, die eine Diagnose stellt, im Element `asserter` der Condition Ressource.\n\nIn FHIR werden PersonImGesundheitsberuf mit der [`Practitioner`](https://hl7.org/fhir/R4/practitioner.html)-Ressource\n repräsentiert.  \n Für das Profil ISIKPersonImGesundheitsberuf wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKPatient valide sind, auch valide sind gegen:\n* [Profil KBV_PR_Base_Practitioner der KBV Basisprofile](https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Practitioner). \n* [Profil HiGHmed_IC_Practitioner, MI Initiative - HiGHmed Use Case Infection Control der  Medizininformatik Initiative ](https://simplifier.net/medizininformatikinitiative-highmed-ic/highmed-ic-practitioner)\n* [Profil TIPractitioner der gematik](https://gematik.de/fhir/ti/StructureDefinition/ti-practitioner)  \n\nHinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden.",
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
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Practitioner",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Practitioner",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Practitioner",
        "path" : "Practitioner",
        "constraint" : [
          {
            "key" : "prac-de-1",
            "severity" : "error",
            "human" : "Die amtliche Differenzierung der Geschlechtsangabe 'other' darf nur gefüllt sein, wenn das Geschlecht 'other' angegeben ist",
            "expression" : "gender='other' or gender.extension('http://fhir.de/StructureDefinition/gender-amtlich-de').empty()",
            "source" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKPersonImGesundheitsberuf"
          }
        ]
      },
      {
        "id" : "Practitioner.id",
        "path" : "Practitioner.id",
        "short" : "serverseitige, interne ID des Datensatzes",
        "comment" : "**bedingtes Pflichtfeld/bedingtes MS:** Alle von einem Server bereitgestellten Ressourcen MÜSSEN über eine `id` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `id`verfügen. ",
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.meta.versionId",
        "path" : "Practitioner.meta.versionId",
        "short" : "Eindeutiger Name der serverseitigen Version des Datensatzes",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über eine `versionID` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `versionID`verfügen. "
      },
      {
        "id" : "Practitioner.meta.lastUpdated",
        "path" : "Practitioner.meta.lastUpdated",
        "short" : "Zeitpunkt der letzten Änderung",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über ein `lastUpdate` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über ein `lastUpdate`verfügen. "
      },
      {
        "id" : "Practitioner.identifier",
        "path" : "Practitioner.identifier",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        },
        "comment" : "Eindeutiger Identifier der Person",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.identifier:Arztnummer",
        "path" : "Practitioner.identifier",
        "sliceName" : "Arztnummer",
        "short" : "Lebenslange Arztnummer",
        "comment" : " Im Krankenhaus ist die lebenslange Arztnummer der Ärzte bekannt und MUSS zur eindeutigen Identifikation eines Arztes bereitgestellt werden.\n**Hinweise:** Siehe [Beschreibung der Deutschen Basisprofile](https://ig.fhir.de/basisprofile-de/1.2.0/LebenslangeArztnummerLANR-Identifier.html)\nWährend die Deutschen Basisprofile hier die Abkürzung LANR verwenden, ist im KBV-Kontext das Akronym ANR gebräuchlich. Die Bezeichnung des Slices hat jedoch keinerlei Auswirkungen auf die Kompatibilität.",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Identifier",
            "profile" : ["http://fhir.de/StructureDefinition/identifier-lanr"]
          }
        ],
        "patternIdentifier" : {
          "type" : {
            "coding" : [
              {
                "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
                "code" : "LANR"
              }
            ]
          }
        },
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.identifier:Arztnummer.type",
        "path" : "Practitioner.identifier.type",
        "min" : 1
      },
      {
        "id" : "Practitioner.identifier:EFN",
        "path" : "Practitioner.identifier",
        "sliceName" : "EFN",
        "short" : "Einheitliche Fortbildungsnummer für Ärzte in Deutschland",
        "comment" : "In bestimmten KIS wird keine EFN geführt, da diese aus Compliance-Gründen getrennt in HR-Systemen vorgehalten wird (Hinweis kam von Stakeholder), daher soll der entsprechende Test im Test-System mit \"warningOnly\" ausgegeben werden.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Identifier",
            "profile" : ["http://fhir.de/StructureDefinition/identifier-efn"]
          }
        ],
        "patternIdentifier" : {
          "type" : {
            "coding" : [
              {
                "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
                "code" : "DN"
              }
            ]
          }
        },
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.identifier:EFN.type",
        "path" : "Practitioner.identifier.type",
        "min" : 1
      },
      {
        "id" : "Practitioner.identifier:TelematikId",
        "path" : "Practitioner.identifier",
        "sliceName" : "TelematikId",
        "short" : "Telematik-ID",
        "comment" : "**Begründung MS:** Zur Verknüpfung der Patient Instanz mit Diensten der Telematik Infrastruktur SOLL die ID mit angegeben sein.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Identifier",
            "profile" : ["http://fhir.de/StructureDefinition/identifier-telematik-id"]
          }
        ],
        "patternIdentifier" : {
          "type" : {
            "coding" : [
              {
                "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
                "code" : "PRN"
              }
            ]
          }
        },
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.identifier:TelematikId.type",
        "path" : "Practitioner.identifier.type",
        "min" : 1
      },
      {
        "id" : "Practitioner.name",
        "path" : "Practitioner.name",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        },
        "comment" : "Namen der Person",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.name:Name",
        "path" : "Practitioner.name",
        "sliceName" : "Name",
        "short" : "Vollständiger Name",
        "comment" : "Der Name des Arztes MUSS in konkreten Anwendungen angezeigt werden können. Es MUSS nach dem Namen des Arztes gesucht werden können.",
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
        "id" : "Practitioner.name:Name.use",
        "path" : "Practitioner.name.use",
        "min" : 1,
        "fixedCode" : "official",
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.name:Name.family",
        "path" : "Practitioner.name.family",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.name:Name.given",
        "path" : "Practitioner.name.given",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.name:Name.prefix",
        "path" : "Practitioner.name.prefix",
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.name:Geburtsname",
        "path" : "Practitioner.name",
        "sliceName" : "Geburtsname",
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
        }
      },
      {
        "id" : "Practitioner.name:Geburtsname.use",
        "path" : "Practitioner.name.use",
        "min" : 1,
        "fixedCode" : "maiden",
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.name:Geburtsname.family",
        "path" : "Practitioner.name.family",
        "min" : 1
      },
      {
        "id" : "Practitioner.name:Geburtsname.given",
        "path" : "Practitioner.name.given",
        "max" : "0"
      },
      {
        "id" : "Practitioner.name:Geburtsname.prefix",
        "path" : "Practitioner.name.prefix",
        "max" : "0"
      },
      {
        "id" : "Practitioner.telecom.system",
        "path" : "Practitioner.telecom.system",
        "min" : 1
      },
      {
        "id" : "Practitioner.telecom.value",
        "path" : "Practitioner.telecom.value",
        "min" : 1
      },
      {
        "id" : "Practitioner.address",
        "path" : "Practitioner.address",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        },
        "comment" : "In order to differentiate between post box addresses and physical addresses, street names and house numbers, and to add city district names, vendors can opt to support the extensions as suggested in the German Address Base Profile http://fhir.de/StructureDefinition/address-de-basis.\r\nSuch differentiations are however not required within the scope of this specification.",
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.address:Strassenanschrift",
        "path" : "Practitioner.address",
        "sliceName" : "Strassenanschrift",
        "short" : "Straßenanschrift",
        "comment" : "Ist die Adresse bekannt, unter der ein Arzt erreichbar ist, MUSS sie bereitgestellt werden. Diese kann zur Unterscheidung von Personen herangezogen werden. Die Ausdifferenzierung der Adresse in die Adressbestandteile erfolgt in Hinblick auf eine einheitliche Verwendung von Adressen.",
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
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.address:Strassenanschrift.extension:Stadtteil",
        "path" : "Practitioner.address.extension",
        "sliceName" : "Stadtteil",
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.address:Strassenanschrift.type",
        "path" : "Practitioner.address.type",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.address:Strassenanschrift.line",
        "path" : "Practitioner.address.line",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.address:Strassenanschrift.line.extension:Strasse",
        "path" : "Practitioner.address.line.extension",
        "sliceName" : "Strasse",
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.address:Strassenanschrift.line.extension:Hausnummer",
        "path" : "Practitioner.address.line.extension",
        "sliceName" : "Hausnummer",
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.address:Strassenanschrift.line.extension:Adresszusatz",
        "path" : "Practitioner.address.line.extension",
        "sliceName" : "Adresszusatz",
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.address:Strassenanschrift.line.extension:Postfach",
        "path" : "Practitioner.address.line.extension",
        "sliceName" : "Postfach",
        "max" : "0"
      },
      {
        "id" : "Practitioner.address:Strassenanschrift.city",
        "path" : "Practitioner.address.city",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.address:Strassenanschrift.postalCode",
        "path" : "Practitioner.address.postalCode",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.address:Strassenanschrift.country",
        "path" : "Practitioner.address.country",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.address:Postfach",
        "path" : "Practitioner.address",
        "sliceName" : "Postfach",
        "short" : "Postfachanschrift",
        "comment" : "Ist die Postfachadresse bekannt, unter der ein Arzt erreichbar ist, MUSS sie bereitgestellt werden. Diese kann zur Unterscheidung von Personen herangezogen werden. Die Ausdifferenzierung der Adresse in die Adressbestandteile erfolgt in Hinblick auf eine einheitliche Verwendung von Adressen.",
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
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.address:Postfach.type",
        "path" : "Practitioner.address.type",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.address:Postfach.line",
        "path" : "Practitioner.address.line",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.address:Postfach.line.extension:Strasse",
        "path" : "Practitioner.address.line.extension",
        "sliceName" : "Strasse",
        "max" : "0"
      },
      {
        "id" : "Practitioner.address:Postfach.line.extension:Hausnummer",
        "path" : "Practitioner.address.line.extension",
        "sliceName" : "Hausnummer",
        "max" : "0"
      },
      {
        "id" : "Practitioner.address:Postfach.line.extension:Adresszusatz",
        "path" : "Practitioner.address.line.extension",
        "sliceName" : "Adresszusatz",
        "max" : "0"
      },
      {
        "id" : "Practitioner.address:Postfach.line.extension:Postfach",
        "path" : "Practitioner.address.line.extension",
        "sliceName" : "Postfach",
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.address:Postfach.city",
        "path" : "Practitioner.address.city",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.address:Postfach.postalCode",
        "path" : "Practitioner.address.postalCode",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.address:Postfach.country",
        "path" : "Practitioner.address.country",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.gender",
        "path" : "Practitioner.gender",
        "short" : "Ist das Geschlecht des Arztes bekannt, MUSS es bereitgestellt werden. Eine korrekte Kodierung des Geschlechtseintrags 'divers' MUSS per GenderOtherDE-Extension unterstüzt werden.",
        "comment" : "Geschlecht der Person",
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.gender.extension",
        "path" : "Practitioner.gender.extension",
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
        "id" : "Practitioner.gender.extension:Geschlecht-Administrativ",
        "path" : "Practitioner.gender.extension",
        "sliceName" : "Geschlecht-Administrativ",
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
        "id" : "Practitioner.gender.extension:Geschlecht-Administrativ.value[x]",
        "path" : "Practitioner.gender.extension.value[x]",
        "mustSupport" : true
      },
      {
        "id" : "Practitioner.qualification.code",
        "path" : "Practitioner.qualification.code",
        "comment" : "Zur Kodierung der Qualifikation ist das entsprechende [ValueSet der KBV](https://fhir.kbv.de/ValueSet/KBV_VS_Base_Practitioner_Speciality) zu empfehlen."
      }
    ]
  }
}

```
