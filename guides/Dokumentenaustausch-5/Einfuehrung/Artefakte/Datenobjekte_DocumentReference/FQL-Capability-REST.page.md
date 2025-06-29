<fql output="inline">
from
    CapabilityStatement
where
    url = %capability
for rest.resource.where(supportedProfile = %canonical)
select
{
     documentation
}
</fql>

<fql>
from
    CapabilityStatement
where
    url = %capability
for rest.resource.where(supportedProfile = %canonical).interaction
select
{
     Interaktion: code,
     Hinweise: documentation,
     Verbindlichkeit: extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value
}
</fql>