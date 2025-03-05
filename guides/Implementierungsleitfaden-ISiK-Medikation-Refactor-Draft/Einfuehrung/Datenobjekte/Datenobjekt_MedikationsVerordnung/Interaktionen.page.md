---
topic: ISiKMedikationsVerordnung-Interaktionen
canonical: https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsVerordnung
---
### Interaktionen

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
    documentation
with
    no header
</fql>

<tabs>
    <tab title="Interaktionen"> 
        {{page:FQL-Capability-REST}}
    </tab>
    <tab title="Suchparameter">
        {{page:FQL-Capability-Search}}
    </tab>
    <tab title="Operationen">
        {{page:FQL-Capability-Operations}}
    </tab>
    <tab title="Link">
        {{pagelink:CapabilityStatement}}
    </tab>
</tabs>



