---
topic: FQL-Capability-REST
---
<fql output="inline">
from
    CapabilityStatement
where
    url = %capability-1
or
    url = %capability-2
or
    url = %capability-3
for rest.resource.where(%canonical in supportedProfile)
select
{
     documentation
}
</fql>

<fql>
from
    CapabilityStatement
where
    url = %capability-1
or
    url = %capability-2
or
    url = %capability-3
for rest.resource.where(%canonical in supportedProfile).interaction
select
{
     Interaktion: code,
     Hinweise: documentation,
     Verbindlichkeit: extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value
}
</fql>