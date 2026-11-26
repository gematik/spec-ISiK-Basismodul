# VS MII ICU Code Monitoring und Vitaldaten [ISO11073] - ISiK ICU v6.0.0

ISiK ICU

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **VS MII ICU Code Monitoring und Vitaldaten [ISO11073]**

## ValueSet: VS MII ICU Code Monitoring und Vitaldaten [ISO11073] 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/vs-mii-icu-code-monitoring-und-vitaldaten-iso11073 | *Version*:6.0.0 |
| Active as of 2026-07-01 | *Computable Name*:VS_MII_ICU_Code_Monitoring_und_Vitaldaten_ISO11073 |

 
Dieses ValueSet enthält Codes für Vitaldaten sowie Daten aus dem Patientenmonitoring. 

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
  "id" : "vs-mii-icu-code-monitoring-und-vitaldaten-iso11073",
  "url" : "https://gematik.de/fhir/isik/ValueSet/vs-mii-icu-code-monitoring-und-vitaldaten-iso11073",
  "version" : "6.0.0",
  "name" : "VS_MII_ICU_Code_Monitoring_und_Vitaldaten_ISO11073",
  "title" : "VS MII ICU Code Monitoring und Vitaldaten [ISO11073]",
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
  "description" : "Dieses ValueSet enthält Codes für Vitaldaten sowie Daten aus dem Patientenmonitoring.",
  "compose" : {
    "include" : [{
      "system" : "urn:iso:std:iso:11073:10101",
      "concept" : [{
        "code" : "150017",
        "display" : "Systolic blood pressure"
      },
      {
        "code" : "150019",
        "display" : "Mean blood pressure"
      },
      {
        "code" : "150018",
        "display" : "Diastolic blood pressure"
      },
      {
        "code" : "150084",
        "display" : "Central venous pressure"
      },
      {
        "code" : "150045",
        "display" : "Systolic pulmonary arterial pressure"
      },
      {
        "code" : "150047",
        "display" : "Mean pulmonary arterial pressure"
      },
      {
        "code" : "150046",
        "display" : "Diastolic pulmonary arterial pressure"
      },
      {
        "code" : "150052",
        "display" : "Pulmonary artery wedge pressure"
      },
      {
        "code" : "150276",
        "display" : "Cardiac output"
      },
      {
        "code" : "149772",
        "display" : "Cardiac index"
      },
      {
        "code" : "149760",
        "display" : "Systemic vascular resistance indexed"
      },
      {
        "code" : "152852",
        "display" : "Pulmonary Vascular Resistance Index"
      },
      {
        "code" : "150428",
        "display" : "Ventricular stroke"
      },
      {
        "code" : "149764",
        "display" : "Left Ventricular Stroke Work Index"
      },
      {
        "code" : "150368",
        "display" : "MDC_TEMP_CORE"
      },
      {
        "code" : "150456",
        "display" : "Oxygen saturation in Arterial blood by Pulse oximetry"
      },
      {
        "code" : "160300",
        "display" : "Postductal SpO2"
      },
      {
        "code" : "160296",
        "display" : "Preductal SpO2"
      },
      {
        "code" : "153608",
        "display" : "Intracranial pressure"
      },
      {
        "code" : "150103",
        "display" : "Mean left ventricular pressure"
      },
      {
        "code" : "150107",
        "display" : "Mean right ventricular pressure"
      },
      {
        "code" : "150101",
        "display" : "Systolic left ventricular pressure"
      },
      {
        "code" : "150105",
        "display" : "Systolic right ventricular pressure"
      },
      {
        "code" : "150102",
        "display" : "Diastolic left ventricular pressure"
      },
      {
        "code" : "150106",
        "display" : "Diastolic right ventricular pressure"
      },
      {
        "code" : "150069",
        "display" : "Systolic right atrial pressure"
      },
      {
        "code" : "150065",
        "display" : "Systolic left atrial pressure"
      },
      {
        "code" : "150067",
        "display" : "Mean left atrial pressure"
      },
      {
        "code" : "150071",
        "display" : "Mean right atrial pressure"
      },
      {
        "code" : "150066",
        "display" : "Diastolic left atrial pressure"
      },
      {
        "code" : "150070",
        "display" : "Diastolic right atrial pressure"
      },
      {
        "code" : "188420",
        "display" : "Rectal temperature"
      },
      {
        "code" : "188496",
        "display" : "Axillary temperature"
      },
      {
        "code" : "188424",
        "display" : "Oral temperature"
      },
      {
        "code" : "188436",
        "display" : "Blood temperature"
      },
      {
        "code" : "188500",
        "display" : "Myocardial temperature"
      },
      {
        "code" : "147842",
        "display" : "Heart Rate"
      },
      {
        "code" : "188504",
        "display" : "Nasal temperature"
      },
      {
        "code" : "149514",
        "display" : "Pulse rate"
      },
      {
        "code" : "150372",
        "display" : "Esophageal temperature"
      },
      {
        "code" : "150380",
        "display" : "Nasopharynx temperature"
      },
      {
        "code" : "188452",
        "display" : "Axillary (armpit) temperature"
      },
      {
        "code" : "150324",
        "display" : "Arterial oxygen saturation"
      },
      {
        "code" : "188796",
        "display" : "Ideal body weight (IBW)"
      },
      {
        "code" : "150392",
        "display" : "Tympanic temperature"
      },
      {
        "code" : "150356",
        "display" : "Airway temperature"
      },
      {
        "code" : "150408",
        "display" : "MDC_VOL_BLD_VENT_LEFT_STROKE"
      },
      {
        "code" : "150636",
        "display" : "MDC_VOL_BLD_STROKE_INDEX"
      }]
    }]
  }
}

```
