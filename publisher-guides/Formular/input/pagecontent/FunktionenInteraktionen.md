<div style="width: 700px;">
{% include akteure.svg %}
</div>

### Launch eines Formular-Renderers

Der Aufruf eines Formular-Renderes kann mit verschiedenen Methoden erfolgen.

#### Fremdaufruf
Die Methode des Fremdaufrufes versucht eine Brückentechnologie bereitzustellen, die es heutigen Anwendungssystemen, die noch nicht über eine SMART-Launch-Funktionalität verfügen, dennoch mit einfachsten Mitteln einen Formular-Renderer integrieren zu können. Der Fremdaufruf ist jedoch bewusst  nur rudimentär definiert, da mittelfristig die Umstellung auf den SMART-App-Launch dringendst empfohlen wird.

Beim Fremdaufruf muss sichergestellt sein, dass ein adäquater Sicherheitsmechanismus zum Einsatz kommt, damit der Aufruf nicht bestehende Berechtigungsstrukturen außer Kraft setzt.

Die vorgeschlagenen Übergabe-Parameter sind:

- [obligatorisch] Patientennummer (gängig PID; Identifier am [ISiKPatient](https://gematik.de/fhir/isik/StructureDefinition/ISiKPatient))
    - Ist für die Herstellung eines passenden Launch-Context nach SDC unabdingbar
- [optional] Abrechnungsnummer (gängig Fallnummer; Identifier am [ISiKAbrechnungsfall](https://gematik.de/fhir/isik/StructureDefinition/ISiKAbrechnungsfall))
    - Mit der Abrechnungsnummer kann eingeschränkt werden, welche Encounter für die Extraktion von Daten ausgewählt werden können. Der richtige Encounter muss gemäß der Beschreibungen in [ISiK Basis Stufe 5: Herstellung von Patient- und Encounterkontext](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc/Patient-Besuch-Kontext.html) manuell gewahlt werden
- [optional] Aufnahmenummer (Identifier am [ISiKKontaktGesundheitseinrichtung](https://gematik.de/fhir/isik/StructureDefinition/ISiKKontaktGesundheitseinrichtung))
    - Mit der Aufnahmenummer kann der richtige Encounter bereits mit übergeben werden
- [optional] Canonical der [FormularDefinition](StructureDefinition-ISiKFormularDefinition.html)
    - Mittels der Canonical einer [FormularDefinition](StructureDefinition-ISiKFormularDefinition.html) kann der richtige Fragebogen schon vorausgewählt werden
- [obliagtorisch] URL des FHIR-Endpunktes, der für die Ermittlung von Daten zur Vorbelegung sowie die Rückübermittlung der [FormularDaten](StructureDefinition-ISiKFormularDaten.html) verwendet werden soll.  


#### SMART-App-Launch
Der standardisierte Aufruf einer beliebigen webbbasierten Applikation aus einem klinischen Primärsystem heraus wird im Modul ISiK-Connect beschrieben und sollte für den Aufruf eines Formular-Renderers mit Übergabe eines Benutzer-, Patienten- und Encounterkontextes präferiert zum Einsatz kommen.

#### Stand-Alone-Launch
Beim Stand-Alone Launch startet der Benutzer den Formular-Renderer ohne Kontext.  Der Patienten- und Encounter-Kontext wird im Formular-Renderer gemäß der Beschreibungen in [ISiK Basis Stufe 5: Herstellung von Patient- und Encounterkontext](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc/Patient-Besuch-Kontext.html) vom Anwender manuell getroffen.

Beim Stand-Alone-Launch muss sichergestellt sein, dass ein adäquater Sicherheitsmechanismus zum Einsatz kommt, damit bestehende Berechtigungsstrukturen nicht außer Kraft gesetzt werden.

### Interaktion: FormularDefinitionsVerwaltung
Die Interaktion FormularDefinitionsVerwaltung dient der Bereitstellung von FormularDefinitionen.
In der ersten Ausbaustufe dieses Moduls wird diese Funktionalität als integraler Bestandteil von FormularRenderern angenommen. Perspektivisch sollten [FormularRenderer](Akteure.html#FormularRenderer) jedoch in der Lage sein, auch auf externe Quellen, die als FormularDefinitionBereitsteller agieren, zugreifen zu können, beispielsweise auf nationale Formular-Verzeichnisse oder Formulardefintionen, die vom aufrufenden System (FormularLauncher) bereitgestellt werden.

<div>
{% include formDefVerwaltung.svg %}
</div>

### Interaktion: FormularDatenVorbelegung

Ein FormularRenderer prüft eine [FormularDefinition](StructureDefinition-ISiKFormularDefinition.html) auf entsprechende Annotationen für die automatische Vorbelegung.
Dies kann entweder mittels der [Expression based population](https://build.fhir.org/ig/HL7/sdc/populate.html#exp-pop)  
oder der [Observation based prepopulation](https://build.fhir.org/ig/HL7/sdc/populate.html#obs-pop) geschehen.

<div>
{% include formDatVorbelegung.svg %}
</div>

Die folgenden Core und SDC Extensions sind für die Vorbelegung in dieser Stufe relevant. Unter [Extensions](Extensions.html) sind mehr Informationen dazu zu finden.

- [Launch Contexts](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-launchContext.html)
- [Initial Expression](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-initialExpression.html)
- [Obervation link period](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-observationLinkPeriod.html)

### Funktion: FormularDatenValidierung

Bei der Formulardatenvalidierung handelt es sich formal nicht um eine *Inter*aktion, da
diese derzeit als eine Aktion angenommen wird, die vom [FormularRenderer](Akteure.html#FormularRenderer) eigenständig ausgeführt wird.
Gemäß FHIR-Spezifikation ist die Validierung jedoch auch als ein Service mittels der $validate-Operation implementierbar.

In künftigen Ausbaustufen des ISiK-Formular-Moduls ist auch eine Einbindung [externer Validierungs-Services](https://hl7.org/fhir/R4/validation.html#op) denkbar. 
Daher wird diese Funktion bereits in dieser Stufe als *potentielle* Interaktion betrachtet. 

Die Datenextraktion wird in dieser Stufe zunächst ausschließlich von [FormularRenderer](Akteure.html#FormularRenderer) implementiert.
Hierbei ist zu beachten, dass [FormularDaten](StructureDefinition-ISiKFormularDaten.html) *nicht* gegen ein QuestionnaireResponse-Profil zu validieren sind, 
sondern gegen die zugrundeliegende [FormularDefinition](StructureDefinition-ISiKFormularDefinition.html).


| **Warnung** | **Missing Feature** |
|-|-|
|<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Basismodul/refs/heads/archive-stable-pics-etc/Material/piktogramme/Ampel%20auf%20Rot_Blau_gematik.svg" alt="gematik logo" width="75"/> | Die Validierung von QuestionnaireResponse-Ressourcen gegen Questionnaires wird nicht von allen Validatoren unterstützt!|

Die folgenden Core und SDC Extensions sind für die Validierung in dieser Stufe relevant. Unter [Extensions](Extensions.html) sind mehr Informationen dazu zu finden.

- [maxDecimalPlaces](https://hl7.org/fhir/R4/extension-maxdecimalplaces.html)
- [maxValue](https://hl7.org/fhir/R4/extension-maxvalue.html)
- [minLength](https://hl7.org/fhir/R4/extension-minlength.html)
- [minValue](https://hl7.org/fhir/R4/extension-minvalue.html)
- [regex](https://hl7.org/fhir/R4/extension-regex.html)

### Interaktion: FormularDatenExtraktion

Bei der Formulardatenextraktion handelt es sich formal nicht um eine *Inter*aktion, da diese derzeit als eine Aktion angenommen wird, die vom [FormularRenderer](Akteure.html#FormularRenderer) eigenständig ausgeführt wird.
Gemäß SDC-Spezifikation ist die FormularDaten-Extraktion jedoch auch als ein Service mittels der $extract-Operation implementierbar.

In künftigen Ausbaustufen des ISiK-Formular-Moduls ist auch eine Einbindung [externer Extractions-Services](https://build.fhir.org/ig/HL7/sdc/extraction.html#extraction-service) denkbar. 
Daher wird diese Funktion bereits in dieser Stufe als *potentielle* Interaktion betrachtet.

Die Datenextraktion wird in dieser Stufe zunächst ausschließlich von [FormularRenderer](Akteure.html#FormularRenderer) implementiert und beschränkt sich auf die Methoden
- [Observation based extraction](https://build.fhir.org/ig/HL7/sdc/extraction.html#observation-based-extraction)
- [Template based extraction](https://build.fhir.org/ig/HL7/sdc/en/extraction.html#template-based-extraction)

Die folgenden Core und SDC Extensions sind für die Extraktion in dieser Stufe relevant. Unter [Extensions](Extensions.html) sind mehr Informationen dazu zu finden.

- [Launch Contexts](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-launchContext.html)
- [Extract Observation](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-observationExtract.html)
- [Extract Observation - Category](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-observation-extract-category.html)
- [Extract Template - Bundle](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-templateExtractBundle.html)
- [Extract Template - Resource](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-templateExtract.html)
- [Extract Template - Context](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-templateExtractContext.html)
- [Extract Template - Extract value](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-templateExtractValue.html)

### Interaktion: FormularDaten-Rückübermittlung

Die Rückübermittlung von [FormularDaten](StructureDefinition-ISiKFormularDaten.html) erfolgt gemäß den Festlegungen in [ISiK Basis Stufe-5: Datenübermittlung aus Subsystemen](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc/Datenuebermittlung-aus-Subsystemen.html)

<div>
{% include formDatRueckuebermittlung.svg %}
</div>

| **Work in Progress** | **Fehlendes Artefakt** |
|-|-|
|<img src="https://raw.githubusercontent.com/gematik/spec-ISiK-Terminplanung/c604c61a3887bd5532d2c7392eb20d8c79403028/Material/images/piktogramme/Betriebskoordination_Gruen_gematik.svg" width="40"/> | In der weiteren Entwicklung dieses Moduls wird ein Dokumenten-Profil festgelegt, das die Rückübermittlung von FormularDaten, FormularDefintionen und Strukturierten Inhalten, sowie die Erstellung von Narrativen für die menschenlesbare Darstellung von Formularinhalten spezifiziert |
