---
topic: SD_MII_ICU_Systemischer_Vaskulaerer_Widerstandsindex-MS
canonical: https://gematik.de/fhir/isik/StructureDefinition/sd-mii-icu-systemischer-vaskulaerer-widerstandsindex
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

