# dok-beispiel-server - ISiK Dokumentenaustausch Implementierungsleitfaden v6.0.0

ISiK Dokumentenaustausch Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **dok-beispiel-server**

## DocumentReference: dok-beispiel-server

Profile: [Erforderliche Metadaten für Dokumentenaustausch in ISiK](StructureDefinition-ISiKDokumentenMetadaten.md)

Security Label: [test health data (Details: ActReason code HTEST = 'test health data')](http://terminology.hl7.org/7.3.0/CodeSystem-v3-ActReason.html)

**masterIdentifier**: [URI](http://terminology.hl7.org/5.0.0/NamingSystem-uri.html)/urn:oid:1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46340

**status**: Current

**type**: Molekularpathologiebefund

**category**: Befundbericht

**subject**: [Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Private Krankenversicherung (use: secondary, ))](Patient-PatientinMusterfrau.md)

**securityLabel**: normal

> **content**

### Attachments

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| - | **ContentType** | **Language** | **Url** | **Title** | **Creation** |
| * | application/pdf | Deutsch | [https://mein-Dokumentenserver/dokumente/1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46340.pdf](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&canonical=https://mein-Dokumentenserver/dokumente/1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46340.pdf) | Molekularpathologiebefund vom 31.12.21 | 2020-12-31 23:50:50-0500 |

**format**: [IHE Format Code set for use with Document Sharing: urn:ihe:iti:xds:2017:mimeTypeSufficient](https://profiles.ihe.net/fhir/ihe.formatcode.fhir/1.4.0/CodeSystem-formatcode.html#formatcode-urn.58ihe.58iti.58xds.582017.58mimeTypeSufficient) (mimeType Sufficient)

### Contexts

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Encounter** | **FacilityType** | **PracticeSetting** |
| * | [Encounter: extension = ,2025-01-02,2025-01-04; identifier = Visit number; status = finished; class = inpatient encounter (ActCode#IMP); type = Abteilungskontakt,Operation; serviceType = Orthopädie; period = 2024-10-21 --> 2025-01-01](Encounter-FachabteilungskontaktNormal.md) | Krankenhaus | Allgemeinmedizin |



## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "dok-beispiel-server",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKDokumentenMetadaten"],
    "security" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v3-ActReason",
      "code" : "HTEST"
    }]
  },
  "masterIdentifier" : {
    "system" : "urn:ietf:rfc:3986",
    "value" : "urn:oid:1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46340"
  },
  "status" : "current",
  "type" : {
    "coding" : [{
      "system" : "http://dvmd.de/fhir/CodeSystem/kdl",
      "code" : "PT130102",
      "display" : "Molekularpathologiebefund"
    },
    {
      "system" : "http://ihe-d.de/CodeSystems/IHEXDStypeCode",
      "code" : "PATH",
      "display" : "Pathologiebefundberichte"
    }]
  },
  "category" : [{
    "coding" : [{
      "system" : "http://ihe-d.de/CodeSystems/IHEXDSclassCode",
      "code" : "BEF",
      "display" : "Befundbericht"
    }]
  }],
  "subject" : {
    "reference" : "Patient/PatientinMusterfrau"
  },
  "securityLabel" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v3-Confidentiality",
      "code" : "N"
    }]
  }],
  "content" : [{
    "attachment" : {
      "contentType" : "application/pdf",
      "language" : "de",
      "url" : "https://mein-Dokumentenserver/dokumente/1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46340.pdf",
      "title" : "Molekularpathologiebefund vom 31.12.21",
      "creation" : "2020-12-31T23:50:50-05:00"
    },
    "format" : {
      "system" : "http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode",
      "code" : "urn:ihe:iti:xds:2017:mimeTypeSufficient",
      "display" : "mimeType Sufficient"
    }
  }],
  "context" : {
    "encounter" : [{
      "reference" : "Encounter/FachabteilungskontaktNormal"
    }],
    "facilityType" : {
      "coding" : [{
        "system" : "http://ihe-d.de/CodeSystems/PatientBezogenenGesundheitsversorgung",
        "code" : "KHS",
        "display" : "Krankenhaus"
      }]
    },
    "practiceSetting" : {
      "coding" : [{
        "system" : "http://ihe-d.de/CodeSystems/AerztlicheFachrichtungen",
        "code" : "ALLG"
      }]
    }
  }
}

```
