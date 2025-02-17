<fql output="inline">
        from
	        Questionnaire
        where
	        url = %canonical
        select
	        Beschreibung: description
        with
            no header
</fql>

<fql output="table">
        from
	        Questionnaire
        where
	        url = %canonical
for repeat(item)
select 
	ID: linkId, Test: text, Typ: type, Pflichtangabe: required, Mehrfachangabe: repeats, Vorbelegung: extension.where(url='http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression').exists()
order by ID
</fql>