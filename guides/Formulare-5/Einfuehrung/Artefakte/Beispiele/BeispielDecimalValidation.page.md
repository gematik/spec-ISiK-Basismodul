---
topic: DezimalValidierung
canonical: https://gematik.de/fhir/isik/Questionnaire/ExampleEntryValidationDecimal
expand: 2
---

## Questionnaire

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

<iframe src="https://gefyra.github.io/ISiK-Questionnaire-Tooling-Demo/?base=https%3A%2F%2Ffhir.simplifier.net%2Fisik-stufe-5%2F&id=ExampleEntryValidationDecimal&minimal=true" style="width:100%; height:800px; border:none; display:block;"></iframe>

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
    Validierung: for extension
    select {Extension[markdown]: '['  +url.replaceMatches('^.+/(?<name>[A-Za-z-]+)$', '${name}') + '](' + url +')', Wert: value | value.code}
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

## QuestionnaireResponse
{{page:Einfuehrung/Artefakte/Beispiele/BeispielDecimalValidationResponse.page.md}}