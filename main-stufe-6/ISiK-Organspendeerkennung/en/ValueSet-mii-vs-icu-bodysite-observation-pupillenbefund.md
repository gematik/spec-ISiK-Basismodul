# MII VS ICU BodySite Observation Pupillenbefund - ISiK Organspendeerkennung v6.0.0

ISiK Organspendeerkennung

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **MII VS ICU BodySite Observation Pupillenbefund**

## ValueSet: MII VS ICU BodySite Observation Pupillenbefund 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-bodysite-observation-pupillenbefund | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:MII_VS_ICU_BodySite_Observation_Pupillenbefund |

 
Zulaessige Koerperstellen fuer lateralisierte Pupillenbefunde: linke oder rechte Pupille. 
Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets/MII_VS_ICU_BodySite_Observation_Pupillenbefund.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 04.03.2026 

 **References** 

* [MII PR ICU Untersuchung Pupillenform](StructureDefinition-mii-pr-icu-untersuchung-pupillenform.md)
* [MII PR ICU Untersuchung Pupillengroesse](StructureDefinition-mii-pr-icu-untersuchung-pupillengroesse.md)
* [MII PR ICU Untersuchung Pupillenlichtreaktion Direkt](StructureDefinition-mii-pr-icu-untersuchung-pupillenlichtreaktion-direkt.md)
* [MII PR ICU Untersuchung Pupillenlichtreaktion Indirekt](StructureDefinition-mii-pr-icu-untersuchung-pupillenlichtreaktion-indirekt.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "mii-vs-icu-bodysite-observation-pupillenbefund",
  "url" : "https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-bodysite-observation-pupillenbefund",
  "version" : "6.0.0",
  "name" : "MII_VS_ICU_BodySite_Observation_Pupillenbefund",
  "title" : "MII VS ICU BodySite Observation Pupillenbefund",
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
  "description" : " Zulaessige Koerperstellen fuer lateralisierte Pupillenbefunde: linke oder rechte Pupille.\n\nDie Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets/MII_VS_ICU_BodySite_Observation_Pupillenbefund.fsh - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 04.03.2026",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "16089004",
        "display" : "Structure of pupil of left eye"
      },
      {
        "code" : "52378001",
        "display" : "Structure of pupil of right eye"
      }]
    }]
  }
}

```
