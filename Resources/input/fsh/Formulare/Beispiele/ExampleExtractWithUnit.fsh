Instance: ExampleExtractWithUnit
InstanceOf: ISiKFormularDefinition

* insert QuestionnaireExamplesMetadata(ExampleExtractWithUnit)
* title = "Observation Based Extraction bei quantitativen Angaben"
* description = "### Beispiel-Questionnaire mit Observation Based Extraction von Dezimalwerten mit Maßeinheiten  
  * Vorgabe der anzugebenden Maßeinheit mittels [questionnaire-unit](https://hl7.org/fhir/R4/extension-questionnaire-unit.html)-Extension
  * Annotation zur Extraktion mittels [observationExtract](http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract)"
* item[+]
  * type = #group
  * required = false
  * linkId = "4"
  * text = "Körpermaße"
  * code = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs
  * item[+]  
    //Annotation mit codierter Maßeinheit
    * insert uunit(kg)
    * code = $loinc#29463-7
    * linkId = "4.1"
    * text = "Körpergewicht in kg"
    * type = #decimal
    * insert observationExtract
  * item[+]  
    //Annotation mit codierter Maßeinheit
    * insert uunit(cm)
    * code = $loinc#8302-2
    * linkId = "4.2"
    * text = "Körpergröße in cm"
    * type = #decimal
    * insert observationExtract


   
Instance: ExampleExtractWithUnitResponse
InstanceOf: ISiKFormularDaten
* insert QuestionnaireResponseCommons(ExampleEntryValidationDecimal, PatientinMinimal)
* questionnaire.extension[questionnaireDisplay].valueString = "Validierung von Dezimalen"
* authored = "2025-08-22"
* item[+]
  * linkId = "4"
  * text = "Körpermaße"
  * item[+]  
    * linkId = "4.1"
    * text = "Körpergewicht in kg"
    * answer.valueDecimal = 66
  * item[+]  
    * linkId = "4.2"
    * text = "Körpergröße in cm"
    * answer.valueDecimal = 166

Instance: ExtractedObservationKoerpergroesse    
InstanceOf: ISiKKoerpergroesse
* status = #final
* subject = Reference(PatientinMinimal)
* effectiveDateTime = "2025-08-22"
* valueQuantity = 166 'cm' "cm"
* derivedFrom = Reference(ExampleExtractWithUnitResponse)

Instance: ExtractedObservationKoerpergewicht    
InstanceOf: ISiKKoerpergewicht 
* status = #final
* subject = Reference(PatientinMinimal)
* effectiveDateTime = "2025-08-22"
* valueQuantity = 166 'kg' "kg"
* derivedFrom = Reference(ExampleExtractWithUnitResponse)

   




 

