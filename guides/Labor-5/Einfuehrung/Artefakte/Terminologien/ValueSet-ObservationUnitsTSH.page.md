---
canonical: https://gematik.de/fhir/isik/ValueSet/ObservationUnitsTSH
---

## {{link}}

<fql output="inline">
from
	ValueSet
where
	url = %canonical
select
	description
with
  no header
</fql>

### Metadaten

<fql output="transpose" headers="true">
from
	ValueSet
where
	url = %canonical
select
	Beschreibung: description, CanonicalURL: url, Status: status, Version: version, Herausgeber: publisher
</fql>

### Inhalt

<tabs>
    <tab title="Darstellung">
    {{page:FQL-ValueSet}}
    </tab>
    <tab title="XML">      
        {{xml}}
    </tab>
    <tab title="JSON">
        {{json}}
    </tab>
    <tab title="Link">
        {{link}}
    </tab>
</tabs>

---