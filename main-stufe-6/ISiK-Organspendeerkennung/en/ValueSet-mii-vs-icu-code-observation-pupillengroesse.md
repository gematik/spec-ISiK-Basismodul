# MII VS ICU Code Observation Pupillengroesse - ISiK Organspendeerkennung v6.0.0

ISiK Organspendeerkennung

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **MII VS ICU Code Observation Pupillengroesse**

## ValueSet: MII VS ICU Code Observation Pupillengroesse 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-code-observation-pupillengroesse | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:MII_VS_ICU_Code_Observation_Pupillengroesse |

 
Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets/ - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 16.03.2026 

 **References** 

* [MII PR ICU Untersuchung Pupillengroesse](StructureDefinition-mii-pr-icu-untersuchung-pupillengroesse.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "mii-vs-icu-code-observation-pupillengroesse",
  "url" : "https://gematik.de/fhir/isik/ValueSet/mii-vs-icu-code-observation-pupillengroesse",
  "version" : "6.0.0",
  "name" : "MII_VS_ICU_Code_Observation_Pupillengroesse",
  "title" : "MII VS ICU Code Observation Pupillengroesse",
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
  "description" : "Die Datenstruktur wurde dem laufenden Stand der Entwicklung des MII ICU Module entnommen - https://github.com/medizininformatik-initiative/kerndatensatzmodul-intensivmedizin/blob/master/input/fsh/valuesets/ - Details zur Kompatibilität mit dem ISiK Package der Stufe 6 wurden angepasst und Metadaten des Ursprungsschemas zum Teil entfernt. Stand 16.03.2026",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "420335002",
        "display" : "Medium size pupil"
      },
      {
        "code" : "301939004",
        "display" : "Constricted pupil"
      },
      {
        "code" : "188557000",
        "display" : "Large pupil"
      }]
    }]
  }
}

```
