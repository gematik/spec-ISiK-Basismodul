Instance: ISiKCapabilityStatementFormularVorbelegungAkteur
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Akteur
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementFormularVorbelegungAkteur"
* name = "ISiK-CapabilityStatementFormularVorbelegungAkteur"
* title = "Akteur `ISiKCapabilityStatementFormularVorbelegungAkteur`"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Formularmodul"
* purpose = " CapabilityStatement für den Akteur `ISiKCapabilityStatementFormularVorbelegungAkteur`.
  Dieser Akteur ist im Kontext des Moduls optional, da die Vorbelegung auch vom Akteur des FormularRenderers innerhalb seiner Implementierung bereitgestellt werden kann. Falls die Funktion ausgelagert wird, muss sie über die Operation `prepopulate` auf dem ResourceType `QuestionnaireResponse` abgebildet sein."

* imports[+] = Canonical(ISiKCapabilityStatementFormularVorbelegungRolle)
  * insert ExpectationImports(#SHALL)

* rest.mode = #server



