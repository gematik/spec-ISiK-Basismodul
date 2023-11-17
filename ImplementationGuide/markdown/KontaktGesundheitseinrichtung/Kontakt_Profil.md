### Profil

@```
from StructureDefinition where url = 'https://gematik.de/fhir/isik/v3/Basismodul/StructureDefinition/ISiKKontaktGesundheitseinrichtung' select Name: name, Canonical: url
```

{{tree:https://gematik.de/fhir/isik/v3/Basismodul/StructureDefinition/ISiKKontaktGesundheitseinrichtung, hybrid}}

Es ist ein üblicher Fall, dass die Dauer eines Versorgungsstellenkontaktes die eines Abteilungskontaktes übersteigt. Ein Beispiel hierfür: Ein Patient bleibt im Bett (Versorgungsstellenkontakt), aber ein Fachabteilungswechsel geschieht, da die Diagnose über eine Fachabteilung (Onkologie) läuft, dann aber der Wechsel zur Fachabteilung Chirurgie (neuer Abteilungskontakt) notwendig wird. 
Für einen solchen Fall gilt: Bei einem Fachabteilungswechsel SOLL ein neuer Versorgungsstellenkontakt angelegt werden. Der alte Versorgungsstellenkontakt endet mit dem Ende des Abteilungskontaktes (Begründung für diese Anforderung ist die Wahrung einer 1 zu N Kardinalität zwischen den Abteilungs- und Versorgungsstellen-Kontakten; dabei bleiben verschiedene Versorgungsstellenkontakte auf einen Abteilungskontakt weiterhin möglich, z.B. bei Bettenverlegung, etc.).

---

**Constraints**

Folgende FHIRPath-Constraints sind im Profil zu beachten:

@``` from StructureDefinition where url = 'https://gematik.de/fhir/isik/v3/Basismodul/StructureDefinition/ISiKKontaktGesundheitseinrichtung' for differential.element.constraint select key, severity, human, expression```

Weitere Hinweise zu den Abgrenzungen der Begrifflichkeiten Fall und Kontakt finden sie unter [Deutsche Basisprofile - Abschnitt Ambulanter/stationärer Fall / Kontakt (Encounter)](https://ig.fhir.de/basisprofile-de/1.2.0/Ressourcen-AmbulanterStationaererFall.html).

---

**Terminology Bindings**

@```
from StructureDefinition
where url in ('https://gematik.de/fhir/isik/v3/Basismodul/StructureDefinition/ISiKKontaktGesundheitseinrichtung' )
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
