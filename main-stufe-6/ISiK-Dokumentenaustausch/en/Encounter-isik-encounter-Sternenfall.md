# isik-encounter-Sternenfall - ISiK Dokumentenaustausch Implementierungsleitfaden v6.0.0

ISiK Dokumentenaustausch Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **isik-encounter-Sternenfall**

## Encounter: isik-encounter-Sternenfall

Profile: [ISiKKontaktGesundheitseinrichtung](StructureDefinition-ISiKKontaktGesundheitseinrichtung.md)

**identifier**: Visit number/Sternenfall-20200310-001

**status**: In Progress

**class**: [ActCode: IMP](http://terminology.hl7.org/7.3.0/CodeSystem-v3-ActCode.html#v3-ActCode-IMP) (Inpatient)

**type**: Abteilungskontakt

**subject**: [Aelin Sternenfall (official) Unknown, DoB: ( Medical record number)](Patient-isik-patient-156722.md)

**period**: 2020-03-10 20:17:06+0100 --> (ongoing)

**account**: Identifier: `https://test.krankenhaus.de/fhir/sid/fallnummer`/174357

### Locations

| | | |
| :--- | :--- | :--- |
| - | **Location** | **PhysicalType** |
| * | [Location/isik-station-anaesthesie](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&canonical=http://fhir.org/packages/de.basisprofil.r4/Location/isik-station-anaesthesie) | Ward |



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "isik-encounter-Sternenfall",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung"]
  },
  "identifier" : [{
    "type" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code" : "VN"
      }]
    },
    "system" : "https://test.krankenhaus.de/fhir/sid/aufnahmenummer",
    "value" : "Sternenfall-20200310-001"
  }],
  "status" : "in-progress",
  "class" : {
    "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
    "code" : "IMP",
    "display" : "Inpatient"
  },
  "type" : [{
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/Kontaktebene",
      "code" : "abteilungskontakt"
    }]
  }],
  "subject" : {
    "reference" : "Patient/isik-patient-156722"
  },
  "period" : {
    "start" : "2020-03-10T20:17:06+01:00"
  },
  "account" : [{
    "identifier" : {
      "system" : "https://test.krankenhaus.de/fhir/sid/fallnummer",
      "value" : "174357"
    }
  }],
  "location" : [{
    "location" : {
      "reference" : "Location/isik-station-anaesthesie"
    },
    "physicalType" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/location-physical-type",
        "code" : "wa",
        "display" : "Ward"
      }]
    }
  }]
}

```
