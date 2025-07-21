---
topic: BedingteItems
canonical: https://gematik.de/fhir/isik/Questionnaire/ExampleConditionalItem
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

<fql>
from
    Questionnaire
where
    url = %canonical
for descendants().item
select
{
    ID: linkId,
    Text: text,
    Type: type,
    Options: for answerOption select {Display: value.display},
    EnableWhen: for enableWhen select {Question: question, Operator: operator, Answer: answer.descendants()}
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