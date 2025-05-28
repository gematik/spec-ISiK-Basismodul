---
topic: BerichtSubsystem-Interaktionen
canonical: https://gematik.de/fhir/isik/StructureDefinition/ISiKBerichtSubSysteme
capability: https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementCompositionKonsumentenRolle
---
### Interaktionen

Auf dem Ressourcentyp `Composition` sind keine Interaktionen definiert.  
Zur Beschreibung der Berichtsübermittlung, siehe {{pagelink:DatenübermittlungSubsystem}}

<fql output="inline">
from
    CapabilityStatement
where
    url = %capability
for document
select
    documentation
with
    no header
</fql>


