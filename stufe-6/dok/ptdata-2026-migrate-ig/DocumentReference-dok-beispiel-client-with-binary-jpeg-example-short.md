# Example DocumentReference - dok-beispiel-client-with-binary-jpeg-example-short - ISiK Dokumentenaustausch Implementierungsleitfaden v6.0.0-rc

ISiK Dokumentenaustausch Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example DocumentReference - dok-beispiel-client-with-binary-jpeg-example-short**

## Example DocumentReference: Example DocumentReference - dok-beispiel-client-with-binary-jpeg-example-short

Profile: [Erforderliche Metadaten für Dokumentenaustausch in ISiK](StructureDefinition-ISiKDokumentenMetadaten.md)

Security Label: test health data (Details: ActReason code HTEST = 'test health data')

**masterIdentifier**: [Uniform Resource Identifier (URI)](http://terminology.hl7.org/6.3.0/NamingSystem-uri.html)/urn:oid:1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46340

**status**: Current

**type**: Fotodokumentation Operation

**subject**: [Patient/PatientinMusterfrau](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Patient/PatientinMusterfrau)

**securityLabel**: normal

> **content**

### Attachments

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| - | **ContentType** | **Language** | **Data** | **Title** | **Creation** |
| * | image/jpeg | German | `4AAQSkZJRgABAQEB` | Fotodokumentation Operation vom 31.12.21 | 2020-12-31 23:50:50-0500 |

**format**: [IHE Format Code set for use with Document Sharing: urn:ihe:iti:xds:2017:mimeTypeSufficient](https://profiles.ihe.net/fhir/ihe.formatcode.fhir/1.4.0/CodeSystem-formatcode.html#formatcode-urn.58ihe.58iti.58xds.582017.58mimeTypeSufficient) (Format aus MIME Type ableitbar)

### Contexts

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Encounter** | **FacilityType** | **PracticeSetting** |
| * | [Encounter/FachabteilungskontaktNormal](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Encounter/FachabteilungskontaktNormal) | Krankenhaus | Allgemeinmedizin |



## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "dok-beispiel-client-with-binary-jpeg-example-short",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKDokumentenMetadaten"
    ],
    "security" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/v3-ActReason",
        "code" : "HTEST"
      }
    ]
  },
  "masterIdentifier" : {
    "system" : "urn:ietf:rfc:3986",
    "value" : "urn:oid:1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46340"
  },
  "status" : "current",
  "type" : {
    "coding" : [
      {
        "system" : "http://dvmd.de/fhir/CodeSystem/kdl",
        "code" : "ED020101",
        "display" : "Fotodokumentation Operation"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "securityLabel" : [
    {
      "coding" : [
        {
          "system" : "http://terminology.hl7.org/CodeSystem/v3-Confidentiality",
          "code" : "N"
        }
      ]
    }
  ],
  "content" : [
    {
      "attachment" : {
        "contentType" : "image/jpeg",
        "language" : "de",
        "data" : "4AAQSkZJRgABAQEB",
        "title" : "Fotodokumentation Operation vom 31.12.21",
        "creation" : "2020-12-31T23:50:50-05:00"
      },
      "format" : {
        "system" : "http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode",
        "code" : "urn:ihe:iti:xds:2017:mimeTypeSufficient",
        "display" : "Format aus MIME Type ableitbar"
      }
    }
  ],
  "context" : {
    "encounter" : [
      {
        "reference" : "Encounter/FachabteilungskontaktNormal"
      }
    ],
    "facilityType" : {
      "coding" : [
        {
          "system" : "http://ihe-d.de/CodeSystems/PatientBezogenenGesundheitsversorgung",
          "code" : "KHS",
          "display" : "Krankenhaus"
        }
      ]
    },
    "practiceSetting" : {
      "coding" : [
        {
          "system" : "http://ihe-d.de/CodeSystems/AerztlicheFachrichtungen",
          "code" : "ALLG"
        }
      ]
    }
  }
}

```
