<fql>
        from
	        OperationDefinition
        where
	        url = %canonical
        select
	        Beschreibung: description
        with
            no header
</fql>