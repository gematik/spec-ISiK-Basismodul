Auf dieser Seite befindet sich eine Liste der FHIR-Artefakte, welche im Rahmen dieses Implementation Guide definiert werden.

Es gelten zur Umsetzung der basalen Funktionalität und weiterer Use Cases in ISiK die Festlegungen zu CapabilityStatements [(Akteure und Rollen)](Erlaeuterung-Akteurs-und-Rollenmodell.md) sowie Datenstrukturen entsprechend der folgenden Abschnitte.

Softwareherstellern steht es frei, über die hier spezifizierten Profiltypen hinaus weitere FHIR-Profile zu nutzen, zu implementieren oder zu spezifizieren und über eine API bereitzustellen. Wir bitten in solchen Fällen jedoch um eine Meldung entsprechender Bedarfe über das [ISiK Anfrageportal](https://service.gematik.de/servicedesk/customer/portal/16), damit wir über mögliche Leerstellen der ISiK-Spezifikation in grundlegenden API-Funktionalitäten zur Abdeckung spezifischer Workflows informiert werden.

### CapabilityStatements

#### Akteure

Das CapabilityStatement mit der Kennzeichnung "Expanded" dient der direkten Übersicht aller zu implementierender Interaktionen und Profile.

{% include artifacts-table-generator-isik.html resourceType="CapabilityStatement" nameContains="Akteur" withPurpose=true %}
<div><figcaption><strong>Tabelle:</strong> Capability Statements - Akteure</figcaption></div>

#### Rollen

{% include artifacts-table-generator-isik.html resourceType="CapabilityStatement" nameContains="Rolle" withPurpose=true %}
<div><figcaption><strong>Tabelle:</strong> Capability Statements - Rollen</figcaption></div>

### Ressourcenprofile

{% include artifacts-table-generator-isik.html resourceType="StructureDefinition" %}
<div><figcaption><strong>Tabelle:</strong> Ressourcenprofile</figcaption></div>

### Terminologien

#### Value Sets

Die folgenden Value Sets sind für die Audit-Event-Service-Funktionalitäten festgelegt.

{% include artifacts-table-generator.html resourceType="ValueSet" %}
<div><figcaption><strong>Tabelle:</strong> Value Sets</figcaption></div>


#### Code Systems

{% include artifacts-table-generator.html resourceType="CodeSystem" %}
<div><figcaption><strong>Tabelle:</strong> Code Systems</figcaption></div>

### Beispiele

{% include example-list-generator.html %}
<div><figcaption><strong>Tabelle:</strong> Beispiel-Instanzen</figcaption></div>

