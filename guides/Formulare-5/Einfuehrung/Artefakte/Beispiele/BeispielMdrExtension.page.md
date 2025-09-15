---
topic: ExampleMdrRelevant
canonical: https://gematik.de/fhir/isik/Questionnaire/ExampleMdrRelevant
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

<iframe src="https://gematik.github.io/poc-isik-formular/?base=https://fhir.simplifier.net/isik-stufe-5/&id=ExampleMdrRelevant&minimal=true" style="width:100%; height:400px; border:none; display:block;"></iframe>

### Globale Extensions
<fql>
from
    Questionnaire
where
    url = %canonical
for modifierExtension
select
{
    Name[markdown]: '['  +url.replaceMatches('^.+/(?<name>[A-Za-z-]+)$', '${name}') + '](' + url +')',
    Value: value | value.code
}
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