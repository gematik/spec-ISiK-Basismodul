### Profil

@```
from StructureDefinition where url = 'https://gematik.de/fhir/isik/Basismodul/StructureDefinition/ISiKSchwangerschaftsstatus' select Name: name, Canonical: url
```

{{tree:https://gematik.de/fhir/isik/Basismodul/StructureDefinition/ISiKSchwangerschaftsstatus, hybrid}}

---

**Constraints**

Folgende FHIRPath-Constraints sind im Profil zu beachten:

@``` from StructureDefinition where url = 'https://gematik.de/fhir/isik/Basismodul/StructureDefinition/ISiKSchwangerschaftsstatus' for differential.element.constraint select key, severity, human, expression```

---

**Terminology Bindings**

@```
from StructureDefinition
where url in ('https://gematik.de/fhir/isik/Basismodul/StructureDefinition/ISiKSchwangerschaftsstatus' )
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
@```
from StructureDefinition where url = 'https://gematik.de/fhir/isik/Basismodul/StructureDefinition/ISiKSchwangerschaftErwarteterEntbindungstermin' select Name: name, Canonical: url
```

{{tree:https://gematik.de/fhir/isik/Basismodul/StructureDefinition/ISiKSchwangerschaftErwarteterEntbindungstermin, hybrid}}

---

**Constraints**

Folgende FHIRPath-Constraints sind im Profil zu beachten:

@``` from StructureDefinition where url = 'https://gematik.de/fhir/isik/Basismodul/StructureDefinition/ISiKSchwangerschaftErwarteterEntbindungstermin' for differential.element.constraint select key, severity, human, expression```

---

**Terminology Bindings**

@```
from StructureDefinition
where url in ('https://gematik.de/fhir/isik/Basismodul/StructureDefinition/ISiKSchwangerschaftErwarteterEntbindungstermin' )
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
@```
from StructureDefinition where url = 'https://gematik.de/fhir/isik/Basismodul/StructureDefinition/ISiKAlkoholAbusus' select Name: name, Canonical: url
```

{{tree:https://gematik.de/fhir/isik/Basismodul/StructureDefinition/ISiKAlkoholAbusus, hybrid}}

---

**Constraints**

Folgende FHIRPath-Constraints sind im Profil zu beachten:

@``` from StructureDefinition where url = 'https://gematik.de/fhir/isik/Basismodul/StructureDefinition/ISiKAlkoholAbusus' for differential.element.constraint select key, severity, human, expression```

---

**Terminology Bindings**

@```
from StructureDefinition
where url in ('https://gematik.de/fhir/isik/Basismodul/StructureDefinition/ISiKAlkoholAbusus' )
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
@```
from StructureDefinition where url = 'https://gematik.de/fhir/isik/Basismodul/StructureDefinition/ISiKRaucherStatus' select Name: name, Canonical: url
```

{{tree:https://gematik.de/fhir/isik/Basismodul/StructureDefinition/ISiKRaucherStatus, hybrid}}

---

**Constraints**

Folgende FHIRPath-Constraints sind im Profil zu beachten:

@``` from StructureDefinition where url = 'https://gematik.de/fhir/isik/Basismodul/StructureDefinition/ISiKRaucherStatus' for differential.element.constraint select key, severity, human, expression```

---

**Terminology Bindings**

@```
from StructureDefinition
where url in ('https://gematik.de/fhir/isik/Basismodul/StructureDefinition/ISiKRaucherStatus' )
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
@```
from StructureDefinition where url = 'https://gematik.de/fhir/isik/Basismodul/StructureDefinition/ISiKStillstatus' select Name: name, Canonical: url
```

{{tree:https://gematik.de/fhir/isik/Basismodul/StructureDefinition/ISiKStillstatus, hybrid}}

---

**Constraints**

Folgende FHIRPath-Constraints sind im Profil zu beachten:

@``` from StructureDefinition where url = 'https://gematik.de/fhir/isik/Basismodul/StructureDefinition/ISiKStillstatus' for differential.element.constraint select key, severity, human, expression```

---

**Terminology Bindings**

@```
from StructureDefinition
where url in ('https://gematik.de/fhir/isik/Basismodul/StructureDefinition/ISiKStillstatus' )
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