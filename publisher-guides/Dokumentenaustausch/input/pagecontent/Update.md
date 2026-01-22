---
topic: AkteureUndInteraktionen-AkteureUndInteraktionen-Update
canonical: https://gematik.de/fhir/isik/OperationDefinition/UpdateMetadata
---

<fql output="inline">
        from
	        OperationDefinition
        where
	        url = %canonical
        select
	        Beschreibung: description
        with
            no header
</fql>

| Hinweis | Experimentelle Funktion |
|---------|---------------------|
| <img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Terminplanung/c604c61a3887bd5532d2c7392eb20d8c79403028/Material/images/piktogramme/Betriebskoordination_Gruen_gematik.svg" width="40"/>| Die Löschung vorläufiger Dokumente mittels $update-metadata ist experimentell. Entwickler, die diese Funktionalität nutzen, sind gebeten, im [Chat](https://chat.fhir.org/#narrow/channel/287581-german.2Fisik/topic/.5BDOK.5D.20Integration.20mittels.20MHD.20und.20ISiK.20-.20L.C3.B6schen.20von.20Doks/with/502563788) ein Feedback zu hinterlassen, ob sich diese Funktion implementierbar/nützlich oder komplex/problematisch erwiesen hat. Abhängig von der Rückmeldung kann dieses Feature in späteren Releases entweder verbindlich gemacht oder entfernt werden. |

### OperationDefinition `$update-metadata`

{{render:https://gematik.de/fhir/isik/OperationDefinition/UpdateMetadata}}

### Beispiel 

URL:  
    HTTP POST [base]/DocumentReference/example/$update-metadata

BODY:  
<tabs>
    <tab title="Übersicht">      
        {{render:Resources/fsh-generated/resources/Parameters-ParametersExampleUpdateMetadata.json}}
    </tab>
    <tab title="XML">      
        {{xml:Resources/fsh-generated/resources/Parameters-ParametersExampleUpdateMetadata.json}}
    </tab>
    <tab title="JSON">
        {{json:Resources/fsh-generated/resources/Parameters-ParametersExampleUpdateMetadata.json}}
    </tab>
    <tab title="Link">
        {{link:Resources/fsh-generated/resources/Parameters-ParametersExampleUpdateMetadata.json}}
    </tab>
</tabs>


