# ISiKBehandlungsergebnisReha - ISiK Medikation Implementierungsleitfaden v6.0.0-rc

ISiK Medikation Implementierungsleitfaden

Version 6.0.0-rc - release-candidate 

* [**Table of Contents**](toc.md)
* [**Artefakte**](artifacts.md)
* **ISiKBehandlungsergebnisReha**

## CodeSystem: ISiKBehandlungsergebnisReha 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/CodeSystem/ISiKBehandlungsergebnisRehaCS | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:ISiKBehandlungsergebnisReha |

 
Behandlungsergebnis Reha gemäß §301(4 UND 4A) SGB V. Diagnosenbezogene Bewertung des Behandlungsergebnisses für einen Versicherten/Berechtigten bei Entlassung aus der Reha-Maßnahme bzw. Stellung eines Antrags auf Verlängerung. Vgl. Schlüsseltabelle 2.71 Diagnose - Behandlungsergebnis. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [ISiKBehandlungsergebnisRehaVS](ValueSet-ISiKBehandlungsergebnisReha.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "ISiKBehandlungsergebnisRehaCS",
  "url" : "https://gematik.de/fhir/isik/CodeSystem/ISiKBehandlungsergebnisRehaCS",
  "version" : "6.0.0-rc",
  "name" : "ISiKBehandlungsergebnisReha",
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
  "description" : "Behandlungsergebnis Reha gemäß §301(4 UND 4A) SGB V. Diagnosenbezogene Bewertung des Behandlungsergebnisses für einen Versicherten/Berechtigten bei Entlassung aus der Reha-Maßnahme bzw. Stellung eines Antrags auf Verlängerung. Vgl. Schlüsseltabelle 2.71 Diagnose - Behandlungsergebnis.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 4,
  "concept" : [
    {
      "code" : "0",
      "display" : "Ziff. 1-3 trifft nicht zu"
    },
    {
      "code" : "1",
      "display" : "gebessert"
    },
    {
      "code" : "2",
      "display" : "unverändert"
    },
    {
      "code" : "3",
      "display" : "verschlechtert"
    }
  ]
}

```
