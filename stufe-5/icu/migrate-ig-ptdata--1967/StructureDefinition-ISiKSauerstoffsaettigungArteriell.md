# ISiKSauerstoffsaettigungArteriell - Test Implementation Guide v0.0.1

Test Implementation Guide

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKSauerstoffsaettigungArteriell**

## Resource Profile: ISiKSauerstoffsaettigungArteriell 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKSauerstoffsaettigungArteriell | *Version*:0.0.1 |
| Active as of 2025-10-23 | *Computable Name*:ISiKSauerstoffsaettigungArteriell |

 
Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die arterielle Sauerstoffsättigung eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus). 

### Motivation

 
Die Erfassung und Überwachung der arteriellen Sauerstoffsättigung ist essenziell für die Beurteilung der respiratorischen Funktion, die Überwachung von Patienten mit Atemwegserkrankungen sowie die Unterstützung klinischer Entscheidungen, insbesondere in kritischen Versorgungssituationen. 
In FHIR wird die arterielle Sauerstoffsättigung mit der Observation-Ressource repräsentiert. 

### Kompatibilität

 
Das Profil ISiKSauerstoffsaettigungArteriell ist vom Profil[VitalSignDE_Arterielle_Sauerstoffsaettigung_Pulsoximetrie](http://fhir.de/StructureDefinition/observation-de-vitalsign-sauerstoffsaettigung-pulsoximetrie)aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil[Observation Oxygen Saturation Profile](http://hl7.org/fhir/StructureDefinition/oxygensat)aus der FHIR R4 Spezifikation. 

**Usages:**

* Examples for this Profile: [Observation/ISiKSauerstoffsaettigungArteriellExample](Observation-ISiKSauerstoffsaettigungArteriellExample.md), [Observation/ISiKSauerstoffsaettigungArteriellMaxExample](Observation-ISiKSauerstoffsaettigungArteriellMaxExample.md) and [Observation/ISiKSauerstoffsaettigungArteriellMinExample](Observation-ISiKSauerstoffsaettigungArteriellMinExample.md)
* CapabilityStatements using this Profile: [ISiK CapabilityStatement VitalSign ICU Source Minimal Akteur (Expanded)](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceMinimalAkteur-expanded.md) and [ISiK CapabilityStatement VitalSign Standard Source Rolle](CapabilityStatement-ISiKCapabilityStatementVitalSignStandardSourceRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/icu.test.ig|current/StructureDefinition/ISiKSauerstoffsaettigungArteriell)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKSauerstoffsaettigungArteriell.csv), [Excel](StructureDefinition-ISiKSauerstoffsaettigungArteriell.xlsx), [Schematron](StructureDefinition-ISiKSauerstoffsaettigungArteriell.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKSauerstoffsaettigungArteriell",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKSauerstoffsaettigungArteriell",
  "version" : "0.0.1",
  "name" : "ISiKSauerstoffsaettigungArteriell",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-10-23",
  "description" : "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über die arterielle Sauerstoffsättigung eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus).\n### Motivation\nDie Erfassung und Überwachung der arteriellen Sauerstoffsättigung ist essenziell für die Beurteilung der respiratorischen Funktion, die Überwachung von Patienten mit Atemwegserkrankungen sowie die Unterstützung klinischer Entscheidungen, insbesondere in kritischen Versorgungssituationen.\n\nIn FHIR wird die arterielle Sauerstoffsättigung mit der Observation-Ressource repräsentiert.\n\n### Kompatibilität\nDas Profil ISiKSauerstoffsaettigungArteriell ist vom Profil [VitalSignDE_Arterielle_Sauerstoffsaettigung_Pulsoximetrie](http://fhir.de/StructureDefinition/observation-de-vitalsign-sauerstoffsaettigung-pulsoximetrie) aus den deutschen Basisprofilen abgeleitet. Es ist kompatibel mit dem Profil [Observation Oxygen Saturation Profile](http://hl7.org/fhir/StructureDefinition/oxygensat) aus der FHIR R4 Spezifikation.",
  "fhirVersion" : "4.0.1",
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "http://fhir.de/StructureDefinition/observation-de-vitalsign-sauerstoffsaettigung",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Observation",
        "path" : "Observation"
      },
      {
        "id" : "Observation.id",
        "path" : "Observation.id",
        "short" : "serverseitige, interne ID des Datensatzes",
        "comment" : "**bedingtes Pflichtfeld/bedingtes MS:** Alle von einem Server bereitgestellten Ressourcen MÜSSEN über eine `id` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `id`verfügen. ",
        "mustSupport" : true
      },
      {
        "id" : "Observation.meta.versionId",
        "path" : "Observation.meta.versionId",
        "short" : "Eindeutiger Name der serverseitigen Version des Datensatzes",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über eine `versionID` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über eine `versionID`verfügen. "
      },
      {
        "id" : "Observation.meta.lastUpdated",
        "path" : "Observation.meta.lastUpdated",
        "short" : "Zeitpunkt der letzten Änderung",
        "comment" : "Alle von einem Server bereitgestellten Ressourcen SOLLEN über ein `lastUpdate` verfügen.\n  Von Clients erzeugte Ressourcen, die im Kontext einer CREATE-Interaktion übermittelt werden, MÜSSEN NICHT über ein `lastUpdate`verfügen. "
      },
      {
        "id" : "Observation.status",
        "path" : "Observation.status",
        "short" : "Untersuchungsstatus",
        "comment" : "**WICHTIGER Hinweis für Implementierer:**  \n* Alle server-seitigen Implementierungen MÜSSEN in der Lage sein, die systemintern möglichen Statuswerte korrekt in FHIR abzubilden, mindestens jedoch `final`.\n* Alle client-seitigen Implementierungen MÜSSEN in der Lage sein, sämtliche Status-Codes zu interpretieren und dem Anwender in angemessener Form darstellen zu können, beispielsweise durch Ausblenden/Durchstreichen von Ressourcen mit dem status `entered-in-error` und Ausgrauen von Ressourcen, die einen Plan- oder Entwurfs-Status haben.",
        "mustSupport" : true
      },
      {
        "id" : "Observation.category",
        "path" : "Observation.category",
        "short" : "Untersuchungskategorie",
        "comment" : "Motivation MS: Dieses Feld erlaubt die Sortierung und Abfrage anhand der Kategorie der Untersuchung",
        "mustSupport" : true
      },
      {
        "id" : "Observation.category:VSCat",
        "path" : "Observation.category",
        "sliceName" : "VSCat",
        "short" : "Vitalparameterkategorie",
        "comment" : "Motivation MS: Die Kategorie 'vital-signs' dient der Kategorisierung von Vitalparametern",
        "mustSupport" : true
      },
      {
        "id" : "Observation.code",
        "path" : "Observation.code",
        "short" : "Code",
        "comment" : "Motivation MS: Die Observation wird anhand des Codes identifiziert.",
        "mustSupport" : true
      },
      {
        "id" : "Observation.code.coding",
        "path" : "Observation.code.coding",
        "short" : "Coding",
        "comment" : "Motivation MS: Semantische Kodierung",
        "mustSupport" : true
      },
      {
        "id" : "Observation.code.coding:loinc",
        "path" : "Observation.code.coding",
        "sliceName" : "loinc",
        "short" : "LOINC Kodierung",
        "comment" : "Motivation MS: Kodierung des Vitalparameters mittels LOINC.",
        "mustSupport" : true
      },
      {
        "id" : "Observation.code.coding:snomed",
        "path" : "Observation.code.coding",
        "sliceName" : "snomed",
        "short" : "SNOMED CT Kodierung",
        "comment" : "Motivation MS: Kodierung des Vitalparameters mittels SNOMED CT.",
        "mustSupport" : true
      },
      {
        "id" : "Observation.code.coding:IEEE11073",
        "path" : "Observation.code.coding",
        "sliceName" : "IEEE11073",
        "min" : 0,
        "max" : "1",
        "patternCoding" : {
          "system" : "urn:iso:std:iso:11073:10101",
          "code" : "150324"
        }
      },
      {
        "id" : "Observation.subject",
        "path" : "Observation.subject",
        "short" : "Patient",
        "comment" : "**Motivation MS:** Die Verlinkung auf eine Patienten-Ressource dient der technischen Zuordnung der Dokumentation zu einem Patienten und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc.\nIm ISik Kontext MUSS die referenzierte Ressource konform zu [ISiKPatient](https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient) sein.\nJenseits von ISiK KÖNNEN weitere Instanzen mit anderen Profilen referenziert werden.",
        "mustSupport" : true
      },
      {
        "id" : "Observation.encounter",
        "path" : "Observation.encounter",
        "short" : "Aufenthaltsbezug",
        "comment" : "Motivation MS: Der Behandlungskontext ist für die Interpretation der Untersuchungsergebnisse relevant",
        "mustSupport" : true
      },
      {
        "id" : "Observation.encounter.reference",
        "path" : "Observation.encounter.reference",
        "short" : "Encounter-Link",
        "comment" : "**Begründung Pflichtfeld:** Die Verlinkung auf eine Encounter-Ressource dient der technischen Zuordnung der Dokumentation zu einem Aufenthalt und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc.\n**WICHTIGER Hinweis für Implementierer:** Die Zuordnung MUSS auf einen Encounter der Ebene \"Abteilungskontakt\" (siehe hierzu Basismodul > UseCases > Abbildung des Konstruktes \"Fall\") erfolgen.  \nBei der Auswahl des Encounters ist zu beachten, dass unter einer (Abrechnungs-)\"Fallnummer\" (hier: `Encounter.account`) unter Umständen mehrere Encounter gruppiert sein können (z.B. stationärer Besuch mit mehreren vor- und nachstationären Aufenthalten.)\nIm ISik Kontext MUSS die referenzierte Ressource konform zu [ISiKKontaktGesundheitseinrichtung](https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung) sein.\nJenseits von ISiK KÖNNEN weitere Instanzen mit anderen Profilen referenziert werden.",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.effective[x]",
        "path" : "Observation.effective[x]",
        "short" : "Datum und Uhrzeit der Untersuchung",
        "comment" : "Motivation MS: Das Datum und die Uhrzeit der Untersuchung sind für die Interpretation der Untersuchungsergebnisse relevant",
        "mustSupport" : true
      },
      {
        "id" : "Observation.performer",
        "path" : "Observation.performer",
        "short" : "Untersuchender",
        "comment" : "Motivation MS: Dieses Feld stellt präzisierende Angaben zum Zweck der Qualitätsbewertung bereit",
        "mustSupport" : true
      },
      {
        "id" : "Observation.value[x]",
        "path" : "Observation.value[x]",
        "short" : "Untersuchungsergebnis",
        "comment" : "Motivation MS: Der Wert des Vitalparameters ist das zentrale Ergebnis der Untersuchung",
        "mustSupport" : true
      },
      {
        "id" : "Observation.value[x]:valueQuantity",
        "path" : "Observation.value[x]",
        "sliceName" : "valueQuantity",
        "short" : "quantitatives Untersuchungsergebnis",
        "comment" : "Motivation MS: valueQuantity muss für VitalSigns unterstützt werden",
        "type" : [
          {
            "code" : "Quantity"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Observation.value[x]:valueQuantity.value",
        "path" : "Observation.value[x].value",
        "short" : "Wert",
        "comment" : "Motivation MS: Eine Quantity soll einen Wert enthalten",
        "mustSupport" : true
      },
      {
        "id" : "Observation.value[x]:valueQuantity.unit",
        "path" : "Observation.value[x].unit",
        "short" : "Einheit",
        "comment" : "Motivation MS: Eine Quantity soll eine Einheit enthalten",
        "mustSupport" : true
      },
      {
        "id" : "Observation.value[x]:valueQuantity.system",
        "path" : "Observation.value[x].system",
        "short" : "CodeSystem aus dem die Einheit stammt",
        "comment" : "Motivation MS: Eine Quantity soll ein System, mit dem die Einheit kodiert wird, enthalten",
        "mustSupport" : true
      },
      {
        "id" : "Observation.value[x]:valueQuantity.code",
        "path" : "Observation.value[x].code",
        "short" : "Code der Einheit",
        "comment" : "Motivation MS: Eine Quantity soll einen Code der die Einheit kodiert enthalten",
        "mustSupport" : true
      },
      {
        "id" : "Observation.dataAbsentReason",
        "path" : "Observation.dataAbsentReason",
        "short" : "Grund für fehlende Untersuchungsergebnisse",
        "comment" : "Motivation MS: Dieses Feld erlaubt die Angabe von Gründen für fehlende Untersuchungsergebnisse",
        "mustSupport" : true
      },
      {
        "id" : "Observation.method",
        "path" : "Observation.method",
        "short" : "Untersuchungsmethode",
        "comment" : "**Einschränkung der übergreifenden MS-Definition:**  \nVerfügt ein bestätigungsrelevantes System nicht über die Datenstruktur zur Hinterlegung der Untersuchungsmethode, so MUSS dieses System die Information NICHT abbilden\n\n\n  Motivation zum eingeschränkten MS: Dieses Feld stellt präzisierende Angaben zum Zweck der Qualitätsbewertung bereit. Allerdings rechtfertigt der Stand der Umsetzung in gängigen Systemen eine Implementierungspflicht (MS) für die Schnittstelle nicht.",
        "mustSupport" : true
      },
      {
        "id" : "Observation.device",
        "path" : "Observation.device",
        "short" : "Gerät",
        "comment" : "**Einschränkung der übergreifenden MS-Definition:**  \n  Verfügt ein bestätigungsrelevantes System nicht über die Datenstruktur zur Hinterlegung des Geräts, mittels dessen der Parameter erhoben worden ist, so MUSS dieses System die Information NICHT abbilden.\n\n  Motivation zum eingeschränkten MS: Dieses Feld stellt präzisierende Angaben zum Zweck der Qualitätsbewertung bereit. Allerdings rechtfertigt der Stand der Umsetzung in gängigen Systemen eine Implementierungspflicht (MS) für die Schnittstelle nicht.",
        "mustSupport" : true
      }
    ]
  }
}

```
