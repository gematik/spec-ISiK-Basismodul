---
topic: Bundle_Interaktionen
canonical: https://gematik.de/fhir/isik/StructureDefinition/ISiKBerichtBundle
capability1: https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementCompositionKonsumentenRolle
---
### Interaktionen

<fql output="inline">
from
    CapabilityStatement
where
    url = %capability1
or 
    url = %capability2
select
    Name: name,
    join for rest.resource.where(%canonical in supportedProfile)
    select
        documentation
with
    no header
</fql>

<tabs>
    <tab title="Interaktionen"> 
        {{page:FQL-Capability-REST-multicps-2}}
    </tab>
    <tab title="Suchparameter">
        {{page:FQL-Capability-Search-multicps-2}}
    </tab>
    <tab title="Operationen">
        {{page:FQL-Capability-Operations-multicps-2}}
    </tab>
</tabs>



