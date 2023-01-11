Profile: ISiKVersicherungsverhaeltnisGesetzlich
Parent: http://fhir.de/StructureDefinition/coverage-de-basis
Id: ISiKVersicherungsverhaeltnisGesetzlich
Description: "Dieses Profil ermöglicht die Darstellung eines gesetzlichen Versicherungsverhältnisses in ISiK Szenarien."
* insert Meta
* . ^definition = "Kostenübernahme im Rahmen eines gesetzlichen Versicherungsverhältnisses in Deutschland."
* identifier MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^short = "Primärer Identifier der Versicherung"
  * ^definition = "Ein gesetzliches Versicherungsverhältnis sollte stets durch die eindeutige 30-stellige Versichertennummer identifiziert werden. Ist diese nicht bekannt, so wird die 10-stellige VersichertenID statt dessen verwendet."
* identifier contains KrankenversichertenID 1..1 MS
* identifier[KrankenversichertenID] only IdentifierKvid10
  * system MS
  * value MS
* status MS
* type MS
  * ^comment = "28.07.2017 (zulip): TC Konsens bzgl. Verwendung eines eigenen ValueSets anstelle des im Standrad definierten preferred bindings, da die dortigen Codes nicht passen."
  * coding 1.. MS
    * system 1.. MS
    * system = "http://fhir.de/CodeSystem/versicherungsart-de-basis" (exactly)
    * code 1.. MS
    * code = #GKV (exactly)
* subscriber only Reference(ISiKAngehoeriger)
  * ^definition = "Hauptversicherte Person, wenn abweichend von beneficiary, z.B. bei Familienversicherung"
  * identifier 1..
  * identifier only IdentifierKvid10
    * ^short = "VersichertenID (10-stellig) des Hauptversicherten"
    * ^patternIdentifier.system = "http://fhir.de/sid/gkv/kvid-10"
  * display ^short = "Name des Hauptversicherten"
* beneficiary only Reference(ISiKPatient)
* beneficiary MS
  * ^definition = "Benennt die versicherte Person."
  * ^comment = "Die Angabe der 10-stelligen Krankenversichertennummer ist verpflichtend. Durch die Referenz auf eine Patient-Resource können weitere Informationen zum Patienten hinterlegt werden."
  * reference 1.. MS
  * identifier ^short = "Identifier der versicherten Person"
    * ^patternIdentifier.system = "http://fhir.de/sid/gkv/kvid-10"
  * display ^short = "Name der Versicherten Person"
    * ^definition = "Die Angabe des Namens des Versicherten dient der geeigenten Darstellung für den Benutzer und hat keine technische Bedeutung."
* period
  * start ^mapping.identity = "KVDT"
  * start ^mapping.map = "4133"
  * end ^mapping.identity = "KVDT"
  * end ^mapping.map = "4110"
* payor ..1 MS
* payor only Reference(Organization)
  * ^definition = "Gibt den Kostenträger des Versicherten an. Die Angabe der IK-Nummer als logische Referenz sowie des Namens als Display ist zwingend erforderlich.\r\nDie Referenz auf eine Resource vom Typ Organization, die weitere Details zur Versicherung enthalten kann (z.B. Adresse, Kontaktdaten) ist optional.\r\nSofern eine zweite Referenz auf einen Kostenträger existiert, so handelt es sich hierbei um den abrechnenden Kostenträger"
  * ^comment = "Die Angabe der IK-Nummer des Versicherers in payor.identifier ist verpflichtend. Weitere Angaben zum Versicherer (Name, Adresse) können in einer Organization-Resource hinterlegt werden, auf die hier referenziert wird."
  * identifier only IdentifierIknr
  * identifier MS
    * system MS
    * value MS
  * display 1.. MS

Instance: coverageGesetzlich
InstanceOf: ISiKVersicherungsverhaeltnisGesetzlich
Usage: #example
* identifier.type = $identifier-type-de-basis#GKV
* identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* identifier.value = "A234567890"
* status = #active
* type = $versicherungsart-de-basis#GKV
* beneficiary = Reference(patient)
* payor.identifier.type = $v2-0203#XX
* payor.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* payor.identifier.value = "260326822"
* payor.display = "Eine Gesundheitskasse"