---
topic: Bundle_Profile
canonical: https://gematik.de/fhir/isik/StructureDefinition/ISiKDokumentenSuchergebnisse
---
## {{link}}

<fql output="inline">
from
	StructureDefinition
where
	url = %canonical
select
	description
with
  no header
</fql>

### Metadaten

<fql output="transpose" headers="true">
from
	StructureDefinition
where
	url = %canonical
select
	Canonical: url, Status: status, Version: version, Basis: baseDefinition
</fql>

### Inhalt

<tabs>
  <tab title="Darstellung">{{tree, buttons}}</tab>
  <tab title="XML">{{xml}}</tab>
  <tab title="JSON">{{json}}</tab>
  <tab title="Link">{{link}}</tab>
</tabs>

<!--### Constraints/Invarianten
<fql headers="true">
from 
    StructureDefinition 
where 
    url = %canonical 
for 
    differential.element.constraint 
select Name: key, Schweregrad: severity, Beschreibung: human, Ausdruck: expression
</fql>-->
