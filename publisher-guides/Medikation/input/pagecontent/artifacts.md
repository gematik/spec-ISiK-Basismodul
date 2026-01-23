Auf dieser Seite befindet sich eine Liste der FHIR-Artefakte, welche im Rahmen dieses Implementation Guide definiert werden.

### Terminologien

#### Value Sets

Die folgenden Value Sets sind für die Audit-Event-Service-Funktionalitäten festgelegt.

{% include artifacts-table-generator.html resourceType="ValueSet" %}
<div><figcaption><strong>Tabelle:</strong> Value Sets</figcaption></div>


#### Code Systems

{% include artifacts-table-generator.html resourceType="CodeSystem" %}
<div><figcaption><strong>Tabelle:</strong> Code Systems</figcaption></div>


### ePA-weit geltende Spezifikation

Die Capability Statements dienen als ePA-weit gültige Referenz für die Definition der FHIR RESTful-Schnittstellen. Die Capability Statements legen grundlegende Anforderungen und Verhaltensweisen fest und bilden die Basis für alle spezifischen Ausprägungen in nachfolgenden Capability Statemens.

#### Basis-Capability-Statement für FHIR Data Service

{% include artifacts-table-generator.html render="CapabilityStatement/epa-basic-server" %}
<div><figcaption><strong>Tabelle:</strong> Capability Statement <i>ePA Basic Server</i></figcaption></div>


#### Basis-Capability-Statement für ePA-Clients bei FHIR-Data-Service-Nutzung

{% include artifacts-table-generator.html render="CapabilityStatement/epa-basic-client" %}
<div><figcaption><strong>Tabelle:</strong> Capability Statement <i>ePA Basic Client</i></figcaption></div>


### Systemverhalten

#### Capability Statements

Ein Capability Statement beschreibt die Anforderungen und Fähigkeiten, die ein Server oder Client für die konforme Implementierung eines FHIR Data Service umsetzen muss. Es handelt sich um eine Konformitätserklärung, die spezifiziert, welche Ressourcen, Interaktionen und Suchparameter das ePA-Aktensystem für einen FHIR Data Service unterstützen muss. Die folgenden Capability Statements sind definiert:

{% capture capabilitystatements %}
CapabilityStatement/epa-audit-event-server,
CapabilityStatement/epa-audit-event-client,
CapabilityStatement/epa-patient-server,
CapabilityStatement/epa-patient-client
{% endcapture %}
{% include artifacts-table-generator.html render=capabilitystatements %}
<div><figcaption><strong>Tabelle:</strong> Capability Statements</figcaption></div>


### Ressourcenprofile

{% capture profiles %}
StructureDefinition/epa-patient,
StructureDefinition/epa-auditevent,
StructureDefinition/epa-activity-provenance
{% endcapture %}
{% include artifacts-table-generator.html render=profiles %}
<div><figcaption><strong>Tabelle:</strong> Ressourcenprofile</figcaption></div>


### Datentypen

{% capture datatypes %}
StructureDefinition/identifier-epa-fhir-data-service
{% endcapture %}
{% include artifacts-table-generator.html render=datatypes %}
<div><figcaption><strong>Tabelle:</strong> Datentypen</figcaption></div>


### Erweiterungen (Extension Definitions)

{% capture extensions %}
StructureDefinition/epa-healthcare-facility-type-extension
{% endcapture %}
{% include artifacts-table-generator.html render=extensions %}
<div><figcaption><strong>Tabelle:</strong> Extension Definitions</figcaption></div>


### Beispielinstanzen

{% include example-list-generator.html %}