# ISiKImplantatHueftprothese - ISiK Basis Implementierungsleitfaden v6.0.0

ISiK Basis Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiKImplantatHueftprothese**

## Device: ISiKImplantatHueftprothese

Profile: [ISiKImplantat](StructureDefinition-ISiKImplantat.md)

**status**: Active

**type**: Hüftprothese

**patient**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)



## Resource Content

```json
{
  "resourceType" : "Device",
  "id" : "ISiKImplantatHueftprothese",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKImplantat"]
  },
  "status" : "active",
  "type" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "67270000",
      "display" : "Hüftprothese"
    }]
  },
  "patient" : {
    "reference" : "Patient/PatientinMusterfrau"
  }
}

```
