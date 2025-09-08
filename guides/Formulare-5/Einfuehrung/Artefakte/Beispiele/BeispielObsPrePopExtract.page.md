---
topic: ObsPrePopExtr
canonical: https://gematik.de/fhir/isik/Questionnaire/ExamplePrePopObservation
expand: 2
---

## {{page-title}}

### Metadaten
<fql output="transpose">
from
    Questionnaire
where
    url = %canonical
select
{
    Name: name,
    URL: url,
    Beschreibung: description
}
</fql>

### Globale Extensions
<fql output="transpose">
from
    Questionnaire
where
    url = %canonical
for extension
select
{
    Name[markdown]: '['  +url.replaceMatches('^.+/(?<name>[A-Za-z-]+)$', '${name}') + '](' + url +')',
    Subextensions: for extension select {URL: url, Wert: value | value.code}
}
with subheader
</fql>

### Item-Definitionen
<fql>
from
    Questionnaire
where
    url = %canonical
for (item | descendants().item)
select
{
    ID: linkId,
    Text: text,
    Type: type,
    Code: code.descendants(),
    Options[markdown]: '['  + answerValueSet.replaceMatches('^.+/(?<name>[A-Za-z-]+)$', '${name}') + '](' + answerValueSet +')',
    Extraction: extension('http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract').value,
    LinkPeriod: for extension('http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationLinkPeriod')
    select {Wert: value.value, Einheit: value.code}
    }
order by linkId
with subheader
</fql>

### Quellcode
<!---
TODO: isik-sandbox -> isik-stufe-5
-->
<tabs>
  <tab title="LHC-Forms">
    <p></p>
    <iframe src="https://gefyra.github.io/ISiK-Questionnaire-Tooling-Demo/?base=https%3A%2F%2Ffhir.simplifier.net%2Fisik-sandbox%2F&id=ExamplePrePopObservation&prepopBase=https%3A%2F%2Ffhir.hl7.de%2Ffhir&patient=10&minimal=true" style="width:100%; height:800px; border:none; display:block;"></iframe>
  </tab>
  <tab title="XML">
  {{xml}}
  </tab>
  <tab title="JSON">
  {{json}}
  </tab>
</tabs>  