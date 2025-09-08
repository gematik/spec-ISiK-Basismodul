---
topic: PrePopDemo
canonical: https://gematik.de/fhir/isik/Questionnaire/ExamplePrePopDemo
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
    Vorbelegung: for extension('http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression')
    select {Beschreibung: value.description, FHIRPATH: value.expression}
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
    <iframe src="https://gefyra.github.io/ISiK-Questionnaire-Tooling-Demo/?base=https%3A%2F%2Ffhir.simplifier.net%2Fisik-sandbox%2F&id=ExamplePrePopDemo&patient=SZ1Patient&minimal=true" style="width:100%; height:800px; border:none; display:block;"></iframe>
  </tab>
  <tab title="XML">
  {{xml}}
  </tab>
  <tab title="JSON">
  {{json}}
  </tab>
</tabs>  