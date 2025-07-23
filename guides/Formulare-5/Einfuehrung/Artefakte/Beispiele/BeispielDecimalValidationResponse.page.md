---
topic: DezimalValidierungResponse
canonical: ExampleEntryValidationDecimalResponse
expand: 2
---


### Beispiel: vollständig und valide ausgefülltes Formular
<fql output="transpose">
from
    QuestionnaireResponse
where
    id = %canonical
select 
{
    Titel: questionnaire.extension.value,
    Datum: authored,
    Patient: subject.reference,
    Autor: author.reference
}
</fql>
<fql>
from
    QuestionnaireResponse
where
    id = %canonical
for (item | descendants().item)
select
        {
            ID: linkId,
            Frage: text,
            Antwort: answer.value
        }
order by linkId
with subheader
</fql>

### Quellcode
<tabs>
  <tab title="XML">
  {{xml:ExampleEntryValidationDecimalResponse}}
  </tab>
  <tab title="JSON">
  {{json:ExampleEntryValidationDecimalResponse}}
  </tab>
</tabs>
