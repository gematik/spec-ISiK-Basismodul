---
topic: DocumentReference_Interaktionen
capability: https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementDokumentenaustauschServer
canonical: https://gematik.de/fhir/isik/StructureDefinition/ISiKDokumentenMetadaten
---
### Interaktionen

<fql output="inline">
from
    CapabilityStatement
where
    url = %capability
for rest.resource.where(supportedProfile = %canonical)
select
    documentation
with
    no header
</fql>

<tabs>
    <tab title="Interaktionen"> 
        {{page:Einfuehrung/Datenobjekte/Datenobjekte_DocumentReference/FQL-Capability-REST.page.md}}
    </tab>
    <tab title="Suchparameter">
        {{page:Einfuehrung/Datenobjekte/Datenobjekte_DocumentReference/FQL-Capability-Search.page.md}}
    </tab>
    <tab title="Operationen">
        {{page:Einfuehrung/Datenobjekte/Datenobjekte_DocumentReference/FQL-Capability-Operations.page.md}}
    </tab>
    <tab title="Link">
    <!-- Achtung: Link muss noch händisch gesetzt werden, hier funktioniert der Platzhalter %capability nicht!-->
        {{pagelink:CapabilityStatement}}
    </tab>
</tabs>



