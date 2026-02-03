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



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "PatientinMinimal",
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
    }
  ],
  "name" : [
    {
      "use" : "official",
      "family" : "Müller",
      "given" : ["Anna"]
    }
  ],
  "gender" : "female",
  "birthDate" : "1957-08-12"
}

```
