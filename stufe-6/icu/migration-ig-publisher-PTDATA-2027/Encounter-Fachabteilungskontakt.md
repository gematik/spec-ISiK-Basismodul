#  - ISiK ICU v6.0.0-rc

ISiK ICU

Version 6.0.0-rc - STU1 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* ****

## Encounter: 

Profile: [ISiKKontaktGesundheitseinrichtung](StructureDefinition-ISiKKontaktGesundheitseinrichtung.md)

> **ExtensionAufnahmegrund**
* ErsteUndZweiteStelle: [CodeSystemAufnahmegrundErsteUndZweiteStelle: 01](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/CodeSystem/dkgev/AufnahmegrundErsteUndZweiteStelle#AufnahmegrundErsteUndZweiteStelle-01) (Krankenhausbehandlung, vollstationär)
* DritteStelle: [AufnahmegrundDritteStelle: 0](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/CodeSystem/dkgev/AufnahmegrundDritteStelle#AufnahmegrundDritteStelle-0) (Anderes)
* VierteStelle: [AufnahmegrundVierteStelle: 1](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.de/CodeSystem/dkgev/AufnahmegrundVierteStelle#AufnahmegrundVierteStelle-1) (Normalfall)

**identifier**: Visit number/0123456789

**status**: Finished

**class**: [ActCode: IMP](http://terminology.hl7.org/7.0.1/CodeSystem-v3-ActCode.html#v3-ActCode-IMP) (inpatient encounter)

**type**: Abteilungskontakt, Operation

**serviceType**: Innere Medizin

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**period**: 2021-02-12 --> 2021-02-13

### Diagnoses

| | | |
| :--- | :--- | :--- |
| - | **Condition** | **Use** |
| * | [Condition/BehandlungsDiagnoseFreitext](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Condition/BehandlungsDiagnoseFreitext) | Behandlungsrelevante Diagnosen |

**account**: [Account/AbrechnungsfallDRG](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Account/AbrechnungsfallDRG)

### Hospitalizations

| | | |
| :--- | :--- | :--- |
| - | **AdmitSource** | **DischargeDisposition** |
| * | Einweisung durch einen Arzt |  |

### Locations

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Location** | **Status** | **PhysicalType** |
| * | Bettenstellplatz 123 (Identifier:`https://test.krankenhaus.de/fhir/sid/locationid`/123) | Active | Bed |

**serviceProvider**: Fachabteilung XYZ (Identifier: `https://test.krankenhaus.de/fhir/sid/fachabteilungsid`/XYZ)



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "Fachabteilungskontakt",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung"
    ]
  },
  "extension" : [
    {
      "extension" : [
        {
          "url" : "ErsteUndZweiteStelle",
          "valueCoding" : {
            "system" : "http://fhir.de/CodeSystem/dkgev/AufnahmegrundErsteUndZweiteStelle",
            "code" : "01",
            "display" : "Krankenhausbehandlung, vollstationär"
          }
        },
        {
          "url" : "DritteStelle",
          "valueCoding" : {
            "system" : "http://fhir.de/CodeSystem/dkgev/AufnahmegrundDritteStelle",
            "code" : "0",
            "display" : "Anderes"
          }
        },
        {
          "url" : "VierteStelle",
          "valueCoding" : {
            "system" : "http://fhir.de/CodeSystem/dkgev/AufnahmegrundVierteStelle",
            "code" : "1",
            "display" : "Normalfall"
          }
        }
      ],
      "url" : "http://fhir.de/StructureDefinition/Aufnahmegrund"
    }
  ],
  "identifier" : [
    {
      "type" : {
        "coding" : [
          {
            "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
            "code" : "VN"
          }
        ]
      },
      "system" : "https://test.krankenhaus.de/fhir/sid/besuchsnummer",
      "value" : "0123456789"
    }
  ],
  "status" : "finished",
  "class" : {
    "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
    "code" : "IMP"
  },
  "type" : [
    {
      "coding" : [
        {
          "system" : "http://fhir.de/CodeSystem/Kontaktebene",
          "code" : "abteilungskontakt"
        }
      ]
    },
    {
      "coding" : [
        {
          "system" : "http://fhir.de/CodeSystem/kontaktart-de",
          "code" : "operation"
        }
      ]
    }
  ],
  "serviceType" : {
    "coding" : [
      {
        "system" : "http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel",
        "code" : "0100"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "period" : {
    "start" : "2021-02-12",
    "end" : "2021-02-13"
  },
  "diagnosis" : [
    {
      "condition" : {
        "reference" : "Condition/BehandlungsDiagnoseFreitext"
      },
      "use" : {
        "coding" : [
          {
            "system" : "http://fhir.de/CodeSystem/KontaktDiagnoseProzedur",
            "code" : "treatment-diagnosis"
          }
        ]
      }
    }
  ],
  "account" : [
    {
      "reference" : "Account/AbrechnungsfallDRG",
      "identifier" : {
        "system" : "https://test.krankenhaus.de/fhir/sid/fallnummer",
        "value" : "XZY"
      }
    }
  ],
  "hospitalization" : {
    "admitSource" : {
      "coding" : [
        {
          "system" : "http://fhir.de/CodeSystem/dgkev/Aufnahmeanlass",
          "code" : "E"
        }
      ]
    },
    "dischargeDisposition" : {
      "extension" : [
        {
          "extension" : [
            {
              "url" : "ErsteUndZweiteStelle",
              "valueCoding" : {
                "system" : "http://fhir.de/CodeSystem/dkgev/EntlassungsgrundErsteUndZweiteStelle",
                "code" : "01",
                "display" : "Behandlung regulär beendet"
              }
            },
            {
              "url" : "DritteStelle",
              "valueCoding" : {
                "system" : "http://fhir.de/CodeSystem/dkgev/EntlassungsgrundDritteStelle",
                "code" : "1",
                "display" : "arbeitsfähig entlassen"
              }
            }
          ],
          "url" : "http://fhir.de/StructureDefinition/Entlassungsgrund"
        }
      ]
    }
  },
  "location" : [
    {
      "location" : {
        "identifier" : {
          "system" : "https://test.krankenhaus.de/fhir/sid/locationid",
          "value" : "123"
        },
        "display" : "Bettenstellplatz 123"
      },
      "status" : "active",
      "physicalType" : {
        "coding" : [
          {
            "system" : "http://terminology.hl7.org/CodeSystem/location-physical-type",
            "code" : "bd",
            "display" : "Bed"
          }
        ]
      }
    }
  ],
  "serviceProvider" : {
    "identifier" : {
      "system" : "https://test.krankenhaus.de/fhir/sid/fachabteilungsid",
      "value" : "XYZ"
    },
    "display" : "Fachabteilung XYZ"
  }
}

```
