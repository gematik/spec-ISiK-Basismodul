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

Beim Klicken auf "Zeige QR + Observations" werden Sie auf eine externe Seite weitergeleitet, auf der die durch Sie in der Demo eingegebenen Werte als QuestionnaireResonse und extragierte Observations dargestellt werden.

<iframe src="https://gematik.github.io/poc-isik-formular/?base=https://fhir.simplifier.net/isik-stufe-5/&id=ExampleExtractWithUnit&minimal=withbuttons" style="width:100%; height:400px; border:none; display:block;"></iframe>

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
