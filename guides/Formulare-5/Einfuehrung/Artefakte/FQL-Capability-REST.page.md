<fql>
from
    CapabilityStatement
where
    url = %capability
for rest.resource.where(type = %resType).interaction
select
{
     Interaktion: code,
     Typ: type,
     Verbindlichkeit: extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value
}
</fql>