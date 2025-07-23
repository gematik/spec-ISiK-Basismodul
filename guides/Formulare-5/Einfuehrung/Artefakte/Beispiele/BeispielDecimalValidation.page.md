---
topic: DezimalValidierung
canonical: https://gematik.de/fhir/isik/Questionnaire/ExampleEntryValidationDecimal
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
    Validierung: for extension
    select {URL[markdown]: '['  +url.replaceMatches('^.+/(?<name>[A-Za-z-]+)$', '${name}') + '](' + url +')', Wert: value | value.code}
    }
order by linkId
with subheader
</fql>

### Quellcode
<tabs>
  <tab header="XML">
  {{xml}}
  </tab>
  <tab header = "JSON">
  {{json}}
  </tab>
</tabs>  