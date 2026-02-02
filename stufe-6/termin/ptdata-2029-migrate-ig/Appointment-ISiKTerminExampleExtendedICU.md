# Example Appointment - ISiKTerminExampleExtendedICU - ISiK Terminplanung Implementierungsleitfaden v6.0.0-rc

ISiK Terminplanung Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Appointment - ISiKTerminExampleExtendedICU**

## Example Appointment: Example Appointment - ISiKTerminExampleExtendedICU

Profile: [ISiKTermin](StructureDefinition-ISiKTermin.md)

Tag: External (Details: CS Basisprofil Common Meta Tag DE code external = 'External')

**status**: Proposed

**serviceType**: Intensive Care Medicine

**specialty**: Intensivmedizin

**priority**: `ISiKTerminPriorityExtension: `Emergency

**start**: 2022-12-10 09:00:00+0000

**end**: 2022-12-10 09:30:00+0000

**slot**: [Slot: status = busy; start = 2022-12-10 09:00:00+0000; end = 2022-12-10 11:00:00+0000](Slot-ISiKTerminblockExample.md)

### Participants

| | | |
| :--- | :--- | :--- |
| - | **Actor** | **Status** |
| * | [Test Patient](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Patient/ISiKPatientTest) | Accepted |



## Resource Content

```json
{
  "resourceType" : "Appointment",
  "id" : "ISiKTerminExampleExtendedICU",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKTermin"
    ],
    "tag" : [
      {
        "system" : "http://fhir.de/CodeSystem/common-meta-tag-de",
        "code" : "external"
      }
    ]
  },
  "status" : "proposed",
  "serviceType" : [
    {
      "coding" : [
        {
          "system" : "http://terminology.hl7.org/CodeSystem/service-type",
          "code" : "174"
        }
      ]
    }
  ],
  "specialty" : [
    {
      "coding" : [
        {
          "system" : "http://ihe-d.de/CodeSystems/AerztlicheFachrichtungen",
          "code" : "INTM"
        },
        {
          "system" : "http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel-erweitert",
          "code" : "3600"
        }
      ]
    }
  ],
  "_priority" : {
    "extension" : [
      {
        "url" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKTerminPriorityExtension",
        "valueCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://snomed.info/sct",
              "code" : "25876001"
            }
          ]
        }
      }
    ]
  },
  "start" : "2022-12-10T09:00:00Z",
  "end" : "2022-12-10T09:30:00Z",
  "slot" : [
    {
      "reference" : "Slot/ISiKTerminblockExample"
    }
  ],
  "participant" : [
    {
      "actor" : {
        "reference" : "Patient/ISiKPatientTest",
        "display" : "Test Patient"
      },
      "status" : "accepted"
    }
  ]
}

```
