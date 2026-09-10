# ISiKBesondereBehandlungsformRehaVS - ISiK Dokumentenaustausch Implementierungsleitfaden v6.0.0

ISiK Dokumentenaustausch Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiKBesondereBehandlungsformRehaVS**

## ValueSet: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ISiKBesondereBehandlungsformReha | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKBesondereBehandlungsformRehaVS |

 
Besondere Behandlungsform der Reha gemäß §301(4 UND 4A) SGB V. Vgl. Schlüsseltabelle 2.51 Besondere Behandlungsformen. 

 **References** 

* [ExtensionISiKRehaEntlassung](StructureDefinition-ExtensionISiKRehaEntlassung.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ISiKBesondereBehandlungsformReha",
  "language" : "de-DE",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ISiKBesondereBehandlungsformReha",
  "version" : "6.0.0",
  "name" : "ISiKBesondereBehandlungsformRehaVS",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-07-01",
  "publisher" : "gematik GmbH",
  "contact" : [{
    "name" : "gematik GmbH",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.gematik.de"
    }]
  }],
  "description" : "Besondere Behandlungsform der Reha gemäß §301(4 UND 4A) SGB V. Vgl. Schlüsseltabelle 2.51 Besondere Behandlungsformen.",
  "compose" : {
    "include" : [{
      "system" : "https://gematik.de/fhir/isik/CodeSystem/ISiKBesondereBehandlungsformRehaCS"
    }]
  }
}

```
