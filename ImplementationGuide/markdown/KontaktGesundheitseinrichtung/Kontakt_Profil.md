### Profil

@```
from StructureDefinition where url = 'https://gematik.de/fhir/ISiK/v2/StructureDefinition/ISiKKontaktGesundheitseinrichtung' select Name: name, Canonical: url
```

{{tree:https://gematik.de/fhir/ISiK/v2/StructureDefinition/ISiKKontaktGesundheitseinrichtung, hybrid}}

---

**Constraints**

Folgende FHIRPath-Constraints sind im Profil zu beachten:

@``` from StructureDefinition where url = 'https://gematik.de/fhir/ISiK/v2/StructureDefinition/ISiKKontaktGesundheitseinrichtung' for differential.element.constraint select key, severity, human, expression```

Weitere Hinweise zu den Abgrenzungen der Begrifflichkeiten Fall und Kontakt finden sie unter [Deutsche Basisprofile - Abschnitt Ambulanter/stationärer Fall / Kontakt (Encounter)](https://ig.fhir.de/basisprofile-de/1.2.0/Ressourcen-AmbulanterStationaererFall.html).

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