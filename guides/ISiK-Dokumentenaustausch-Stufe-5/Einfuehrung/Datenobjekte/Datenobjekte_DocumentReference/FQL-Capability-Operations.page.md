<fql>
from
    CapabilityStatement
where
    url = %capability
for rest.resource.where(supportedProfile = %canonical).operation
select
{
     Name: name,
     Spezifikation: definition,
     Verbindlichkeit: extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value
}
</fql> 