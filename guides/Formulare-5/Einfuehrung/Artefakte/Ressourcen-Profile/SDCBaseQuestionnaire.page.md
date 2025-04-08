---
canonical: https://gematik.de/fhir/isik//StructureDefinition/ISiKFormular
capability: https://gematik.de/fhir/isik/CapabilityStatement/ISiKFormularClient
resType: Questionnaire
expand: 1
---

## {{link}}

### Metadaten

<fql output="transpose" headers="true">
using closure
from
	StructureDefinition
where
	url = %canonical
select
	Canonical: url, Status: status, Version: version, Basis: baseDefinition
</fql>



### Inhalt

<!-- im Beschreibungs-Tab werden die Inhalte StructureDefintion.description sowie ElementDefinition.short und .comment der mit einem MS-Flag markierten Elemente ausgegeben-->
<tabs>
  <tab title="Darstellung">{{tree, buttons}}</tab>
  <tab title="Beschreibung"> 
    {{page:Übersicht/Artefakte/Ressourcen-Profile/FQL-Beschreibung.page.md}}
  </tab>
  <tab title="XML">{{xml}}</tab>
  <tab title="JSON">{{json}}</tab>
  <tab title="Link">{{link}}</tab>
</tabs>

<!-- TODO: FQL funktioniert noch nicht wie vorgesehen, da nur die Binding des Differentials ausgegeben werden
### Terminology-Bindings

<fql headers="true">
from 
    StructureDefinition
where 
    url = %canonical
for 
    snapshot.element
    where 
        mustSupport = true and binding.exists()
    select
        Element: binding.path, Staerke: binding.strength, ValueSet: binding.valueSet
</fql>
-->

### Constraints/Invarianten
<fql headers="true">
from StructureDefinition where url = %canonical for differential.element.constraint select Name: key, Schweregrad: severity, Beschreibung: human, Ausdruck: expression
</fql>

### RestFul API

<tabs>
    <tab title="Interaktionen"> 
        {{page:Übersicht/Artefakte/Ressourcen-Profile/FQL-Capability-REST.page.md}}
    </tab>
    <tab title="Suchparameter">
        {{page:Übersicht/Artefakte/Ressourcen-Profile/FQL-Capability-Search.page.md}}
    </tab>
    <tab title="Operationen">
        {{page:Übersicht/Artefakte/Ressourcen-Profile/FQL-Capability-Operations.page.md}}
    </tab>
    <tab title="Link">
    <!-- Achtung: Link muss noch händisch gesetzt werden, hier funktioniert der Platzhalter %capability nicht!-->
        {{link:https://gematik.de/fhir/isik//CapabilityStatement/ISiKFormularClient}}
    </tab>
</tabs>

### Beispiele

<!-- ausgewählte Seiten aus Kapitel /Artefakte/Beispiele hier einbetten-->

{{page:Startseite/Artefakte/Beispiele/Patient--Minimaldatensatz-1.page.md}}
{{page:Startseite/Artefakte/Beispiele/Patient--Minimaldatensatz-2.page.md}}


