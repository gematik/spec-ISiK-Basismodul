---
topic: SD_MII_ICU_Koerpergewicht_Percentil_Altersabhaengig-MS
canonical: https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpergewicht-percentil-altersabhaengig
---

### Anmerkungen zu Must-Support-Feldern

<fql>
from
	StructureDefinition
where 
    url = %canonical
for differential.element
where mustSupport = true
select
	Feldname: id, Kurzbeschreibung: short, Hinweise: comment
</fql>

