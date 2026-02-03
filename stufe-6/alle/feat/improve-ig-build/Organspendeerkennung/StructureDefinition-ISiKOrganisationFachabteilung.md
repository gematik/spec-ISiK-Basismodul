# ISiKOrganisationFachabteilung - ISiK Organspendeerkennung v0.0.1-rc

ISiK Organspendeerkennung

Version 0.0.1-rc - STU1 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiKOrganisationFachabteilung**

## Resource Profile: ISiKOrganisationFachabteilung 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKOrganisationFachabteilung | *Version*:0.0.1-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKOrganisationFachabteilung |

 
Dieses Profil beschreibt die Organisationseinheit Fachabteilung innerhalb eines Krankenhauses. 

### Motivation

 
Die Abbildung der Aufbauorganisation eines Krankenhauses dient der Festlegung von Zuständigkeiten und (Entscheidungs-)Verantwortungen von Organisationseinheiten (z.B. Fachkliniken, Fachabteilungen und -bereichen etc.) in strukturierter Form. 
In FHIR wird die Organisation (Organization) vom Standort (Location) eindeutig abgegrenzt. 
Die Erfassung der Organisation in strukturierter Form ermöglicht u.a.: 
* Zuweisungen von Diensten an bestimmte Bereiche der Aufbauorganisation im Rahmen des Terminmanagements
* Die Raum- und Betten-Belegung in strukturierter Form (interdisziplinär)
 
Auch die Erfassung des Krankenhauses als Ganzem ist relevant. Entsprechend fokussieren die folgenden Profile zur Organisation auf das Krankenhaus als Ganzes und die Fachabteilung als Organisation. 

