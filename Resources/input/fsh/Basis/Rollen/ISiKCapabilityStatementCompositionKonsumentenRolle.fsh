Instance: ISiKCapabilityStatementCompositionKonsumentenRolle
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Rolle
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementCompositionKonsumentenRolle"
* name = "ISiKCapabilityStatementCompositionKonsumentenRolle"
* title = "CapabilityStatement für Rolle ISiKCapabilityStatementCompositionKonsumentenRolle"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Basismodul"
* purpose = "
CapabilityStatement für die Rolle ISiKCapabilityStatementCompositionKonsumentenRolle.
Diese Rolle beschreibt verpflichtende Interaktionen zum Abruf und der Verarbeitung von ISiKBerichtBundles.
"

* document
  * insert Expectation(#SHALL)  
  * mode = #consumer
  * profile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKBerichtBundle"
  * documentation = "Endpunkt zur Entgegennahme von Subsystem-Berichten in Form eines ISiKBerichtBundles. Weitere Hinweise siehe [BerichtSubsystem](https://gemspec.gematik.de/ig/fhir/isik/basis/6.0.0-rc/StructureDefinition-ISiKBerichtSubSysteme.html)"


