# ISiKLaboruntersuchung - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKLaboruntersuchung**

## Resource Profile: ISiKLaboruntersuchung 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/StructureDefinition/ISiKLaboruntersuchung | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKLaboruntersuchung |

 
Dieses Profil ermöglicht die Abbildung von Informationen zur Laboruntersuchungen eines Patienten in ISiK Szenarien. Es dient primär als Vorlage, von der spezifische Laboruntersuchungs-Profile abgeleitet werden, kann aber grundsätzlich auch zur Repräsentation von nicht weiter ausspezifizierten Laboruntersuchungen genutzt werden. 
Viele medizinischen Entscheidungen benötigen Informationen zu den Laboruntersuchungen eines Patienten. Hierzu gehören z.B. aktuelle Nierenfunktionswerte, Leberwerte, Blutbildwerte oder Hormone aus Schilddrüse. Jede dieser Untersuchungen wird durch bestimmte [[https://loinc.org/ LOINC]] oder [[http://snomed.info/sct SNOMED CT]] Codes bezeichnet. Der angegebene Wert ist durch genaue Einheitenangaben in [[http://unitsofmeasure.org UCUM]] zu konkretitiseren. Motivierender Use-Case zur Einführung dieser Profile ist die [Arzneitmitteltherapiesicherheit im Krankenhaus - AMTS](https://simplifier.net/guide/isik-medikation-v4/ImplementationGuide-markdown-UseCases-AMTS?version=current). 
In FHIR werden Untersuchungen, bzw. Beobachtungen als [`Observation`](https://hl7.org/fhir/R4/observation.html)-Ressource repräsentiert. Zugehörige Codes und Einheiten sind den entsprechenden Valuessets zu entnehmen. 

**Usages:**

* Derived from this Profile: [ISiKLaboruntersuchungCRP](StructureDefinition-ISiKLaboruntersuchungCRP.md), [ISiKLaboruntersuchungGFR](StructureDefinition-ISiKLaboruntersuchungGFR.md), [ISiKLaboruntersuchungHb](StructureDefinition-ISiKLaboruntersuchungHb.md), [ISiKLaboruntersuchungPCT](StructureDefinition-ISiKLaboruntersuchungPCT.md)... Show 4 more, [ISiKLaboruntersuchungSerumkreatinin](StructureDefinition-ISiKLaboruntersuchungSerumkreatinin.md), [ISiKLaboruntersuchungTSH](StructureDefinition-ISiKLaboruntersuchungTSH.md), [ISiKLaboruntersuchungThrombozyten](StructureDefinition-ISiKLaboruntersuchungThrombozyten.md) and [ISiKLaboruntersuchungTroponin](StructureDefinition-ISiKLaboruntersuchungTroponin.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ICU|current/StructureDefinition/ISiKLaboruntersuchung)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ISiKLaboruntersuchung.csv), [Excel](StructureDefinition-ISiKLaboruntersuchung.xlsx), [Schematron](StructureDefinition-ISiKLaboruntersuchung.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ISiKLaboruntersuchung",
  "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKLaboruntersuchung",
  "version" : "6.0.0-rc",
  "name" : "ISiKLaboruntersuchung",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "description" : "Dieses Profil ermöglicht die Abbildung von Informationen zur Laboruntersuchungen eines Patienten in ISiK Szenarien. Es dient primär als Vorlage, von der spezifische Laboruntersuchungs-Profile abgeleitet werden, kann aber grundsätzlich auch zur Repräsentation von nicht weiter ausspezifizierten Laboruntersuchungen genutzt werden.\n\nViele medizinischen Entscheidungen benötigen Informationen zu den Laboruntersuchungen eines Patienten. Hierzu gehören z.B. aktuelle Nierenfunktionswerte, Leberwerte, Blutbildwerte oder Hormone aus Schilddrüse.\nJede dieser Untersuchungen wird durch bestimmte [[https://loinc.org/ LOINC]] oder [[http://snomed.info/sct SNOMED CT]] Codes bezeichnet. Der angegebene Wert ist durch genaue Einheitenangaben in [[http://unitsofmeasure.org UCUM]] zu konkretitiseren.\nMotivierender Use-Case zur Einführung dieser Profile ist die [Arzneitmitteltherapiesicherheit im Krankenhaus - AMTS](https://simplifier.net/guide/isik-medikation-v4/ImplementationGuide-markdown-UseCases-AMTS?version=current).\n\nIn FHIR werden Untersuchungen, bzw. Beobachtungen als [`Observation`](https://hl7.org/fhir/R4/observation.html)-Ressource repräsentiert. Zugehörige Codes und Einheiten sind den entsprechenden Valuessets zu entnehmen.",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "workflow",
      "uri" : "http://hl7.org/fhir/workflow",
      "name" : "Workflow Pattern"
    },
    {
      "identity" : "sct-concept",
      "uri" : "http://snomed.info/conceptdomain",
      "name" : "SNOMED CT Concept Domain Binding"
    },
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
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "sct-attr",
      "uri" : "http://snomed.org/attributebinding",
      "name" : "SNOMED CT Attribute Binding"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Observation",
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
        "short" : "Status der Laboruntersuchung",
        "comment" : "**Begründung MS**: Der Status ist unerlässlich für die korrekte Interpretation einer Untersuchung. **WICHTIGER Hinweis für Implementierer**:  \n  * Alle server-seitigen Implementierungen MÜSSEN in der Lage sein, \n  die systemintern möglichen Statuswerte korrekt in FHIR abzubilden, mindestens jedoch die Werte `final` und `unknown`.\n  * Alle client-seitigen Implementierungen MÜSSEN in der Lage sein, sämtliche Status-Codes zu interpretieren und dem Anwender in angemessener Form darstellen zu können, \n  beispielsweise durch Ausblenden/Durchstreichen von Prozeduren mit dem status `entered-in-error` und Ausgrauen von Untersuchungen, die noch nicht stattgefunden haben, o.ä.",
        "mustSupport" : true
      },
      {
        "id" : "Observation.category",
        "path" : "Observation.category",
        "short" : "Kategorie der Laboruntersuchung",
        "comment" : "**Begründung MS**: Ermöglicht das Filtern, Sortieren und Gruppieren von Befunden. Für Laboruntersuchungen ist die Kategorie zwingend mit dem entsprechenden Code (z. B. LOINC-Kategorie „laboratory“) zu befüllen.",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
              "code" : "laboratory"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Observation.code",
        "path" : "Observation.code",
        "short" : "Gegenstand der Untersuchung (Laborparameter)",
        "comment" : "**Begründung MS**: Der Code identifiziert, was gemessen wurde, und ist damit das zentrale Element der Observation. Ohne .code ist kein eindeutiger sowie maschinell auswertbarer klinischer Kontext  dokumentiert.",
        "mustSupport" : true
      },
      {
        "id" : "Observation.code.coding",
        "path" : "Observation.code.coding",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        },
        "short" : "Kodierung des Laborparameters",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.code.coding.system",
        "path" : "Observation.code.coding.system",
        "short" : "System, aus dem der Code für den Laborparameter stammt (z. B. LOINC)",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.code.coding.code",
        "path" : "Observation.code.coding.code",
        "short" : "Code des Laborparameters entsprechend dem verwendeten System",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.code.coding.display",
        "path" : "Observation.code.coding.display",
        "short" : "Anzeige-/Bezeichnungstext für den Laborparameter-Code",
        "mustSupport" : true
      },
      {
        "id" : "Observation.code.coding:loinc",
        "path" : "Observation.code.coding",
        "sliceName" : "loinc",
        "min" : 1,
        "max" : "*",
        "patternCoding" : {
          "system" : "http://loinc.org"
        },
        "mustSupport" : true
      },
      {
        "id" : "Observation.code.text",
        "path" : "Observation.code.text",
        "mustSupport" : true
      },
      {
        "id" : "Observation.subject",
        "path" : "Observation.subject",
        "short" : "Referenz auf den Patienten",
        "comment" : "**Begründung MS**: Die Verknüpfung zur Patientin oder zum Patienten ist zwingend notwendig für jegliche klinische Verwertbarkeit.",
        "min" : 1,
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Observation.subject.reference",
        "path" : "Observation.subject.reference",
        "short" : "Patienten-Link",
        "comment" : "**Begründung MS:** Die Verlinkung auf eine Patienten-Ressource dient der technischen Zuordnung der Dokumentation zu einem Patienten und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc.\nIm ISik Kontext MUSS die referenzierte Ressource konform zu [ISiKPatient](https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient) sein.\nJenseits von ISiK KÖNNEN weitere Instanzen mit anderen Profilen referenziert werden.",
        "mustSupport" : true
      },
      {
        "id" : "Observation.encounter",
        "path" : "Observation.encounter",
        "short" : "Referenz auf den Abteilungskontakt",
        "comment" : "**Begründung MS**: Dient der Einordnung in den klinischen Verlauf und ermöglicht Kontextinformationen wie Aufnahmediagnose oder behandelnde Abteilung.",
        "mustSupport" : true
      },
      {
        "id" : "Observation.encounter.reference",
        "path" : "Observation.encounter.reference",
        "comment" : "**Begründung MS:** Die Verlinkung auf eine Encounter-Ressource dient der technischen Zuordnung der Dokumentation zu einem Aufenthalt und ermöglicht wichtige API-Funktionen wie verkettete Suche, (Reverse-)Include etc.\nIm ISik Kontext MUSS die referenzierte Ressource konform zu [ISiKKontaktGesundheitseinrichtung](https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung) sein.\nJenseits von ISiK KÖNNEN weitere Instanzen mit anderen Profilen referenziert werden.",
        "mustSupport" : true
      },
      {
        "id" : "Observation.effective[x]",
        "path" : "Observation.effective[x]",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "type",
              "path" : "$this"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "short" : "Zeitpunkt der Untersuchung",
        "comment" : "**Begründung Must Support**:\nDas Element effective[x] ist zentral, um die Beobachtung - insbesondere bei Laborbefunden - zeitlich korrekt einzuordnen. Es stellt sicher, dass Systeme erkennen können, wann eine Untersuchung durchgeführt oder ein Zustand beobachtet wurde. Dies ist entscheidend für:\n\n* die klinische Relevanz des Ergebnisses (z.B. aktueller vs. älterer Befund),\n* Verlaufsauswertungen und Trendanalysen,\n* zeitlich abhängige Entscheidungsunterstützung,\n* eine valide Anzeige im zeitlichen Kontext des Patientenaufenthalts.",
        "mustSupport" : true
      },
      {
        "id" : "Observation.effective[x]:effectiveDateTime",
        "path" : "Observation.effective[x]",
        "sliceName" : "effectiveDateTime",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "dateTime"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Observation.issued",
        "path" : "Observation.issued",
        "short" : "Zeitpunkt der Verfügbarkeit des Untersuchungsergebnisses",
        "comment" : "**Begründung MS**: Relevant zur Nachvollziehbarkeit und Validierung von Befunden, z.B. wann eine Entscheidung darauf basierte.",
        "mustSupport" : true
      },
      {
        "id" : "Observation.value[x]",
        "path" : "Observation.value[x]",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "type",
              "path" : "$this"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "short" : "Festgestellter (Mess)Wert für den Laborparameter",
        "comment" : "**Begründung MS**: Der gemessene Wert stellt die zentrale Aussage der Observation dar. Ohne value besitzt die Observation keine medizinische Relevanz.",
        "mustSupport" : true
      },
      {
        "id" : "Observation.value[x]:valueQuantity",
        "path" : "Observation.value[x]",
        "sliceName" : "valueQuantity",
        "short" : "Messwert in quantitativer Form",
        "comment" : "**Begründung MS**: Standardisierte, codierte Einheiten sind für Vergleichbarkeit, Umrechnung und automatische Plausibilisierung erforderlich.",
        "min" : 0,
        "max" : "1",
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
        "short" : "Der numerische Messwert",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.value[x]:valueQuantity.unit",
        "path" : "Observation.value[x].unit",
        "short" : "Einheit des Messwertes (z. B. mg/dL)",
        "mustSupport" : true
      },
      {
        "id" : "Observation.value[x]:valueQuantity.system",
        "path" : "Observation.value[x].system",
        "short" : "Kodiersystem für die Einheit (UCUM)",
        "min" : 1,
        "patternUri" : "http://unitsofmeasure.org",
        "mustSupport" : true
      },
      {
        "id" : "Observation.value[x]:valueQuantity.code",
        "path" : "Observation.value[x].code",
        "short" : "UCUM-Code der Einheit",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.dataAbsentReason",
        "path" : "Observation.dataAbsentReason",
        "short" : "Angabe eines Grundes weshalb kein Ergebniss der Laboruntersuchung vorliegt",
        "comment" : "**Begründung Must Support**:\nNicht alle geplanten oder dokumentierten Untersuchungen liefern auch tatsächlich ein Ergebnis. In solchen Fällen ist es wichtig, nicht nur auf das Fehlen eines Wertes zu reagieren, sondern den Grund strukturiert anzugeben. dataAbsentReason ermöglicht diese präzise Aussage und verhindert Fehlinterpretationen",
        "mustSupport" : true
      },
      {
        "id" : "Observation.interpretation",
        "path" : "Observation.interpretation",
        "short" : "Interpretation oder Bewertung des Messergebnisses (z.B. „hoch“, „niedrig“, „normal“)",
        "comment" : "Begründung MS: Unterstützt die klinische Interpretation, insbesondere bei komplexen Parametern und automatisierten Auswertungen.",
        "mustSupport" : true
      },
      {
        "id" : "Observation.note",
        "path" : "Observation.note",
        "short" : "Freitextnotiz oder Kommentar zur Beobachtung (z. B. Hinweise des Labors)",
        "comment" : "**Begründung MS**: Dient zur Dokumentation abweichender Umstände, Freitextbefundung oder ergänzender Laborkommentare.",
        "mustSupport" : true
      },
      {
        "id" : "Observation.method",
        "path" : "Observation.method",
        "comment" : "**Einschränkung der übergreifenden MS-Definition:** \n  Verfügt ein bestätigungsrelevantes System nicht über die Datenstruktur zur Hinterlegung der zugrundeliegenden Methode, so MUSS dieses System\n   die Information NICHT abbilden. \n   \n   Motivation zum eingeschränkten MS: Die Untersuchungsmethode einer Laboruntersuchung ist eine relevante medizinische Information: Unterschiedliche Methoden können unterschiedliche Resultate liefern. Die Methode ist daher für Transparenz und Vergleichbarkeit entscheidend.\n   Da diese Information aktuell häufig nicht übergeben wird, wird das MS eingeschränkt. Es ist dennoch wünschenswert, dass die Probe in der Zukunft übergeben wird.",
        "mustSupport" : true
      },
      {
        "id" : "Observation.specimen",
        "path" : "Observation.specimen",
        "comment" : "**Einschränkung der übergreifenden MS-Definition:** \n  Verfügt ein bestätigungsrelevantes System nicht über die Datenstruktur zur Hinterlegung der Laboruntersuchung zugrundeliegenden Probe, so MUSS dieses System\n   die Information NICHT abbilden. \n   \n   Motivation zum eingeschränkten MS: Die Probe (z. B. Serum, Urin) ist zentral für die korrekte Bewertung des Ergebnisses. Die Unterscheidung von Materialtypen ist oft diagnostisch ausschlaggebend.\n   Da die Information aktuell jedoch häufig nicht übergeben wird, wird das MS eingeschränkt. Es ist dennoch wünschenswert, dass die Probe in der Zukunft übergeben wird",
        "mustSupport" : true
      },
      {
        "id" : "Observation.specimen.reference",
        "path" : "Observation.specimen.reference",
        "mustSupport" : true
      },
      {
        "id" : "Observation.specimen.identifier",
        "path" : "Observation.specimen.identifier",
        "mustSupport" : true
      },
      {
        "id" : "Observation.specimen.identifier.system",
        "path" : "Observation.specimen.identifier.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.specimen.identifier.value",
        "path" : "Observation.specimen.identifier.value",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.device",
        "path" : "Observation.device",
        "short" : "Verwendetes Gerät oder Instrument zur Durchführung der Untersuchung",
        "comment" : "**Begründung Must Support**:\nDas verwendete Mess- oder Analysegerät kann einen entscheidenden Einfluss auf die Genauigkeit, Validität und Vergleichbarkeit von Untersuchungsergebnissen haben.",
        "mustSupport" : true
      },
      {
        "id" : "Observation.referenceRange",
        "path" : "Observation.referenceRange",
        "short" : "Referenzbereich zur Interpretation des Messergebnisses (z. B. Normalwerte)",
        "comment" : "**Begründung MS**: Referenzbereiche erlauben die sofortige klinische Bewertung eines Wertes",
        "mustSupport" : true
      },
      {
        "id" : "Observation.referenceRange.low",
        "path" : "Observation.referenceRange.low",
        "short" : "Untergrenze des Referenzbereichs",
        "mustSupport" : true
      },
      {
        "id" : "Observation.referenceRange.low.value",
        "path" : "Observation.referenceRange.low.value",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.referenceRange.low.unit",
        "path" : "Observation.referenceRange.low.unit",
        "mustSupport" : true
      },
      {
        "id" : "Observation.referenceRange.low.system",
        "path" : "Observation.referenceRange.low.system",
        "min" : 1,
        "patternUri" : "http://unitsofmeasure.org",
        "mustSupport" : true
      },
      {
        "id" : "Observation.referenceRange.low.code",
        "path" : "Observation.referenceRange.low.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.referenceRange.high",
        "path" : "Observation.referenceRange.high",
        "short" : "Obergrenze des Referenzbereichs",
        "mustSupport" : true
      },
      {
        "id" : "Observation.referenceRange.high.value",
        "path" : "Observation.referenceRange.high.value",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.referenceRange.high.unit",
        "path" : "Observation.referenceRange.high.unit",
        "mustSupport" : true
      },
      {
        "id" : "Observation.referenceRange.high.system",
        "path" : "Observation.referenceRange.high.system",
        "min" : 1,
        "patternUri" : "http://unitsofmeasure.org",
        "mustSupport" : true
      },
      {
        "id" : "Observation.referenceRange.high.code",
        "path" : "Observation.referenceRange.high.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.referenceRange.type",
        "path" : "Observation.referenceRange.type",
        "short" : "Art des Referenzbereichs (z. B. normal, kritisch)",
        "mustSupport" : true
      },
      {
        "id" : "Observation.referenceRange.type.coding",
        "path" : "Observation.referenceRange.type.coding",
        "mustSupport" : true
      },
      {
        "id" : "Observation.referenceRange.type.coding.system",
        "path" : "Observation.referenceRange.type.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.referenceRange.type.coding.code",
        "path" : "Observation.referenceRange.type.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.referenceRange.type.coding.display",
        "path" : "Observation.referenceRange.type.coding.display",
        "mustSupport" : true
      },
      {
        "id" : "Observation.referenceRange.type.text",
        "path" : "Observation.referenceRange.type.text",
        "mustSupport" : true
      },
      {
        "id" : "Observation.referenceRange.appliesTo",
        "path" : "Observation.referenceRange.appliesTo",
        "short" : "Für wen der Referenzbereich gilt (z. B. Geschlecht, Alter)",
        "mustSupport" : true
      },
      {
        "id" : "Observation.referenceRange.appliesTo.coding",
        "path" : "Observation.referenceRange.appliesTo.coding",
        "short" : "Kodierte Angabe zur Zielgruppe",
        "mustSupport" : true
      },
      {
        "id" : "Observation.referenceRange.appliesTo.coding.system",
        "path" : "Observation.referenceRange.appliesTo.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.referenceRange.appliesTo.coding.code",
        "path" : "Observation.referenceRange.appliesTo.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.referenceRange.appliesTo.coding.display",
        "path" : "Observation.referenceRange.appliesTo.coding.display",
        "mustSupport" : true
      },
      {
        "id" : "Observation.referenceRange.appliesTo.text",
        "path" : "Observation.referenceRange.appliesTo.text",
        "mustSupport" : true
      },
      {
        "id" : "Observation.referenceRange.age",
        "path" : "Observation.referenceRange.age",
        "short" : "Altersbereich, für den der Referenzbereich gilt",
        "mustSupport" : true
      },
      {
        "id" : "Observation.referenceRange.age.low",
        "path" : "Observation.referenceRange.age.low",
        "mustSupport" : true
      },
      {
        "id" : "Observation.referenceRange.age.high",
        "path" : "Observation.referenceRange.age.high",
        "mustSupport" : true
      },
      {
        "id" : "Observation.referenceRange.text",
        "path" : "Observation.referenceRange.text",
        "short" : "Freitextbeschreibung des Referenzbereichs",
        "mustSupport" : true
      }
    ]
  }
}

```
