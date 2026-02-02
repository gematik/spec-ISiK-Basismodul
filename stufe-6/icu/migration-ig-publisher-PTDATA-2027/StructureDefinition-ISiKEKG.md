# ISiKEKG - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKEKG**

## Resource Profile: ISiKEKG 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKEKG | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKEKG |

 
Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über kurze, relevante EKG-Ausschnitte eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus). Es wurde entwickelt, um spezifische klinische Fragestellungen zu unterstützen, bei denen prägnante und gezielte EKG-Daten im Vordergrund stehen. Für vollständige und längere EKG-Aufzeichnungen sind alternative Formate vorgesehen, die für umfangreiche Daten besser geeignet sind. 

### Motivation

 
Die Bereitstellung kurzer EKG-Ausschnitte ermöglicht eine präzise und effiziente Unterstützung bei der Diagnose akuter kardiologischer Fragestellungen, der Überwachung von Arrhythmien oder der Beurteilung bestimmter Ereignisse wie ST-Strecken-Veränderungen. Diese fokussierte Darstellung dient der Optimierung klinischer Entscheidungen und der schnellen Verarbeitung relevanter Daten. 
In FHIR wird das EKG durch die Observation-Ressource repräsentiert, wobei spezifische Anforderungen für die Darstellung und Kodierung der Daten in diesem Profil berücksichtigt werden. 

### Kompatibilität

 
Das Profil ISiKEKG ist vom Profil [EkgDE](http://fhir.de/StructureDefinition/observation-de-ekg) aus den deutschen Basisprofilen abgeleitet. 

**Usages:**

* Examples for this Profile: [Observation/ISiKEKGExample](Observation-ISiKEKGExample.md), [Observation/ISiKEKGMaxExample](Observation-ISiKEKGMaxExample.md) and [Observation/ISiKEKGMinExample](Observation-ISiKEKGMinExample.md)
* CapabilityStatements using this Profile: [ISiK CapabilityStatement Vitalparameter Server Extended (Expanded)](CapabilityStatement-ISiKCapabilityStatementVitalSignICUSourceExtendedAkteur-expanded.md) and [ISiK CapabilityStatement VitalSign Standard Source Rolle](CapabilityStatement-ISiKCapabilityStatementVitalSignStandardSourceRolle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ICU|current/StructureDefinition/ISiKEKG)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKEKG.csv), [Excel](StructureDefinition-ISiKEKG.xlsx), [Schematron](StructureDefinition-ISiKEKG.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKEKG",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKEKG",
  "version" : "6.0.0-rc",
  "name" : "ISiKEKG",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "description" : "Dieses Profil spezifiziert die Minimalanforderungen für die Bereitstellung von Informationen über kurze, relevante EKG-Ausschnitte eines Patienten im Rahmen der interoperablen Kommunikation gemäß den Vorgaben der ISiK (Interoperable Schnittstelle im Krankenhaus). Es wurde entwickelt, um spezifische klinische Fragestellungen zu unterstützen, bei denen prägnante und gezielte EKG-Daten im Vordergrund stehen. Für vollständige und längere EKG-Aufzeichnungen sind alternative Formate vorgesehen, die für umfangreiche Daten besser geeignet sind.\n### Motivation\nDie Bereitstellung kurzer EKG-Ausschnitte ermöglicht eine präzise und effiziente Unterstützung bei der Diagnose akuter kardiologischer Fragestellungen, der Überwachung von Arrhythmien oder der Beurteilung bestimmter Ereignisse wie ST-Strecken-Veränderungen. Diese fokussierte Darstellung dient der Optimierung klinischer Entscheidungen und der schnellen Verarbeitung relevanter Daten.\n\nIn FHIR wird das EKG durch die Observation-Ressource repräsentiert, wobei spezifische Anforderungen für die Darstellung und Kodierung der Daten in diesem Profil berücksichtigt werden.\n\n### Kompatibilität\nDas Profil ISiKEKG ist vom Profil [EkgDE](http://fhir.de/StructureDefinition/observation-de-ekg) aus den deutschen Basisprofilen abgeleitet.",
  "fhirVersion" : "4.0.1",
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "http://fhir.de/StructureDefinition/observation-de-ekg",
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
      },
      {
        "id" : "Observation.component",
        "path" : "Observation.component",
        "short" : "Vitalparameter-Komponente",
        "comment" : "Motivation MS: Erfassung der Komponenten eines Vitalparameters",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component.code",
        "path" : "Observation.component.code",
        "short" : "Code",
        "comment" : "Motivation MS: Die Komponente wird anhand des Codes identifiziert.",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component.code.coding",
        "path" : "Observation.component.code.coding",
        "short" : "Coding",
        "comment" : "Motivation MS: Semantische Kodierung",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component.value[x]",
        "path" : "Observation.component.value[x]",
        "short" : "Wert der Komponente",
        "comment" : "Motivation MS: Der Wert der Komponente ist ein Ergebnis der Untersuchung",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:ekgLeads",
        "path" : "Observation.component",
        "sliceName" : "ekgLeads",
        "short" : "EKG-Ableitungen",
        "comment" : "Motivation MS: Die einzelnen Ableitungen des EKG werden als component abgebildet. **Begründung**: Bei einer EKG Untersuchung werden mehrere Ableitungen gemeinsam erfasst und bilden zusammen das Gesamtbild des EKGs. Siehe auch [Observation.component im FHIR R4 Standard](https://hl7.org/fhir/R4//observation.html#gr-comp).",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:ekgLeads.code",
        "path" : "Observation.component.code",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:ekgLeads.code.coding",
        "path" : "Observation.component.code.coding",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:ekgLeads.value[x]",
        "path" : "Observation.component.value[x]",
        "short" : "SampledData",
        "comment" : "Motivation MS: Die EKG-Daten werden mittels des SampledData Datentyps abgebildet.",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:ekgLeads.value[x].origin",
        "path" : "Observation.component.value[x].origin",
        "short" : "Ausgangswert",
        "comment" : "Motivation MS: Das Feld `origin` definiert den Referenzpunkt und die Einheit der Messreihe, um sicherzustellen, dass die gemessenen Werte im richtigen Kontext interpretiert werden können.",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:ekgLeads.value[x].period",
        "path" : "Observation.component.value[x].period",
        "short" : "Messintervall",
        "comment" : "Motivation MS: Das Feld `period` definiert die zeitliche Distanz zwischen zwei aufeinanderfolgenden Messwerten.",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:ekgLeads.value[x].dimensions",
        "path" : "Observation.component.value[x].dimensions",
        "short" : "Dimensionen",
        "comment" : "Motivation MS: Das Feld `dimensions` gibt die Anzahl der Achsen oder Dimensionen an, die in der Messreihe enthalten sind, und ist notwendig, um die Struktur der Daten korrekt zu verstehen.",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:ekgLeads.value[x].data",
        "path" : "Observation.component.value[x].data",
        "short" : "Messwerte",
        "comment" : "Motivation MS: Das Feld `data` enthält die eigentlichen Messwerte der EKG-Daten.",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:deprecatedLeadCodes",
        "path" : "Observation.component",
        "sliceName" : "deprecatedLeadCodes"
      },
      {
        "id" : "Observation.component:deprecatedLeadCodes.code",
        "path" : "Observation.component.code",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:deprecatedLeadCodes.code.coding",
        "path" : "Observation.component.code.coding",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component:deprecatedLeadCodes.value[x]",
        "path" : "Observation.component.value[x]",
        "mustSupport" : true
      }
    ]
  }
}

```
