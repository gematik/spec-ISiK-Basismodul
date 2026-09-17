# AbrechnungsfallGonarthrose - ISiK Basis Implementierungsleitfaden v6.0.0-rc

ISiK Basis Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **AbrechnungsfallGonarthrose**

## Account: AbrechnungsfallGonarthrose

Profile: [ISiKAbrechnungsfall](StructureDefinition-ISiKAbrechnungsfall.md)

**identifier**: Account number/1234567891

**status**: Active

**type**: inpatient encounter

**subject**: [Anna Müller (official) Female, DoB: 1957-08-12 ( Medical record number)](Patient-PatientinNormal.md)



## Resource Content

```json
{
  "resourceType" : "Account",
  "id" : "AbrechnungsfallGonarthrose",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKAbrechnungsfall"
    ]
  },
  "identifier" : [
    {
      "type" : {
        "coding" : [
          {
            "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
            "code" : "AN"
          }
        ]
      },
      "system" : "https://test.krankenhaus.de/fhir/sid/abrechnungsnummer",
      "value" : "1234567891"
    }
  ],
  "status" : "active",
  "type" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
        "code" : "IMP"
      }
    ]
  },
  "subject" : [
    {
      "reference" : "Patient/PatientinNormal"
    }
  ]
}

```
