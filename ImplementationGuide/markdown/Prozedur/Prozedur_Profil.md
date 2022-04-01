### Profil

@```
from StructureDefinition where url = 'https://gematik.de/fhir/ISiK/v2/StructureDefinition/ISiKProzedur' select Name: name, Canonical: url
```

{{tree:https://gematik.de/fhir/ISiK/v2/StructureDefinition/ISiKProzedur, hybrid}}

---

**Constraints**

Folgende FHIRPath-Constraints sind im Profil zu beachten:

@``` from StructureDefinition where url = 'https://gematik.de/fhir/ISiK/v2/StructureDefinition/ISiKProzedur' for differential.element.constraint select key, severity, human, expression```

---

**Terminology Bindings**

@```
from StructureDefinition
where url in ('https://gematik.de/fhir/ISiK/v2/StructureDefinition/ISiKKontaktGesundheitseinrichtung' )
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