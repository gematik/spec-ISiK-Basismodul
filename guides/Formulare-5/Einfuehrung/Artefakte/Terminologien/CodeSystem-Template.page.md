---
canonical: 
---


## {{link}}

<fql output="inline">
from
	CodeSystem
where
	url = %canonical
select
	Beschreibung: description
</fql>

### Metadaten

<fql output="transpose" headers="true">
from
	CodeSystem
where
	url = %canonical
select
	Beschreibung: description, CanonicalURL: url, Status: status, Version: version
</fql>

### Inhalt

<tabs>
    <tab title="Darstellung">  
        {{render}}
    </tab>
    <tab title="Darstellung (FQL)"><!-- Alternative Darstellung: sieht schöner aus, funktioniert aktuell aber nur für CodeSysteme, die nicht hierarchisch sind!!!-->
            @```
from
	CodeSystem
where
	url = %canonical
for concept
select
	Code: code, Anzeigetext: display, Definition: definition
```
    </tab>
    <tab title="Beschreibung">
    {{page:Übersicht/Artefakte/Terminologien/CodeSystems/FQL-Beschreibung.page.md}}
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