# ISiKEncounterClassDE - AMTS ISiK Implementierungsleitfaden v6.0.0

AMTS ISiK Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ISiKEncounterClassDE**

## ValueSet: ISiKEncounterClassDE 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/ISiKEncounterClassDE | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:ISiKEncounterClassDE |

 
Erweitert das ValueSet EncounterClassDE der Deutschen Basisprofile um die Codes ACUTE, NONAC und OBSENC aus dem HL7 v3 ActCode System zur Harmonisierung mit dem HL7 Europe Hospital Discharge Report (HDR). Ein Issue zur Aufnahme dieser Codes in EncounterClassDE wurde bei den Deutschen Basisprofilen eingereicht. 

 **References** 

* [ISiKKontaktGesundheitseinrichtung](StructureDefinition-ISiKKontaktGesundheitseinrichtung.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ISiKEncounterClassDE",
  "url" : "https://gematik.de/fhir/isik/ValueSet/ISiKEncounterClassDE",
  "version" : "6.0.0",
  "name" : "ISiKEncounterClassDE",
  "title" : "ISiKEncounterClassDE",
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
  "description" : "Erweitert das ValueSet EncounterClassDE der Deutschen Basisprofile um die Codes ACUTE, NONAC und OBSENC aus dem HL7 v3 ActCode System zur Harmonisierung mit dem HL7 Europe Hospital Discharge Report (HDR). Ein Issue zur Aufnahme dieser Codes in EncounterClassDE wurde bei den Deutschen Basisprofilen eingereicht.",
  "compose" : {
    "include" : [{
      "valueSet" : ["http://fhir.de/ValueSet/EncounterClassDE"]
    },
    {
      "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
      "version" : "11.0.0",
      "concept" : [{
        "code" : "ACUTE",
        "display" : "inpatient acute"
      },
      {
        "code" : "NONAC",
        "display" : "inpatient non-acute"
      },
      {
        "code" : "OBSENC",
        "display" : "observation encounter"
      }]
    }]
  }
}

```
