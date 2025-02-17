

Profile: ISiKFormularAntwort
Parent: QuestionnaireResponse
Title: "Ausgefülltes ISiK-Formular"
Description: "ToDo"
* obeys sdcqr-1 and sdcqr-2
* identifier MS
* questionnaire 1.. MS
* questionnaire only Canonical(ISiKFormular)
  * extension contains DisplayName named questionnaireDisplay 1..1 MS
  * extension[questionnaireDisplay] ^comment = "This SHALL be the title of the Questionnaire at the time the QuestionnaireResponse was originally authored."
* status MS
* subject 1..1 MS
* authored 1.. MS
* author MS
* item MS
  * linkId MS
  * text MS
  * answer MS
    * value[x] MS
    * item MS
      * ^contentReference = "http://hl7.org/fhir/StructureDefinition/QuestionnaireResponse#QuestionnaireResponse.item"
  * item MS
    * ^contentReference = "http://hl7.org/fhir/StructureDefinition/QuestionnaireResponse#QuestionnaireResponse.item"

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