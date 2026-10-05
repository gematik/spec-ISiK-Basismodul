# ISiKImplantatHerzschrittmacher - ISiK Basis Implementierungsleitfaden v6.0.0

ISiK Basis Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ISiKImplantatHerzschrittmacher**

## Device: ISiKImplantatHerzschrittmacher

Profile: [ISiKImplantat](StructureDefinition-ISiKImplantat.md)

### UdiCarriers

| | | |
| :--- | :--- | :--- |
| - | **DeviceIdentifier** | **CarrierHRF** |
| * | 00380740006918 | (01)00380740006918(11)230615(21)SN-2024-00471 |

**status**: Active

**manufacturer**: Medtronic GmbH

**manufactureDate**: 2023-06-15

**serialNumber**: SN-2024-00471

### DeviceNames

| | | |
| :--- | :--- | :--- |
| - | **Name** | **Type** |
| * | Evoque DR | Manufacturer name |

**modelNumber**: EV-DR-01

**type**: Herzschrittmacher

**patient**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)



## Resource Content

```json
{
  "resourceType" : "Device",
  "id" : "ISiKImplantatHerzschrittmacher",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKImplantat"]
  },
  "udiCarrier" : [{
    "deviceIdentifier" : "00380740006918",
    "carrierHRF" : "(01)00380740006918(11)230615(21)SN-2024-00471"
  }],
  "status" : "active",
  "manufacturer" : "Medtronic GmbH",
  "manufactureDate" : "2023-06-15",
  "serialNumber" : "SN-2024-00471",
  "deviceName" : [{
    "name" : "Evoque DR",
    "type" : "manufacturer-name"
  }],
  "modelNumber" : "EV-DR-01",
  "type" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "14106009",
      "display" : "Herzschrittmacher"
    }]
  },
  "patient" : {
    "reference" : "Patient/PatientinMusterfrau"
  }
}

```
