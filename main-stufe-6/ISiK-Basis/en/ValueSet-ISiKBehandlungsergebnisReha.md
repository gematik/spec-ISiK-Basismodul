# ISiKBehandlungsergebnisRehaVS - ISiK Basis Implementierungsleitfaden v6.0.0

ISiK Basis Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiKBehandlungsergebnisRehaVS**

## ValueSet: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ISiKBehandlungsergebnisReha | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKBehandlungsergebnisRehaVS |

 
Behandlungsergebnis Reha gemäß §301(4 UND 4A) SGB V. Diagnosenbezogene Bewertung des Behandlungsergebnisses für einen Versicherten/Berechtigten bei Entlassung aus der Reha-Maßnahme bzw. Stellung eines Antrags auf Verlängerung. Vgl. Schlüsseltabelle 2.71 Diagnose - Behandlungsergebnis. 

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
  "id" : "ISiKBehandlungsergebnisReha",
  "language" : "de-DE",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ISiKBehandlungsergebnisReha",
  "version" : "6.0.0",
  "name" : "ISiKBehandlungsergebnisRehaVS",
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
  "description" : "Behandlungsergebnis Reha gemäß §301(4 UND 4A) SGB V. Diagnosenbezogene Bewertung des Behandlungsergebnisses für einen Versicherten/Berechtigten bei Entlassung aus der Reha-Maßnahme bzw. Stellung eines Antrags auf Verlängerung. Vgl. Schlüsseltabelle 2.71 Diagnose - Behandlungsergebnis.",
  "compose" : {
    "include" : [{
      "system" : "https://gematik.de/fhir/isik/CodeSystem/ISiKBehandlungsergebnisRehaCS"
    }]
  }
}

```
