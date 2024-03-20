### Anmerkungen zu Must-Support-Feldern

<fql output = "table" headers="true">

        from 
            StructureDefinition 
        where 
            url = %canonical
        for 
            differential.element 
            where 
                mustSupport = true 
            select Feldname: id, Kurzbeschreibung: short, Hinweise: comment
</fql>

---