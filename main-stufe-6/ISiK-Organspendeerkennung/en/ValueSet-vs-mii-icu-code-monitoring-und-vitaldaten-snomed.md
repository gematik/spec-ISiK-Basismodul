# VS MII ICU Code Monitoring und Vitaldaten [sct] - ISiK Organspendeerkennung v6.0.0

ISiK Organspendeerkennung

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **VS MII ICU Code Monitoring und Vitaldaten [sct]**

## ValueSet: VS MII ICU Code Monitoring und Vitaldaten [sct] 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/vs-mii-icu-code-monitoring-und-vitaldaten-snomed | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:VS_MII_ICU_Code_Monitoring_und_Vitaldaten_SNOMED |

 
Dieses ValueSet enthaelt Codes fuer Vitaldaten sowie Daten aus dem Patientenmonitoring. 

 **References** 

* [SD MII ICU Monitoring und Vitaldaten](StructureDefinition-sd-mii-icu-monitoring-und-vitaldaten.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "vs-mii-icu-code-monitoring-und-vitaldaten-snomed",
  "url" : "https://gematik.de/fhir/isik/ValueSet/vs-mii-icu-code-monitoring-und-vitaldaten-snomed",
  "version" : "6.0.0",
  "name" : "VS_MII_ICU_Code_Monitoring_und_Vitaldaten_SNOMED",
  "title" : "VS MII ICU Code Monitoring und Vitaldaten [sct]",
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
  "description" : "Dieses ValueSet enthaelt Codes fuer Vitaldaten sowie Daten aus dem Patientenmonitoring.",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "364075005",
        "display" : "Herzfrequenz"
      },
      {
        "code" : "75367002",
        "display" : "Blood pressure"
      },
      {
        "code" : "271649006",
        "display" : "Systolic blood pressure"
      },
      {
        "code" : "6797001",
        "display" : "Mean blood pressure"
      },
      {
        "code" : "271650006",
        "display" : "Diastolic blood pressure"
      },
      {
        "code" : "71420008",
        "display" : "Central venous pressure"
      },
      {
        "code" : "118433006",
        "display" : "Pulmonary artery wedge pressure"
      },
      {
        "code" : "82799009",
        "display" : "Cardiac output"
      },
      {
        "code" : "54993008",
        "display" : "Cardiac index"
      },
      {
        "code" : "276900001",
        "display" : "Systemic vascular resistance index"
      },
      {
        "code" : "276902009",
        "display" : "Pulmonary vascular resistance index"
      },
      {
        "code" : "90096001",
        "display" : "Stroke volume"
      },
      {
        "code" : "277381004",
        "display" : "Stroke index"
      },
      {
        "code" : "276885007",
        "display" : "Körperkerntemperatur"
      },
      {
        "code" : "250844005",
        "display" : "Intracranial pressure"
      },
      {
        "code" : "27113001",
        "display" : "Körpergewicht"
      },
      {
        "code" : "170804003",
        "display" : "Ideal body weight"
      },
      {
        "code" : "1153637007",
        "display" : "Körpergröße"
      },
      {
        "code" : "1153605006",
        "display" : "Body height for age percentile"
      },
      {
        "code" : "1153592008",
        "display" : "Weight for age percentile"
      },
      {
        "code" : "415974002",
        "display" : "Körperkerntemperatur gemessen am Trommelfell"
      },
      {
        "code" : "307047009",
        "display" : "Rektaltemperatur"
      },
      {
        "code" : "431598003",
        "display" : "Körperkerntemperatur gemessen im Ösophagus"
      },
      {
        "code" : "698831002",
        "display" : "Körperkerntemperatur gemessen im Nasopharynx"
      },
      {
        "code" : "698832009",
        "display" : "Körperkerntemperatur gemessen an der Harnblase"
      },
      {
        "code" : "364246006",
        "display" : "Vaginaltemperatur"
      },
      {
        "code" : "415882003",
        "display" : "Axillary temperature"
      },
      {
        "code" : "415945006",
        "display" : "Orale Temperatur"
      },
      {
        "code" : "415929009",
        "display" : "Groin temperature"
      },
      {
        "code" : "1222808002",
        "display" : "Körperkerntemperatur im Blut gemessen"
      },
      {
        "code" : "248835004",
        "display" : "Breast temperature"
      },
      {
        "code" : "364419004",
        "display" : "Cervical spine temperature"
      },
      {
        "code" : "415922000",
        "display" : "Stirntemperatur"
      },
      {
        "code" : "250124002",
        "display" : "Joint temperature"
      },
      {
        "code" : "364429006",
        "display" : "Temperature of lumbar spine"
      },
      {
        "code" : "364424001",
        "display" : "Thoracic spine temperature"
      },
      {
        "code" : "8499008",
        "display" : "Pulse"
      },
      {
        "code" : "442476006",
        "display" : "Arterial oxygen saturation"
      },
      {
        "code" : "364090009",
        "display" : "Systemic arterial pressure"
      },
      {
        "code" : "250846007",
        "display" : "Cerebral perfusion pressure"
      }]
    }]
  }
}

```
