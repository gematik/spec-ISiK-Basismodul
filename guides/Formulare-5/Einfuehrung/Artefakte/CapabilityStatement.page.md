---
canonical: http://example.org/CapabilityStatement/BeispielCapabilityStatement
---

|Hinweis|Diese Box bitte entfernen!|
|-
|![Information](https://wiki.hl7.de/images/thumb/Under_construction_icon-blue.svg/100px-Under_construction_icon-blue.svg.png)|Diese Seite ist ein Template, das bei Verwendung für ein konkretes Projekt angepasst werden muss! Dieses Banner kann verwendet werden, um zu kennzeichnen, welche Seiten noch nicht bearbeitet wurden, sich gerade in Arbeit befinden oder um auf offene Punkte hinzuweisen.|

## {{link}}

### Metadaten

<fql output="table">
from
	CapabilityStatement
where
	url = 'http://example.org/CapabilityStatement/BeispielCapabilityStatement'
select
	CanonicalURL: url, Intention: kind, Status: status, Version: version
</fql>

### Inhalt

<tabs>
    <tab title="Darstellung">      
        {{render}}
    </tab>
    <tab title="Beschreibung">
    @```
from
	CapabilityStatement
where
	url = 'http://example.org/CapabilityStatement/BeispielCapabilityStatement' 
select
	Beschreibung: description
```
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
