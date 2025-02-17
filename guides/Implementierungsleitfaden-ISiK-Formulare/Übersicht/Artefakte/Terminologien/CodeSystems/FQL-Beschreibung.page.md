<fql output="inline">
from
	CodeSystem
where
	url = %canonical
select
	Beschreibung: description
</fql>