### Kompatibilität

 
Für das Profil ISiKOrganisationFachabteilung wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKPatient valide sind, auch valide sind gegen: 
* [Profil TIOrganization der gematik](https://gematik.de/fhir/ti/StructureDefinition/ti-organization)
 
Hinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden. 

**Usages:**

* Examples for this Profile: [Allgemeinchirurgie](Organization-AbteilungAllgemeinchirurgieOrganisationBeispiel.md)
* CapabilityStatements using this Profile: [CapabilityStatement für Rolle "AufbaustrukturRolle"](CapabilityStatement-ISiKCapabilityStatementAufbaustrukturRolle.md) and [Akteur "ISiKCapabilityStatementBasisServerAkteur" (Expanded)](CapabilityStatement-ISiKCapabilityStatementBasisServerAkteur-expanded.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/Organspendeerkennung|current/StructureDefinition/ISiKOrganisationFachabteilung)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKOrganisationFachabteilung.csv), [Excel](StructureDefinition-ISiKOrganisationFachabteilung.xlsx), [Schematron](StructureDefinition-ISiKOrganisationFachabteilung.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKOrganisationFachabteilung",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-imposeProfile",
      "valueCanonical" : "https://gematik.de/fhir/ti/StructureDefinition/ti-organization|1.1.1"
    }
  ],
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKOrganisationFachabteilung",
  "version" : "0.0.1-rc",
  "name" : "ISiKOrganisationFachabteilung",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "description" : "Dieses Profil beschreibt die Organisationseinheit Fachabteilung innerhalb eines Krankenhauses.\n### Motivation\n\nDie Abbildung der Aufbauorganisation eines Krankenhauses dient der Festlegung von Zuständigkeiten und (Entscheidungs-)Verantwortungen von Organisationseinheiten (z.B. Fachkliniken, Fachabteilungen und -bereichen etc.) in strukturierter Form. \n\nIn FHIR wird die Organisation (Organization) vom Standort (Location) eindeutig abgegrenzt.\n\nDie Erfassung der Organisation in strukturierter Form ermöglicht u.a.:\n- Zuweisungen von Diensten an bestimmte Bereiche der Aufbauorganisation im Rahmen des Terminmanagements\n- Die Raum- und Betten-Belegung in strukturierter Form (interdisziplinär)\n\nAuch die Erfassung des Krankenhauses als Ganzem ist relevant.\nEntsprechend fokussieren die folgenden Profile zur Organisation auf das Krankenhaus als Ganzes und die Fachabteilung als Organisation.  \n### Kompatibilität\n\nFür das Profil ISiKOrganisationFachabteilung wird eine Kompatibilität mit folgenden Profilen angestrebt; allerdings kann nicht sichergestellt werden, dass Instanzen, die gegen ISIKPatient valide sind, auch valide sind gegen:\n* [Profil TIOrganization der gematik](https://gematik.de/fhir/ti/StructureDefinition/ti-organization)  \n\nHinweise zu Inkompatibilitäten können über die [Portalseite](https://service.gematik.de/servicedesk/customer/portal/16) gemeldet werden.\n\n",
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
  "type" : "Organization",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Organization",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
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
        "id" : "Organization.identifier",
        "path" : "Organization.identifier",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        },
        "short" : "Identifikatoren der Fachabteilung",
        "comment" : "Mindestens ein Identifikator muss für die Fachabteilung angegeben werden.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Organization.identifier:IKNR",
        "path" : "Organization.identifier",
        "sliceName" : "IKNR",
        "short" : "Institutionskennzeichen",
        "comment" : "Motivation: Entsprechend der Profil-Festlegung der KBV Organisation 1.5.0. (https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Organization), muss ein System ein Institutionskennzeichen (IKNR) verarbeiten können, sofern diese Information verfügbar ist. ",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Identifier",
            "profile" : ["http://fhir.de/StructureDefinition/identifier-iknr"]
          }
        ],
        "patternIdentifier" : {
          "system" : "http://fhir.de/sid/arge-ik/iknr"
        },
        "mustSupport" : true
      },
      {
        "id" : "Organization.identifier:BSNR",
        "path" : "Organization.identifier",
        "sliceName" : "BSNR",
        "short" : "Betriebsstättennummer",
        "comment" : "Motivation: Entsprechend der Profilierung im Rahmen der Stakeholderbefragung zu einem Profil Organisation in der Arbeitsgruppe zum ISIK Basismodul Stufe 4 und der Vorgabe der KBV Organisation 1.5.0. (https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Organization), muss ein System eine Betriebsstättennummer (BSNR) verarbeiten können, sofern diese Information verfügbar ist.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Identifier",
            "profile" : ["http://fhir.de/StructureDefinition/identifier-bsnr"]
          }
        ],
        "patternIdentifier" : {
          "system" : "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR"
        },
        "mustSupport" : true
      },
      {
        "id" : "Organization.identifier:TelematikID",
        "path" : "Organization.identifier",
        "sliceName" : "TelematikID",
        "short" : "Telematik-ID",
        "comment" : "Motivation: Entsprechend der Profil-Festlegung der KBV Organisation 1.5.0. (https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Organization) und der VZD-FHIR-Directory Organisation-Ressource in der Version 0.10.2 (https://gematik.de/fhir/directory/StructureDefinition/OrganizationDirectory), muss ein System ein Institutionskennzeichen (IKNR) verarbeiten können, sofern diese Information verfügbar ist.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Identifier",
            "profile" : ["http://fhir.de/StructureDefinition/identifier-telematik-id"]
          }
        ],
        "patternIdentifier" : {
          "system" : "https://gematik.de/fhir/sid/telematik-id"
        },
        "mustSupport" : true
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
            "coding" : [
              {
                "system" : "http://snomed.info/sct",
                "code" : "225746001"
              }
            ]
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
        "id" : "Organization.active",
        "path" : "Organization.active",
        "short" : "Aktiv/Inaktiv Status",
        "comment" : "Motivation: Ein System muss prüfen können, ob eine Fachabteilung als Organisation aktiv ist oder nicht, sofern diese Information verfügbar ist.",
        "mustSupport" : true
      },
      {
        "id" : "Organization.type",
        "path" : "Organization.type",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "short" : "Art der Organisation",
        "comment" : "Motivation: Ein System muss den Typ einer Organisation zum Abruf bereitstellen, sofern diese Information verfügbar ist. \n  Die Festlegung einer endlichen Menge von Organisations-Formen in verbindlicher weise, ist zum Zeitpunkt der Festlegung nicht möglich.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Organization.type:organisationstyp",
        "path" : "Organization.type",
        "sliceName" : "organisationstyp",
        "short" : "Angabe des Organisations-Typ",
        "comment" : "Motivation: Eine Fachabteilung muss als solche hinsichtlich des Typs kodiert werden.",
        "min" : 1,
        "max" : "1",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://terminology.hl7.org/CodeSystem/organization-type",
              "code" : "dept"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Organization.type:ErweiterterFachabteilungsschluessel",
        "path" : "Organization.type",
        "sliceName" : "ErweiterterFachabteilungsschluessel",
        "short" : "Angabe des §301 Fachabteilungsschlüssel",
        "comment" : "Motivation: Das ValueSet muss bindend sein, damit Systemübergreifend der Fachabteilungstyp einheitlich kodiert werden kann. \n  \n  Dieses ValueSet KANN über ein Mapping (siehe Abschnitt https://wiki.hl7.de/index.php?title=IG:Value_Sets_f%C3%BCr_XDS#DocumentEntry.practiceSettingCode) mit dem ValueSet der Fachrichtung verknüpft werden und darüber ggf. die Integration von Systemen erleichtern.",
        "min" : 0,
        "max" : "1",
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.de/ValueSet/dkgev/Fachabteilungsschluessel-erweitert"
        }
      },
      {
        "id" : "Organization.type:ErweiterterFachabteilungsschluessel.coding.system",
        "path" : "Organization.type.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Organization.type:ErweiterterFachabteilungsschluessel.coding.code",
        "path" : "Organization.type.coding.code",
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
      },
      {
        "id" : "Organization.name",
        "path" : "Organization.name",
        "short" : "Name der Organisation",
        "comment" : "Motivation: Einer Organisation oder Organisationseinheit muss ein Name zugewiesen werden.",
        "mustSupport" : true
      },
      {
        "id" : "Organization.alias",
        "path" : "Organization.alias",
        "short" : "Alias der Organisation",
        "comment" : "Hinweis: unter Umständen können hier Kürzel genutzt werden. Motivation: Ein System muss den Alias einer Organisation zum Abruf bereitstellen, sofern diese Information verfügbar ist.",
        "mustSupport" : true
      },
      {
        "id" : "Organization.telecom",
        "path" : "Organization.telecom",
        "short" : "Kontaktinformation",
        "comment" : "Motivation: Ein System muss Kontaktinformation einer Organisation zum Abruf bereitstellen, sofern diese Information verfügbar ist.",
        "mustSupport" : true
      },
      {
        "id" : "Organization.address",
        "path" : "Organization.address",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        },
        "short" : "Adresse der Organisation",
        "comment" : "In order to differentiate between post box addresses and physical addresses, street names and house numbers, and to add city district names, vendors can opt to support the extensions as suggested in the German Address Base Profile http://fhir.de/StructureDefinition/address-de-basis.\r\nSuch differentiations are however not required within the scope of this specification.",
        "mustSupport" : true
      },
      {
        "id" : "Organization.address:Strassenanschrift",
        "path" : "Organization.address",
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
            "source" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKOrganisationFachabteilung"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Organization.address:Strassenanschrift.extension:Stadtteil",
        "path" : "Organization.address.extension",
        "sliceName" : "Stadtteil",
        "mustSupport" : true
      },
      {
        "id" : "Organization.address:Strassenanschrift.type",
        "path" : "Organization.address.type",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Organization.address:Strassenanschrift.line",
        "path" : "Organization.address.line",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Organization.address:Strassenanschrift.line.extension:Strasse",
        "path" : "Organization.address.line.extension",
        "sliceName" : "Strasse",
        "mustSupport" : true
      },
      {
        "id" : "Organization.address:Strassenanschrift.line.extension:Hausnummer",
        "path" : "Organization.address.line.extension",
        "sliceName" : "Hausnummer",
        "mustSupport" : true
      },
      {
        "id" : "Organization.address:Strassenanschrift.line.extension:Adresszusatz",
        "path" : "Organization.address.line.extension",
        "sliceName" : "Adresszusatz",
        "mustSupport" : true
      },
      {
        "id" : "Organization.address:Strassenanschrift.line.extension:Postfach",
        "path" : "Organization.address.line.extension",
        "sliceName" : "Postfach",
        "max" : "0"
      },
      {
        "id" : "Organization.address:Strassenanschrift.city",
        "path" : "Organization.address.city",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Organization.address:Strassenanschrift.postalCode",
        "path" : "Organization.address.postalCode",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Organization.address:Strassenanschrift.country",
        "path" : "Organization.address.country",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Organization.address:Postfach",
        "path" : "Organization.address",
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
            "source" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKOrganisationFachabteilung"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Organization.address:Postfach.extension:Stadtteil",
        "path" : "Organization.address.extension",
        "sliceName" : "Stadtteil",
        "mustSupport" : true
      },
      {
        "id" : "Organization.address:Postfach.type",
        "path" : "Organization.address.type",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Organization.address:Postfach.line",
        "path" : "Organization.address.line",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Organization.address:Postfach.line.extension:Strasse",
        "path" : "Organization.address.line.extension",
        "sliceName" : "Strasse",
        "max" : "0"
      },
      {
        "id" : "Organization.address:Postfach.line.extension:Hausnummer",
        "path" : "Organization.address.line.extension",
        "sliceName" : "Hausnummer",
        "max" : "0"
      },
      {
        "id" : "Organization.address:Postfach.line.extension:Adresszusatz",
        "path" : "Organization.address.line.extension",
        "sliceName" : "Adresszusatz",
        "max" : "0"
      },
      {
        "id" : "Organization.address:Postfach.line.extension:Postfach",
        "path" : "Organization.address.line.extension",
        "sliceName" : "Postfach",
        "mustSupport" : true
      },
      {
        "id" : "Organization.address:Postfach.city",
        "path" : "Organization.address.city",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Organization.address:Postfach.postalCode",
        "path" : "Organization.address.postalCode",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Organization.address:Postfach.country",
        "path" : "Organization.address.country",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Organization.partOf",
        "path" : "Organization.partOf",
        "short" : "Übergeordnete Organisation",
        "comment" : "Motivation: System muss die Hierarchie einer Organisationseinheit innherhalb einer Organisation zum Abruf bereitstellen, sofern diese Information verfügbar ist.",
        "mustSupport" : true
      },
      {
        "id" : "Organization.contact",
        "path" : "Organization.contact",
        "short" : "Kontaktperson oder -abteilung",
        "comment" : "Motivation: Ein System muss Kontaktinformation einer Organisation zum Abruf bereitstellen, sofern diese Information verfügbar ist.",
        "mustSupport" : true
      },
      {
        "id" : "Organization.endpoint",
        "path" : "Organization.endpoint",
        "short" : "Technischer Endpunkt",
        "comment" : "Motivation: Ein System muss den technischen Endpunkt einer Organisation zum Abruf bereitstellen, sofern diese Information verfügbar ist.",
        "mustSupport" : true
      }
    ]
  }
}

```
