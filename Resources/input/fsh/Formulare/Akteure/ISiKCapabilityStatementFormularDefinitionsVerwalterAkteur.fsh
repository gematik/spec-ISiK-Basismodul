Instance: ISiKCpSFormDefinitionsVerwalterAkteur
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Akteur
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCpSFormDefinitionsVerwalterAkteur"
* name = "ISiK-CpSFormDefinitionsVerwalterAkteur"
* title = "Akteur `ISiKCpSFormDefinitionsVerwalterAkteur`"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Formularmodul"
* purpose = """   
  CapabilityStatement für den Akteur `ISiKCpSFormDefinitionsVerwalterAkteur`.
  Dieser Akteur aggregiert die Rollen zur Abfrage von ausgefüllten Formularen, zur Datenbereitstellung für die Formularvorbelegung und zur Rückübermittlung von aus Formularen extrahierten Daten.
  Verpflichtend ist in diesem Kontext nur die Rolle `FormularDefinitionsVerwalterRolle` und `CompositionKonsumentenRolle`, die weiteren Rollen sind optional, da sie ggf. auch von anderen Akteuren bereitgestellt werden können.
  """

* imports[+] = Canonical(ISiKCapabilityStatementFormularDefinitionsVerwalterRolle)
  * insert ExpectationImports(#SHALL)

* rest.mode = #server



