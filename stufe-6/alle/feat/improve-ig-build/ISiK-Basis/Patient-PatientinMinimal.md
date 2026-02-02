# Example Patient - PatientinMinimal - ISiK Basis Implementierungsleitfaden v6.0.0-rc

ISiK Basis Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Patient - PatientinMinimal**

## Example Patient: Example Patient - PatientinMinimal

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
