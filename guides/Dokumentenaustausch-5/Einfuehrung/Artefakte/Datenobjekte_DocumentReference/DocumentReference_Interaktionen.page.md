---
topic: DocumentReference_Interaktionen
capability: https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementDokumentenaustauschServer
capability2: https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementDokumentenverwaltungRolle
canonical: https://gematik.de/fhir/isik/StructureDefinition/ISiKDokumentenMetadaten
---
### Interaktionen

<fql output="inline">
from
    CapabilityStatement
where
    url = %capability 
or
    url = %capability2
for rest.resource.where(supportedProfile = %canonical)
select
    documentation
with
    no header
</fql>

<tabs>
    <tab title="Interaktionen"> 
        {{page:FQL-Capability-REST-milticps-2}}
    </tab>
    <tab title="Suchparameter">
        {{page:FQL-Capability-Search-milticps-2}}
    </tab>
    <tab title="Operationen">
        {{page:FQL-Capability-Operations-milticps-2}}
    </tab>
    <tab title="Link">
    <!-- Achtung: Link muss noch händisch gesetzt werden, hier funktioniert der Platzhalter %capability nicht!-->
        {{pagelink:CapabilityStatement}}
    </tab>
</tabs>


