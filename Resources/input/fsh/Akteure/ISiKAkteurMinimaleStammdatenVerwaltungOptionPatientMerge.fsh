Instance: ISiKAkteurMinimaleStammdatenVerwaltungOptionPatientMerge
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-CapabilityStatement-actor
* url = "https://gematik.de/fhir/isik/CapabilityStatement/ISiKAkteurMinimaleStammdatenVerwaltungOptionPatientMerge"
* name = "ISiKAkteurMinimaleStammdatenVerwaltungOptionPatientMerge"
* title = "Option &quot;OptionPatientMerge&quot; für Akteur &quot;Minimale Stammdaten-Verwaltung&quot;"
* implementationGuide = "https://gematik.de/fhir/isik/ImplementationGuide/ISiK-Basismodul"
* imports = Canonical(ISiKCapabilityStatementStammdatenRolle)

* rest
  * mode = #server

//TopicBased Subscription Backport (https://hl7.org/fhir/uv/subscriptions-backport/)
* rest
  * resource[+]
    * insert Expectation(#SHALL)
    * type = #Subscription
    * supportedProfile = Canonical(ISiKSubscription)
      * insert Expectation(#SHALL)
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #read
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #create
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #update
    * interaction[+]
      * insert Expectation(#SHALL)
      * code = #delete

    * extension[+]
      * url = Canonical(CapabilityStatementSubscriptionTopic)
      * valueCanonical = $patient-merge-topic 
    * operation[+]
      * name = "$get-ws-binding-token"
      * insert Expectation(#SHALL)  
      * definition = "http://hl7.org/fhir/uv/subscriptions-backport/OperationDefinition/backport-subscription-get-ws-binding-token"
