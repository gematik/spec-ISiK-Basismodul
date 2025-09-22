---
topic: FQL-CodeSystem
---

<fql>
from
	CodeSystem
where
	url = %canonical
for concept
select
	Code: code, Anzeigetext: display, Definition: definition
</fql>

Dieses CodeSystem wird verwendet in folgenden ValueSets:

<fql output="inline">
from
	ValueSet
where
	compose.include.system = %canonical
select Canonical: url
</fql>
