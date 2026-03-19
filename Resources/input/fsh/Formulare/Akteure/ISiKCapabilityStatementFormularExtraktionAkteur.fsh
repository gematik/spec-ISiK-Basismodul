Instance: ISiKCapabilityStatementFormularExtraktionAkteur
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Akteur
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementFormularExtraktionAkteur"
* name = "ISiK-CapabilityStatementFormularExtraktionAkteur"
* title = "Akteur `ISiKCapabilityStatementFormularExtraktionAkteur`"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Formularmodul"
* purpose = " CapabilityStatement für den Akteur `ISiKCapabilityStatementFormularExtraktionAkteur`.
  Dieser Akteur ist im Kontext des Moduls optional, da die Extraktion auch vom Akteur des FormularRenderers innerhalb seiner Implementierung bereitgestellt werden kann. Falls die Funktion ausgelagert wird, muss sie über die Operation `extract` auf dem ResourceType `QuestionnaireResponse` abgebildet sein."

* imports[+] = Canonical(ISiKCapabilityStatementFormularExtraktionRolle)
  * insert ExpectationImports(#SHALL)

* rest.mode = #server



