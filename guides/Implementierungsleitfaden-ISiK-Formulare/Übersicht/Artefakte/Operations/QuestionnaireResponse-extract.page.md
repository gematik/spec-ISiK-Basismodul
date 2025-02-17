---
canonical: http://hl7.org/fhir/uv/sdc/OperationDefinition/QuestionnaireResponse-extract
---


## {{link}}

### Metadaten

<fql output="transpose" headers="true">
from
	OperationDefinition
where
	url = %canonical
select
	Canonical: url, Status: status, Version: version
</fql>



### Inhalt

<tabs>
  <tab title="Darstellung">{{render}}</tab>
  <tab title="Beschreibung"> 
    {{page:Übersicht/Artefakte/Operations/FQL-Beschreibung.page.md}}
  </tab>
  <tab title="XML">{{xml}}</tab>
  <tab title="JSON">{{json}}</tab>
  <tab title="Link">{{link}}</tab>
</tabs>



