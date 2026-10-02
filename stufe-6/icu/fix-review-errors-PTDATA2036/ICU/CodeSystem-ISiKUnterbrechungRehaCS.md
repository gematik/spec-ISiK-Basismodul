# ISiKUnterbrechungReha - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKUnterbrechungReha**

## CodeSystem: ISiKUnterbrechungReha 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/CodeSystem/ISiKUnterbrechungRehaCS | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKUnterbrechungReha |

 
ISiK Unterbrechung Reha. Dokumentiert die relevanten Gründe einer Unterbrechung einer Rehabilitationsmaßnahme im Einzelfall. Vgl. Schlüsseltabelle 2.111 Erläuterung zur Unterbrechung. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [ISiKUnterbrechungRehaVS](ValueSet-ISiKUnterbrechungReha.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "ISiKUnterbrechungRehaCS",
  "url" : "https://gematik.de/fhir/isik/CodeSystem/ISiKUnterbrechungRehaCS",
  "version" : "6.0.0-rc",
  "name" : "ISiKUnterbrechungReha",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "description" : "ISiK Unterbrechung Reha. Dokumentiert die relevanten Gründe einer Unterbrechung einer Rehabilitationsmaßnahme im Einzelfall. Vgl. Schlüsseltabelle 2.111 Erläuterung zur Unterbrechung.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 7,
  "concept" : [
    {
      "code" : "01",
      "display" : "Interkurrente Erkrankung"
    },
    {
      "code" : "02",
      "display" : "Stationäre Krankenhausbehandlung (nicht interkurrente Erkrankung)"
    },
    {
      "code" : "03",
      "display" : "Beurlaubung"
    },
    {
      "code" : "04",
      "display" : "Stationäre Krankenhausbehandlung"
    },
    {
      "code" : "05",
      "display" : "Erkrankung (ohne Krankenhausbehandlung)"
    },
    {
      "code" : "06",
      "display" : "Belastungserprobung im häuslichen Umfeld"
    },
    {
      "code" : "09",
      "display" : "Sonstiger Grund, der zur Unterbrechung der Pflegekosten führt"
    }
  ]
}

```
