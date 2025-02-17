<fql output="inline">
from
	ValueSet
where
	url = %canonical
select
	Beschreibung: description
</fql>