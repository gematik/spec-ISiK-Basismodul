---
canonical: http://example.org/CodeSystem/MeinCodeSystem
---
|Hinweis|Diese Box bitte entfernen!|
|-
|![Information](https://wiki.hl7.de/images/thumb/Under_construction_icon-blue.svg/100px-Under_construction_icon-blue.svg.png)|Diese Seite ist ein Template, das bei Verwendung für ein konkretes Projekt angepasst werden muss! Dieses Banner kann verwendet werden, um zu kennzeichnen, welche Seiten noch nicht bearbeitet wurden, sich gerade in Arbeit befinden oder um auf offene Punkte hinzuweisen.|

## {{link}}

### Metadaten

<fql output="transpose" headers="true">
from
	CodeSystem
where
	url = 'http://example.org/CodeSystem/MeinCodeSystem'
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
	url = 'http://example.org/CodeSystem/MeinCodeSystem'
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