Instance: ISiKCapabilityStatementSubscriptionServerAkteur
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-Akteur
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKCapabilityStatementSubscriptionServerAkteur"
* name = "ISiK-CapabilityStatementSubscriptionServerAkteur"
* title = "Akteur &quot;ISiKCapabilityStatementSubscriptionServerAkteur&quot;"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Subscription"
* purpose = """   
  CapabilityStatement für den Akteur &quot;ISiKCapabilityStatementBasisServerAkteur&quot;.
  """
* rest.mode = #server
* imports[+] = Canonical(ISiKCapabilityStatementSubscriptionRolle)
  * insert ExpectationImports(#SHALL)