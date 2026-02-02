# Interaktion: Update von Metadaten - ISiK Dokumentenaustausch Implementierungsleitfaden v6.0.0-rc

ISiK Dokumentenaustausch Implementierungsleitfaden

Version 6.0.0-rc - ci-build 

* [**Table of Contents**](toc.md)
* **Interaktion: Update von Metadaten**

## Interaktion: Update von Metadaten

from OperationDefinition where url = %canonical select Beschreibung: description with no header

| | |
| :--- | :--- |
| ![](https://raw.githubusercontent.com/gematik/spec-ISiK-Terminplanung/c604c61a3887bd5532d2c7392eb20d8c79403028/Material/images/piktogramme/Betriebskoordination_Gruen_gematik.svg) | Die Löschung vorläufiger Dokumente mittels $update-metadata ist experimentell. Entwickler, die diese Funktionalität nutzen, sind gebeten, im[Chat](https://chat.fhir.org/#narrow/channel/287581-german.2Fisik/topic/.5BDOK.5D.20Integration.20mittels.20MHD.20und.20ISiK.20-.20L.C3.B6schen.20von.20Doks/with/502563788)ein Feedback zu hinterlassen, ob sich diese Funktion implementierbar/nützlich oder komplex/problematisch erwiesen hat. Abhängig von der Rückmeldung kann dieses Feature in späteren Releases entweder verbindlich gemacht oder entfernt werden. |

### OperationDefinition $update-metadata

### Beispiel

URL:
 HTTP POST [base]/DocumentReference/example/$update-metadata

BODY:

