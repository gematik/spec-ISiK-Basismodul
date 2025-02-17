


Profile: ISiKFormular
Parent: Questionnaire

* extension contains
    DesignNote named designNote 0..1 and
    $sdc-questionnaire-performerType named performerType 0..* MS 
* extension[designNote] ^comment = "Allows capture of todos, rationale for design decisions, etc.  It can also be used to capture comments about the completion of the form in general. Allows commentary to be captured during the process of answering a questionnaire (if not already supported by the form design) as well as after the form is completed. Comments are not part of the \"data\" of the form. If a form prompts for a comment, this should be captured in an answer, not in this element. Formal assessments of the QuestionnareResponse would use [[[Observation]]]."
* url 1.. MS
  * ^short = "CanoncialURL des Formulars" 
  * ^comment = "Weltweit eindeutiger Name des Formulars."
* version MS
  * ^short = "Version"
  * ^comment = "Versionsnummer des Formulars. Sollte gem. semVer-Regeln inkrementiert werden, je nach Schweregrad der Änderungen."
* title 1.. MS
  * ^short = "Titel/Überschrift"
  * ^comment = "Dem Anwender angezeigter Titel des Formulars."
* status MS
  * insert doku([["active | retired"]], [["Die im ISiK-Kontext bereitgestellten Formulare sollten final ausspezifiziert sein und daher den Status 'active' haben. Formulare, die zurückgezogen oder durch neuere Versionen ersetzt wurden, können mit 'retired' gekennzeichnet werden."]] )
* subjectType 0..1 MS
* subjectType = #Patient
  * ^short = "Subject, über das in diesem Formular berichtet wird."
  * ^comment = "Zur Vereinfachung des Workflows werden zunächst nur Formulare mit Patientenbezug zugelassen. 
  Dabei ist stets davon auszugehen, dass der Patient, für den dieses Formular ausgefüllt wird, 
  identisch ist, mit dem Patient, der im Kontext des SMART-Launch übergeben wird. 
  Diese Anforderung kann in künftigen Ausbaustufen gelockert werden."
* description 1..1 MS 
  * ^short = "Beschreibung"
  * ^comment = "Ausführliche Beschreibung des Formulars zur Verbesserung der Auffindbarkeit"
* item MS
  * ^short = "Formularfeld"
  * ^comment = "Formularfeld, Anzeigetext oder Gruppe von Formularfeldern"
  * obeys ele-1 and sdc-1
  * linkId MS
    * ^short = "innerhalb dieses Formulars eindeutige ID dieses Feldes"
    * ^comment = "Erforderlich für die Verlinkung der Antworten in der QuestionnaireRespons mit der Definition des Formularfeldes."
  * prefix MS
  * text MS
    * ^short = "Text"
    * ^comment = "Je nach 'type' des items: Fragestellung, Anzeigetext oder Gruppenname"
  * type MS
    * ^comment = "Time is handled using \"string\".  File is handled using Attachment.  (Content can be sent as a contained binary)."
  * required MS
    * ^short = "Pflichtfeld?"
  * repeats MS
    * ^short = "Mehrfachangaben erlaubt?"
  * readOnly MS
    * ^short = "Keine Eingabe erlaubt?"
    * ^comment = "Antwort wird automatisch vorbelegt/berechnet und darf nicht vom Anwender editiert/überschrieben werden."
  * maxLength MS
    * ^short = "Längenbegrenzung"
    * ^comment =  "Maximale Anzahl zulässiger Zeichen für die Beantwortung der Frage."
  * answerValueSet MS
  * answerOption MS
  * initial MS
    * value[x] MS
  * item MS

Invariant: ele-1
Description: "All FHIR elements must have a @value or children"
* severity = #error
* expression = "hasValue() or (children().count() > id.count())"
* xpath = "@value|f:*|h:div"
* source = "http://hl7.org/fhir/StructureDefinition/Questionnaire"

Invariant: sdc-1
Description: "An item cannot have an answerExpression if answerOption or answerValueSet is already present."
* severity = #error
* expression = "extension('http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression').empty().not() implies (answerOption.empty() and answerValueSet.empty())"
* xpath = "f:extension[@url='http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression'] and (not(f:answerOption) and not(f:answerValueSet))"
