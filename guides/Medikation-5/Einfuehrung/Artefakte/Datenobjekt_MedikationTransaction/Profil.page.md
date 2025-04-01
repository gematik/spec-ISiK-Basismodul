---
topic: ISiKMedikationTransaction-Profil
canonical: https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationTransaction
---
## {{link}}

Hinweis: Die Regeln aus dem Modul [ISiK Basis Stufe 4](https://simplifier.net/guide/isik-basis-v4) für die Verarbeitung Document-Bundles, treffen hier nicht zu, da es sich um den Bundle-Typ Transaction handelt.

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

### Constraints/Invarianten
<fql headers="true">
from 
    StructureDefinition 
where 
    url = %canonical 
for 
    differential.element.constraint 
select Name: key, Schweregrad: severity, Beschreibung: human, Ausdruck: expression
</fql>

### Terminology-Bindings
<fql headers="true">
from 
    StructureDefinition
where 
    url = %canonical
   
for 
    differential.element
    where 
        binding.exists()
    select
        Element: id, Staerke: binding.strength, ValueSet: binding.valueSet
</fql>

<!--### Mappings

<fql>
      from StructureDefinition
      where url = %canonical
      for differential.element 
      select
        'Ziel: DocumentReference': id,
        join mapping.where(identity = 'CompositionDocumentReferenceMapping')
          { 'Quelle: Document-Bundle': map, Hinweis: comment } 
</fql>-->


Transaction-Bundles werden nicht persistiert, sondern ausschließlich im Kontext von FHIR-Transaktionen verwendet, vgl. [FHIR RESTful API - Batch/Transaction](https://www.hl7.org/fhir/R4/http.html#transaction).