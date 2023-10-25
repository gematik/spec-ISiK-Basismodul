### Profil

@```
from StructureDefinition where url = 'https://gematik.de/fhir/isik/v3/Basismodul/StructureDefinition/ISiKAbrechnungsfall' select Name: name, Canonical: url
```

{{tree:https://gematik.de/fhir/isik/v3/Basismodul/StructureDefinition/ISiKAbrechnungsfall, hybrid}}

Weitere Hinweise zu den Abgrenzungen der Begrifflichkeiten Fall und Kontakt finden sie unter [Deutsche Basisprofile - Abschnitt Ambulanter/stationärer Fall / Kontakt (Encounter)](https://ig.fhir.de/basisprofile-de/1.2.0/Ressourcen-AmbulanterStationaererFall.html).

---

**Terminology Bindings**

@```
from StructureDefinition
where url in ('https://gematik.de/fhir/isik/v3/Basismodul/StructureDefinition/ISiKAbrechnungsfall' )
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