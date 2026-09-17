# ISiKBesondereBehandlungsformReha - ISiK Terminplanung Implementierungsleitfaden v6.0.0

ISiK Terminplanung Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKBesondereBehandlungsformReha**

## CodeSystem: ISiKBesondereBehandlungsformReha 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/CodeSystem/ISiKBesondereBehandlungsformRehaCS | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKBesondereBehandlungsformReha |

 
Besondere Behandlungsform der Reha gemäß §301(4 UND 4A) SGB V. Vgl. Schlüsseltabelle 2.51 Besondere Behandlungsformen. 

This Code system is referenced in the definition of the following value sets:

* [ISiKBesondereBehandlungsformRehaVS](ValueSet-ISiKBesondereBehandlungsformReha.md)

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "ISiKBesondereBehandlungsformRehaCS",
  "language" : "de-DE",
  "url" : "https://gematik.de/fhir/isik/CodeSystem/ISiKBesondereBehandlungsformRehaCS",
  "version" : "6.0.0",
  "name" : "ISiKBesondereBehandlungsformReha",
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
  "description" : "Besondere Behandlungsform der Reha gemäß §301(4 UND 4A) SGB V. Vgl. Schlüsseltabelle 2.51 Besondere Behandlungsformen.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 5,
  "concept" : [{
    "code" : "0",
    "display" : "keine"
  },
  {
    "code" : "1",
    "display" : "MBOR",
    "definition" : "Medizinisch beruflich orientierte Rehabilitation"
  },
  {
    "code" : "2",
    "display" : "VMO (vor dem Jahr 2021) / Kombination MBOR/VMO (ab dem Jahr 2021)",
    "definition" : "Verhaltensmedizinische Orthopädie"
  },
  {
    "code" : "3",
    "display" : "VOR",
    "definition" : "Verhaltensmedizinisch orientierte Rehabilitation"
  },
  {
    "code" : "9",
    "display" : "sonstige"
  }]
}

```
