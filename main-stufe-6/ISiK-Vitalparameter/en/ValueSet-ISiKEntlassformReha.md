# ISiKEntlassformRehaVS - ISiK Vitalparameter Implementierungsleitfaden v6.0.0

ISiK Vitalparameter Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKEntlassformRehaVS**

## ValueSet: 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ISiKEntlassformReha | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKEntlassformRehaVS |

 
ISiK Entlassform Reha. Beschreibt Form und ggf. Weiterbehandlung der Entlassung eines Versicherten/Berechtigten aus verwaltungs- und medizinischer Sicht. Vgl. Schlüsseltabelle 2.107 Entlassungsform. 

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
  "id" : "ISiKEntlassformReha",
  "language" : "de-DE",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ISiKEntlassformReha",
  "version" : "6.0.0",
  "name" : "ISiKEntlassformRehaVS",
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
  "description" : "ISiK Entlassform Reha. Beschreibt Form und ggf. Weiterbehandlung der Entlassung eines Versicherten/Berechtigten aus verwaltungs- und medizinischer Sicht. Vgl. Schlüsseltabelle 2.107 Entlassungsform.",
  "compose" : {
    "include" : [{
      "system" : "https://gematik.de/fhir/isik/CodeSystem/ISiKEntlassformRehaCS"
    }]
  }
}

```
