---
topic: ExampleExtractWithUnit
canonical: https://gematik.de/fhir/isik/Questionnaire/ExampleExtractWithUnit
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

<iframe src="https://gefyra.github.io/ISiK-Questionnaire-Tooling-Demo/?q=https://fhir.simplifier.net/isik-stufe-5/Questionnaire/ExampleExtractWithUnit&minimal=true" style="width:100%; height:800px; border:none; display:block;"></iframe>

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
    Subextensions: for extension select {URL: url, Wert: value | value.code | 'System: ' + value.coding.system + '<br>Code: ' + value.coding.code}
}
order by linkId
with subheader
</fql>

### Extrahierte Ressourcen

<tabs>
  <tab title="QuestionnaireResponse">
    {{json:ExampleExtractWithUnitResponse}}
  </tab>
  <tab title="Observation - Körpergröße">
    {{json:ExtractedObservationKoerpergroesse}}
  </tab>
  <tab title="Observation - Körpergewicht">
    {{json:ExtractedObservationKoerpergewicht}}
  </tab>
</tabs>

### Quellcode

<tabs>
  <tab title="XML">
  {{xml}}
  </tab>
  <tab title="JSON">
  {{json}}
  </tab>
</tabs>