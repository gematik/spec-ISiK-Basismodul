<fql>
from
    CapabilityStatement
where
    url = %capability
for rest.resource.where(type = %resType).searchParam
select
{
     Parameter: name,
     Typ: type,
     Verbindlichkeit: extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value
}
</fql>