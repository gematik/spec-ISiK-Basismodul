---
topic: ImplementationGuide-markdown-Artifacts
---

Auf dieser Seite befindet sich eine Liste der FHIR-Artefakte, welche im Rahmen dieses Implementation Guide definiert werden.

### MII-Profile - Vitalparameter für die Intensiv- und Normalversorgung

An dieser Stelle werden Festlegungen zu Profilen getroffen, die für die Intensiv- sowie Normalversorgung vorgesehen sind und dem Kontext des Moduls zur Intensivmedizinische Versorgung (ICU) der MII entstammen.

Datenobjekte, die der Rolle  *VitalSign Standard Source* zugeordnet sind, werden hier nicht als eigenständige Profile geführt, sondern sind dem entsprechenden [Implementierungsleitfaden](https://gemspec.gematik.de/ig/fhir/isik/vitalparameter/6.0.0-rc/index.html) zu entnehmen.

#### Motivation zur Übernahme
Im Rahmen des [Moduls zur Intensivmedizinische Versorgung (ICU) der MII](https://www.medizininformatik-initiative.de/Kerndatensatz/Modul_Intensivmedizin/MonitoringundVitaldaten.html) hat die MII Profile bereitgestellt, die sich für die Verarbeitung von Vitalparametern im Rahmen der intensiv- sowie normalstationären Versorgung eignen.
Die Profile der MII sind medizinisch qualitätsgesichert und weisen eine feingranulare Kodierung vor.

Durch die Übernahme der Profile der MII und Abbildung auf das ISIK-Setting, können feingranular kodierte Profile zu Vitalparametern im Krankenhauskontext genutzt werden - für die Normal- wie für die intensivmedizinische Versorgung.

#### Designentscheidung
- Maximale Kardinalitäten von Coding Slices wurden von der MII übernommen
- Die Profil-Eigenschaften der MII-Profile, die den bisherigen, existenten Profilen in ISiK entsprechen, wurden in die existenten Profile des [generischen Implementierungsleitfadens Vitalparemeter](https://gemspec.gematik.de/ig/fhir/isik/vitalparameter/6.0.0-rc/index.html) übernommen.

### Datenobjekte aus der Basis

Folgende Datenobjekte aus dem Modul [ISiK Basis](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc/index.html) werden in diesem Modul verwendet: 
* [Patient](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc/StructureDefinition-ISiKPatient.html)
* [Kontakt/Fall (Encounter)](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc/StructureDefinition-ISiKKontaktGesundheitseinrichtung.html)
* [Person im Gesundheitsberuf](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc/StructureDefinition-ISiKPersonImGesundheitsberuf.html)

Die Verwendung der genannten Ressourcen in diesem Modul bedeutet:
Wenn ein Profil aus diesem Modul auf die genannten Datenobjekte aus dem Basismodul referenziert, dann MÜSSEN die referenzierten FHIR-Ressourcen im ISiK-Kontext konform zu Vorgaben an diese Ressourcen aus dem Basismodul sein (Profilkonformität). In diesem Zusammenhang sind insbesondere die Vorgaben zur [Herstellung des Patienten- und Encounter-Kontextes](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc/Patient-Besuch-Kontext.html) zu beachten.

Die konkreten Vorgaben zu Interaktionen und Abhängigkeiten zwischen Modulen werden noch präzisiert.

### Profile aus dem ISiK Support Modul Labor

Zur Unterstützung der Überleitung zwischen intensivmedizinischer und normalstationärer Versorgung (siehe Use Cases), MÜSSEN alle
Profile aus dem [ISIK Support Modul Labor](https://gemspec.gematik.de/ig/fhir/isik/labor/6.0.0-rc/index.html) von einem bestätigungsrelevanten System implementiert werden, sofern das System diese Daten verwaltet (z.B. in Form einer Übernahme aus einem Laborinformationssystem).

#### Profilhierarchie 

Die folgende Darstellung zeigt die Vererbungsstruktur aller ICU-Profile in diesem Modul:

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="Ableitungshierarchie_vereinfacht_ICU.drawio.svg" alt="Ableitungshierarchie_vereinfacht_ICU" style="width: 100%;">
    </div>
</figure>
----------

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

