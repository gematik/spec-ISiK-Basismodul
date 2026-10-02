# isik-patient-156722 - AMTS ISiK Implementierungsleitfaden v6.0.0

AMTS ISiK Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **isik-patient-156722**

## Patient: isik-patient-156722

Profile: [ISiKPatient](StructureDefinition-ISiKPatient.md)

Aelin Sternenfall (official) Unknown, DoB: ( Medical record number)

-------

| | |
| :--- | :--- |
| Active: | true |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "isik-patient-156722",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient"]
  },
  "identifier" : [{
    "type" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code" : "MR"
      }]
    },
    "system" : "https://example-krankenhaus.de/fhir/sid/pid",
    "value" : "156722"
  }],
  "active" : true,
  "name" : [{
    "use" : "official",
    "family" : "Sternenfall",
    "given" : ["Aelin"]
  }],
  "gender" : "unknown",
  "_birthDate" : {
    "extension" : [{
      "url" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
      "valueCode" : "unknown"
    }]
  }
}

```
