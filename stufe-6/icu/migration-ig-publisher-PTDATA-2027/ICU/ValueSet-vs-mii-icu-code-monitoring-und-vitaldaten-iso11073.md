# VS MII ICU Code Monitoring und Vitaldaten [ISO11073] - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **VS MII ICU Code Monitoring und Vitaldaten [ISO11073]**

## ValueSet: VS MII ICU Code Monitoring und Vitaldaten [ISO11073] 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/isik/ValueSet/vs-mii-icu-code-monitoring-und-vitaldaten-iso11073 | *Version*:6.0.0-rc |
| Active as of 2025-12-17 | *Computable Name*:VS_MII_ICU_Code_Monitoring_und_Vitaldaten_ISO11073 |

 
Dieses ValueSet enthält Codes für Vitaldaten sowie Daten aus dem Patientenmonitoring. 

 **References** 

* [SD MII ICU Monitoring und Vitaldaten](StructureDefinition-sd-mii-icu-monitoring-und-vitaldaten.md)

### Logical Definition (CLD)

 

### Expansion

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "vs-mii-icu-code-monitoring-und-vitaldaten-iso11073",
  "url" : "https://gematik.de/fhir/isik/ValueSet/vs-mii-icu-code-monitoring-und-vitaldaten-iso11073",
  "version" : "6.0.0-rc",
  "name" : "VS_MII_ICU_Code_Monitoring_und_Vitaldaten_ISO11073",
  "title" : "VS MII ICU Code Monitoring und Vitaldaten [ISO11073]",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-17",
  "description" : "Dieses ValueSet enthält Codes für Vitaldaten sowie Daten aus dem Patientenmonitoring.",
  "compose" : {
    "include" : [
      {
        "system" : "urn:iso:std:iso:11073:10101",
        "concept" : [
          {
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
            "display" : "Body temperature - Core"
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
          }
        ]
      }
    ]
  }
}

```
