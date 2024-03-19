### FHIR-Profil

Das Profil ISiKOrganisation soll auch ein Krankenhaus als Ganzes abbilden können:

@```
from StructureDefinition where url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKOrganisation' select Name: name, Canonical: url
```
{{tree:https://gematik.de/fhir/isik/StructureDefinition/ISiKOrganisation, hybrid}}

Folgende FHIRPath-Constraints sind im Profil zu beachten:

@``` from StructureDefinition where url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKOrganisation' for differential.element.constraint select key, severity, human, expression```

**Terminology Bindings**

@```
from StructureDefinition
where url in ('https://gematik.de/fhir/isik/StructureDefinition/ISiKOrganisation' )
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

Das Profil ISiKOrganisationFachabteilung soll eine einzelne Fachabteilung abbilden:

@```
from StructureDefinition where url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKOrganisationFachabteilung' select Name: name, Canonical: url
```
{{tree:https://gematik.de/fhir/isik/StructureDefinition/ISiKOrganisationFachabteilung, hybrid}}

Folgende FHIRPath-Constraints sind im Profil zu beachten:

@``` from StructureDefinition where url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKOrganisationFachabteilung' for differential.element.constraint select key, severity, human, expression```


**Terminology Bindings**

@```
from StructureDefinition
where url in ('https://gematik.de/fhir/isik/StructureDefinition/ISiKOrganisationFachabteilung' )
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
