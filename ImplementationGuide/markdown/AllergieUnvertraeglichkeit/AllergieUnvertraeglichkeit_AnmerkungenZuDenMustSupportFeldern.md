### Anmerkungen zu den Must-Support-Feldern

@```from
	StructureDefinition
where
    url = 'https://gematik.de/fhir/isik/v4/Medikation/StructureDefinition/ISiKAllergieUnvertraeglichkeit'
for differential.element
where mustSupport = true
  and short.exists()
select
	Feldname: id, Kurzbeschreibung: short, Hinweise: comment
```
