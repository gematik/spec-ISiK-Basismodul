---
topic: ISiKMedikationsVerabreichung-Interaktionen
canonical: https://gematik.de/fhir/isik/StructureDefinition/ISiKMedikationsVerabreichung
capability1: https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementMedikationVerabreichungRolle
---
### Interaktionen

<fql output="inline">
from
    CapabilityStatement
where
    url = %capability1
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
   
</tabs>



