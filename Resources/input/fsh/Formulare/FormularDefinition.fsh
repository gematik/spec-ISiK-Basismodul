Alias: $m49.htm = http://unstats.un.org/unsd/methods/m49/m49.htm
Alias: $sdc-questionnaire-preferredTerminologyServer = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-preferredTerminologyServer
Alias: $sdc-questionnaire-performerType = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-performerType
Alias: $sdc-questionnaire-assemble-expectation = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assemble-expectation
Alias: $sdc-valueset = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-valueset


Profile: ISiKFormularDefinition
Parent: Questionnaire
Description: "Im Profil `ISiKFormularDefinition` sind Mindestanforderungen an ISiK kompatible Formulare definiert.
Die verwendbaren Extensions sind nicht mit profiliert, sondern im IG unter Spezifikationen->Extensions beschrieben."
* insert Meta
* insert CommonElements
* modifierExtension contains
  ISiKMpFormularExtension named MpFormular 0..1 MS
* modifierExtension[MpFormular]
  * ^short = "Formular wird in einem Medizinprodukt eingesetzt"
  * ^comment = "**Begründung MS:**
  In dieser Extension wird die Zweckbestimmung angegeben, mit der dieses Formular im Kontext eines Medizinproduktes verwendet wird. Sobald diese Extension vorhanden ist, sollten die Konsequenzen für die Anzeige und Verarbeitung des Formulars geprüft werden. Ein Formularrenderer, der sich nicht mit dem Thema MDR und Medizinprodukte auseinandergesetzt hat, sollte hier auf das im FHIR-Standard festgelegte Verhalten bei [modifierExtension](http://hl7.org/fhir/extensibility.html#modifierExtension) zurückgreifen."  
* url 1.. MS
  * ^short = "CanoncialURL des Formulars" 
  * ^comment = "Weltweit eindeutiger Name des Formulars.
  **Begründung Pflichtfeld:**
  Wird für eindeutige Bezugnahme von FormularDaten auf FormularDefinition benötigt."
* version 1.. MS
  * ^short = "Version"
  * ^comment = "Versionsnummer des Formulars. Sollte gem. semVer-Regeln inkrementiert werden, je nach Schweregrad der Änderungen.
  **Begründung MS:**  
  Wird benötigt, um FormularDefinitionen in unterschiedlichen Versionen zu differenzieren. "
* title 1.. MS
  * ^short = "Titel/Überschrift"
  * ^comment = "Dem Anwender angezeigter Titel des Formulars.  
  **Begründung MS:**  
  Wird für die Darstellung und Auffindbarkeit der FormularDefinition benötigt."
* derivedFrom MS
  * ^short = "Abgeleitet von"
  * ^comment = "Verweis auf ein Questionnaire, von dem abgeleitet wurde, welches erweitert wurde oder welches als Grundlage diente."
* status MS
  * ^short = "active | retired"
  * ^comment = "Die im ISiK-Kontext bereitgestellten Formulare sollten final ausspezifiziert sein und daher den Status 'active' haben. 
  Formulare, die zurückgezogen oder durch neuere Versionen ersetzt wurden, können mit 'retired' gekennzeichnet werden."
* subjectType 1..1 MS
  * ^short = "Subject, über das in diesem Formular berichtet wird."
  * ^comment = "**Begründung Pflichtfeld:** Die in diesem Modul beschriebenen Funktionen und Interaktionen beziehen sich auf den subjectType `Patient`. Ist hier ein anderer subjectType angegeben, so unterliegt das Formular nicht den Einschränkungen und Anforderungen, die in diesem IG für ISiK-Formulare definiert sind. Um dennoch eine Validität zum Profil herzustellen, wurde das Pattern entfernt.
  
  **Hinweis:** Ist der subjectType `Patient` gesetzt, ist stets davon auszugehen, dass der Patient, für den dieses Formular ausgefüllt wird, identisch ist, mit dem Patient, der im Launch-Kontext übergeben wird."
* description 1..1 MS 
  * ^short = "Formularbeschreibung"
  * ^comment = "**Begründung Pflichtfeld:**  
  Ausführliche Beschreibung des Formulars zur Verbesserung der Auffindbarkeit und Interpretation der Nutzung"
* item MS
  * ^short = "Formularfeld"
  * ^comment = "Formularfeld oder Einstiegspunkt für eine Gruppe von Formularfeldern"
//  * obeys sdc-1
  * linkId MS
    * ^short = "innerhalb dieses Formulars eindeutige ID dieses Feldes"
    * ^comment = "**Begründung Pflichtfeld:**  
    Erforderlich für die Verlinkung der Antworten in der QuestionnaireRespons mit der Definition des Formularfeldes."
  * code MS
    * ^short = "Code für dieses Formularfeld"
    * ^comment = "**Begründung MS:**  
    Zur eindeutigen Identifikation des Formularfeldes. Ohne Code ist Observation-based-extraction nicht möglich.
    Wenn kein Code zur Verfügung steht, besteht weiterhin die Möglichkeit ein Item ohne Code zu definieren."  
  * prefix MS
    * ^short = "Feld für bspw. Nummerierung von Elementen"
    * ^comment = "**Begründung MS:**
    Falls bspw. eine Gruppierung oder Nummerierung nicht über die Verschachtelung von Items erfolgt, kann über das Prefix eine solche erfolgen. Aus dem Grund MUSS es in der Darstellung beim Rendern mit verarbeitet werden."
  * text MS
    * ^short = "Fragestellung, Anzeigetext oder Gruppenname"
    * ^comment = "**Begründung MS:**  
    Je nach 'type' des items: Fragestellung, Anzeigetext oder Gruppenname"
  * type MS
    * ^comment = "Time is handled using \"string\".  File is handled using Attachment.  (Content can be sent as a contained binary)."
  * enableWhen MS
    * ^comment = "**Begründung MS:** Bedingungen, die erfüllt sein müssen, damit das Item dargestellt wird. Dieses Feld ist ein modifier-Element, weshalb MS obligatorisch ist, es muss interpretiert werden."
    * question MS
      * ^comment = "LinkId der Frage, bei der die Bedingung zu erfüllen ist."
    * operator MS
      * ^comment = "Operator, mittels dem die Value der .question mit dem in answer[x] angegeben Element vergleichen wird."
    * answer[x] MS
      * ^comment = "Rechter Wert des Bedingungsvergleich"
  * required MS
    * ^short = "Pflichtfeld?"
    * ^comment = "**Begründung MS:**  
    FormularRenderer sollen sicherstellen können, dass Formulare vom Anwender vollständig ausgefüllt werden."
  * repeats MS
    * ^short = "Mehrfachangaben erlaubt?"
    * ^comment = "**Begründung MS:**  FormularRenderer sollen in der Lage sein zwischen Einfach- und Mehrfachangaben unterscheiden zu können."
  * readOnly MS
    * ^short = "Keine Eingabe erlaubt?"
    * ^comment = "Antwort wird automatisch vorbelegt/berechnet und darf nicht vom Anwender editiert/überschrieben werden.
    **Begründung MS:** Automatisch vorbelegte Items sollen gegen Veränderung durch den Benutzer geschützt werden können (z.B. für Patientenstammdaten)."
  * maxLength MS
    * ^short = "Längenbegrenzung"
    * ^comment =  "Maximale Anzahl zulässiger Zeichen für die Beantwortung der Frage."
  * answerValueSet MS
    * ^short = "Festlegung der Antwortmöglichkeiten durch Verweis auf ValueSet"
    * ^comment = "**Begründung MS:**  Wo geeignete ValueSets vorhanden sind, die die Antwortmöglichkeiten hinreichend repräsentieren, sollte auf diese verwiesen werden."
  * answerOption MS
    * ^short = "Festlegung der Antwortmöglichkeiten durch Aufzählung"
    * ^comment = "**Begründung MS:**  Wo *keine* geeignete ValueSets vorhanden sind, die die Antwortmöglichkeiten hinreichen repräsentieren, 
    können Antworten alternativ in der FormularDefinition explizit aufgezählt werden.."
  //* initial MS
  //  * value[x] MS 
  * item MS 
    * ^short = "Untergeordnetes Item"
    * ^comment = "**Begründung MS:**  
   Items können beliebig verschachtelt und zu Gruppen zusammengefasst werden, um komplexere und umfangreichere Formulare zu strukturieren."

