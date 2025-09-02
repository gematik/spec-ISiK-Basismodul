/*
***** Parametrierung von Items *****
addItem: zur Parametrierung eines einfachen *optionalen* Items mit
 + linkId = z.B. "1.2"
 + type = #choice | #string | #date | #decimal ...
 + text = z.B. "Name des Patienten"

addRItem: zur Parameterierung eines einfachen *mandatorischen* Items mit
 + linkId = z.B. "1.2"
 + type = #choice | #string | #date | #decimal ...
 + text = z.B. "Name des Patienten"

uunit: zur Annotation eines Items mit einer UCUM Einheit
 + code = kg, m, km, s...

munit: zur Annotation eines Items mit einer Währungseinheit
 + code = EUR, USD, CAD...

itemControl: Zur Steuerung des Verhaltens eines Items
 + code = #autocomplete | #gtable | #check-box ...

entryFormat: Zur Vorblendung eines Format-Strings in einem Eingabefeld
 + string = z.B. "xxx.xx" oder "dd.mm.yyyy"

regEx: zur Validierung einer Benutzereingabe anhand einer FHIRPath-
 + expression = z.B. [["/^[A-Z][0-9]{9}$/"]]


***** Prepopulation ***** 

launchContext: Zur Erstellung einer Kontext-Variablen
 + name = patient | encounter | location | user | study... // Name der SMART-Launch Kontext-Variablen (erweiterbar)
 + type = Patient | Encounter | Practitioner | Questionnaire... //FHIR Ressource Type
 + description = Beschreibung des Launch Kontextes

initialExpression: Zur Vorbelegung eines Items anhand einer FHIRPath-
 + expression = z.B.: [["%patient.identifier.where(system = 'http://fhir.de/sid/gkv/kvid-10').value"]]
 + description = z.B.: "Versichertennummer des Patienten"


***** Extraction *****  

observationExtract: Aktiviert die Extraktion eines Items in eine Observation (paramterlos) 

****** Response ********

qritem: zur initialisierung eines Items in einer QuestionnaireResponse
  + linkId = {id}
  + text = {text}
*/
Alias: $unitsofmeasure = http://unitsofmeasure.org
Alias: $currency = urn:iso:std:iso:4217

RuleSet: addItem(linkId, type, text)
* linkId = {linkId}
* type = {type}
* text = {text}

RuleSet: addRItem(linkId, type, text)
* insert addItem({linkId}, {type}, {text})
* required = true

RuleSet: minMaxInteger(min, max)
* extension[+] 
  * url = "http://hl7.org/fhir/StructureDefinition/maxValue"
  * valueInteger = {max}
* extension[+] 
  * url = "http://hl7.org/fhir/StructureDefinition/minValue"
  * valueInteger = {min}

RuleSet: minMaxDecimal(min, max)
* extension[+] 
  * url = "http://hl7.org/fhir/StructureDefinition/maxValue"
  * valueDecimal = {max}
* extension[+] 
  * url = "http://hl7.org/fhir/StructureDefinition/minValue"
  * valueDecimal = {min}

RuleSet: minLength(min)
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/minLength"
  * valueInteger = {min}

RuleSet: maxOccurs(max)
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-maxOccurs"
  * valueInteger = {max}

RuleSet: minOccurs(min)
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-minOccurs"
  * valueInteger = {min}

RuleSet: minMaxOccurs(min, max)
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-minOccurs"
  * valueInteger = {min}
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-maxOccurs"
  * valueInteger = {max}

//name = patient | encounter | location | user | study
RuleSet: launchContext(name, type, description)
* extension
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
  * extension[+]
    * url = "name"
    * valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#{name}
  * extension[+]
    * url = "type"
    * valueCode = {type}
  * extension[+]
    * url = "description"
    * valueString = {description}

RuleSet: initialExpression(expression, description)
* extension
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
  * valueExpression
    * language = #text/fhirpath
    * expression = {expression}
    * description = {description}

RuleSet: observationLinkPeriod(duration)
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationLinkPeriod"
  * valueDuration = {duration}

RuleSet: observationExtract
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract"
  * valueBoolean = true

RuleSet: observationExtractCategoryVitalSign
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observation-extract-category"
  * valueCodeableConcept
    * coding[+] = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs


RuleSet: variable(name, expression)
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = {name}
    * language = #text/fhirpath
    * expression = {expression}


RuleSet: uunit(code)
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
  * valueCoding = $unitsofmeasure#{code}

RuleSet: maxDecimalPlaces(integer)
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/maxDecimalPlaces"
  * valueInteger = {integer}


RuleSet: entryFormat(string)
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/entryFormat"
  * valueString = {string}

RuleSet: itemControl(code)
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
  * valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control{code}

RuleSet: regEx(expression)
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/regex"
  * valueString = {expression}

RuleSet: targetConstraint(key, expression, severity, human)  
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/targetConstraint"
  * extension[+]
    * url = "key"
    * valueId = {key}
  * extension[+]
    * url = "severity"
    * valueCode = {severity} 
  * extension[+]
    * url = "expression"
    * valueExpression
      //* name = {name}
      * language = #text/fhirpath
      * expression = {expression}
  * extension[+]
    * url = "human" 
    * valueString = {human}   

RuleSet: qritem (id, text)
* linkId = {id}
* text = {text}

RuleSet: QuestionnaireExamplesMetadata(name)
* name = "{name}"
* version = "0.1.0"
* url = "https://gematik.de/fhir/isik/Questionnaire/{name}"
* status = #draft
* experimental = false
* publisher = "Gematik GmbH"
* subjectType = #Patient

RuleSet: QuestionnaireResponseCommons(questionnaire, patient)
* questionnaire = Canonical({questionnaire})
* status = #completed
* subject = Reference({patient})
* author = Reference({patient})
* authored = "2025-01-01"

