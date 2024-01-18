### FHIR-Profil

Die Implementierung des Profils ISiKOrganisation im Rahmen der Ausbaustufe 4 ist nicht verpflichtend (KANN-Anforderung).

Das Profil ISiKOrganisation soll auch ein Krankenhaus als ganzes abbilden können.

@```
from StructureDefinition where url = 'https://gematik.de/fhir/isik/v4/Basismodul/StructureDefinition/ISiKOrganisation' select Name: name, Canonical: url
```
{{tree:https://gematik.de/fhir/isik/v4/Basismodul/StructureDefinition/ISiKOrganisation, hybrid}}

Folgende FHIRPath-Constraints sind im Profil zu beachten:

@``` from StructureDefinition where url = 'https://gematik.de/fhir/isik/v4/Basismodul/StructureDefinition/ISiKOrganisation' for differential.element.constraint select key, severity, human, expression```

---

---
