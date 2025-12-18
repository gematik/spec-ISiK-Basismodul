#  - Organspendeerkennung v0.0.1

Organspendeerkennung

Version 0.0.1 - STU1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Patient: 

Profile: [ISiKPatient](StructureDefinition-ISiKPatient.md)

Friedlinde Musterfrau (official) Female, DoB: 1924-01-01 ( Medical record number)

-------

| | |
| :--- | :--- |
| Active: | true |
| Other Id: | Krankenversichertennummer/A222222222 |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "SZ2Patient",
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
      "system" : "http://beispiel-krankenhaus.de/sid/Patienten",
      "value" : "222222"
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
      "value" : "A222222222"
    }
  ],
  "active" : true,
  "name" : [
    {
      "use" : "official",
      "family" : "Musterfrau",
      "given" : ["Friedlinde"]
    }
  ],
  "gender" : "female",
  "birthDate" : "1924-01-01"
}

```
