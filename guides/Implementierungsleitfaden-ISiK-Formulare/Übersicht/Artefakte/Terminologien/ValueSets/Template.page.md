---
canonical: http://example.org/ValueSet/MeinValueSet
---
|Hinweis|Diese Box bitte entfernen!|
|-
|![Information](https://wiki.hl7.de/images/thumb/Under_construction_icon-blue.svg/100px-Under_construction_icon-blue.svg.png)|Diese Seite ist ein Template, das bei Verwendung für ein konkretes Projekt angepasst werden muss! Dieses Banner kann verwendet werden, um zu kennzeichnen, welche Seiten noch nicht bearbeitet wurden, sich gerade in Arbeit befinden oder um auf offene Punkte hinzuweisen.|


## {{link}}

### Metadaten

<fql output="transpose" headers="true">
from
	ValueSet
where
	url = 'http://example.org/ValueSet/MeinValueSet'
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
