---
topic: FQL-Capability-Search-multicps-2
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
    join for rest.resource.where(%canonical in supportedProfile).searchParam
    select
    {
        Parameter: name,
        Typ: type,
        Verbindlichkeit: extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value,
        Hinweise: documentation
    }
</fql>

#### (Reverse-)Include
<fql>
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
    {
        Include: searchInclude,
        ReverseInclude: searchRevInclude
    }
</fql>
