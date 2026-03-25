Auf dieser Seite befindet sich eine Liste der FHIR-Artefakte, welche im Rahmen dieses Implementation Guide definiert werden.

Folgende Datenobjekte aus dem Modul [ISiK Basis Stufe 5](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc/index.html) werden in diesem Modul verwendet:
* [Patient](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc/StructureDefinition-ISiKPatient.html)
* [Practitioner](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc/StructureDefinition-ISiKPersonImGesundheitsberuf.html)
* [Encounter](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc/StructureDefinition-ISiKKontaktGesundheitseinrichtung.html)

Die Verwendung der genannten Ressourcen in diesem Modul bedeutet:
Wenn ein Profil aus diesem Modul auf die genannten Datenobjekte aus dem Basismodul referenziert, dann MÜSSEN die referenzierten FHIR-Ressourcen im ISiK-Kontext konform zu Vorgaben an diese Ressourcen aus dem Basismodul sein (Profilkonformität).

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


{% include artifacts-table-generator.html resourceType="ValueSet" %}
<div><figcaption><strong>Tabelle:</strong> Value Sets</figcaption></div>


#### Code Systems

{% include artifacts-table-generator.html resourceType="CodeSystem" %}
<div><figcaption><strong>Tabelle:</strong> Code Systems</figcaption></div>

### Beispiele

{% include example-list-generator-isik.html %}
<div><figcaption><strong>Tabelle:</strong> Beispiel-Instanzen</figcaption></div>

