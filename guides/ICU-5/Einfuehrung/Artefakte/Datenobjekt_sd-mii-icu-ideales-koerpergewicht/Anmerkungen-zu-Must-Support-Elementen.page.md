---
topic: SD_MII_ICU_Ideales_Koerpergewicht-MS
canonical: https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-ideales-koerpergewicht
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

