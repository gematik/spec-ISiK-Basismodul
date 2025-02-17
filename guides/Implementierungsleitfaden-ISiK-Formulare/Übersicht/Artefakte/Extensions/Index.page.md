## {{page-title}}

@```
from StructureDefinition
	where type = 'Extension'
	select Beschreibung: description, CanonicalURL: url, Kontext: context.expression, Status: status, Version: version
```

{{index:current}}