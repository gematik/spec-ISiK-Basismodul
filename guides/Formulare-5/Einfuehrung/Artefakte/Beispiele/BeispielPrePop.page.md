---
topic: ExamplePrePopDemo
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

### Gerendertes Formular

<iframe src="https://gematik.github.io/poc-isik-formular/?base=https%3A%2F%2Ffhir.simplifier.net%2Fisik-stufe-5%2F&id=ExamplePrePopDemo&patient=SZ1Patient&minimal=true" style="width:100%; height:300px; border:none; display:block;"></iframe>

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
    InitialExpression: for extension('http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression')
    select {Sprache: value.language, Expression: value.expression, Beschreibung: value.description}
    }
order by linkId
with subheader
</fql>

### Quellcode
<tabs>
  <tab title="XML">
  {{xml}}
  </tab>
  <tab title="JSON">
  {{json}}
  </tab>
</tabs>  