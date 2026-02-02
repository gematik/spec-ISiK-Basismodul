# Resource Appendektomie



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Appendektomie",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKProzedur"
    ]
  },
  "extension" : [
    {
      "url" : "http://fhir.de/StructureDefinition/ProzedurDokumentationsdatum",
      "valueDateTime" : "2020-04-23"
    }
  ],
  "status" : "completed",
  "category" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "387713003",
        "display" : "Surgical procedure (procedure)"
      }
    ]
  },
  "code" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "80146002",
        "display" : "Excision of appendix (procedure)"
      },
      {
        "system" : "http://fhir.de/CodeSystem/bfarm/ops",
        "version" : "2020",
        "code" : "5-470",
        "display" : "Appendektomie"
      },
      {
        "version" : "2024"
      }
    ],
    "text" : "Entfernung des Blinddarms"
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "performedDateTime" : "2020-04-23",
  "note" : [
    {
      "text" : "Testnotiz"
    }
  ]
}

```
