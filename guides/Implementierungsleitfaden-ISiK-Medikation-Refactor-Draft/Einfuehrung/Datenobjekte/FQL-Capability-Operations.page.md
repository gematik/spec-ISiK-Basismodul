---
topic: FQL-Capability-Operations
---

<fql>
from
    CapabilityStatement
where
    url = %capability-1
or
    url = %capability-2
or
    url = %capability-3
for rest.resource.where(%canonical in supportedProfile).operation
select
{
     Name: name,
     Spezifikation: definition,
     Verbindlichkeit: extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value
}
</fql> 