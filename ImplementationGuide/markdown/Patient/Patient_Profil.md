### FHIR-Profil

@```
from StructureDefinition where url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient' select Name: name, Canonical: url
```
{{tree:https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient, hybrid}}

Folgende FHIRPath-Constraints sind im Profil zu beachten:

@``` from StructureDefinition where url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient' for differential.element.constraint select key, severity, human, expression```

---
