---
topic: SD_MII_ICU_Koerpertemperatur_Nasen_Rachen_Raum-MS
canonical: https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-koerpertemperatur-nasen-rachen-raum
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

