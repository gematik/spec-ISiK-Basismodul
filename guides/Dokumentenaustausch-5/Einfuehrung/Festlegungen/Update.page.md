---
topic: AkteureUndInteraktionen-AkteureUndInteraktionen-Update
canonical: https://gematik.de/fhir/isik/OperationDefinition/UpdateMetadata
---

<fql>
        from
	        OperationDefinition
        where
	        url = %canonical
        select
	        Beschreibung: description
        with
            no header
</fql>

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


