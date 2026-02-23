---
topic: AkteureUndInteraktionen-AkteureUndInteraktionen-Update
canonical: https://gematik.de/fhir/isik/OperationDefinition/UpdateMetadata
---

Zur entsprechenden Operation siehe [$update-metadata](OperationDefinition-UpdateMetadata.html). 

| Hinweis | Experimentelle Funktion |
|---------|---------------------|
| <img src="Betriebskoordination_Gruen_gematik.svg" width="40"/>| Die Löschung vorläufiger Dokumente mittels $update-metadata ist experimentell. Entwickler, die diese Funktionalität nutzen, sind gebeten, im [Chat](https://chat.fhir.org/#narrow/channel/287581-german.2Fisik/topic/.5BDOK.5D.20Integration.20mittels.20MHD.20und.20ISiK.20-.20L.C3.B6schen.20von.20Doks/with/502563788) ein Feedback zu hinterlassen, ob sich diese Funktion implementierbar/nützlich oder komplex/problematisch erwiesen hat. Abhängig von der Rückmeldung kann dieses Feature in späteren Releases entweder verbindlich gemacht oder entfernt werden. |

### Beispiel 

URL:  
``` HTTP POST [base]/DocumentReference/example/$update-metadata ```

BODY:  

```json
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

