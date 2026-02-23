Auf dieser Seite befindet sich eine Liste der FHIR-Artefakte, welche im Rahmen dieses Implementation Guide definiert werden.

Folgende Datenobjekte aus dem Modul ISiK Basis werden in diesem Modul verwendet:

   * Patient - https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Artefakte/Datenobjekte_Patient
   * Kontakt/Fall (Encounter) - https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Artefakte/Datenobjekte_Kontakt
   * Binary - https://simplifier.net/guide/isik-basis-stufe-5/Einfuehrung/Artefakte/Datenobjekte_Binary

Die Verwendung der genannten Ressourcen in diesem Modul bedeutet: Wenn ein Profil aus diesem Modul auf die genannten Datenobjekte aus dem Basismodul referenziert, dann MÜSSEN die referenzierten FHIR-Ressourcen im ISiK-Kontext konform zu Vorgaben an diese Ressourcen aus dem Basismodul sein (Profilkonformität). Die konkreten Vorgaben zu Interaktionen und Abhängigkeiten zwischen Modulen werden noch präzisiert.

Darüber hinaus gelten die [übergreifenden Festlegungen zu FHIR-Artefakten aus dem Basimodul](https://gemspec.gematik.de/fhir/ig/TODO/LINK/IG). 

### CapabilityStatements

#### Akteure

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

