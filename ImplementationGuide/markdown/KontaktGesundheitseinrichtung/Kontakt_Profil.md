### Profil

@```
from StructureDefinition where url = 'https://gematik.de/fhir/isik/v3/Basismodul/StructureDefinition/ISiKKontaktGesundheitseinrichtung' select Name: name, Canonical: url
```

{{tree:https://gematik.de/fhir/isik/v3/Basismodul/StructureDefinition/ISiKKontaktGesundheitseinrichtung, hybrid}}

**Bei Abbildung von Versorgungsstellenkontakten**

Es ist ein üblicher Fall, dass die Dauer eines Versorgungsstellenkontaktes die eines Abteilungskontaktes übersteigt. Ein Beispiel hierfür: Ein Patient bleibt im Bett (Versorgungsstellenkontakt), aber ein Fachabteilungswechsel geschieht, da die Diagnose über eine Fachabteilung (Onkologie) läuft, dann aber der Wechsel zur Fachabteilung Chirurgie (neuer Abteilungskontakt) notwendig wird. 
Für einen solchen Fall gilt: 

Im Falle eines Fachabteilungswechsels legt ein System einen neuen Abteilungskontakt an. Bestehende Versorgungsstellenkontakt SOLLEN nicht in ihrer Relation (.partOf) zum Abteilungskontakt modifiziert werden. Hingegen SOLL das System ein oder mehrere Versorgungsstellenkontakte erzeugen und mit dem neu angelegten Abteilungskontakt in Verbindung setzen. 

Hinweis: Ein Versorgungsstellenkontakt endet zugleich nicht notwendigerweise mit einem Fachabteilungswechsel.

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
