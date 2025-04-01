---
topic: DemoQuestionnaire
canonical: https://gematik.de/fhir/isik/Questionnaire/Demo
expand: 2
---

## {{link}}

### Metadaten

<fql output="transpose" headers="true">
from
	Questionnaire
where
	url = %canonical 
select
	CanonicalURL: url, Name: name, Titel: title, Status: status, Version: version
</fql>

<fql output="inline">
        from
	        Questionnaire
        where
	        url = %canonical
        select
	        Beschreibung: description
        with
            no header
</fql>

### Inhalt

<tabs>
  <tab title="Darstellung">{{tree, snapshot}}</tab>
  <tab title="Beschreibung"> 
    {{page:Übersicht/Artefakte/Questionnaires/FQL-Beschreibung.page.md}}
  </tab>
  <tab title="XML">{{xml}}</tab>
  <tab title="JSON">{{json}}</tab>
  <tab title="Link">{{link}}</tab> 
</tabs>

### Launch-Kontexte
<fql>
from
    Questionnaire
where
    url = %canonical
for extension
where url = 'http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext'
select 
	Name: extension.where(url='name').value.code, Ressourcentyp: extension.where(url='type').value, Beschreibung: extension.where(url='description').value
distinct
order by url
</fql>

### verwendete Extensions
<fql>
from
    Questionnaire
where
    url = %canonical
for (extension | descendants().extension)
where url.startsWith('http') 
select 
	Canoncial: url
distinct
order by url
</fql>

### verwendete FHIRPath-Expressions
<fql>
from
    Questionnaire
where 
    url = %canonical
for (extension.value | descendants().extension.value)
where language = 'text/fhirpath'
select 
	Beschreibung: description, FHIRPath: expression
distinct
</fql>


<!--### verwendete Queries
<fql>
from
    Questionnaire
where
    url = 'http://gefyra.de/fhir/sdc/Questionnaire/Demo'
for (extension.value | descendants().extension.value)
where language = 'text/x-fhir-query'
select 
	Beschreibung: description, Query: expression
distinct
</fql>-->