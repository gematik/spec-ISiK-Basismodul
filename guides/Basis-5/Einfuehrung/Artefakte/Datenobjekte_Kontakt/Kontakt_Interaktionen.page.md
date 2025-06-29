---
topic: Encounter_Interaktionen
canonical: https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung
capability1: https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementStammdatenRolle
capability2: https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementErweiterteStammdatenRolle
capability3: https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementLeistungserbringerRolle
---
### Interaktionen

<fql output="inline">
from
    CapabilityStatement
where
    url = %capability1
or
    url = %capability2
or
    url = %capability3
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
        {{page:FQL-Capability-REST-multicps-3}}
    </tab>
    <tab title="Suchparameter">
        {{page:FQL-Capability-Search-multicps-3}}
    </tab>
    <tab title="Operationen">
        {{page:FQL-Capability-Operations-multicps-3}}
    </tab>
    <tab title="Link">
        {{pagelink:CapabilityStatement-multicps-3}}
    </tab>
</tabs>



