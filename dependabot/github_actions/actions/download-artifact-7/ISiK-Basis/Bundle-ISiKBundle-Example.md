# Blutdruckmessung vom 3.5.2022 (Bundle) - ISiK Basis Implementierungsleitfaden v6.0.0-rc

ISiK Basis Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Blutdruckmessung vom 3.5.2022 (Bundle)**

## Example Bundle: Blutdruckmessung vom 3.5.2022 (Bundle)



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "ISiKBundle-Example",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/isik/StructureDefinition/ISiKBerichtBundle"
    ]
  },
  "identifier" : {
    "type" : {
      "coding" : [
        {
          "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
          "code" : "FILL"
        }
      ]
    },
    "system" : "https://fhir.krankenhaus.example/sid/subsystem-a/berichtbundlenummer",
    "value" : "0123456789"
  },
  "type" : "document",
  "timestamp" : "2022-05-03T17:57:34+01:00",
  "entry" : [
    {
      "fullUrl" : "urn:uuid:74b471ba-6fc9-11ed-a1eb-0242ac120002",
      "resource" : {
        "resourceType" : "Composition",
        "id" : "CompositionExampleBlutdruck",
        "meta" : {
          "profile" : [
            "https://gematik.de/fhir/isik/StructureDefinition/ISiKBerichtSubSysteme"
          ]
        },
        "text" : {
          "status" : "extensions",
          "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Composition_CompositionExampleBlutdruck\"> </a><p>Familienname:Fürstin von Musterfrau</p><p>Geburtsdatum:1964-08-12</p><p>PID:TestPID</p><p>Bericht-Status:final</p><p>Bericht-Typ:Berichtzusammenfassung / Document Summary</p><p>Datum:03.05.2022</p><p>Titel:Blutdruckmessung vom 3.5.2022</p><p>Autor:Gerät XY, Fa. Z, Modell T</p></div>"
        },
        "identifier" : {
          "type" : {
            "coding" : [
              {
                "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
                "code" : "FILL"
              }
            ]
          },
          "system" : "https://fhir.krankenhaus.example/sid/system-a/berichtnummer",
          "value" : "0123456789"
        },
        "status" : "final",
        "type" : {
          "coding" : [
            {
              "system" : "http://loinc.org",
              "code" : "55112-7"
            }
          ],
          "text" : "Kurzbericht"
        },
        "subject" : {
          "reference" : "urn:uuid:3bada18a-6fd2-11ed-a1eb-0242ac112345"
        },
        "encounter" : {
          "reference" : "urn:uuid:74b46c1a-6fc9-11ed-a1eb-0242ac198765"
        },
        "date" : "2022-05-03",
        "author" : [
          {
            "type" : "Device",
            "display" : "Gerät XY, Fa. Z, Modell T"
          }
        ],
        "title" : "Blutdruckmessung vom 3.5.2022",
        "section" : [
          {
            "title" : "Messung",
            "text" : {
              "status" : "generated",
              "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Systolisch</b></td><td><b>Diastolisch</b></td><td><b>Einheit</b></td><td><b>Uhrzeit</b></td></tr><tr><td>140</td><td>110</td><td>mmHG</td><td>17:15h</td></tr></table></div>"
            }
          }
        ]
      }
    },
    {
      "fullUrl" : "urn:uuid:3bada18a-6fd2-11ed-a1eb-0242ac112345",
      "resource" : {
        "resourceType" : "Patient",
        "id" : "PatientinMusterfrauMinimal",
        "text" : {
          "status" : "generated",
          "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Patient_PatientinMusterfrauMinimal\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Patient PatientinMusterfrauMinimal</b></p><a name=\"PatientinMusterfrauMinimal\"> </a><a name=\"hcPatientinMusterfrauMinimal\"> </a><p style=\"border: 1px #661aff solid; background-color: #e6e6ff; padding: 10px;\">Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Medical record number)</p><hr/></div>"
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
            "value" : "TestPID"
          }
        ],
        "name" : [
          {
            "use" : "official",
            "family" : "Fürstin von Musterfrau",
            "given" : ["Erika"],
            "prefix" : ["Dr."]
          }
        ],
        "gender" : "female",
        "birthDate" : "1964-08-12"
      }
    },
    {
      "fullUrl" : "urn:uuid:74b46c1a-6fc9-11ed-a1eb-0242ac198765",
      "resource" : {
        "resourceType" : "Encounter",
        "id" : "FachabteilungskontaktMinimal",
        "text" : {
          "status" : "generated",
          "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Encounter_FachabteilungskontaktMinimal\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Encounter FachabteilungskontaktMinimal</b></p><a name=\"FachabteilungskontaktMinimal\"> </a><a name=\"hcFachabteilungskontaktMinimal\"> </a><p><b>identifier</b>: Visit number/0123456789</p><p><b>status</b>: Unknown</p><p><b>class</b>: <a href=\"http://terminology.hl7.org/7.0.1/CodeSystem-v3-ActCode.html#v3-ActCode-IMP\">ActCode: IMP</a> (inpatient encounter)</p><p><b>type</b>: <span title=\"Codes:{http://fhir.de/CodeSystem/kontaktart-de operation}\">Operation</span>, <span title=\"Codes:{http://fhir.de/CodeSystem/Kontaktebene abteilungskontakt}\">Abteilungskontakt</span></p><p><b>serviceType</b>: <span title=\"Codes:{http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel 0100}\">Innere Medizin</span></p><p><b>subject</b>: <a href=\"Bundle-ISiKBundle-Example.html#urn-uuid-3bada18a-6fd2-11ed-a1eb-0242ac112345\">Erika Fürstin von Musterfrau (official) Female, DoB: 1964-08-12 ( Medical record number)</a></p><p><b>period</b>: 2022-05-03 --&gt; 2022-05-05</p></div>"
        },
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
        "status" : "unknown",
        "class" : {
          "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
          "code" : "IMP"
        },
        "type" : [
          {
            "coding" : [
              {
                "system" : "http://fhir.de/CodeSystem/kontaktart-de",
                "code" : "operation"
              }
            ]
          },
          {
            "coding" : [
              {
                "system" : "http://fhir.de/CodeSystem/Kontaktebene",
                "code" : "abteilungskontakt"
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
          "reference" : "urn:uuid:3bada18a-6fd2-11ed-a1eb-0242ac112345"
        },
        "period" : {
          "start" : "2022-05-03",
          "end" : "2022-05-05"
        }
      }
    }
  ]
}

```
