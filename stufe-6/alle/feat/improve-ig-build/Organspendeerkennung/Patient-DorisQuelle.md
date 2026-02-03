# DorisQuelle - ISiK Organspendeerkennung v0.0.1-rc

ISiK Organspendeerkennung

Version 0.0.1-rc - STU1 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **DorisQuelle**

## Patient: DorisQuelle

Profile: [ISiKPatient](StructureDefinition-ISiKPatient.md)

Doris Duplikat (official) Female, DoB: 1964-08-12 ( Medical record number)

-------

| | |
| :--- | :--- |
| Active: | false |
| Other Id: | Krankenversichertennummer/A123456789 |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "DorisQuelle",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient"
    ]
  },
  "identifier" : [
    {
      "type" : {
        "coding" : [
          {
            "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
            "code" : "MR"
          }
        ]
      },
      "system" : "https://fhir.krankenhaus.example/sid/PID",
      "value" : "654321"
    },
    {
      "type" : {
        "coding" : [
          {
            "system" : "http://fhir.de/CodeSystem/identifier-type-de-basis",
            "code" : "KVZ10"
          }
        ]
      },
      "system" : "http://fhir.de/sid/gkv/kvid-10",
      "value" : "A123456789"
    }
  ],
  "active" : false,
  "name" : [
    {
      "use" : "official",
      "family" : "Duplikat",
      "given" : ["Doris"]
    }
  ],
  "gender" : "female",
  "birthDate" : "1964-08-12"
}

```
