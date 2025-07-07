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
where differential.element.binding.exists() and differential.element.binding.valueSet = '%canonical'
select Profil:id, Canonical: url
</fql>