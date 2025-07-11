---
topic: ISiKMedikationsVerordnung-Interaktionen
canonical: https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsVerordnung
capability: https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementMedikationVerordnungRolle
---
### Interaktionen

<fql output="inline">
from
    CapabilityStatement
where
    url = %capability
for rest.resource.where(%canonical in supportedProfile)
select
    documentation
with
    no header
</fql>

<tabs>
    <tab title="Interaktionen"> 
        {{page:FQL-Capability-REST-multicps}}
    </tab>
    <tab title="Suchparameter">
        {{page:FQL-Capability-Search-multicps}}
    </tab>
    <tab title="Operationen">
        {{page:FQL-Capability-Operations-multicps}}
    </tab>
    <tab title="Link">
        {{pagelink:Einfuehrung/Artefakte/CapabilityStatements}}
    </tab>
</tabs>


