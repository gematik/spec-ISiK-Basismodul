Instance: CodeSystemErweiterungPupillenlichtreaktion
InstanceOf: ISiKCodeSystem
Description: "CodeSystem zur Erweiterung der Ergebnisse des Pupillenlichtreaktion-Profils."
Usage: #example
* insert MetaInstance
* url = "https://gematik.de/fhir/isik/CodeSystem/pupil-reaction-additional"
* name = "PupilReactionAdditional"
* status = #active
* content = #complete
* caseSensitive = true
* experimental = false
* concept[0].code = #not-measurable
* concept[0].display = "nicht messbar"
* concept[0].definition = "Pupillenlichtreaktion ist klinisch nicht messbar beziehungsweise nicht beurteilbar. Beispiel: Pupille ist verengt - bspw. durch postoperativen Opiatüberhang. Daher ändert sich die Pupillenweite nur minimal - aber die Änderung ist mit bloßem Auge nicht zu erkennen"