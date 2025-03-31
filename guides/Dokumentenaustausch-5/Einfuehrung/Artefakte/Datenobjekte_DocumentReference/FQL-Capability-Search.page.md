<fql>
from
    CapabilityStatement
where
    url = %capability
for rest.resource.where(supportedProfile = %canonical).searchParam
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
    url = %capability
for rest.resource.where(supportedProfile = %canonical)
select
{
     Include: searchInclude,
     ReverseInclude: searchRevInclude
}
</fql>
