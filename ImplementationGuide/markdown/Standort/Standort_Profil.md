### FHIR-Profile

Das Profil ISiKStandort soll auch den Standort eines Krankenhauses abbilden können.

@```
from StructureDefinition where url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKStandort' select Name: name, Canonical: url
```
{{tree:https://gematik.de/fhir/isik/StructureDefinition/ISiKStandort, hybrid}}

Folgende FHIRPath-Constraints sind im Profil zu beachten:

@``` from StructureDefinition where url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKStandort' for differential.element.constraint select key, severity, human, expression```

**Terminology Bindings**

@```
from StructureDefinition
where url in ('https://gematik.de/fhir/isik/StructureDefinition/ISiKStandort' )
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

Folgendes Profil dient der Abbildung eines Raums:

@```
from StructureDefinition where url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKStandortRaum' select Name: name, Canonical: url
```
{{tree:https://gematik.de/fhir/isik/StructureDefinition/ISiKStandortRaum, hybrid}}

Folgende FHIRPath-Constraints sind im Profil zu beachten:

@``` from StructureDefinition where url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKStandort' for differential.element.constraint select key, severity, human, expression```

**Terminology Bindings**

@```
from StructureDefinition
where url in ('https://gematik.de/fhir/isik/StructureDefinition/ISiKStandortRaum' )
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

Folgendes Profil dient der Abbildung eines Bettenstellplatzes :

@```
from StructureDefinition where url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKStandortBettenstellplatz' select Name: name, Canonical: url
```
{{tree:https://gematik.de/fhir/isik/StructureDefinition/ISiKStandortBettenstellplatz, hybrid}}

Folgende FHIRPath-Constraints sind im Profil zu beachten:

@``` from StructureDefinition where url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKStandortBettenstellplatz' for differential.element.constraint select key, severity, human, expression```



Ein einzelnes Bett als Gegenstand kann als FHIR-Ressource 'Device' abgebildet werden, das einen Bettenstellplatz referenziert.

**Terminology Bindings**

@```
from StructureDefinition
where url in ('https://gematik.de/fhir/isik/StructureDefinition/ISiKStandortBettenstellplatz' )
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


