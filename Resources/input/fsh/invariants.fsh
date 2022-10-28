Invariant: kdl-1
Description: "KDL-Code ungültig"
Severity: #warning
Expression: "matches('[A-Z]{2}[0-9]{6}')"

Invariant: isik-con1
Description: "Falls eine kodierte Diagnose vorliegt muss der dazugehörige Einrichtungskontakt angegeben werden"
Severity: #error
Expression: "code.coding.exists() implies encounter.exists()"

Invariant: icd-text-1
Description: "Entweder MUSS eine kodierte Diagnose vorliegen oder eine textuelle Beschreibung. Stattdessen nur Extensions hinzuzufügen (vgl. https://www.hl7.org/fhir/element.html - ele-1), ist explizit nicht erlaubt."
Severity: #error
Expression: "coding.exists().not() implies text.exists()"

Invariant: ISiK-enc-1
Description: "Abgeschlossene Kontakte sollten einen End-Zeitpunkt angeben"
Severity: #warning
Expression: "status = 'finished' implies period.end.exists()"

Invariant: isik-pat-1
Description: "Falls die Geschlechtsangabe 'other' gewählt wird, muss die amtliche Differenzierung per Extension angegeben werden"
Severity: #error
Expression: "gender.exists() and gender='other' implies gender.extension('http://fhir.de/StructureDefinition/gender-amtlich-de').exists()"

Invariant: pat-cnt-2or3-char
Description: "The content of the country element (if present) SHALL be selected EITHER from ValueSet ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2 OR MAY be selected from ISO Country Alpha-3 Value Set http://hl7.org/fhir/ValueSet/iso3166-1-3, IF the country is not specified in value Set ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2."
Severity: #warning
Expression: "country.empty() or (country.memberOf('http://hl7.org/fhir/ValueSet/iso3166-1-2') or country.memberOf('http://hl7.org/fhir/ValueSet/iso3166-1-3'))"

Invariant: prac-de-1
Description: "Die amtliche Differenzierung der Geschlechtsangabe 'other' darf nur gefüllt sein, wenn das Geschlecht 'other' angegeben ist"
Severity: #error
Expression: "gender='other' or gender.extension('http://fhir.de/StructureDefinition/gender-amtlich-de').empty()"

Invariant: proc-ISiK-1
Description: "Falls die Prozedur per OPS kodiert wird, MUSS eine SNOMED-CT kodierte Category abgebildet werden"
Severity: #error
Expression: "code.coding.where(system = 'http://fhir.de/CodeSystem/bfarm/ops').exists() implies category.coding.where(system = 'http://snomed.info/sct').exists()"

Invariant: proc-ISiK-2
Description: "Falls eine codierte Prozedur vorliegt MUSS eine kodierte Category abgebildet werden"
Severity: #error
Expression: "code.coding.exists() implies category.coding.exists()"

Invariant: sct-ops-1
Description: "Falls die Prozedur kodiert vorliegt, SOLL mindestens ein OPS oder SNOMED-CT Code angegeben werden. Liegt die Prozedur nicht kodiert vor SOLL Freitext angegeben werden."
Severity: #error
Expression: "coding.exists() implies coding.where(system = 'http://snomed.info/sct').exists() or coding.where(system = 'http://fhir.de/CodeSystem/bfarm/ops').exists())"

Invariant: proc-ISiK-3
Description: "Entweder MUSS eine kodierte Prozedur vorliegen oder eine textuelle Beschreibung. Stattdessen nur Extensions hinzuzufügen (vgl. https://www.hl7.org/fhir/element.html - ele-1), ist explizit nicht erlaubt."
Severity: #error
Expression: "coding.exists().not() implies text.exists()"

Invariant: relatedp-de-1
Description: "Falls die Geschlechtsangabe 'other' gewählt wird, muss die amtliche Differenzierung per Extension angegeben werden"
Severity: #error
Expression: "gender.exists() and gender='other' implies gender.extension('http://fhir.de/StructureDefinition/gender-amtlich-de').exists()"

Invariant: address-cnt-2or3-char
Description: "The content of the country element (if present) SHALL be selected EITHER from ValueSet ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2 OR MAY be selected from ISO Country Alpha-3 Value Set http://hl7.org/fhir/ValueSet/iso3166-1-3, IF the country is not specified in value Set ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2."
Severity: #warning
Expression: "country.empty() or (country.memberOf('http://hl7.org/fhir/ValueSet/iso3166-1-2') or country.memberOf('http://hl7.org/fhir/ValueSet/iso3166-1-3'))"

