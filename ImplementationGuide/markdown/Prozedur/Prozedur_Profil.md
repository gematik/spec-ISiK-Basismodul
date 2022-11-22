### Profil

@```
from StructureDefinition where url = 'https://gematik.de/fhir/isik/v2/Basismodul/StructureDefinition/ISiKProzedur' select Name: name, Canonical: url
```

{{tree:https://gematik.de/fhir/isik/v2/Basismodul/StructureDefinition/ISiKProzedur, hybrid}}

---

**Constraints**

Folgende FHIRPath-Constraints sind im Profil zu beachten:

@``` from StructureDefinition where url = 'https://gematik.de/fhir/isik/v2/Basismodul/StructureDefinition/ISiKProzedur' for differential.element.constraint select key, severity, human, expression```

---

**Terminology Bindings**

@```
from StructureDefinition
where url in ('https://gematik.de/fhir/isik/v2/Basismodul/StructureDefinition/ISiKProzedur' )
for differential.element
select
Path: path,
join binding.where(valueSet.exists())
{
  Name: valueSet.substring((9 + valueSet.indexOf('ValueSet/'))),
  Strength: strength,
  URL: valueSet
}
```

---