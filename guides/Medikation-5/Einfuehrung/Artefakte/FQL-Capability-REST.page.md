---
topic: FQL-Capability-REST
---
<fql output="inline">
from
    CapabilityStatement
where
    url = %capability1
or
    url = %capability2
or
    url = %capability3
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
    url = %capability1
or
    url = %capability2
or
    url = %capability3
for rest.resource.where(%canonical in supportedProfile).interaction
select
{
     Interaktion: code,
     Hinweise: documentation,
     Verbindlichkeit: extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value
}
</fql>