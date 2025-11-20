---
topic: FQL-ValueSet
---

<fql output="inline">
from
	ValueSet
where
	url = %canonical
select
	Beschreibung: description
</fql>

Dieses ValueSet wird verwendet in folgenden Profilen:

<fql output="inline">
from
	StructureDefinition
select
	id, url, 
join differential.element.binding.valueSet
where 
   valueSet = %canonical
select Canonical: url
</fql>
