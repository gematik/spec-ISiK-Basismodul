# SZ1Patient - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SZ1Patient**

## Patient: SZ1Patient

Profile: [ISiKPatient](StructureDefinition-ISiKPatient.md)

Töchterchen Musterfrau (official) Female, DoB: 2010-01-01 ( Medical record number)

-------

| | |
| :--- | :--- |
| Active: | true |
| Other Id: | Krankenversichertennummer/A123456789 |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "SZ1Patient",
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
      "value" : "12345"
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
  "active" : true,
  "name" : [
    {
      "use" : "official",
      "family" : "Musterfrau",
      "given" : ["Töchterchen"]
    }
  ],
  "gender" : "female",
  "birthDate" : "2010-01-01"
}

```
