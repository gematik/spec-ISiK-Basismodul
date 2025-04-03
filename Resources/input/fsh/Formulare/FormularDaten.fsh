Alias: $sdc-questionnaire-itemMedia = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemMedia
Alias: $sdc-questionnaire-itemAnswerMedia = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemAnswerMedia
Alias: $ordinalValue = http://hl7.org/fhir/StructureDefinition/ordinalValue

Profile: ISiKFormularDaten
Parent: QuestionnaireResponse
Title: "Ausgefülltes ISiK-Formular"
Description: "ToDo"
* insert Meta
* obeys sdcqr-1 and sdcqr-2
* modifierExtension contains
  ISiKMDRRelevanzFormularExtension named MDR-Relevant 1..1 MS
* modifierExtension[MDR-Relevant]
  * ^short = "MPG-Relevanz der Formulardaten"
  * ^comment = "**Begründung MS:**   
  Systeme, die Formulardaten anzeigen oder weiterverarbeiten benötigen Information zu deren MPG-Relevanz"  
* modifierExtension[MDR-Relevant].valueCoding MS
* identifier MS
  * ^short = "eindeutiger Identifier der FormularDaten"
  * ^comment = "**Begründung MS:**
  Ein vom FormularRenderer vergebener, eindeutiger Identifier kann von weiterverarbeitenden Systemen genutzt werden, um Dubletten zu erkennen."
* questionnaire 1.. MS
  * ^short = "Bezug zur FormularDefinition"
  * ^comment = "**Begründung MS:** 
  Der Bezug zur Formulardefinition kann für die Interpretation und Darstellung der Formulardaten relevant sein."
//* questionnaire only Canonical(ISiKFormularDefinition) 
  * extension contains DisplayName named questionnaireDisplay 1..1 MS
  * extension[questionnaireDisplay] 
    * ^short = "Titel/Überschrift der zugrunde liegenden FormularDefinition"
    * ^comment = "Wird für die Darstellung und Auffindbarkeit der FormularDaten benötigt."
* status MS
* subject 1..1 MS
  * ^short = "Subject (Patient), über das in diesem Formular berichtet wird."
  * ^comment = "**Begründung Pflichtfeld:**  
  Zur Vereinfachung des Workflows werden zunächst nur Formulare mit Patientenbezug zugelassen.  
  Diese Anforderung kann in künftigen Ausbaustufen gelockert werden."
* authored 1.. MS
  * ^short = "Datum der FormularDaten"
  * ^comment = "**Begründung Pflichtfeld:** 
  Relevant für die Suche und zeitliche Einordnung der FormularDaten"
* author MS
* item MS
  * linkId MS
  * text MS
    * ^short = "Frage, die beantwortet wurde"
    * ^comment = "**Begründung Pflichtfeld:**  
    Die FormularDaten sollte pro Antwort auch die Fragestellung mitführen, 
    damit die Daten auch von Systemen/Anwendern interpretiert werden können, 
    die *keinen* Zugriff auf die zugrunde liegende FormularDefinition haben."
  * answer MS
    * value[x] MS
    * item MS
      * ^short = "Untergeordnetes Item"
      * ^comment = "**Begründung MS:**  
   Items können beliebig verschachtelt und zu Gruppen zusammengefasst werden, um komplexere und umfangreichere Formulare zu strukturieren."
  * item MS
    * ^short = "Untergeordnetes Item"
    * ^comment = "**Begründung MS:**  
   Items können beliebig verschachtelt und zu Gruppen zusammengefasst werden, um komplexere und umfangreichere Formulare zu strukturieren."



Invariant: sdcqr-1
Description: "Subject SHOULD be present (searching is difficult without subject).  Almost all QuestionnaireResponses should be with respect to some sort of subject."
* severity = #warning
* expression = "subject.exists()"
* xpath = "exists(f:subject)"
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bestpractice"
* extension[0].valueBoolean = true

Invariant: sdcqr-2
Description: "When repeats=true for a group, it'll be represented with multiple items with the same linkId in the QuestionnaireResponse.  For a question, it'll be represented by a single item with that linkId with multiple answers."
* severity = #error
* expression = "(QuestionnaireResponse|repeat(answer|item)).select(item.where(answer.value.exists()).linkId.isDistinct()).allTrue()"
* xpath = "not(exists(for $item in descendant::f:item[f:answer] return $item/preceding-sibling::f:item[f:linkId/@value=$item/f:linkId/@value]))"
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bestpractice"
* extension[0].valueBoolean = true