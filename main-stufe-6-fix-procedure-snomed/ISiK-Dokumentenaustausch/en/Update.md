# Interaktion: Update von Metadaten - ISiK Dokumentenaustausch Implementierungsleitfaden v6.0.0

ISiK Dokumentenaustausch Implementierungsleitfaden

Version 6.0.0 - active 

* [**Table of Contents**](toc.md)
* **Interaktion: Update von Metadaten**

## Interaktion: Update von Metadaten

Zur entsprechenden Operation siehe [$update-metadata](OperationDefinition-UpdateMetadata.md).

| | |
| :--- | :--- |
| ![](Betriebskoordination_Gruen_gematik.svg) | Die Löschung vorläufiger Dokumente mittels $update-metadata ist experimentell. Entwickler, die diese Funktionalität nutzen, sind gebeten, im[Chat](https://chat.fhir.org/#narrow/channel/287581-german.2Fisik/topic/.5BDOK.5D.20Integration.20mittels.20MHD.20und.20ISiK.20-.20L.C3.B6schen.20von.20Doks/with/502563788)ein Feedback zu hinterlassen, ob sich diese Funktion implementierbar/nützlich oder komplex/problematisch erwiesen hat. Abhängig von der Rückmeldung kann dieses Feature in späteren Releases entweder verbindlich gemacht oder entfernt werden. |

### Beispiel

URL:
 `HTTP POST [base]/DocumentReference/example/$update-metadata`

BODY:

```
{
  "resourceType": "Parameters",
  "id": "ParametersExampleUpdateMetadata",
  "parameter": [
    {
      "name": "docStatus",
      "valueCode": "final"
    }
  ]
}

```

