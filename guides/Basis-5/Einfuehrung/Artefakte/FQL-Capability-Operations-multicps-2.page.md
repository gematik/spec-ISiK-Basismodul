---
topic: FQL-Capability-Operations-multicps-2
---

<fql>
from
    CapabilityStatement
where
    url = %capability1
or
    url = %capability2
select
    Name: name,
    join for rest.resource.where(%canonical in supportedProfile).operation
    select
    {
        Name: name,
        Spezifikation: definition,
        Verbindlichkeit: extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value
    }
</fql> 