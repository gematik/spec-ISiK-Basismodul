Instance: ISiKCapabilityStatementCompositionKonsumentenRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Rolle
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementCompositionKonsumentenRolle"
* name = "ISiKCapabilityStatementCompositionKonsumentenRolle"
* title = "CapabilityStatement für Rolle &quot;ISiKCapabilityStatementCompositionKonsumentenRolle&quot;"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Basismodul"


* document
  * insert Expectation(#SHALL)  
  * mode = #consumer
  * profile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKBerichtBundle"
  * documentation = "Endpunkt zur Entgegennahme von Subsystem-Berichten in Form eines ISiKBerichtBundles. Weitere Hinweise siehe {{pagelink:BerichtSubsystem}}"


