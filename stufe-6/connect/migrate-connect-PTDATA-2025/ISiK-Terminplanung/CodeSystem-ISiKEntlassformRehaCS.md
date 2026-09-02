# ISiKEntlassformReha - ISiK Terminplanung Implementierungsleitfaden v6.0.0-rc

ISiK Terminplanung Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKEntlassformReha**

## CodeSystem: ISiKEntlassformReha 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/CodeSystem/ISiKEntlassformRehaCS | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKEntlassformReha |

 
ISiK Entlassform Reha. Beschreibt Form und ggf. Weiterbehandlung der Entlassung eines Versicherten/Berechtigten aus verwaltungs- und medizinischer Sicht. Vgl. Schlüsseltabelle 2.107 Entlassungsform. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [ISiKEntlassformRehaVS](ValueSet-ISiKEntlassformReha.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "ISiKEntlassformRehaCS",
  "url" : "https://gematik.de/fhir/isik/CodeSystem/ISiKEntlassformRehaCS",
  "version" : "6.0.0-rc",
  "name" : "ISiKEntlassformReha",
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
  "description" : "ISiK Entlassform Reha. Beschreibt Form und ggf. Weiterbehandlung der Entlassung eines Versicherten/Berechtigten aus verwaltungs- und medizinischer Sicht. Vgl. Schlüsseltabelle 2.107 Entlassungsform.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 17,
  "concept" : [
    {
      "code" : "01",
      "display" : "Behandlung regulär beendet"
    },
    {
      "code" : "02",
      "display" : "Behandlung vorzeitig auf ärztliche Veranlassung beendet"
    },
    {
      "code" : "03",
      "display" : "Behandlung vorzeitig mit ärztlichem Einverständnis beendet"
    },
    {
      "code" : "04",
      "display" : "Behandlung gegen ärztlichen Rat beendet („Vorzeitig ohne ärztliches Einverständnis“)"
    },
    {
      "code" : "05",
      "display" : "Behandlung aus disziplinarischen Gründen beendet"
    },
    {
      "code" : "06",
      "display" : "Verlegung in Krankenhaus, bei DRV auch: Verlegung in andere Reha-Einrichtung"
    },
    {
      "code" : "07",
      "display" : "Wechsel zu ambulanter (Sucht), ganztägig ambulanter, stationärer Reha"
    },
    {
      "code" : "09",
      "display" : "gestorben"
    },
    {
      "code" : "11",
      "display" : "Wechsel von Phase B zu D vorgesehen"
    },
    {
      "code" : "12",
      "display" : "Wechsel von Phase B zu C vorgesehen"
    },
    {
      "code" : "13",
      "display" : "Wechsel von Phase C zu D vorgesehen x"
    },
    {
      "code" : "14",
      "display" : "Zuständigkeitswechsel des Leistungsträgers"
    },
    {
      "code" : "15",
      "display" : "Behandlung aus sonstigen Gründen beendet"
    },
    {
      "code" : "16",
      "display" : "Wechsel von Phase D zu C"
    },
    {
      "code" : "17",
      "display" : "Wechsel von Phase D zu B"
    },
    {
      "code" : "18",
      "display" : "Wechsel von Phase C zu B"
    },
    {
      "code" : "19",
      "display" : "Entlassung vor Wiederaufnahme (für CIFolgetherapie)"
    }
  ]
}

```
