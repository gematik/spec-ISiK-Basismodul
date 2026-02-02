#  - ISiK Organspendeerkennung v0.0.1-rc

ISiK Organspendeerkennung

Version 0.0.1-rc - STU1 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* ****

## Patient: 

Profile: [ISiKPatient](StructureDefinition-ISiKPatient.md)

Anna Müller (official) Female, DoB: 1957-08-12 ( Medical record number)

-------

| | |
| :--- | :--- |
| Active: | true |
| Other Id: | Krankenversichertennummer/A123456789 |
| Alt. Name: | Weber (Name changed for Marriage) |
| Contact Detail | * Musterweg 2 Demmin 17109 DE 
* Postfach 815 Musterhausen 98764 DE 
 |
| Links: | * Also see: [Anna Müller (official) Female, DoB: 1957-08-12 ( Medical record number)](Patient-PatientinMinimal.md)
 |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "PatientinNormal",
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
      "value" : "TestPID1"
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
      "family" : "Müller",
      "given" : ["Anna"],
      "prefix" : ["Dr."]
    },
    {
      "use" : "maiden",
      "family" : "Weber"
    }
  ],
  "gender" : "female",
  "birthDate" : "1957-08-12",
  "address" : [
    {
      "type" : "both",
      "line" : ["Musterweg 2"],
      "city" : "Demmin",
      "postalCode" : "17109",
      "country" : "DE"
    },
    {
      "type" : "postal",
      "line" : ["Postfach 815"],
      "city" : "Musterhausen",
      "postalCode" : "98764",
      "country" : "DE"
    }
  ],
  "link" : [
    {
      "other" : {
        "reference" : "Patient/PatientinMinimal"
      },
      "type" : "seealso"
    }
  ]
}

```
