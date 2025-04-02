## {{page-title}}

<fql output="table" headers="true">
from
	StructureDefinition
	for differential.element select
	Element: path, join constraint { Name: key, Schweregrad: severity, Beschreibung: human, Ausdruck: expression  }
order by
	path
</fql>