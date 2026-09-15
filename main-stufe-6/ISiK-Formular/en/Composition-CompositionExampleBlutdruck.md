# Blutdruckmessung vom 3.5.2022 - ISiK Formularmodul Implementation Guide v6.0.0

ISiK Formularmodul Implementation Guide

Version 6.0.0 - ballot 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Blutdruckmessung vom 3.5.2022**

## Composition: Blutdruckmessung vom 3.5.2022

Familienname:Fürstin von Musterfrau

Geburtsdatum:1964-08-12

PID:TestPID

Bericht-Status:final

Bericht-Typ:Berichtzusammenfassung / Document Summary

Datum:03.05.2022

Titel:Blutdruckmessung vom 3.5.2022

Autor:Gerät XY, Fa. Z, Modell T



## Resource Content

```json
{
  "resourceType" : "Composition",
  "id" : "CompositionExampleBlutdruck",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKBerichtSubSysteme"]
  },
  "identifier" : {
    "type" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code" : "FILL"
      }]
    },
    "system" : "https://fhir.krankenhaus.example/sid/system-a/berichtnummer",
    "value" : "0123456789"
  },
  "status" : "final",
  "type" : {
    "coding" : [{
      "system" : "http://dvmd.de/fhir/CodeSystem/kdl",
      "code" : "AD010112"
    }],
    "text" : "Kurzbericht"
  },
  "subject" : {
    "reference" : "urn:uuid:3bada18a-6fd2-11ed-a1eb-0242ac112345"
  },
  "encounter" : {
    "reference" : "urn:uuid:74b46c1a-6fc9-11ed-a1eb-0242ac198765"
  },
  "date" : "2022-05-03",
  "author" : [{
    "type" : "Device",
    "display" : "Gerät XY, Fa. Z, Modell T"
  }],
  "title" : "Blutdruckmessung vom 3.5.2022",
  "section" : [{
    "title" : "Messung",
    "text" : {
      "status" : "generated",
      "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table><tr><td><b>Systolisch</b></td><td><b>Diastolisch</b></td><td><b>Einheit</b></td><td><b>Uhrzeit</b></td></tr><tr><td>140</td><td>110</td><td>mmHG</td><td>17:15h</td></tr></table></div>"
    }
  }]
}

```
