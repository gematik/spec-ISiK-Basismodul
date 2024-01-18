### FHIR-Profil

Die Implementierung des Profils ISiKStandort im Rahmen der Ausbaustufe 4 ist nicht verpflichtend (KANN-Anforderung).

Das Profil ISiKStandort soll auch ein Krankenhaus als ganzes abbilden können.

@```
from StructureDefinition where url = 'https://gematik.de/fhir/isik/v4/Basismodul/StructureDefinition/ISiKStandort' select Name: name, Canonical: url
```
{{tree:https://gematik.de/fhir/isik/v4/Basismodul/StructureDefinition/ISiKStandort, hybrid}}

Folgende FHIRPath-Constraints sind im Profil zu beachten:

@``` from StructureDefinition where url = 'https://gematik.de/fhir/isik/v4/Basismodul/StructureDefinition/ISiKStandort' for differential.element.constraint select key, severity, human, expression```

---

---
