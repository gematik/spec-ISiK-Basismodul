---
canonical: 
---


## {{link}}

<fql output="inline">
from
	ValueSet
where
	url = %canonical
select
	Beschreibung: description
</fql>

### Metadaten

<fql output="transpose" headers="true">
from
	ValueSet
where
	url = %canonical
select
	CanonicalURL: url, Status: status, Version: version
</fql>

### Inhalt

<tabs>
    <tab title="Darstellung">      
        {{render}}
    </tab>
    <tab title="Beschreibung">
        {{page:Übersicht/Artefakte/Terminologien/ValueSets/FQL-Beschreibung.page.md}}
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
