Alias: $m49.htm = http://unstats.un.org/unsd/methods/m49/m49.htm
Alias: $sdc-questionnaire-preferredTerminologyServer = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-preferredTerminologyServer
Alias: $sdc-questionnaire-performerType = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-performerType
Alias: $sdc-questionnaire-assemble-expectation = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assemble-expectation
Alias: $sdc-valueset = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-valueset


Profile: ISiKFormularDefinition
Parent: Questionnaire
* insert Meta
* modifierExtension contains
  ISiKMDRRelevanzFormularExtension named MDR-Relevant 1..1 MS
* modifierExtension[MDR-Relevant].valueCoding MS
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
  * ^short = "active | retired"
  * ^comment = "Die im ISiK-Kontext bereitgestellten Formulare sollten final ausspezifiziert sein und daher den Status 'active' haben. Formulare, die zurückgezogen oder durch neuere Versionen ersetzt wurden, können mit 'retired' gekennzeichnet werden."
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
//  * obeys sdc-1
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

