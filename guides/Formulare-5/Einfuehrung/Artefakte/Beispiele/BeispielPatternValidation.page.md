---
topic: ExampleInputPatternValidation
canonical: https://gematik.de/fhir/isik/Questionnaire/ExampleInputPatternValidation
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
<!---
TODO: isik-sandbox -> isik-stufe-5
-->
Das Feature wird von LHC-Forms zum aktuellen Zeitpunkt noch nicht unterstützt. Aus dem Grund wird im gerenderten Formular die Validierung noch nicht korrekt ausgeführt.

<iframe src="https://gefyra.github.io/ISiK-Questionnaire-Tooling-Demo/?q=https://fhir.simplifier.net/isik-sandbox/Questionnaire/ExampleInputPatternValidation&minimal=true" style="width:100%; height:800px; border:none; display:block;"></iframe>

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
    Subextensions: for extension select { for extension select { URL: url, Wert: value | value.code | value.expression } }
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