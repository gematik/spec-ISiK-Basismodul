---
topic: ISiKMedikament-Interaktionen
canonical: https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikament
capability1: https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementMedikamentRolle
---
### Interaktionen

<fql output="inline">
from
    CapabilityStatement
where
    url = %capability1
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
   
</tabs>


