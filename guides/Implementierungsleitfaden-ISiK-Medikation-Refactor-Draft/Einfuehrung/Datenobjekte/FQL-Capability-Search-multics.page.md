---
topic: FQL-Capability-Search-multics
---

<fql>
from
    CapabilityStatement
where
    url = %capability1
or
    url = %capability2
or
    url = %capability3
or
    url = %capability4
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
or
    url = %capability3
select
    Name: name,
    join for rest.resource.where(%canonical in supportedProfile)
    select
    {
        Include: searchInclude,
        ReverseInclude: searchRevInclude
    }
</fql>
